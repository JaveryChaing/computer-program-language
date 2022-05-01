## **Golang标准库**

- #### fmt 包

  > Print  将内容输出到系统的标准输出(未string化)
  >
  > Printf  将内容格式化字符串标准输出
  >
  > Fprint 将内容输出到一个io.Writer接口类型的变量w中（写文件）
  >
  > Sprint 传入的数据生成并返回一个字符串。
  >
  > Errorft 根据format参数生成格式化字符串并返回一个包含该字符串的错误。
  >
  > |     占位符      |                             说明                             |
  > | :-------------: | :----------------------------------------------------------: |
  > |       %v        |                       值的默认格式表示                       |
  > |       %+v       |              类似%v，但输出结构体时会添加字段名              |
  > |       %#v       |                        值的Go语法表示                        |
  > |       %T        |                         打印值的类型                         |
  > |       %%        |                            百分号                            |
  > |       %t        |                             布尔                             |
  > |       %b        |                            二进制                            |
  > |       %c        |                    该值对应的unicode码值                     |
  > |       %q        | 该值对应的单引号括起来的go语法字符字面值，必要时会采用安全的转义表示 |
  > | %f 、%9f，%9.2f |                             小数                             |
  > |       %s        |                   直接输出字符串或者[]byte                   |
  >
  > Scan 从标准输入扫描文本(换行符视为空白符，空格输入数据的分隔符)
  >
  > Scanln 遇到换行时才停止扫描。最后一个数据后面必须有换行或者到达结束位置
  >
  > NewReader 输入的内容可能包含空格

- #### Time 

  > *时间的显示和测量用的函数*
  >
  >  
  >
  > Duration 两个时间点之间经过的时间，以纳秒为单位
  >
  >   
  >
  > Tick 定时器（时间间隔）
  >
  > ~~~go
  >  ticker := time.Tick(time.Second)
  > for i := range ticker {
  >         fmt.Println(i)//每秒都会执行的任务
  >     }
  > ~~~
  >
  > 时间格式化  
  >
  > ~~~go
  >   //Format 模板以go创建时间为例
  > fmt.Println(now.Format("2006-01-02 03:04:05.000"))
  > ~~~
  >
  > 解析字符串格式时间
  >
  > ~~~go
  > loc, err := time.LoadLocation("Asia/Shanghai")
  > timeObj, err := time.ParseInLocation("2006/01/02 15:04:05", "2019/08/04 14:15:20", loc)
  > ~~~

- #### Flag 

  > *获取go命令行参数*
  >
  >  
  >
  > os.Args 

- #### Logger

  > *内置的log包实现了简单的日志服务*

- #### I/O操作

> - ```
>   func Create(name string) (file *File, err Error)
>   ```
>
>   - 根据提供的文件名创建新的文件，返回一个文件对象，默认权限是0666
>
> - ```
>   func NewFile(fd uintptr, name string) *File
>   ```
>
>   - 根据文件描述符创建相应的文件，返回一个文件对象
>
> - ```
>   func Open(name string) (file *File, err Error)
>   ```
>
>   - 只读方式打开一个名称为name的文件
>
> - ```
>   func OpenFile(name string, flag int, perm uint32) (file *File, err Error)
>   ```
>
>   - 打开名称为name的文件，flag是打开的方式，只读、读写等，perm是权限
>
> - ```
>   func (file *File) Write(b []byte) (n int, err Error)
>   ```
>
>   - 写入byte类型的信息到文件
>
> - ```
>   func (file *File) WriteAt(b []byte, off int64) (n int, err Error)
>   ```
>
>   - 在指定位置开始写入byte类型的信息
>
> - ```
>   func (file *File) WriteString(s string) (ret int, err Error)
>   ```
>
>   - 写入string信息到文件
>
> - ```
>   func (file *File) Read(b []byte) (n int, err Error)
>   ```
>
>   - 读取数据到b中
>
> - ```
>   func (file *File) ReadAt(b []byte, off int64) (n int, err Error)
>   ```
>
>   - 从off开始读取数据到b中
>
> - ```
>   func Remove(name string) Error
>   ```
>
>   - 删除文件名为name的文件

- #### **strconv **

> 基本数据类型与其字符串表示的转换
>
> - Atoi() 将字符串转为int
> - Itoa()将int转为字符
> - Parse 类函数用于转换字符串为给定类型的值

- #### **Template**

  > 模板语法 {{.}}  .表示当前传入的对象
  
- #### Http

- #### **Context**

  > 在 Goroutine 构成的树形结构中对信号进行同步以减少计算资源的浪费是 [`context.Context`](https://draveness.me/golang/tree/context.Context) 的最大作用。
  >
  > ![image-20220501192355673](img\image-20220501192355673.png) 
  >
  > 
