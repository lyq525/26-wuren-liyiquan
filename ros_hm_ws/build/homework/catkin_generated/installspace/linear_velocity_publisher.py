

#! /usr/bin/env python
"""
    编写 ROS 节点，控制小乌龟画圆

    准备工作:
        1.获取topic(已知: /turtle1/cmd_vel)
        2.获取消息类型(已知: geometry_msgs/Twist)
        3.运行前，注意先启动 turtlesim_node 节点

    实现流程:
        1.导包
        2.初始化 ROS 节点
        3.创建发布者对象
        4.循环发布运动控制消息

"""

#!/usr/bin/env python3
#1.导包
import rospy
from homework.msg import linearVelocity


if __name__ == '__main__':
    #2.初始化 ROS 节点
    rospy.init_node('velocity_publisher')
    #3.创建发布者对象
    pub = rospy.Publisher('/turtle_linear_velocity',linearVelocity, queue_size=5)
    rate = rospy.Rate(30)  
    msg = linearVelocity()
    msg.linear = 2.0  # 固定线速度值
    while not rospy.is_shutdown():
        #4.循环发布运动控制消息       
        pub.publish(msg)
        