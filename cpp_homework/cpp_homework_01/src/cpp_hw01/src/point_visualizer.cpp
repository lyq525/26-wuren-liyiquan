#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/PointCloud2.h>
#include <fsd_common_msgs/ConeDetections.h>
#include <Eigen/Dense>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

//声明内外参矩阵和发布者
Eigen::Matrix<double,3,4> extrinsic;

Eigen::Matrix<double,3,3> intrinsic;


ros::Publisher point_pub;

//和隔壁的marker结构差不多，在细节上改一下
void coneCallBack(const fsd_common_msgs::ConeDetections::ConstPtr& msg){
    cv::Mat image=cv::Mat::zeros(360,1280,CV_8UC3);
    for(size_t i=0;i<msg->cone_detections.size();i++){
        const auto& cone = msg->cone_detections[i];
        //因为msg里只有x和y的信息，所以我直接把z设成0了
        Eigen::Vector4d pt_world(cone.position.x, cone.position.y, 0.0, 1.0);
        Eigen::Vector3d pt_pixel=intrinsic*extrinsic*pt_world;
        //套ppt里的公式就行
        pt_pixel[0]=pt_pixel(0,0)/pt_pixel(2,0);
        pt_pixel[1]=pt_pixel(1,0)/pt_pixel(2,0);
        cv:: Scalar color(0,0,0);
        //一样，msg里的颜色是以r和b显示的（opencv是bgr属实需要适应一下）
        if(cone.color.data=="r"){ color=cv::Scalar(0,0,255);}
        else if(cone.color.data=="b"){color=cv::Scalar(255,0,0);}
        //接着套公式（最后一个-1是实心）
        cv::circle(image,cv::Point(pt_pixel[0],pt_pixel[1]),10,color,-1);
        }
    //cv_bridge的公式
    sensor_msgs::ImagePtr img_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
    point_pub.publish(img_msg);
}  

int main(int argc ,char* argv[]){
//初始化节点
ros::init(argc, argv, "cone_projector");
//创建句柄
ros::NodeHandle nh;
extrinsic<< 3.5594209875121074e-03, -9.9987761481865733e-01, -1.5234365979146680e-02, 8.9277270417879417e-02,
            1.9781062410225703e-03, 1.5241472820252011e-02, -9.9988188532544631e-01, 9.1100499695349946e-01,
            9.9999170877459420e-01, 3.5288653732390984e-03, 2.0321149683686368e-03, 1.9154049062915668e+00;
intrinsic << 532.795, 0.0, 632.15,
              0.0, 532.72, -3.428,
              0.0, 0.0, 1.0;
//话题的发布与接收
point_pub=nh.advertise<sensor_msgs::Image>("/projected_image", 10);
ros::Subscriber sub=nh.subscribe("/perception/fusion/cone_fusion",10,coneCallBack);
ros::spin();
return 0;
}