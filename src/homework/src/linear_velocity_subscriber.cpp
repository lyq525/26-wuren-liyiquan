/*  

    实现流程:
        1.包含头文件
        2.初始化 ROS 节点
        3.创建 ROS 句柄
        4.创建订阅者对象
        5.回调函数处理订阅的数据
        6.spin
*/

//1.包含头文件
#include <ros/ros.h>
#include <homework/linearVelocity.h>
#include <geometry_msgs/Twist.h>
double angular_vel;
double radius;
//5.回调函数处理订阅的数据
void velocityCallback(const homework::linearVelocity::ConstPtr& msg) {
    ros::NodeHandle nh;
    ros::Publisher cmd_vel_pub = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);
    
    geometry_msgs::Twist twist;
    twist.linear.x = msg->linear;          // 从消息获取线速度
    twist.angular.z = angular_vel;         // 从参数服务器获取角速度
    
    cmd_vel_pub.publish(twist);
}

int main(int argc, char* argv[]) {
    //防止中文爆乱码
    setlocale(LC_ALL,"");
    //2.初始化 ROS 节点
    ros::init(argc, argv, "turtle_controller");
    //3.创建 ROS 句柄
    ros::NodeHandle nh;
    
    // 从参数服务器读取参数
    nh.param<double>("angular_velocity", angular_vel, 1.0);
    nh.param<double>("trajectory/radius", radius, 2.0);
    ROS_INFO("参数服务器中的信息: angular_vel=%.2f, radius=%.2f", angular_vel, radius);
     
    //4.创建订阅者对象
    ros::Subscriber sub = nh.subscribe("/turtle_linear_velocity", 10, velocityCallback);
    //6.spin
    ros::spin();
    return 0;
}