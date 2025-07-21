
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/common/common.h>


//接下来要用的话需要先声明一下这个函数
void processing_and_publishing();
//定义发布者和接收者以及需要的点云
pcl::PointCloud<pcl::PointXYZI> cloud_middle, cloud_up, cloud_down;
ros::Publisher point_pub;
ros::Subscriber sub_up,sub_middle,sub_down;

//三个回调函数
void up_callback(const sensor_msgs::PointCloud2ConstPtr& msg){
    pcl::fromROSMsg(*msg,cloud_up);
    processing_and_publishing();
}

void middle_callback(const sensor_msgs::PointCloud2ConstPtr& msg){
    pcl::fromROSMsg(*msg,cloud_middle);
    processing_and_publishing();
}

void down_callback(const sensor_msgs::PointCloud2ConstPtr& msg){
    pcl::fromROSMsg(*msg,cloud_down);
    processing_and_publishing();
}
//点云融合+点云强度改变（范围这东西我们cpp课上讲过）
void processing_and_publishing(){
    //接着套ppt上的公式
    pcl::PointCloud<pcl::PointXYZI>::Ptr merged(new pcl::PointCloud<pcl::PointXYZI>());
    *merged+=cloud_up;
    *merged+=cloud_middle;
    *merged+=cloud_down;
    for(auto i:merged->points){
       i.intensity=i.intensity*255.0+1.0;
    }
    sensor_msgs::PointCloud2 out_msg;
    pcl::toROSMsg(*merged,out_msg);
    out_msg.header.frame_id = "lidar";
    out_msg.header.stamp=ros::Time::now();
    point_pub.publish(out_msg);
}

int main(int argc,char* argv[]){
    //初始化ros节点
    ros::init(argc,argv,"point_merger");
    //创建句柄
    ros::NodeHandle nh;
    //话题的发布和订阅
    point_pub=nh.advertise<sensor_msgs::PointCloud2>("/lidar_points", 1);
    sub_up=nh.subscribe("/carla/ego_vehicle/lidar_up", 1, up_callback);
    sub_middle=nh.subscribe("/carla/ego_vehicle/lidar_middle", 1, middle_callback);
    sub_down=nh.subscribe("/carla/ego_vehicle/lidar_down", 1, down_callback);
    //回旋函数
    ros::spin();
    return 0;
}
