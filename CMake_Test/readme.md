说说我对cmake作业的理解吧。
首先我们看一下整个程序：其实结构并不复杂：
1.在main函数中首先创建了一个m1对象，此时调用构造函数并在屏幕上显示提示；
2.调用了M1的print函数，这里包括了M1自带的print函数和A1中的3个print函数（话说这个I'm A3应该就是readme中的I'm planning吧，我就先不改了）；
3.创建了两个（10，20）和（30，40）的点；
4.计算这两个点之间的欧氏距离（20倍根号2，即28.2843）。
也就是说，只要main.cpp能够正常运行，输出的结果就应该是readme中要求的结果。
因此，我们的任务就是通过cmakelists使得整个程序能够运行，不需要其他的东西（比如隔壁ros作业还要自定义message什么的）。
但是，由于我的虚拟机的内存不够安装opencv：在安装的时候1bit的空间都没有了，在我一顿操作试图增加一些空间之后险些把自己对linux系统的权限都整丢了（命令行的绿色名字变白色）之后我也不敢再去硬装了（最后一顿删除总算搞出了2G左右的空间，但不敢乱动了），这就导致我的作业没有进行实际上的验证，至于对错只能听天由命了（等实习期过去之后一定要整个双系统）

以下是我从菜鸟教程那里复制过来的创建cmakelists的基本步骤：

cmake_minimum_required(VERSION 3.10)   # 指定最低 CMake 版本

project(MyProject VERSION 1.0)          # 定义项目名称和版本


set(CMAKE_CXX_STANDARD 11)     # 设置 C++ 标准为 C++11
set(CMAKE_CXX_STANDARD_REQUIRED ON)


include_directories(${PROJECT_SOURCE_DIR}/include)   # 添加头文件搜索路径


add_library(MyLib src/mylib.cpp) # 添加源文件       # 创建一个库目标 MyLib
add_executable(MyExecutable src/main.cpp)  # 创建一个可执行文件目标 MyExecutable


target_link_libraries(MyExecutable MyLib)  # 链接库到可执行文件

我们基本上可以按照这个步骤来进行cmakelists的编写。
1.由于测试者的cmake版本是3.13，所以最低版本写之前的应该没问题；
2.定义项目名称：readme中有要求；
3.设置C++标准（我认为以上三条是不管什么文件都要这么写的）
4.设置头文件搜索路径：这里用了“${CMAKE_CURRENT_SOURCE_DIR}”，按照网上的说法是提高了文件的容错率；
5.因为用到了opencv，所以要添加一个opencv的package（但是如前文所言，我这边搞不到这个包，所以编译肯定是过不了的）；
6.接着就是添加源文件了：
（1）.创建一个库目标：这里我是给每一个源文件都创建了一个库，不然一个库下面塞一大堆源文件看的头疼；
（2）.创建一个可执行文件目标：其实只有main函数是需要执行的；
（3）.链接库到可执行文件：target_link_libraries和target_include_directories这两个通常是要一起出的：分别在link和compile中起到寻找目标的作用。
对于main.cpp来说，需要把上面所有东西都放进去

一些遇到的问题：
1.在.vscode中只有setting.json，并没有c_cpp_priorities.json 和tasks.json，我问了一下AI，它告诉我这两个文件与程序的运行无关，那就先不管了；
2.经典的目录问题：在写程序时经常遇到目录放置错误的问题，这就导致经常会出现找不到文件的问题（与之类似的还有命名规范问题）

就这样吧，我感觉说的差不多了......
