#include <ros/ros.h>
//调用已知的消息类型和服务
#include <visualization_msgs/MarkerArray.h>
#include <fsd_common_msgs/ConeDetections.h>

class ConeVisualizer {
public:
    ConeVisualizer() {
        // 创建节点句柄
        nh_ = ros::NodeHandle("~");
        // 订阅锥桶检测话题
        sub_ = nh_.subscribe("/perception/lidar/cone_side", 10, &ConeVisualizer::coneCallback, this);
        // 发布MarkerArray用于RViz可视化
        marker_pub_ = nh_.advertise<visualization_msgs::MarkerArray>("/visualization/cone_markers", 10);
        
        // 初始化锥桶尺寸（单位：米）（假设是圆柱）
        red_cone_scale_.x = 0.5;   // 底面直径
        red_cone_scale_.y = 0.5;
        red_cone_scale_.z = 0.8;   // 高度
        
        blue_cone_scale_ = red_cone_scale_;  // 可单独配置蓝色尺寸
    }

private:
// 回调函数处理锥桶检测消息(ccb领域大神）
    void coneCallback(const fsd_common_msgs::ConeDetections::ConstPtr& msg) {
        visualization_msgs::MarkerArray marker_array;
        


        // 遍历所有检测到的锥桶
        for (size_t i = 0; i < msg->cone_detections.size(); ++i) {
            const auto& cone = msg->cone_detections[i];
            // 创建Marker对象:每检测到一个锥桶就创建一个对应的Marker
            visualization_msgs::Marker marker;
            
            // 基础设置如帧ID、时间戳、命名空间、ID、类型、动作、位姿、缩放和颜色（这些就随便了）
            marker.header = msg->header;
            marker.ns = "cones";
            marker.id = i;
            marker.type = visualization_msgs::Marker::CYLINDER;
            marker.action = visualization_msgs::Marker::ADD;
            marker.pose.position = cone.position;
            marker.pose.orientation.w = 1.0;  // 无旋转
            
            // 根据颜色设置属性(rgb是从0到1的浮点数)
            if (cone.color.data== "r" ) {
                marker.color.r = 1.0;
                marker.color.g = 0.0;
                marker.color.b = 0.0;
                marker.color.a = 0.8;  // 红色，带透明度
                marker.scale = red_cone_scale_;
            } else if (cone.color.data == "b" ) {
                marker.color.r = 0.0;
                marker.color.g = 0.0;
                marker.color.b = 1.0;
                marker.color.a = 0.8;  // 蓝色
                marker.scale = blue_cone_scale_;
            } else {
                // 未知颜色默认为黑色（看上去应该没有）
                marker.color.r = 0.0;
                marker.color.g = 0.0;
                marker.color.b = 0.0;
                marker.color.a = 0.8;
                marker.scale = red_cone_scale_;
            }
            
            marker.lifetime = ros::Duration(0.1);  // 短暂保留防止闪烁
            marker_array.markers.push_back(marker);
        }
        
        // 发布MarkerArray
        marker_pub_.publish(marker_array);
    }

    ros::NodeHandle nh_;
    ros::Subscriber sub_;
    ros::Publisher marker_pub_;
    geometry_msgs::Vector3 red_cone_scale_, blue_cone_scale_;
};

int main(int argc, char* argv[]) {
    // 初始化ROS节点
    ros::init(argc, argv, "cone_visualizer_node");
    ConeVisualizer visualizer;
    //回调函数
    ros::spin();
    return 0;
}