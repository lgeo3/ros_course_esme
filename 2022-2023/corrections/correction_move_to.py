import rclpy
from rclpy.node import Node

from std_msgs.msg import String
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose
import time
from math import sqrt, atan2

from argparse import ArgumentParser



def distance(A, B):
	return sqrt(pow((A.x - B.x),2) + pow((A.y - B.y),2))

def angle(B, A):
	return atan2(A.y - B.y, A.x - B.x)



class MinimalPublisher(Node):

    def __init__(self, x=None, y=None):
        super().__init__('minimal_publisher')

        # Setting target

        self.target = Pose()
        self.target.x = float(x)
        self.target.y = float(y)

        # Create a subscriber to listen to pose message
        self.subscriber = self.create_subscription(Pose, '/turtle1/pose', self.pose_callback, 10)

        # Create a publisher to send cmd to the robot
        self.publisher_ = self.create_publisher(Twist, '/turtle1/cmd_vel', 10)
        self.initial_pose = None
        self.current_pose = None

        # Run our movement command each 0.01 second based on current position
        self.is_running = False 
        self.create_timer(0.01, self.do_move)

   

    def pose_callback(self, msg: Pose):
        """ Update current pose to last received pose msg. """
        self.current_pose = msg

        # we also store the initial pose of the robot
        if self.initial_pose is None:
            self.initial_pose = self.current_pose

    def do_move(self):
        """ Function that will send control cmd based on last current position."""

        if self.is_running:
            return

        if self.initial_pose is None:
            print("No pose received yet -> not sending any command.")
            return
        
        # creating a twist msg (used as a command)

        # then we fill the msg with the wanted payload based on current pose
        twist_msg = Twist()


        distance_to_target = distance(self.current_pose, self.target)
        print(f"Distance to target is {distance_to_target} -- current pose is {self.current_pose.x, self.current_pose.y}")
        k_t = 0.2
        k_v = 1.0
        min_speed = 0.1  # using a min speed
        if distance_to_target >= 0.1:
            #Linear velocityS
            twist_msg.linear.x = max(min_speed, k_t * distance_to_target)
            twist_msg.linear.y = 0.0
            twist_msg.linear.z = 0.0
            
            #Angular velocity
            twist_msg.angular.x = 0.0
            twist_msg.angular.y = 0.0
            twist_msg.angular.z = k_v * (angle(self.current_pose, self.target) - self.current_pose.theta)
        else:
            print("Destination reached")
            self.destroy_node()


        self.publisher_.publish(twist_msg)
        time.sleep(0.1)

        self.is_running = False


def main(args=None):
    rclpy.init()

    minimal_publisher = MinimalPublisher(x=args.x, y=args.y)

    rclpy.spin(minimal_publisher)

    # Destroy the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    minimal_publisher.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('x', help='x coordinate', default = 8)
    parser.add_argument('y', help='y coordinate', default = 8)
    args = parser.parse_args() 
    main(args)

