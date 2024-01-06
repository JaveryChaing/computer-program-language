## **Linux 常用命令**

- useradd/passwd/chage/su/groupadd/gpasswd

  > Linux用户种类：超级用户，系统用户(一般不能登陆)，普通用户
  >
  > 普通用户相关文件
  >
  > 1. /etc/login.defs
  > 2. /etc/passwd
  > 3. /etc/shadow

- ps 进程管理

  > 进程状态
  >
  > - R：运行
  >
  > - S：休眠
  >
  > - T：暂停
  >
  > - Z：僵死(保留PCB，直到父进程释放)
  >
  > 网络状态
  >
  > - proto：tcp/udp/unix(只用于本机通信)
  > - Recv-Q/Send-Q：数据包收发堆积数量
  > - LocalAddress：本机使用的地址与端口，0.0.0.0:对外开放
  > - ForeginAddress：与本地建立连接的远程计算机的 IP 地址和端口号
  > - state：
  >   1. closed：无连接
  >   2. **listening：等待远程主机连接**
  >   3. syn_send/syn_recv：tcp建立握手状态
  >   4. **established：建立TCP连接（双方正在通信）**
  >   5. fin_wait/fin：tcp释放连接
  >
  > top/vmstat/ldd/lsof/netstat/tcpdump/free：查询当前系统资源使用
  >
  > - top -d  1: 刷新频率
  > - losf -p：显示当前进程打开的文件
  > - losf -u ：指定用户打开的文件
  > - losf /path ：当前文件使用的进程
  > - losf -i ：显示所有连接的端口
  > - netstat -ntlp：查看所有tcp端口
  > - netstat -antp：查看所有已经建立的tcp连接

- service服务管理

  > - chkconfig：管理系统服务的启动和停止
  >   1. --add：添加服务到chkconfig的管理列表中
  >   2. --list：列出所有置的服务以及它们在各个运行级别下的启用状态
  > - service：服务以系统脚本方式运行（脚本存放在/etc/init.d目录中）
  > - systemctl：
  >   - /lib/systemd/system
  >   - /usr/lib/systemd/system
  >   - /etc/systemd/system

- alias  设置命令别名

  ~~~shell
  alias md='mkdir'
  alias dir='ls-al'
  ~~~

- jobs/nohup/disown/bg/&/crontab将查询放到后台执行

  > jobs：显示当前会话执行的后台进程
  >
  > bg：将暂停的任务提交到后台运行（ctrl + z  暂停当前作业，ctrl + c  杀死进程） 
  >
  > &：同bg，将当前命令提交到后台运行
  >
  > fg：与bg相反，将后台任务显示在当前会话
  >
  > nohup：退出终端或关闭SSH连接不中断任务
  >
  > disown：同nohup，退出终端后不中断任务
  >
  > crontab：计时器

- 文件操作命令

  > shell
  >
  > 1. `? .*`：占位符
  > 2. `[0-9] [15] [^r]`：匹配任意个数字，只匹配1或5，匹配除r之外的任意字符
  > 3. `^a z$`：匹配以a开头的行，匹配以z结尾的行
  > 4. `k{2,4}`:匹配k至少2次到4次
  > 5. `> ，>>，2>&1`: 输出重定向
  > 6. `<,<<`：输入重定向
  > 7. `|`: 管道符，将前一个命令的输出作为下一个命令的参数
  > 8. `; && ||`：
  >
  > chmod： 更改文件或目录的属性
  >
  > cmp：比较两个文件是否有差异
  >
  > alias：命令别名
  >
  > cp/mv：移动复制
  >
  > touch：创建文件
  >
  > cat/tail/head/more/less/cut：标准文本输出
  >
  > find/awk/grep/sed/tee：匹配正则表达式需要添加``号
  >
  > - find：查找文件或目录
  >   1. -name/iname ：通过文件名查找
  >   2. -size：+1G：查找大于1G的文件
  >   3. -user/group：查找相关用户文件
  >   4. -atime：根据文件访问时间进行搜索
  >   5. -ctime：根据文件状态改变时间进行搜索
  >   6. -exec：匹配后执行指定命令
  > - grep/egrep：搜索文件内容
  >   1. `-i`:忽略大小写
  >   2. `-n`：输出行号
  >   3. `-v`：输出不符合的行
  > - sed：标准流输入输出编辑器
  >   1. sed `s/old/new/g` file：文件内字符替换
  >   2. sed  `/pattern/d`： 
  >
  > echo：
  >
  > diff：比较文件差异
  >
  > tr：转换文本文件中的字符
  >
  > file 判断文件类型
  >
  > df：磁盘挂载情况
  >
  > du：显示目录或文件大小

  

   

   

