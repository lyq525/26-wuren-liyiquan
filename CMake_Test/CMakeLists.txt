cmake_minimum_required(VERSION 3.10)
project(Test)

# 设置C++标准
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 设置项目根目录
set(PROJECT_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/Cmake1)

# 查找OpenCV包
find_package(OpenCV 4.5.3 REQUIRED)

# 添加A1库
add_library(A1 
    ${PROJECT_ROOT}/modules/A1/src/A11.cpp
    ${PROJECT_ROOT}/modules/A1/src/A12.cpp
    ${PROJECT_ROOT}/modules/A1/src/A13.cpp
)
target_include_directories(A1 PUBLIC 
    ${PROJECT_ROOT}/modules/A1/include
)

# 添加A2库
add_library(A2 
    ${PROJECT_ROOT}/modules/A2/src/A2.cpp
)
target_include_directories(A2 PUBLIC 
    ${PROJECT_ROOT}/modules/A2/include
)

# 添加M1库
add_library(M1 
    ${PROJECT_ROOT}/modules/M1/src/M1.cpp
)
target_include_directories(M1 PUBLIC 
    ${PROJECT_ROOT}/modules/M1/include
    ${PROJECT_ROOT}/modules/A1/include  # 依赖A1头文件
)
target_link_libraries(M1 A1)

# 添加M2库
add_library(M2 
    ${PROJECT_ROOT}/modules/M2/src/M2.cpp
)
target_include_directories(M2 PUBLIC 
    ${PROJECT_ROOT}/modules/M2/include
    ${PROJECT_ROOT}/modules/A1/include  # 依赖A1头文件
    ${PROJECT_ROOT}/modules/A2/include  # 依赖A2头文件
    ${PROJECT_ROOT}/common/kalman/include  # KalmanFilter头文件
)
target_link_libraries(M2 A1 A2 ${OpenCV_LIBS})

# 添加Math库
add_library(Math 
    ${PROJECT_ROOT}/common/Math/src/Math.cpp
)
target_include_directories(Math PUBLIC 
    ${PROJECT_ROOT}/commom/Math/include
    ${PROJECT_ROOT}/common/kalman/include  # KalmanFilter头文件
)
target_link_libraries(Math ${OpenCV_LIBS})

# 添加可执行文件
add_executable(test 
    ${PROJECT_ROOT}/main.cpp
)
target_include_directories(test PUBLIC 
    ${PROJECT_ROOT}/modules/M1/include
    ${PROJECT_ROOT}/modules/M2/include
    ${PROJECT_ROOT}/common/Math/include
    ${PROJECT_ROOT}/common/kalman/include  # KalmanFilter头文件
)
target_link_libraries(test 
    M1 
    M2 
    A1 
    A2 
    Math 
    ${OpenCV_LIBS}
)