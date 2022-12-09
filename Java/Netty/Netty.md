## Netty

*基于Reactor模型的网络通信应用框架（阻塞异步事件驱动）*

> <img src="img\image-20221209143638416.png" alt="image-20221209143638416" style="zoom:67%;" /> 

- #### Channel

  > 对Socket API 封装

- #### EventLoopGroup

  > 线程池，用户处理用户连接请求，处理事件，一个线程可以处理多个Channel上所有事件

- #### ChannelHandler、ChannelPipeline

  > ChannelHandler 是对 Channel 中数据的处理器(拦截器)
  >
  > <img src="img\image-20221209152536338.png" alt="image-20221209152536338" style="zoom: 67%;" /> 
  >
  > channelActive : 通道就绪事件
  >
  > channelRead：通道读取数据事件
  >
  > channelReadComplete：数据读取完毕事件
  >
  > channelInactive：断开重连事件
  >
  > exceptionCaught：通道发生异常事件
  >
  > ChannelPipeline ：ChannelHandler容器，负责ChannelHandler的管理和事件拦截与调度。

- #### ChannelHandlerContext

  > 保存 Channel 所有上下文信息
  >
  > close：关闭通道
  >
  > flush：刷新
  >
  > writeAndFlush：将数据写到 ChannelPipeline 中当前 ChannelHandler 的下一个 ChannelHandler 开始处理
  
- #### ChannelFuture

  > Channel中异步I/O操作的结果
  >
  > channel：返回当前正在进行IO操作的通道
  >
  > sync：等待异步操作执行完毕，将异步改为同步
  
- #### Unpooled

  > 专门用来操作缓冲区的工具类

- **零拷贝**

  > *计算机中传统数据传输需要经过两个阶段，由操作系统把数据从硬盘或网卡拷贝到操作系统内核中，在由用户程序将数据由内核空间拷贝到用户空间，用户程序一次IO需要经过4次目态与管态中断切换，2次CPU拷贝，2次DMA拷贝*
  >
  > <img src="C:\Users\jiangpenghui\AppData\Roaming\Typora\typora-user-images\image-20221209154724749.png" alt="image-20221209154724749" style="zoom:67%;" /> 
  >
  > **零拷贝：**数据从一个存储区域到另一个存储区域不通过复制方法实现，利用mmap内存映射机制，将硬件IO数据映射到内存某个区域，由用户程序直接通过内存读取。
  >
  > **Netty零拷贝实现：**
  >
  > 1. 堆外内存对Socket内存直接读写
  > 2. 用户程序操作buffer对象
  > 3. 文件传输采用TransferTo方法

  



