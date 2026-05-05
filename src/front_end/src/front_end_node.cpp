#include <ros/ros.h>
#include <pcl_conversions/pcl_conversions.h>
#include <sensor_msgs/PointCloud2.h>
#include <livox_ros_driver/CustomMsg.h>
using namespace std;
void livox_handler(const livox_ros_driver::CustomMsg::ConstPtr &msg)
{
  cout << "point_num:" << msg->point_num << " id:" << msg->lidar_id << " time:" << msg->timebase << endl;
  for (uint i = 1; i < msg->point_num; i++)
  {

    cout << i << ": " << msg->points[i].x << " " << msg->points[i].y << " " << msg->points[i].z;
    cout << " reflectivity:" << msg->points[i].reflectivity << " tag:" << msg->points[i].tag  << " line:" << msg->points[i].line << " offset_time:" << msg->points[i].offset_time << endl;
    
  }

}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "front_end");
  ros::NodeHandle n;

  ros::Subscriber sub_points;
  sub_points = n.subscribe("/livox/lidar", 1000, livox_handler, ros::TransportHints().tcpNoDelay());
  
  ros::spin();
  return 0;
}

