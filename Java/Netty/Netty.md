## Netty

*基于Reactor模型的网络通信应用框架（阻塞异步事件驱动）*

> <img src="img\image-20221209143638416.png" alt="image-20221209143638416" style="zoom:67%;" /> 

- #### Channel Java NIO的基本构造

  > 它代表一个到实体（如一个硬件设备、一个文件、一个网络套接字或者一个能够执 行一个或者多个不同的I/O操作的程序组件）的开放连接，如读操作和写操作（Channel 看作是传入（入站）或者传出（出站）数据的载体。因此，它可以 被打开或者被关闭，连接或者断开连接。）

- #### EventLoopGroup

  > 线程池，用户处理用户连接请求，处理事件，一个线程可以处理多个Channel上所有事件

- #### ChannelHandler、ChannelPipeline

  > **入站事件：**
  >
  > 1. 连接已被激活或连接失效
  > 2. 数据读取
  > 3. 用户事件（handler）
  > 4. 错误事件
  >
  > **出站事件：**
  >
  > 1. 打开或者关闭到远程节点连接
  > 2. 将数据写入到Socket
  >
  > 
  >
  > ChannelHandler 是对 Channel 中数据的处理器(拦截器)
  >
  > <img src="img\image-20221209152536338.png" alt="image-20221209152536338" style="zoom: 67%;" /> 
  >
  > **生命周期函数：**
  >
  > channelActive : 在到服务器的连接已经建立之后将被调用
  >
  > channelRead：当从服务器接收到一条消息时被调用(需要处理粘包)
  >
  > channelReadComplete：数据读取完毕事件
  >
  > channelInactive：断开重连事件
  >
  > exceptionCaught：通道发生异常事件
  >
  > ChannelPipeline ：ChannelHandler容器，负责ChannelHandler的管理和事件拦截与调度。
  >
  > userEventTriggered：用户事件（读或写）

- #### ChannelHandlerContext

  > 保存 Channel 所有上下文信息
  >
  > close：关闭通道
  >
  > flush：刷新
  >
  > writeAndFlush：将数据写到 ChannelPipeline 中当前 ChannelHandler 的下一个 ChannelHandler 开始处理
  
- #### ChannelFuture（在操作完成时通知应用程序的方式）

  > ChannelFutureListener：在操作完成时获得通知（实现operationComplete方法）
  >
  > channel：返回当前正在进行IO操作的通道
  >
  > sync：等待异步操作执行完毕，将异步改为同步
  
- #### Unpooled

  > 专门用来操作缓冲区的工具类

- **零拷贝**

  > *计算机中传统数据传输需要经过两个阶段，由操作系统把数据从硬盘或网卡拷贝到操作系统内核中，在由用户程序将数据由内核空间拷贝到用户空间，用户程序一次IO需要经过4次目态与管态中断切换，2次CPU拷贝，2次DMA拷贝*
  >
  > <img src="img/image-20221209154724749.png" alt="image-20221209154724749" style="zoom:67%;" /> 
  >
  > **零拷贝：**数据从一个存储区域到另一个存储区域不通过复制方法实现，利用mmap内存映射机制，将硬件IO数据映射到内存某个区域，由用户程序直接通过内存读取。
  >
  > **Netty零拷贝实现：**
  >
  > 1. 堆外内存对Socket内存直接读写
  > 2. 用户程序操作buffer对象
  > 3. 文件传输采用TransferTo方法

  



