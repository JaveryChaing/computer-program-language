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
> **C++关键字**  [详细](https://www.runoob.com/w3cnote/cpp-keyword-intro.html)
>
> | asm（指令字符串）        | **else**  | **new**          | **this** |
> | ------------------------ | --------- | ---------------- | -------- |
> | auto                     | enum      | operator         | throw    |
> | bool                     | explicit  | private          | true     |
> | break                    | export    | protected        | try      |
> | case                     | extern    | public           | typedef  |
> | catch                    | false     | register         | typeid   |
> | char                     | float     | reinterpret_cast | typename |
> | class                    | for       | return           | union    |
> | const                    | friend    | short            | unsigned |
> | const_cast               | goto      | signed           | using    |
> | continue                 | if        | sizeof           | virtual  |
> | default                  | inline    | static           | void     |
> | delete                   | int       | static_cast      | volatile |
> | do                       | long      | struct           | wchar_t  |
> | double                   | mutable   | switch           | while    |
> | dynamic_cast（动态转换） | namespace | template         |          |
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
> **C++输入输出流**
>
> - IO库头文件
>
>   | 头文件     | 函数和描述                                                   |
>   | :--------- | :----------------------------------------------------------- |
>   | <iostream> | 该文件定义了 **cin、cout、cerr** 和 **clog** 对象，分别对应于标准输入流、标准输出流、非缓冲标准错误流和缓冲标准错误流。 |
>   | <iomanip>  | 该文件通过所谓的参数化的流操纵器（比如 **setw** 和 **setprecision**），来声明对执行标准化 I/O 有用的服务。 |
>   | <fstream>  | 该文件为用户控制的文件处理声明服务                           |
>
> - **iostream**
>
>   1. cout：标准输出流
>   2. cin：标准输入流
>   3. cerr：错误输出流
>   4. clog：标准日志流
>   5. <<  ，>>：流重定向操作符（用来输出整型、浮点型、double 型、字符串和指针 ）
>   6. end，endl：流边界操作符
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