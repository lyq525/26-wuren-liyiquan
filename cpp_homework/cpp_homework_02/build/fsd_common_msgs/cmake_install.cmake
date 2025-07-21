# Install script for directory: /home/lyq/cpp_homework_02/src/fsd_common_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/lyq/cpp_homework_02/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs/msg" TYPE FILE FILES
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/Cone.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/ConeDetections.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/Map.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/ControlCommand.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/CarState.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/CarStateDt.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/Mission.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/TrajectoryPoint.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/EchievMessage.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/RemoteControlCommand.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/ResAndAmi.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/Time.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/Feedback.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/Visualization.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/DecisionFlag.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/DrivingDynamics.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/CanFrames.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/ConeDbscan.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/ConeDetectionsDbscan.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/YoloCone.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/YoloConeDetections.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/YoloConeTrack.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/YoloConeDetectionsTrack.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/InsDelta.msg"
    "/home/lyq/cpp_homework_02/src/fsd_common_msgs/msg/SkidpadGlobalCenterLine.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs/cmake" TYPE FILE FILES "/home/lyq/cpp_homework_02/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/lyq/cpp_homework_02/devel/include/fsd_common_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/lyq/cpp_homework_02/devel/share/roseus/ros/fsd_common_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/lyq/cpp_homework_02/devel/share/common-lisp/ros/fsd_common_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/lyq/cpp_homework_02/devel/share/gennodejs/ros/fsd_common_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/lyq/cpp_homework_02/devel/lib/python3/dist-packages/fsd_common_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/lyq/cpp_homework_02/devel/lib/python3/dist-packages/fsd_common_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/lyq/cpp_homework_02/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs/cmake" TYPE FILE FILES "/home/lyq/cpp_homework_02/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs/cmake" TYPE FILE FILES
    "/home/lyq/cpp_homework_02/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgsConfig.cmake"
    "/home/lyq/cpp_homework_02/build/fsd_common_msgs/catkin_generated/installspace/fsd_common_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/fsd_common_msgs" TYPE FILE FILES "/home/lyq/cpp_homework_02/src/fsd_common_msgs/package.xml")
endif()

