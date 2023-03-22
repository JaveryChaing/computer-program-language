## C++

> **标准库**
>
> - 核心语法
> - C++标准库
> - STL标准模板库
>
> **ANSI标准**：实现不同环境（Mac、UNIX、Windows、Alpha）对C++程序编译执行
>
> **C++编译器**
>
> - GNU
>
>   > gcc：C语言编译器
>   >
>   > g++：C++编译器
>   >
>   > | 选项         | 解释                                                         |
>   > | :----------- | :----------------------------------------------------------- |
>   > | -ansi        | 只支持 ANSI 标准的 C 语法。这一选项将禁止 GNU C 的某些特色， 例如 asm 或 typeof 关键词。 |
>   > | -c           | 只编译并生成目标文件。                                       |
>   > | -DMACRO      | 以字符串"1"定义 MACRO 宏。                                   |
>   > | -DMACRO=DEFN | 以字符串"DEFN"定义 MACRO 宏。                                |
>   > | -E           | 只运行 C 预编译器。                                          |
>   > | -g           | 生成调试信息。GNU 调试器可利用该信息。                       |
>   > | -IDIRECTORY  | 指定额外的头文件搜索路径DIRECTORY。                          |
>   > | -LDIRECTORY  | 指定额外的函数库搜索路径DIRECTORY。                          |
>   > | -lLIBRARY    | 连接时搜索指定的函数库LIBRARY。                              |
>   > | -m486        | 针对 486 进行代码优化。                                      |
>   > | -o           | FILE 生成指定的输出文件。用在生成可执行文件时。              |
>   > | -O0          | 不进行优化处理。                                             |
>   > | -O           | 或 -O1 优化生成代码。                                        |
>   > | -O2          | 进一步优化。                                                 |
>   > | -O3          | 比 -O2 更进一步优化，包括 inline 函数。                      |
>   > | -shared      | 生成共享目标文件。通常用在建立共享库时。                     |
>   > | -static      | 禁止使用共享连接。                                           |
>   > | -UMACRO      | 取消对 MACRO 宏的定义。                                      |
>   > | -w           | 不生成任何警告信息。                                         |
>   > | -Wall        | 生成所有警告信息。                                           |
>   >
>   > ld：GNU链接器（将目标文件和当前环境库文件链接起来，创建可执行程序）
>   >
>   > ar：生成静态库
>   >
>   > make：根据makefile文件对源码生成可执行程序或库文件（编译+链接）
>   >
>   > gdb：调试器
>   >
>   > ldd：查看程序依赖
>
> - MinGW（Window环境GNU工具）
>
> - CMake（**跨平台自动化构建工具**，可以在不同平台普通生成makefile，供GNU进行编译）
>
> 
>
> **头文件**
>
> - 头文件：预处理中#include代替源文件，头文件一般声明变量，数据结构，源文件实现头文件中声明函数或方法
>
> 
>
> **C++关键字**  [详细](https://www.runoob.com/w3cnote/cpp-keyword-intro.html)
>
> | asm（指令字符串）        | **else**  | **new**          | **this**                              |
> | ------------------------ | --------- | ---------------- | ------------------------------------- |
> | auto                     | enum      | operator         | throw                                 |
> | bool                     | explicit  | private          | true                                  |
> | break                    | export    | protected        | try                                   |
> | case                     | extern    | public           | typedef                               |
> | catch                    | false     | register         | typeid                                |
> | char                     | float     | reinterpret_cast | typename                              |
> | class                    | for       | return           | union                                 |
> | const                    | friend    | short            | unsigned                              |
> | const_cast               | goto      | signed           | using                                 |
> | continue                 | if        | sizeof           | **virtual（基类指针指向派生类对象）** |
> | default                  | inline    | static           | void                                  |
> | delete                   | int       | static_cast      | volatile                              |
> | do                       | long      | struct           | wchar_t                               |
> | double                   | mutable   | switch           | while                                 |
> | dynamic_cast（动态转换） | namespace | template         |                                       |
>
> 
>
> **C++数据类型**
>
> - **基本数据类型**
>
>   | 类型                                 | 关键字                                                       | 默认值 |
>   | :----------------------------------- | :----------------------------------------------------------- | ------ |
>   | 布尔型                               | bool                                                         | false  |
>   | 字符型                               | char（1）                                                    | '\0'   |
>   | 整型                                 | int（4）                                                     | 0      |
>   | 浮点型                               | float（4）                                                   | 0      |
>   | 双浮点型                             | double（8）                                                  | 0      |
>   | 无类型                               | void                                                         |        |
>   | 宽字符型                             | wchar_t   （typedef short int wchar_t）                      |        |
>   | 基本类型空间大小修饰(与操作系统相关) | signed(1)，unsigned(1)，short(2)，long(8)                    |        |
>   | 数据类型限定符                       | const：常量<br />volatile：变量的值可能会被程序以外的因素改变<br />restrict：约束变量为指针操作<br />mutable：const修饰方法中成员变量允许被修改（默认不允许修改）<br />static：静态变量<br />register：寄存器变量（修饰频繁使用的变量，不能使用位运算） |        |
>
>   ~~~c++
>       cout << "type: \t\t" << "************size**************"<< endl;  
>       cout << "bool: \t\t" << "所占字节数：" << sizeof(bool);  
>       cout << "\t最大值：" << (numeric_limits<bool>::max)();  
>       cout << "\t\t最小值：" << (numeric_limits<bool>::min)() << endl;  
>       cout << "char: \t\t" << "所占字节数：" << sizeof(char);  
>       cout << "\t最大值：" << (numeric_limits<char>::max)();  
>       cout << "\t\t最小值：" << (numeric_limits<char>::min)() << endl;  
>       cout << "signed char: \t" << "所占字节数：" << sizeof(signed char);  
>       cout << "\t最大值：" << (numeric_limits<signed char>::max)();  
>       cout << "\t\t最小值：" << (numeric_limits<signed char>::min)() << endl;  
>       cout << "unsigned char: \t" << "所占字节数：" << sizeof(unsigned char);  
>       cout << "\t最大值：" << (numeric_limits<unsigned char>::max)();  
>       cout << "\t\t最小值：" << (numeric_limits<unsigned char>::min)() << endl;  
>       cout << "wchar_t: \t" << "所占字节数：" << sizeof(wchar_t);  
>       cout << "\t最大值：" << (numeric_limits<wchar_t>::max)();  
>       cout << "\t\t最小值：" << (numeric_limits<wchar_t>::min)() << endl;  
>       cout << "short: \t\t" << "所占字节数：" << sizeof(short);  
>       cout << "\t最大值：" << (numeric_limits<short>::max)();  
>       cout << "\t\t最小值：" << (numeric_limits<short>::min)() << endl;  
>       cout << "int: \t\t" << "所占字节数：" << sizeof(int);  
>       cout << "\t最大值：" << (numeric_limits<int>::max)();  
>       cout << "\t最小值：" << (numeric_limits<int>::min)() << endl;  
>       cout << "unsigned: \t" << "所占字节数：" << sizeof(unsigned);  
>       cout << "\t最大值：" << (numeric_limits<unsigned>::max)();  
>       cout << "\t最小值：" << (numeric_limits<unsigned>::min)() << endl;  
>       cout << "long: \t\t" << "所占字节数：" << sizeof(long);  
>       cout << "\t最大值：" << (numeric_limits<long>::max)();  
>       cout << "\t最小值：" << (numeric_limits<long>::min)() << endl;  
>       cout << "unsigned long: \t" << "所占字节数：" << sizeof(unsigned long);  
>       cout << "\t最大值：" << (numeric_limits<unsigned long>::max)();  
>       cout << "\t最小值：" << (numeric_limits<unsigned long>::min)() << endl;  
>       cout << "double: \t" << "所占字节数：" << sizeof(double);  
>       cout << "\t最大值：" << (numeric_limits<double>::max)();  
>       cout << "\t最小值：" << (numeric_limits<double>::min)() << endl;  
>       cout << "long double: \t" << "所占字节数：" << sizeof(long double);  
>       cout << "\t最大值：" << (numeric_limits<long double>::max)();  
>       cout << "\t最小值：" << (numeric_limits<long double>::min)() << endl;  
>       cout << "float: \t\t" << "所占字节数：" << sizeof(float);  
>       cout << "\t最大值：" << (numeric_limits<float>::max)();  
>       cout << "\t最小值：" << (numeric_limits<float>::min)() << endl;  
>       cout << "size_t: \t" << "所占字节数：" << sizeof(size_t);  
>       cout << "\t最大值：" << (numeric_limits<size_t>::max)();  
>       cout << "\t最小值：" << (numeric_limits<size_t>::min)() << endl;  
>       cout << "string: \t" << "所占字节数：" << sizeof(string) << endl;  
>       cout << "type: \t\t" << "************size**************"<< endl;  
>   ~~~
>
> - **常量** （必须初始化，不允许赋值）
>
>   ~~~c++
>   // 声明常量 identifier （不用指定数据类型）
>   #define identifier value
>   // 声明常量 identifier
>   const type identifier = value;
>   ~~~
>
> - **复合数据类型**
>
>   ~~~C++
>   // 数据类型别名声明
>   typedef type newName;
>
>   // 声明枚举数据类型 enumName
>   typedef enum { fieldName,fieldName1,...} enumName;
>   typedef enum enumName{ fieldName,fieldName1,...} ;
>
>   // 声明枚举类型变量variable1 variable2 variable3 
>   // 枚举值可以赋值为int类型，int类型不能转为枚举
>   enum enumName {
>       fieldName = 1
>       filedName1
>       ....
>   } variable1, variable2, variable3;
>   // 赋值枚举
>   enum enumName variable = fieldName;
>   // int 转枚举
>   enum enumName variable = (enum ennumName) 1;
>
>   // 时间复合数据
>   #include <ctime>
>   struct tm {
>     int tm_sec;   // 秒，正常范围从 0 到 59，但允许至 61
>     int tm_min;   // 分，范围从 0 到 59
>     int tm_hour;  // 小时，范围从 0 到 23
>     int tm_mday;  // 一月中的第几天，范围从 1 到 31
>     int tm_mon;   // 月，范围从 0 到 11
>     int tm_year;  // 自 1900 年起的年数
>     int tm_wday;  // 一周中的第几天，范围从 0 到 6，从星期日算起
>     int tm_yday;  // 一年中的第几天，范围从 0 到 365，从 1 月 1 日算起
>     int tm_isdst; // 夏令时
>   };
>   // C库函数 返回系统时间（时间戳，秒）
>   time_t  time(time_t *seconds)
>   // C库函数，返回系统时间（字符串）
>   char*ctime(const time_t *time)
>   // 返回本地时间tm
>   struct tm *localtime(const time_t *time);
>
>   //定义复合型数据类型
>   struct type_name{
>       member_type member_name;
>       ...
>   }object_names;
>   // 复合数据类型指针
>   struct object_names *object_namepointer = &object_names
>   // 访问成员变量
>   type variable = object_namepointer -> member_name
>   ~~~
>
> - **类型装换**
>
>   1. 静态：static_cast <type>(value)
>   2. 动态：dynamic_cast<type>(value)，向下转换（通常用作基类转为子类）
>   3. 常量：const_cast<type&>(value)
>   4. 重新解释  reinterpret_cast<float&>(value)，强制装换（可能导致值未定义）
>
> - **运算符**
>
>   1. sizeof：返回变量大小
>   2. 三元表达式
>   3. & 指针运算符，返回变量地址
>   4. `*` 引用指针，**返回变量对应的值**（使用变量地址读取值)
>
> - **指针**
>
>   1. 指针算术运算（通常操作数组）
>
>      ~~~C++
>      // 移动到下一个指针位置
>      pointer ++  pointer --
>      ~~~
>
>   2. 引用（引用不为NULL，**且不允许二次赋值**）
>
>      ~~~C++
>      // 定义referenceName引用变量（定义在引用变量前）
>      type& referenceName = variable
>      // 定义pointerName指针变量
>      type *pointerName = &variable
>      ~~~
>
> 
>
> **C++类与对象**
>
> - 类定义
>
>   ~~~C++
>   class className {
>       // 成员变量，成员和类的默认访问修饰符是 private。
>       private/public/protected：
>           type member_name;
>           type member_name;
>           ...
>        // 声明成员方法
>        type methodName();
>   };
>   // 定义类方法
>   type className::methodName(){
>
>   }
>   ~~~
>
> - **析构函数**
>
>   ~~~C++
>   // 析构函数不带任何参数，
>   // 1.退出程序时执行,
>   // 2.delete操作符修饰时执行
>   // 3.has a 关系时，外部对象析构函数调用时，内部对象也被调用
>   // 4. is a 关系时， 子类调用析构函数，基类析构函数也被调用
>   className::~className(void){
>
>   }
>   ~~~
>
> - **C++继承**（多继承）
>
>   ~~~C++
>   class Base {
>
>   }
>   // 公有继承 
>   class Derived :public Base{
>   }
>   ~~~
>
> - **运算符重载**（定义对象运算方法）
>
>   ~~~c++
>   class Box {
>      public:
>       // 运算符重载方法
>       Box operator+(const Box& b){
>           Box box;
>            box.length = this->length + b.length;
>            box.breadth = this->breadth + b.breadth;
>            box.height = this->height + b.height;
>            return box;
>       }
>   }
>   Box box1;
>   Box box2;
>   // 对象相加
>   Box3 box3 = box1+box2 
>   ~~~
>
>   **可重载运算符**
>
>   - 双目算术运算符（`+ - * / % ++  --`)
>   - 关系运算符 `== != < > <= >=`
>   - 逻辑运算符（ ||  &&  ！）
>   - 单目运算符（+ ，-， * ，&）
>   - 位运算符 （| ，&，~，^，<<，>>)
>   - 赋值运算符(=, +=, -=, *=, /= , % = , &=, |=, ^=, <<=, >>=)
>   - 空间申请与释放（new，delete，new[]，delete[]）
>   - 其他运算符**()**(函数调用)，**->**(成员访问)，**,**(逗号)，**[]**(下标）
>
>   **不允许重载运算符**
>
>   - **.**：成员访问运算符
>   - **.\***, **->\***：成员指针访问运算符
>   - **::**：域运算符
>   - **sizeof**：长度运算符
>   - **?:**：条件运算符
>   - **#**： 预处理符号
>
> - **C++多态**
>
>   > 使用基类指针调用基类方法（静态编译）
>   >
>   > **virtual：根据赋值类型执行相应方法（虚函数）**
>   >
>   > > **声明编译器不要静态链接到该函数，后续根据赋值类型动态调用，虚函数可以无方法体**
>
> 
>
> **C++标准库**
>
> - **C++输入输出流**
>
>   - IO库头文件
>
>     | 头文件     | 函数和描述                                                   |
>     | :--------- | :----------------------------------------------------------- |
>     | <iostream> | 该文件定义了 **cin、cout、cerr** 和 **clog** 对象，分别对应于标准输入流、标准输出流、非缓冲标准错误流和缓冲标准错误流。 |
>     | <iomanip>  | 该文件通过所谓的参数化的流操纵器（比如 **setw** 和 **setprecision**），来声明对执行标准化 I/O 有用的服务。 |
>     | <fstream>  | 该文件为用户控制的文件处理声明服务                           |
>
>   - **iostream**
>
>     1. cout：标准输出流
>     2. cin：标准输入流
>     3. cerr：错误输出流
>     4. clog：标准日志流
>     5. <<  ，>>：流重定向操作符（用来输出整型、浮点型、double 型、字符串和指针 ）
>     6. end，endl：流边界操作符
>
> - **文件输入输出流**
>
>   | 数据类型 | 描述                                                         |
>   | :------- | :----------------------------------------------------------- |
>   | ofstream | 该数据类型表示输出文件流，用于创建文件并向文件写入信息。     |
>   | ifstream | 该数据类型表示输入文件流，用于从文件读取信息。               |
>   | fstream  | 该数据类型通常表示文件流，且同时具有 ofstream 和 ifstream 两种功能，这意味着它可以创建文件，向文件写入信息，从文件读取信息。 |
>
>   - **打开文件模式**
>
>     | 模式标志   | 描述                                                         |
>     | :--------- | :----------------------------------------------------------- |
>     | ios::app   | 追加模式。所有写入都追加到文件末尾。                         |
>     | ios::ate   | 文件打开后定位到文件末尾。                                   |
>     | ios::in    | 打开文件用于读取。                                           |
>     | ios::out   | 打开文件用于写入。                                           |
>     | ios::trunc | 如果该文件已经存在，其内容将在打开文件之前被截断，即把文件长度设为 0。 |
>
> 
>
> **C++异常处理**
>
> - throw：任意的表达式，表达式的结果的类型决定了抛出的异常的类型
>
> - 自定义异常
>
>   ~~~C++
>   // 结构体
>   struct MyException : public exception{
>     const char * what () const throw (){
>       return "C++ Exception";
>     }
>   };
>   ~~~
>
> - C++标准异常
>
>   <img src="img\uyn.png" alt="image-20230321163911534" style="zoom:50%;" /> 
>
>   | 异常                   | 描述                                                         |
>   | :--------------------- | :----------------------------------------------------------- |
>   | **std::exception**     | 该异常是所有标准 C++ 异常的父类。                            |
>   | std::bad_alloc         | 该异常可以通过 **new** 抛出。                                |
>   | std::bad_cast          | 该异常可以通过 **dynamic_cast** 抛出。                       |
>   | std::bad_typeid        | 该异常可以通过 **typeid** 抛出。                             |
>   | std::bad_exception     | 这在处理 C++ 程序中无法预期的异常时非常有用。                |
>   | **std::logic_error**   | 编译异常（通常语法错误抛出）                                 |
>   | std::domain_error      | 当使用了一个无效的数学域时，会抛出该异常。                   |
>   | std::invalid_argument  | 当使用了无效的参数时，会抛出该异常。                         |
>   | std::length_error      | 当创建了太长的 std::string 时，会抛出该异常。                |
>   | std::out_of_range      | 该异常可以通过方法抛出，例如 std::vector 和 std::bitset<>::operator[]()。 |
>   | **std::runtime_error** | 理论上不可以通过读取代码来检测到的异常。                     |
>   | std::overflow_error    | 当发生数学上溢时，会抛出该异常。                             |
>   | std::range_error       | 当尝试存储超出范围的值时，会抛出该异常。                     |
>   | std::underflow_error   | 当发生数学下溢时，会抛出该异常。                             |
>
> 
>
> **C++命名空间** （区别相同函数名和变量）
>
> ~~~C++
> // 创建命名空间
> namespace first_space {
>   void func(){}    
> }
> // 调用该空间变量
> first_space::func();
> // 简化命名空间调用
> using namespace std;
> 
> ~~~
>
> 
>
> **C++泛型函数**
>
> ~~~C++
> // 泛型函数
> template <typename Type> returnType funName (paramter list){
> 
> } 
> // 泛型类
> template <class Type> class ClassName {
> 
> }
> 
> ~~~
>
> 
>
> **C++预处理**  （代替变量，代替其他源文件）
>
> ~~~C++
> // 用于创建符号常量或函数。该符号常量通常称为宏
> #define  PI
> 
> // 参数宏
> #define MIN(a,b) (a<b ? a : b)
> 
> // 条件编译 将NULL 使用0代替
> #ifdef NULL
>     #define NULL 0
> #endif  
> 
> ~~~
>
> - 预定宏
>
>   | 宏       | 描述                                                         |
>   | :------- | :----------------------------------------------------------- |
>   | __LINE__ | 这会在程序编译时包含当前行号。                               |
>   | __FILE__ | 这会在程序编译时包含当前文件名。                             |
>   | __DATE__ | 这会包含一个形式为 month/day/year 的字符串，它表示把源文件转换为目标代码的日期。 |
>   | __TIME__ | 这会包含一个形式为 hour:minute:second 的字符串，它表示程序被编译的时间。 |
>
> 
>
> **C++中断监听函数** 
>
> ~~~C++
> // 监听的信号，信号发生后回调
> void (*signal (int sig,void (*func)(int)))(int);
> signal(SIGINT, signalHandler);  
> // 程序内部生成信号（自中断）
> int raise (signal sig)
> ~~~
>
> | 信号    | 描述                                         |
> | :------ | :------------------------------------------- |
> | SIGABRT | 程序的异常终止，如调用 **abort**。           |
> | SIGFPE  | 错误的算术运算，比如除以零或导致溢出的操作。 |
> | SIGILL  | 检测非法指令。                               |
> | SIGINT  | 程序终止(interrupt)信号。                    |
> | SIGSEGV | 非法访问内存。                               |
> | SIGTERM | 发送到程序的终止请求。                       |
>
> **C++多线程** （Pthreads线程库）
>
> ~~~C++
> // 导入pthread线程库文件
> #include <pthread.h>
> 
> pthread_create (thread, attr, start_routine, arg) 
> 1.thread：接收线程标识符指针
> 2.attr：设置线程属性
> 3.start_routine：线程运行函数起始地址（多线程执行点）
> 4.arg：运行函数的参数
> // 线程完成工作后无需继续存在时被调用
> pthread_exit (status) 
> 
> // 多线程执行方法 thread 为pthread传入的参数    
> void *PrintHello(void *thread){
>    int tid = *((int*)threadid);
>    cout << "Hello Runoob! 线程 ID, " << tid << endl;
>    pthread_exit(NULL);
> }
> //线程数组
> pthread_t  threads [5]
> // 线程下标
> int indexes[NUM_THREADS];
> // &threads[i]：返回当前创建线程指针
> // 开启一个线程执行PrintHello函数
> // value 为PrintHello函数入参，必须是void*类型指针 
> pthread_create(&threads[i],NULL,PrintHello,(void *)&(value))
>     
> pthread_join(threadid, status) 调用线程等待子线程终止
> pthread_detach (threadid) 
>   
> ~~~
>
> 
>
> **C++标准化**
>
> | **发布时间** | **通称**                    | **备注**                       |
> | :----------- | :-------------------------- | :----------------------------- |
> | **2020**     | **C++20, C++2a**            | **ISO/IEC 14882:2020**         |
> | **2017**     | **C++17**                   | **第五个C++标准**              |
> | **2017**     | **coroutines TS**           | **协程库扩展**                 |
> | **2017**     | **ranges TS**               | **提供范围机制**               |
> | **2017**     | **library fundamentals TS** | **标准库扩展**                 |
> | **2016**     | **concurrency TS**          | **用于并发计算的扩展**         |
> | **2015**     | **concepts TS**             | **概念库，用于优化编译期信息** |
> | **2015**     | **TM TS**                   | **事务性内存操作**             |
> | **2015**     | **parallelism TS**          | **用于并行计算的扩展**         |
> | **2015**     | **filesystem TS**           | **文件系统**                   |
> | **2014**     | **C++14**                   | **第四个C++标准**              |
> | **2011**     | **-**                       | **十进制浮点数扩展**           |
> | **2011**     | **C++11**                   | **第三个C++标准**              |
> | **2010**     | **-**                       | **数学函数扩展**               |
> | **2007**     | **C++TR1**                  | **C++技术报告：库扩展**        |
> | **2006**     | **-**                       | **C++性能技术报告**            |
> | **2003**     | **C++03**                   | **第二个C++标准**              |
> | **1998**     | **C++98**                   | **第一个C++标准**              |