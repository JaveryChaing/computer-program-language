## [C++基本语法](https://learn.microsoft.com/zh-cn/cpp/cpp/user-defined-literals-cpp?view=msvc-170)

#### **标准C++关键字**

> <img src="image-20230519161452832.png" alt="image-20230519161452832"  />

#### **基本数据类型**

> 1. 数值
>
>    ~~~C++
>    //整数类型
>    int i = 157;       
>    int j = 0198;       
>    int k = 0365;       
>    int m = 36'000'000
>    // 八进制整型文本，以 0 作为规范的开头，后跟 0 到 7 之间的一系列数字
>    int i =0377
>    // 十六进制整型文本，以 0x 或 0X 作为规范
>    int j = 0X3FFF;
>    // 无符号类型,使用 u 或 U 后缀
>    unsigned val_1 = 328u;                 
>    long val_2 = 0x7FFFFFL;  
>    // 浮点数据类型，默认为double类型，使用后缀f/l,改变为float或long double 类型
>    ~~~
>
> 2. 布尔值（true/false)
>
> 3. 指针
>
>    ~~~c++
>    // C++ 引入了 nullptr 文本来指定初始化为零的指针。 在可移植代码中，应使用 nullptr，而不是整型类型零或宏（如 NULL）
>    // 二进制文本(C++14)
>    auto x = 0B001101  // int 类型
>    
>    // 原始指针变量声明仅分配足够的内存来存储地址，当指针二次执行其他值地址时，不会从新开辟空间，且原值存储空间不会被释放。后续可以使用智能指针消除这种问题
>    ~~~
>
> 4. 字符文本
>
>    ~~~C++
>    // C++ 字符串使用char[]及std::string标准库表示
>    auto c_char = 'A';
>    // u8/L/u 表示（单字节或多字节）、UTF-8、宽字符（UCS-2 或 UTF-16）、UTF-16 和 UTF-32 编码
>    //字符数据类型
>    char c_char_1 = u8'A'; // 以UTF-8位编码的字符文本
>    wchar_t w_char = u8"hello \word"  // 宽字符文本（包含多个字符）
>    // 用户定义的文本 C++11规范
>    ~~~
>
> 基本数据类型大小
>
> | 类型                | 大小     | 评论                                                         |
> | :------------------ | :------- | :----------------------------------------------------------- |
> | **`int`**           | 4 个字节 | 整数值的默认选择。                                           |
> | **`double`**        | 8 字节   | 浮点值的默认选择。                                           |
> | **`bool`**          | 1 个字节 | 表示可为 true 或 false 的值。                                |
> | **`char`**          | 1 个字节 | 用于早期 C 样式字符串或 std:: 字符串对象中无需转换为 UNICODE 的 ASCII 字符。 |
> | **`wchar_t`**       | 2 个字节 | 表示可能以 UNICODE 格式进行编码的“宽”字符值（Windows 上为 UTF-16，其他操作系统上可能不同）。 **`wchar_t`** 是在 类型字符串中使用的字符类型 `std::wstring`。 |
> | **`unsigned char`** | 1 个字节 | C++ 没有内置字节类型。 使用 **`unsigned char`** 来表示字节值。 |
> | **`unsigned int`**  | 4 个字节 | 位标志的默认选项。                                           |
> | **`long long`**     | 8 字节   | 表示更大的整数值范围。                                       |
>
> 特殊字符转移
>
>    | 值           | 转义序列 |
>    | :----------- | :------- |
>    | 换行符       | \n       |
>    | 反斜杠       | \\       |
>    | 水平制表符   | \t       |
>    | 问号         | ? 或 \?  |
>    | 垂直制表符   | \v       |
>    | 单引号       | \'       |
>    | 退格符       | \b       |
>    | 双引号       | \"       |
>    | 回车符       | \r       |
>    | null 字符    | \0       |
>    | 换页符       | \f       |
>    | 八进制       | \ooo     |
>    | 警报（响铃） | \a       |
>    | 十六进制     | \xhhh    |

#### **C++类型系统**

> - 标量类型：算术，指针，nullptr_t（指针空值类型，nullptr的类型）
>
> - 复合类型：数组，函数，类（结构），联合，枚举，引用，非静态成员指针
>
> - void类型：用于方法，函数返回，不能声明void类型变量，允许void指针变量
>
> - 变量：标量类型，复合类型的名称，用于访问数据，**变量类型声明后不允许更改。类型转换：将变量的值复制到不同类型的变量中（可能造成数据丢失或不正确）**
>
>   - **类型装换与类型安全**
>     1. 隐式类型装换
>        - 整型提升、整型装换
>        - 浮点装换
>        - 算术装换
>        - 指针装换（指向基类）
>        - 指向void *，nullprt 指针
>     2. 强制装换（存在数据丢失或不正确）
>        - **`static_cast`**：编译时检查的强制转换（或用于基类向下转型）
>        - `dynamic_cast`：对比static_cast，更安全（或用于基类向下转型）
>        - **`const_cast`**：将非 **`const`** 变量转换为 **`const`**
>        - **`reinterpret_cast`**，用于无关类型（如指针类型和 **`int`**）之间的强制转换。
>
> - 变量限制符
>
>   1. const：保证在编译时不会无意修改值，const int 与int 不是同一数据类型
>
>      ~~~C++
>      //指针型const （const修饰靠近变量）
>      int * const p = a; // 变量p存储地址不允许修改
>      const int*p = a;  // 变量a存储地址不允许修改
>      ~~~
>
>   2. constexpr：修饰常量表达式（在编译时能确定值），与const一致
>
>   3. static：程序启动时分配对象或变量，并在程序结束时释放对象或变量。
>
>      - 文件范围内修饰变量时为文件内可见
>      - 在函数内声明变量时，该变量不会随着return而回收
>
>   4. using与typedef：类型别名（为已声明并定义的实体声明一个新名称）
>
>      ~~~C++
>      // 定义long类型别名 counter
>      using counter = long;
>      using fmt = std::ios_base::fmtflags;
>      // 定义返回void指针，参数int函数类型
>      using func = void(*)(int)
>      void actual_function(int arg);
>      func fpt_pt = &actual_function;
>      //应用于成员变量（类似java中super，使用子类中使用父类方法）
>      class D:B{
>        public:
>         using B::f;
>         using B::g;
>         f();
>         g();
>      }
>      
>      // 应用于模板
>      template <typename T> struct MyAlloc{
>          // 给泛型T声明别名value_type
>          typedef T value_type;
>      }
>      // 声明long类型别名UL 等同 using UL = long;
>      typedef long UL;
>      
>      ~~~
>
>   5. extern：声明变量具有外部连接
>
>   6. thread_local：声明变量仅可以在其创建的线程上访问，线程销毁时销毁
>
>      - DLL中动态初始化线程局部变量可能无法在调用线程上初始化
>
>   7. auto：指示编译器判断变量的初始化类型或 lambda 表达式参数来推导其类型
>
>      ~~~C++
>      auto a {42};
>      auto b = 0;
>      auto d(1.4f);
>      for(auto &i:iterable) do_action(i);
>      int &countRef = count;
>      // auto 推断引用变量会解除引用 
>      auto myauto = countRef; // 复制countRef引用数据
>      // 指针不会解除
>      auto myauot_p = &countRef;
>      ~~~
>
>   8. volatile：线程同步变量，改动后对其他线程可见
>
> - 作用域
>
>   1. 全局作用域
>      - 头文件(.h)与源文件(.cpp)，
>        - 头文件中变量只允许声明不允许定义，不允许重复声明
>        - 程序全局使用使用extern修饰
>        - 声明变量为文件内可见（引用头文件可见）
>          - const
>          - constexpr
>          - typedef
>          - 命名空间中static对象
>
>   2. 局部（命名空间，lambda，函数，类范围，语句范围）
>      - 局部变量中重新声明变量名，可隐藏外部变量
>
> - 头文件：（声明变量，类，函数，命名空间）
>
>   > ~~~C++
>   > // my_class.h
>   > //用于确保它们不会多次插入到单个 .cpp 文件中
>   > #ifndef MY_CLASS_H // include guard
>   > #define MY_CLASS_H
>   > 
>   > namespace N
>   > {
>   >     class my_class
>   >     {
>   >     public:
>   >         void do_something();
>   >     };
>   > }
>   > #endif /* MY_CLASS_H */
>   > ~~~
>
> - 源文件：
>
>   > main函数：无法重载，无法声明inline，static，无法提取地址，无法再次调用
>   >
>   > ~~~C++
>   > // 包含 argv 后面的参数计数的整数。 argc 参数始终大于或等于 1
>   > //argv 传入程序参数
>   > int main(int argc, char* argv[])
>   > //程序钩子函数 <stdlib.h>
>   > //无条件立即终止程序
>   > exit()
>   > // C++ 运行时终止处理（调用全局对象析构函数）
>   > abort()
>   > // 停止程序 不会销毁在调用 atexit 之前初始化的任何全局静态对象
>   > atexit()
>   > 
>   > ~~~
>   >
>   > | 命令行输入       | argv[1]   | argv[2] | argv[3] |
>   > | :--------------- | :-------- | :------ | :------ |
>   > | `"abc" d e`      | `abc`     | `d`     | `e`     |
>   > | `a\\b d"e f"g h` | `a\\b`    | `de fg` | `h`     |
>   > | `a\\\"b c d`     | `a\"b`    | `c`     | `d`     |
>   > | `a\\\\"b c" d e` | `a\\b c`  | `d`     | `e`     |
>   > | `a"b"" c d`      | `ab" c d` |         |         |
>

#### **运算符与表达式**

> - size_t  alignof(type)：对齐方式，返回类型大小
>
>   ~~~C++
>   // 与aligned_malloc使用开辟指针空间
>   S* p = (S*)aligned_malloc(n * sizeof(S), alignof(S));
>   ~~~
>
> - **运行时类型消息RTTI**
>
>   1. dynamic_cast：多态类型转换
>   2. typeid：标识对象类型
>      - typeid操作数为NULL指针时，引发bad_typeid异常
>   3. type_info：保留typeid运算符返回的类信息
>
> - 运算符优先级
>
>   | 运算符说明                                                   | 运算符                                                       | 替代方法     |
>   | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------- |
>   | 第 1 组优先级，无关联性                                      |                                                              |              |
>   | [范围解析](https://learn.microsoft.com/zh-cn/cpp/cpp/scope-resolution-operator?view=msvc-170) | [`::`](https://learn.microsoft.com/zh-cn/cpp/cpp/scope-resolution-operator?view=msvc-170) |              |
>   | 第 2 组优先级，从左到右关联                                  |                                                              |              |
>   | [成员选择（对象或指针）](https://learn.microsoft.com/zh-cn/cpp/cpp/member-access-operators-dot-and?view=msvc-170) | 或 `->`                                                      |              |
>   | [数组下标](https://learn.microsoft.com/zh-cn/cpp/cpp/subscript-operator?view=msvc-170) | [`[\]`](https://learn.microsoft.com/zh-cn/cpp/cpp/subscript-operator?view=msvc-170) |              |
>   | [函数调用](https://learn.microsoft.com/zh-cn/cpp/cpp/function-call-operator-parens?view=msvc-170) | [`()`](https://learn.microsoft.com/zh-cn/cpp/cpp/function-call-operator-parens?view=msvc-170) |              |
>   | [后缀递增](https://learn.microsoft.com/zh-cn/cpp/cpp/postfix-increment-and-decrement-operators-increment-and-decrement?view=msvc-170) | [`++`](https://learn.microsoft.com/zh-cn/cpp/cpp/postfix-increment-and-decrement-operators-increment-and-decrement?view=msvc-170) |              |
>   | [后缀递减](https://learn.microsoft.com/zh-cn/cpp/cpp/postfix-increment-and-decrement-operators-increment-and-decrement?view=msvc-170) | [`--`](https://learn.microsoft.com/zh-cn/cpp/cpp/postfix-increment-and-decrement-operators-increment-and-decrement?view=msvc-170) |              |
>   | [类型名称](https://learn.microsoft.com/zh-cn/cpp/cpp/typeid-operator?view=msvc-170) | [`typeid`](https://learn.microsoft.com/zh-cn/cpp/cpp/typeid-operator?view=msvc-170) |              |
>   | [常量类型转换](https://learn.microsoft.com/zh-cn/cpp/cpp/const-cast-operator?view=msvc-170) | [`const_cast`](https://learn.microsoft.com/zh-cn/cpp/cpp/const-cast-operator?view=msvc-170) |              |
>   | [动态类型转换](https://learn.microsoft.com/zh-cn/cpp/cpp/dynamic-cast-operator?view=msvc-170) | [`dynamic_cast`](https://learn.microsoft.com/zh-cn/cpp/cpp/dynamic-cast-operator?view=msvc-170) |              |
>   | [重新解释的类型转换](https://learn.microsoft.com/zh-cn/cpp/cpp/reinterpret-cast-operator?view=msvc-170) | [`reinterpret_cast`](https://learn.microsoft.com/zh-cn/cpp/cpp/reinterpret-cast-operator?view=msvc-170) |              |
>   | [静态类型转换](https://learn.microsoft.com/zh-cn/cpp/cpp/static-cast-operator?view=msvc-170) | [`static_cast`](https://learn.microsoft.com/zh-cn/cpp/cpp/static-cast-operator?view=msvc-170) |              |
>   | 第 3 组优先级，从右到左关联                                  |                                                              |              |
>   | [对象或类型的大小](https://learn.microsoft.com/zh-cn/cpp/cpp/sizeof-operator?view=msvc-170) | [`sizeof`](https://learn.microsoft.com/zh-cn/cpp/cpp/sizeof-operator?view=msvc-170) |              |
>   | [前缀递增](https://learn.microsoft.com/zh-cn/cpp/cpp/prefix-increment-and-decrement-operators-increment-and-decrement?view=msvc-170) | [`++`](https://learn.microsoft.com/zh-cn/cpp/cpp/prefix-increment-and-decrement-operators-increment-and-decrement?view=msvc-170) |              |
>   | [前缀递减](https://learn.microsoft.com/zh-cn/cpp/cpp/prefix-increment-and-decrement-operators-increment-and-decrement?view=msvc-170) | [`--`](https://learn.microsoft.com/zh-cn/cpp/cpp/prefix-increment-and-decrement-operators-increment-and-decrement?view=msvc-170) |              |
>   | [二进制反码](https://learn.microsoft.com/zh-cn/cpp/cpp/one-s-complement-operator-tilde?view=msvc-170) | [`~`](https://learn.microsoft.com/zh-cn/cpp/cpp/one-s-complement-operator-tilde?view=msvc-170) | **`compl`**  |
>   | [逻辑“非”](https://learn.microsoft.com/zh-cn/cpp/cpp/logical-negation-operator-exclpt?view=msvc-170) | [`!`](https://learn.microsoft.com/zh-cn/cpp/cpp/logical-negation-operator-exclpt?view=msvc-170) | **`not`**    |
>   | [一元求反](https://learn.microsoft.com/zh-cn/cpp/cpp/unary-plus-and-negation-operators-plus-and?view=msvc-170) | [`-`](https://learn.microsoft.com/zh-cn/cpp/cpp/unary-plus-and-negation-operators-plus-and?view=msvc-170) |              |
>   | [一元加](https://learn.microsoft.com/zh-cn/cpp/cpp/unary-plus-and-negation-operators-plus-and?view=msvc-170) | [`+`](https://learn.microsoft.com/zh-cn/cpp/cpp/unary-plus-and-negation-operators-plus-and?view=msvc-170) |              |
>   | [Address-of](https://learn.microsoft.com/zh-cn/cpp/cpp/address-of-operator-amp?view=msvc-170) | [`&`](https://learn.microsoft.com/zh-cn/cpp/cpp/address-of-operator-amp?view=msvc-170) |              |
>   | [间接寻址](https://learn.microsoft.com/zh-cn/cpp/cpp/indirection-operator-star?view=msvc-170) | [`*`](https://learn.microsoft.com/zh-cn/cpp/cpp/indirection-operator-star?view=msvc-170) |              |
>   | [创建对象](https://learn.microsoft.com/zh-cn/cpp/cpp/new-operator-cpp?view=msvc-170) | [`new`](https://learn.microsoft.com/zh-cn/cpp/cpp/new-operator-cpp?view=msvc-170) |              |
>   | [销毁对象](https://learn.microsoft.com/zh-cn/cpp/cpp/delete-operator-cpp?view=msvc-170) | [`delete`](https://learn.microsoft.com/zh-cn/cpp/cpp/delete-operator-cpp?view=msvc-170) |              |
>   | [强制转换](https://learn.microsoft.com/zh-cn/cpp/cpp/cast-operator-parens?view=msvc-170) | [`()`](https://learn.microsoft.com/zh-cn/cpp/cpp/cast-operator-parens?view=msvc-170) |              |
>   | 第 4 组优先级，从左到右关联                                  |                                                              |              |
>   | [指向成员的指针（对象或指针）](https://learn.microsoft.com/zh-cn/cpp/cpp/pointer-to-member-operators-dot-star-and-star?view=msvc-170) | 或 `->*`                                                     |              |
>   | 第 5 组优先级，从左到右关联                                  |                                                              |              |
>   | [乘法](https://learn.microsoft.com/zh-cn/cpp/cpp/multiplicative-operators-and-the-modulus-operator?view=msvc-170) | [`*`](https://learn.microsoft.com/zh-cn/cpp/cpp/multiplicative-operators-and-the-modulus-operator?view=msvc-170) |              |
>   | [部门](https://learn.microsoft.com/zh-cn/cpp/cpp/multiplicative-operators-and-the-modulus-operator?view=msvc-170) | [`/`](https://learn.microsoft.com/zh-cn/cpp/cpp/multiplicative-operators-and-the-modulus-operator?view=msvc-170) |              |
>   | [取模](https://learn.microsoft.com/zh-cn/cpp/cpp/multiplicative-operators-and-the-modulus-operator?view=msvc-170) | [`%`](https://learn.microsoft.com/zh-cn/cpp/cpp/multiplicative-operators-and-the-modulus-operator?view=msvc-170) |              |
>   | 第 6 组优先级，从左到右关联                                  |                                                              |              |
>   | [加法](https://learn.microsoft.com/zh-cn/cpp/cpp/additive-operators-plus-and?view=msvc-170) | [`+`](https://learn.microsoft.com/zh-cn/cpp/cpp/additive-operators-plus-and?view=msvc-170) |              |
>   | [减法](https://learn.microsoft.com/zh-cn/cpp/cpp/additive-operators-plus-and?view=msvc-170) | [`-`](https://learn.microsoft.com/zh-cn/cpp/cpp/additive-operators-plus-and?view=msvc-170) |              |
>   | 第 7 组优先级，从左到右关联                                  |                                                              |              |
>   | [左移](https://learn.microsoft.com/zh-cn/cpp/cpp/left-shift-and-right-shift-operators-input-and-output?view=msvc-170) | [`<<`](https://learn.microsoft.com/zh-cn/cpp/cpp/left-shift-and-right-shift-operators-input-and-output?view=msvc-170) |              |
>   | [右移](https://learn.microsoft.com/zh-cn/cpp/cpp/left-shift-and-right-shift-operators-input-and-output?view=msvc-170) | [`>>`](https://learn.microsoft.com/zh-cn/cpp/cpp/left-shift-and-right-shift-operators-input-and-output?view=msvc-170) |              |
>   | 第 8 组优先级，从左到右关联                                  |                                                              |              |
>   | [小于](https://learn.microsoft.com/zh-cn/cpp/cpp/relational-operators-equal-and-equal?view=msvc-170) | [`<`](https://learn.microsoft.com/zh-cn/cpp/cpp/relational-operators-equal-and-equal?view=msvc-170) |              |
>   | 大于                                                         | [`>`](https://learn.microsoft.com/zh-cn/cpp/cpp/relational-operators-equal-and-equal?view=msvc-170) |              |
>   | 小于或等于                                                   | [`<=`](https://learn.microsoft.com/zh-cn/cpp/cpp/relational-operators-equal-and-equal?view=msvc-170) |              |
>   | 大于或等于                                                   | [`>=`](https://learn.microsoft.com/zh-cn/cpp/cpp/relational-operators-equal-and-equal?view=msvc-170) |              |
>   | 第 9 组优先级，从左到右关联                                  |                                                              |              |
>   | [等式](https://learn.microsoft.com/zh-cn/cpp/cpp/equality-operators-equal-equal-and-exclpt-equal?view=msvc-170) | [`==`](https://learn.microsoft.com/zh-cn/cpp/cpp/equality-operators-equal-equal-and-exclpt-equal?view=msvc-170) |              |
>   | [不相等](https://learn.microsoft.com/zh-cn/cpp/cpp/equality-operators-equal-equal-and-exclpt-equal?view=msvc-170) | [`!=`](https://learn.microsoft.com/zh-cn/cpp/cpp/equality-operators-equal-equal-and-exclpt-equal?view=msvc-170) | **`not_eq`** |
>   | 第 10 组优先级，从左到右关联                                 |                                                              |              |
>   | [位与](https://learn.microsoft.com/zh-cn/cpp/cpp/bitwise-and-operator-amp?view=msvc-170) | [`&`](https://learn.microsoft.com/zh-cn/cpp/cpp/bitwise-and-operator-amp?view=msvc-170) | **`bitand`** |
>   | 第 11 组优先级，从左到右关联                                 |                                                              |              |
>   | [位异或](https://learn.microsoft.com/zh-cn/cpp/cpp/bitwise-exclusive-or-operator-hat?view=msvc-170) | [`^`](https://learn.microsoft.com/zh-cn/cpp/cpp/bitwise-exclusive-or-operator-hat?view=msvc-170) | **`xor`**    |
>   | 第 12 组优先级，从左到右关联                                 |                                                              |              |
>   | [位或](https://learn.microsoft.com/zh-cn/cpp/cpp/bitwise-inclusive-or-operator-pipe?view=msvc-170) | [`|`](https://learn.microsoft.com/zh-cn/cpp/cpp/bitwise-inclusive-or-operator-pipe?view=msvc-170) | **`bitor`**  |
>   | 第 13 组优先级，从左到右关联                                 |                                                              |              |
>   | [逻辑与](https://learn.microsoft.com/zh-cn/cpp/cpp/logical-and-operator-amp-amp?view=msvc-170) | [`&&`](https://learn.microsoft.com/zh-cn/cpp/cpp/logical-and-operator-amp-amp?view=msvc-170) | **`and`**    |
>   | 第 14 组优先级，从左到右关联                                 |                                                              |              |
>   | [逻辑或](https://learn.microsoft.com/zh-cn/cpp/cpp/logical-or-operator-pipe-pipe?view=msvc-170) | [`||`](https://learn.microsoft.com/zh-cn/cpp/cpp/logical-or-operator-pipe-pipe?view=msvc-170) | **`or`**     |
>   | 第 15 组优先级，从右到左关联                                 |                                                              |              |
>   | [条件逻辑](https://learn.microsoft.com/zh-cn/cpp/cpp/conditional-operator-q?view=msvc-170) | [`? :`](https://learn.microsoft.com/zh-cn/cpp/cpp/conditional-operator-q?view=msvc-170) |              |
>   | [转让](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) |              |
>   | [乘法赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`*=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) |              |
>   | [除法赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`/=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) |              |
>   | [取模赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`%=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) |              |
>   | [加法赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`+=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) |              |
>   | [减法赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`-=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) |              |
>   | [左移赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`<<=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) |              |
>   | [右移赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`>>=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) |              |
>   | [按位“与”赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`&=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | **`and_eq`** |
>   | [按位“与或”赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`|=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | **`or_eq`**  |
>   | [按位“异或”赋值](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | [`^=`](https://learn.microsoft.com/zh-cn/cpp/cpp/assignment-operators?view=msvc-170) | **`xor_eq`** |
>   | [引发表达式](https://learn.microsoft.com/zh-cn/cpp/cpp/try-throw-and-catch-statements-cpp?view=msvc-170) | [`throw`](https://learn.microsoft.com/zh-cn/cpp/cpp/try-throw-and-catch-statements-cpp?view=msvc-170) |              |
>   | 第 16 组优先级，从左到右关联                                 |                                                              |              |
>   | [逗号](https://learn.microsoft.com/zh-cn/cpp/cpp/comma-operator?view=msvc-170) | [,](https://learn.microsoft.com/zh-cn/cpp/cpp/comma-operator?view=msvc-170) |              |

#### **复合数据类型**

> - 枚举
>
>   ~~~C++
>   //枚举声明，允许枚举值重复，枚举值可以隐式转为int，但int需要强转enum类型
>   enum Suit { Diamonds = 1, Hearts, Clubs = 1, Spades };
>   ~~~
>
> - union：所有成员共享一个内存位置（**union变量所占用的内存长度等于最长的成员的内存长度**）
>
>   ~~~C++
>   // 单独声明 
>   union union_name{
>        char mark;
>        long num;
>        float score;
>   }
>   // 与struct使用
>   struct TempData{
>       int mark;
>       union{
>            TempData temp;
>            WindData temp;
>       }
>   }
>   ~~~
>
> - 函数运算符重载
>
>   | 运算符       | 名称                   | 类型   |
>   | :----------- | :--------------------- | :----- |
>   | **,**        | 逗号                   | 二元   |
>   | **!**        | 逻辑非                 | 一元   |
>   | !=           | 不相等                 | 二元   |
>   | **%**        | 取模                   | 二元   |
>   | **%=**       | 取模赋值               | 二元   |
>   | **&**        | 位与                   | 二元   |
>   | **&**        | address-of             | 一元   |
>   | **&&**       | 逻辑与                 | 二元   |
>   | &=           | 按位“与”赋值           | 二元   |
>   | **( )**      | 函数调用               | —元    |
>   | **( )**      | 转换运算符             | 一元   |
>   | **`\*`**     | 乘法                   | 二元   |
>   | **`\*`**     | 指针取消引用           | 一元   |
>   | **`\*=`**    | 乘法赋值               | 二元   |
>   | **+**        | 加法                   | 二元   |
>   | **+**        | 一元加                 | 一元   |
>   | **++**       | 递增 1                 | 一元   |
>   | **+=**       | 加法赋值               | 二元   |
>   | **-**        | 减法                   | 二元   |
>   | **-**        | 一元求反               | 一元   |
>   | **--**       | 递减 1                 | 一元   |
>   | **-=**       | 减法赋值               | 二元   |
>   | **->**       | 成员选择               | 二元   |
>   | **`->\*`**   | 指向成员的指针选定内容 | 二元   |
>   | **/**        | 部门                   | 二元   |
>   | **/=**       | 除法赋值               | 二元   |
>   | **<**        | 小于                   | 二元   |
>   | **<<**       | 左移                   | 二元   |
>   | <<=          | 左移赋值               | 二元   |
>   | <=           | 小于或等于             | 二元   |
>   | **=**        | 分配                   | 二元   |
>   | **==**       | 等式                   | 二元   |
>   | **>**        | 大于                   | 二元   |
>   | >=           | 大于或等于             | 二元   |
>   | **>>**       | 右移                   | 二元   |
>   | >>=          | 右移赋值               | 二元   |
>   | **[ ]**      | 数组下标               | —元    |
>   | **^**        | 异或                   | 二元   |
>   | **^=**       | 异或赋值               | 二元   |
>   | **\|**       | 位或                   | 二元   |
>   | **\|=**      | 按位“与或”赋值         | 二进制 |
>   | **\|\|**     | 逻辑或                 | 二进制 |
>   | **~**        | 二进制反码             | 一元   |
>   | **`delete`** | 删除                   | —      |
>   | **`new`**    | 新建                   | —      |
>
> **类与结构**
>
> - friend：友元，定义在类中但不属于类的成员（获得了特殊访问权限的普通外部函数，不受类访问控制）
>
>   > friend void ChangePrivate( Point & );
>   
> - **指针与引用**
>
>   > ~~~C++
>   > // int类型指针变量 prt
>   > // & 右值表达式中为取址  
>   > int *prt = &10;
>   > // & 左值表达式中为引用类型变量ref（引用不能指向空值）
>   > int &ref = *prt
>   > // * 右值表达式取值操作（prt为指针变量)
>   > int p = *prt
>   > // 声明空指针 
>   > int *p1 = nullptr;
>   > ~~~
>
> - 对象生存期和资源管理（RALL：资源获取即初始化)
>
>   > 防止对象泄漏方法
>   >
>   > 1. **在堆栈上创建**（声明为非指针局部变量，在函数体内创建）
>   >
>   > 2. **使用智能指针** <memory>
>   >
>   >    > unique_ptr：独占指针（任何时刻数据只能绑定一个变量）
>   >    >
>   >    > ~~~C++
>   >    > // 声明类型
>   >    > unique_prt<Song> var_name(new Song())
>   >    > auto var_name = make_unique<Song>();
>   >    > //可移动，不可复制，将var_name变量所有权移动给song，var_name变量为nullprt
>   >    > auto song = std::move(var_name)
>   >    > // 
>   >    > ~~~
>   >    >
>   >    > shared_prt：分享指针
>
> - 
>
> 
>



  

  

