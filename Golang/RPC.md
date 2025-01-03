## RPC

> RPC(Remote Procedure Call Prototcol)允许本地调用方式调用远程服务（通过网络调用两台不同服务器上应用方法）
>
> - 解决通讯问题（TCP,UDP网络连接）
> - 解决寻址问题（基于Web服务调用，或基于RMI注册调用）
> - 数据序列化与反序列化（数据规范）
> - 对调用者透明（解耦服务）
练习
#### **Apache Dubbo （RPC框架）**

> - **单一应用架构**
>
>   > 所有功能集成在一个应用中，减少部署节点和成本，适用于简单的CURD应用，ORM数据访问是关键
>
> - **垂直应用架构**
>
>   > 按业务将功能拆分不同的应用，对比单一应用架构，提升应用效率，提升效率的关键是Web框架
>
> - **分布式服务架构**
>
>   > 基于垂直应用架构，应用之间通信效率为分布式提升效率的关键
>
> - **流动计算架构**
>
>   > 基于访问压力实时管理集群容量，提升集群利用率架构，提高机器利用率的资源调度和**治理中心**(SOA)是关键
>
> **Dubbo架构**
>
> ![image-20220508194507735](assets\image-20220508194507735.png) 
>
> - Provider 
> - Consumer
> - Registry
> - Monitor (监控中心，统计应用调用次数和时间)
> - Container （运行容器）
>
> **Dubbo调用流程**
>
> 1. Container启动，加载Provider，并向Registry提供调用接口清单（init）
> 2. Consumer 启动，向Registry订阅**自己所需要**的接口（初始化）
> 3. Registry返回Consumer所需的接口清单，如果有变更（新的Provider加入，或者Provider版本变更），注册中心**主动将变更接口返回给Consumer** （长连接，不用重新建立网络请求）
> 4. **Consumer 使用按照负载均衡算法**，选择一个提供者进行调用（调用失败，则另选）
> 5. 服务消费者和提供者，在内存中累计调用次数和调用时间，定时每分钟发送一次统计数据到监控中心。
>
> **注册中心不转发请求**
>
> **注册中心，服务提供者，服务消费者三者之间均为长连接，监控中心除外**
>
> **注册中心通过长连接感知Provider 是否在线，如果宕机，注册中心将立即推送事件通知消费者，**
>
> **Dubbo服务宕机，不影响以运行的提供者和消费者**
>
> ---
>
> **Dubbo功能**
>
> - 点对点直连服务
> - 服务分组（对远程接口按分组内容调用）
> - 流式通讯
> - 负载均衡
> - 多版本服务（多集群应用下使用版本号作为依据进行调用，通常在集群不停机状态下升级）
> - 分组聚合（类似多线程调用，将Consumer任务分解不同的组，调用时，所有的组进行远程调用，并将最后的结果进行合并）
> - 参数验证
> - 结果缓存
> - 泛化引用，泛化实现
>
> ---
>
> **Dubbo注册中心选择**
>
> - Zookeeper
> - Redis
> - Multicast 
>
> ---
>
> **Dubbo支持的协议**
>
> - Dubbo 协议 （基于tcp设计，NIO同步非阻塞多路复用）
>
>   > NIO 同步非阻塞（同步：进程等待上一次任务结束后才能执行下一步操作，阻塞：调用进程被中断，调用操作系统进程去执行I/O操作，等待I/O操作执行完后，在唤醒被中断的进程。非阻塞I/O：调用进程不需要等待内核IO操作彻底完成，可立即唤醒当前进程进入就绪态)
>   >
>   > <img src="assets\image-20220509093720453.png" alt="image-20220509093720453" style="zoom:80%;" /> 
>   >
>   > - 魔法数（类似消息间隔符，防止Tcp粘包问题）
>   > - 16位，17位 0 表示响应，1表示请求
>   > - 18位，0表示请求或响应包，1位心跳包（用于长连接监测）
>   > - 19~23位 （标识序列化方式）
>   > - 24~31位 标识响应状态（20正常，30超时，31服务端超时）
>   > - 5~12字节（32~95位） RPC请求唯一ID，用来请求响应关联
>   > - 13~16字节（96~127位）校验信息（dubbo版本，方法名称，参数类型，attachment）
>   >
>   > Dubbo中编码实现层继承`Exchangecodec`
>
> - Rmi 协议  可与原生RMI互操作，基于TCP协议
>
>   > `java.rmi.Remote` Java原生实现，使用接口继承Remote实现远程代理对象，实现接口使用UnicastRemoteObject 进行序列化，可以用Spring方式实现
>   >
>   > ~~~java
>   >  //绑定服务接口对象和访问url
>   > LocateRegistry.createRegistry(8080);
>   > Naming.bind("rmi://127.0.0.1:8080/UserService", userServer);
>   >  // 客户端进行访问
>   > UserService userService = (UserService)Naming.lookup("rmi://127.0.0.1:8080/UserService");
>   > 
>   > ~~~
>   >
>   > RMI与Http
>   >
>   > - RMI 在**TCP协议**上传输可序列化Java对象，只能在JVM上使用
>   >
>   > - WebService **基于Http方式进行通讯**
>   >
>   >   > - XML  WebService数据类型
>   >   > - SOAP 用于交换XML编码协议（用于解析XML标记语言规范），可以运行在任何传输协议上
>   >   > - WSDL  WebService描述语言，用于描述Web Service及其函数、参数和返回值
>   >   > - UDDI 
>   >
>   > - RMI性能优于WebService 10倍以上
>   >
>   > - RMI 不能跨语言调用
>
> - Hessian 协议 
>
>   > *本地格式的数据编码为二进制数据，仅用一个字符作为结构化标记*
>   >
>   > 类似于WebService中Soap协议规范，对传输的数据进行描述，加解密
>
> **Dubbo3**
>
> - 全新的基于应用粒度的服务发现机制
> - 与gRpc，SpringCloud 互通
> - 兼容IDL定义服务，支持其他语言
> - Request Stream、Response Stream、Bi-direction Stream 流式通讯
> - 以 HTTP2 作为传输层构建新的协议Triple
>
> ---
>
> **Dubbo路由**
>
> - 动态路由
> - 权重路由
>
> [Dubbo官网](https://dubbo.apache.org/zh/docs/concepts/)
>
> [Dubbo相关资料](https://www.bookstack.cn/read/apache-dubbo-3.0-zh/34d1a9093713983a.md)

#### **gRPC**

> `gRPC`是由 `google`开发的一个高性能、通用的开源`RPC`框架，主要面向移动应用开发且基于**`HTTP/2`协议标准**而设计，同时支持大多数流行的编程语言
>
> **Http/2协议**
>
> - http2采用二进制传输（区别于http1的文本传输）
> - 多路复用（http1在一次网络连接时只能提交一个请求，http2可以同一网络连接可以处理多个请求）
> - http2使用gzip压缩，减少数据在网络上载荷
> - http2服务端**可以主动推送资源到客户端**
>
> **TCP连接与释放**
>
> - <img src="assets\image-20220509142547638.png" alt="image-20220509142547638" style="zoom:67%;" /> 
> - ACK标志位，表示该请求是否有效（服务器或客户端应答标识）
> - SYN标志位，表示该信号是请求建立报文（连接信号）
> - FIN标志位，用于释放连接，FIN位1表示发送方数据发送完毕，并释放连接（释放信号）
> - SEQ 初始序号（服务端与客户端请求标识，确保请求响应一一对应）
>
> - **TCP连接过程**
>
>   1. 客户端发送建立连接的TCP报文(SYN = 1 ，ACK = 0 ，初始序号 = 0 （可以是随机））
>   2. TCP报文被服务器接收提取，并为该TCP连接分配资源，然后向客户端发送允许连接ACK报文（ACK = 1，SYN = 1 ，初始序号 + 1）
>   3. 客户端接收服务器TCP报文，并为该TCP连接分配资源，然后向服务器发送应答信号（ACK = 1  SYN = 0，初始序号 + 1）
>
>   *TCP后两次报文，分别是服务器连接确认，和客户端连接确认，**后续数据传输在通讯端无异常情况下 ACK = 1，SYN = 0，初始序号单向+1***
>
>   ---
>
> - **TCP释放过程**
>
>   1. 客户端发送断开连接报文（FIN = 1  seq = v）
>   2. 服务端立即响应断开连接报文（ACK = 1 ，seq = n + 1 ）服务器不在接收客户端请求
>   3. 服务器响应客户端所有请求后再发送断开报文（FIN = 1 ，ACK = 1，seq = m + 1) 服务器不在响应客户端
>   4. 客户端立即响应服务器断开连接并发送（ACK = 1，seq = m + 2）报文，**服务器收到报文后释放网络连接资源**。客户端等待一段时间后释放网络连接资源
>
> - **Http/1.1 中多路复用** (客户端想发送多个并行的请求，那么必须使用多个 TCP 连接)
>
> <img src="assets\image-20220509161024559.png" alt="image-20220509161024559" style="zoom:67%;" /> 
>
> Protocol Buffers v3  Google开源成熟结构数据序列机制（类似于JSON），gRCP通过序列化机制进行通讯
>
> ~~~go
> // GO Plugins 
> go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
> go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
> go get google.golang.org/grpc
> ~~~
>
> #### **Protobuf语法**
>
> ~~~protobuf
> // Message 类型定义（描述请求或响应的消息格式）
> // Tags  消息定义中字段的唯一数值标签（用于二进制格式中标识字段）
> message SearchRequest{
> 	string query = 1;
> 	int32 page_number = 2;
> 	int32 result_per_page = 3;
> }
> // reserved 关键值指定保留字段名和标签
> message Foo{
> 	reserved 2,15,9 to 11;
> 	reserved "foo","bar";
> }
> 
> // 枚举类型 Enum 每个enum定义的第一个元素值必须是0
> enum Corpus {
> 	 UNIVERSAL = 0;
> 	 WEB = 0;
> 	 IMAGES = 0;
>       NEWS = 0;
>       PRODUCTS = 0;}
> 
> // MAP 类型  key_type 可以是非浮点，byres外内置类型
> // value_type 除map外任意类型
> map<key_type,value_type>map_field = N;
> map<string,Foo>projects = 1;
> 
> //Service 定义服务 RPC服务接口
> service SearchService{
>   rpc Search(SearchRequest) returns(SearchResponse){}
> }
> 
> Message命名采用驼峰命名方式，字段命名采用小写字母加下划线分隔方式
> Enums类型名采用驼峰命名方式，字段命名采用大写字母加下划线分隔方式
> Service名称与RPC方法名统一采用驼峰式命名
> ~~~
>
> **编译**
>
> ~~~shell
> protoc --proto_path=IMPORT_PATH --cpp_out=DST_DIR --java_out=DST_DIR --python_out=DST_DIR --go_out=DST_DIR --ruby_out=DST_DIR --javanano_out=DST_DIR --objc_out=DST_DIR --csharp_out=DST_DIR path/to/file.proto
> ~~~
>
> **基本数据类型**
>
> |  .proto  |  C++   |    Java    |     Python     |   Go    |         Ruby         |     C#     |
> | :------: | :----: | :--------: | :------------: | :-----: | :------------------: | :--------: |
> |  double  | double |   double   |     float      | float64 |        Float         |   double   |
> |  float   | float  |   float    |     float      | float32 |        Float         |   float    |
> |  int32   | int32  |    int     |      int       |  int32  |   Fixnum or Bignum   |    int     |
> |  int64   | int64  |    long    |  ing/long[3]   |  int64  |        Bignum        |    long    |
> |  uint32  | uint32 |   int[1]   |  int/long[3]   | uint32  |   Fixnum or Bignum   |    uint    |
> |  uint64  | uint64 |  long[1]   |  int/long[3]   | uint64  |        Bignum        |   ulong    |
> |  sint32  | int32  |    int     |      intj      |  int32  |   Fixnum or Bignum   |    int     |
> |  sint64  | int64  |    long    |  int/long[3]   |  int64  |        Bignum        |    long    |
> | fixed32  | uint32 |   int[1]   |      int       | uint32  |   Fixnum or Bignum   |    uint    |
> | fixed64  | uint64 |  long[1]   |  int/long[3]   | uint64  |        Bignum        |   ulong    |
> | sfixed32 | int32  |    int     |      int       |  int32  |   Fixnum or Bignum   |    int     |
> | sfixed64 | int64  |    long    |  int/long[3]   |  int64  |        Bignum        |    long    |
> |   bool   |  bool  |  boolean   |    boolean     |  bool   | TrueClass/FalseClass |    bool    |
> |  string  | string |   String   | str/unicode[4] | string  |    String(UTF-8)     |   string   |
> |  bytes   | string | ByteString |      str       | []byte  |  String(ASCII-8BIT)  | ByteString |
>
> 

#### **RPCX**（golang RPC框架）

> - 支持TCP，HTTP，QUIC，KCP，TLS协议
>
> - 支持多编码方式，JSON，Protobuf，MessagePack，原始字节数据
>
> - 服务发现支持，zookeeper、etcd、consul、mDNS
>
> - 容错支持 Failover、Failfast、Failtry 
>
>   > 容错处理方案 (超时处理，限流，线程池，熔断器，降级)
>
> - 负载均衡（随机，顺序，一致性哈希，权重，基于网络质量，就近选取）
>
> - 压缩，扩展信息传递
>
> - 身份认证
>
> - 支持metrics、log、timeout、别名、断路器等特性
>
> [RPCX](https://doc.rpcx.io/part1/quickstart.html)
>
> ~~~go
> rpcx 依赖
> go get -u -v github.com/smallnest/rpcx/...
> go get -u -v -tags "etcd" github.com/smallnest/rpcx/...
> go get -u -v -tags "quic etcd" github.com/smallnest/rpcx/...
> // 所有标签
> go get -u -v -tags "reuseport quic kcp zookeeper etcd consul ping" github.com/smallnest/rpcx/...
> ~~~
> 
>



