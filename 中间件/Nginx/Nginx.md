## Nginx & Lua

#### **nginx安装**

> ~~~shell
> # linux 所需依赖
> yum -y install gcc pcre pcre-devel zlib zlib-devel openssl openssl-devel ;
> # linux 内核参数优化
> vim /ect/sysctl.conf
> #进程同时打开最大句柄数
> fs.file-max = 999999
> # 防止SYN攻击
> net.ipv4.tcp_syncookies=1
> # 用于创建新的TCP连接
> net.ipv4.tw_reuse=1
> ....
> 
>  #编译，安装Nginx  
> ./configure --prefix=/usr/local/nginx 
> # --prefix=PATH  安装目录
> # --config-path=PATH  配置文件nginx.conf目录
> # --error-log-path=PATH error日志存放目录
> # --pid-path=PATH pid文件存放目录
> # --http-proxy-temp-path=PATH  反向代理http包体临时存放路径
> # --with-pcre   添加正则表达式库（强制使用pcre库）
> # --with=libatomic 强制使用atomic库，提供原子操作
> # --with-zlib=DIR  使用zlib压缩库
> # --with-http_ssl_module nginx支持SSL协议，实现HTTPS连接
> # --with-http_realip_module 从客户单获取真正的IP(通过请求头获取)
> # --with-http_addition_module 追加http包体和包体
> # --with-http_image_filter_module 压缩图片（需要ligd库支持）
> # --with-http_sub_module 替换返回客户端应答包字符串
> # --with-http_stub_status_module  提供nginx性能统计页面
> # --with-http_perftools_module 提供性能测试工具
> ~~~
>
> 

#### 	**Nginx.conf：配置**

> ~~~shell
> #全局配置 ，配置worker线程所属用户，master线程只能有一个，管理worker进程
> user  root;
> # 指定工作线程  auto | number ，一般设置为CPU核心数的两倍
> worker_processes  auto;
> # 线程绑定CPU内核，二进制表示cpu编号
> worker_cpu_affinity 1000 0100 0010 0001;
> # 工作进程最大文件打开数
> worker_rlimit_nofile 1000000;
> # 是否允许后台执行
> daemon on | off
> 
> # error 错误日志配置（可配置日志等级）
> error_log  logs/error.log;
> # error_log  logs/error.log  notice;
> # error_log  logs/error.log  info;
> 
> #环境变量配置
> env VAR | VAR=VALUE;
> 
> #引用其他配置文件
> include path;
> 
> #设置pid文件路径（master线程）
> pid        logs/nginx.pid;
> 
> # 开启SSL硬件加速(openssl engine -t 检测是否存在硬件设备)
> ssl_engine device;
> 
> # work读写线程池
> thread_pool name threads =32  max_queue=65535
> 
> # IO事件配置
> events {
>     # 事件模型 kqueue rtsig epoll dev/poll select poll
>     use epoll;
>     # 工作进程最大连接数（不能超过worker_rlimit_nofile，一般为 worker_processes *  worker_connections / 4)
>     worker_connections  1024;
> }
> 
> http {
> 
>     include       mime.types;
>     # 当type不存在时，使用http头域中的content-type
>     default_type  application/octet-stream;
>     #文件扩展名映射
>     type {
>       text/html  html;
>       image/gif  gif;
>     }
>     
>     # 配置日志格式
>     log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
>                       '$status $body_bytes_sent "$http_referer" '
>                       '"$http_user_agent" "$http_x_forwarded_for"';
> 
>     #access_log  logs/access.log  main;
> 
>     #开启sendfile，减少管态与目态之间内存复制
>     sendfile        on;
>    
>     #tcp_nopush     on;
>    
>  # 链接超时时间
>     keepalive_timeout  65;
>    
>      # 开启gzip压缩
>     gzip  on;
>     #低于1k资源不压缩
>     gzip_min_length 1k;
>     #压缩等级 1-9（数值越大，压缩率越高，同时cpu资源耗费高）
>     gzip_comp_level  5;
>     # 压缩资源类型（不建议压缩图片）
>     gzip_types text/plain application/javascript 
>     # 添加Accept-Encoding 响应头
>     gzip_vary on;
>     #连接内存池
>     connection_pool_size size;
>     request_pool_size size;
>    
>      # 请求头，请求头读取超时时间
>     client_body_time time;
>     client_header_timour time;
>     # 发送响应超时时间
>     send_timeout time;
>     # 限制请求体最大值
>     client_max_body_size size;
>    
>  # DNS解析服务器
>     resolver address;
>     resolver_timeout;
>    
>     
>      # 虚拟服务器配置（可监听本机端口，可以存在多个，按照配置顺序生效）
>     server {
>         # 监听端口 ipv6 [::]:8080
>         # 可以绑定本机网卡地址 （内网，外网）
>         # listen 443 ssl; 在当前端口连接必须使用SSL协议
>         listen   80;
>         #主机名，可以配置多个
>         server_name  localhost;
>    
>      # 代理路径
>         #  = ：完全匹配Uri(包括参数)
>         # ~：区分大小写
>         # ~*：不区分大小写
>         # ^~：前缀匹配
>         # \.(gif | jpg | jpeg)$：以.gif .jpg .jpeg 结尾的请求
>         # @：nginx内部重定向（不匹配外部请求）
>         location / {
>             # root path ：定向到本地资源根目录，uri充当相对地址
>             root   html;
>             # alias path：定向到本地资源，url中路径可以与path重复
>             alias path;
>             # 配置首页
>             index  index.html index.htm;
>             # 根据状态码重定向到页面
>             error_page  404  401  402              /404.html;
>             # try_files，尝试访问每一个路径，当有效读取时返回文件内容，否则按顺序访问下一个文件路径，必须包含$uri(有效路径)
>             try_files /system/login.html @other  $uri ;
>             # http报文存储在磁盘或内存中
>             client_body_in_file_only on|clean|off;
>             client_body_in_single_buffer on|off;
>    
>                      #限制用户请求
>             limit_except GET{
>              allow ip/32;
>              deny all;
>             }
>    
>                      #反向代理(可以代理具体ip或upstream集群或https请求)
>             proxy_pass http://backend
>    
>                      #默认情况下反向代理不会转发Host头部消息（加上该配置进行头部转发）
>             proxy_set_header Host $host;
>    
>                    #代理请求方法（可以将GET请求代理POST)
>             proxy_method method;
>    
>                      #重定向转发，当301,302请求时，重设置http头部refresh，location填充地址
>             proxy_redirect address
>    
>                      # 当代理服务器发生超时，错误时，重新选择一个节点发生
>             proxy_next_upstrem error timeout 
>    
>                 }
>         # 根据状态码重定向到页面(全局)
>         error_page  404  401  402              /404.html;
>         error_page  404  401  402              @fetch;
>         error_page  404  401  402              http://example.com;
>    
>         
>         
>      # redirect server error pages to the static page /50x.html
>         #
>         error_page   500 502 503 504  /50x.html;
>         location = /50x.html {
>             root   html;
>         }
>     }
>     # 上游服务器集群，用于反向代理proxy_pass 指令
>     upstream backend{
>        #哈希算法，固定某个ip代理到固定节点（不与weight同时使用）
>        ip_hash
>        # 设置集群轮询权重
>        server server_name weight = 1;
>        # 与fail_timeout使用，配置在fail_timeout时间内失败次数超过max_fails，则认为该节点下线
>        server server_name max_fails=10;
>        # 配置停用间隔时间，到达这个时间后重新上线
>        server server_name fail_timeout=10;
>        server server_name down;
>        server server_name backpu;
>     }
>      # 代理TCP请求
>     stream{
>    
>         }
>    
>     }
> 
> 
> ~~~
> 
>![image-20230525120130535](image-20230525120130535.png) 

#### **Nginx性能监控**

> 添加 ngx_http_stub_status_module 模块
>
> 

