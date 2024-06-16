## [C++基本语法](https://learn.microsoft.com/zh-cn/cpp/cpp/user-defined-literals-cpp?view=msvc-170)

#### **标准C++关键字**

> <img src="assets/image-20230519161452832.png" alt="image-20230519161452832"  /> 
>
> C++文件扩展
>
> - cpp/cc/cxx：C++ 源代码文件实现了 C++ 类、函数和其他代码
>
> - h/hpp/hxx：C++ 头文件，包含类声明、函数原型、常量定义
>
> - inl：内联函数或模板函数的实现文件
>
> - tcc：模板化头文件，可以在编译时实例化
>
> - cppm：模块文件，它可以被其他模块导入
>
> - o/obj：编译后的目标文件，多个目标文件组合成可执行文件或库文件
>
> - lib/a：已编译的目标文件的归档文件，静态链接器将静态库中的对象文件复制并链接到可执行文件中
>
> - dll/so：动态链接器在程序运行时加载动态库
>

**基本语法**

> 头文件：用于包含声明、宏定义、类型定义、函数声明
>
> 1. 代码重用和模块化
> 2. 隔离接口和实现
> 3. 预处理器宏定义
> 4. 防止重复包含
>
> **类型装换与类型安全**
>
> 1. 隐式类型装换
>    - 整型提升、整型装换
>    - 浮点装换
>    - 算术装换
>    - 指针装换（指向基类）
>    - 指向void *，nullprt 指针
> 2. 强制装换（存在数据丢失或不正确）
>    - **`static_cast`**：编译时检查的强制转换（或用于基类向下转型）
>    - `dynamic_cast`：对比static_cast，更安全（或用于基类向下转型）
>    - **`const_cast`**：将非 **`const`** 变量转换为 **`const`**
>    - **`reinterpret_cast`**，用于无关类型（如指针类型和 **`int`**）之间的强制转换。
>
> **变量限制符**
>
> 1. const/constexpr：
>
>    ~~~C++
>    //指针型const （const修饰靠近变量）
>    int * const p = a; // 变量p存储地址不允许修改
>    const int* p = a;  // 变量a存储地址不允许修改
>    ~~~
>
> 2. static：只在程序结束时释放对象或变量
>
> 3. using/typedef：类型别名
>
>    ~~~c++
>    // 定义long类型别名 counter
>    using counter = long;
>    using fmt = std::ios_base::fmtflags;
>    // 应用于模板
>    template <typename T> struct MyAlloc{
>        // 给泛型T声明别名value_type
>        typedef T value_type;
>    }
>
>    // 声明long类型别名UL 等同 using UL = long;
>    typedef long UL;
>    ~~~
>
> 4. extern：声明外部定义变量或函数
>
> 5. typename：泛元，指定标识符是一个类型
>
> 6. explicit：修饰只有一个参数的类构造函数
>
> 
>
> **复合数据类型**
>
> ~~~C++
> //枚举声明，允许枚举值重复，枚举值可以隐式转为int，但int需要强转enum类型
> enum Suit { Diamonds = 1, Hearts, Clubs = 1, Spades };
> // union 成员共享一个内存位置
> union union_name{
>      char mark;
>      long num;
>      float score;
> }
> 
> // 结构体声明 
> struct Point {
>     int x;
>     int y;
>      // 构造函数声明
>     Point(int xCoord, int yCoord);
>      // 成员函数声明
>     void print();
> };
> // 结构体构造函数的定义
> Point::Point(int xCoord, int yCoord) : x(xCoord), y(yCoord) {}
> 
> // 结构体成员函数的定义
> void Point::print() {
>     std::cout << "Point(" << x << ", " << y << ")" << std::endl;
> }
> 
> // 类 封装数据和功能实现，继承和派生，多态性，代码重用
> // 类的定义
> class Animal {
>     private:
>       std::string brand;
>       int year;
>      // 构造函数
>      Animal() {std::cout << "Constructor called." << std::endl;}
>      // 析构函数
>      ~Animal() {std::cout << "Constructor called." << std::endl;}
>     
>     // 拷贝构造函数
>      Animal(const Animal& other) {std::cout << "Copy constructor called." << std::endl;}
>     
>     // 移动构造函数
>      Animal(Animal&& other) noexcept {std::cout << "Move constructor called." << std::endl;}
>     
>     // 赋值运算符重载(赋值函数)
>      Animal& operator=(const Animal& other) {
>         std::cout << "Copy assignment operator called." << std::endl;
>         return *this;
>      }
>      // 移动赋值运算符重载
>     Animal& operator=(Animal&& other) noexcept {
>         std::cout << "Move assignment operator called." << std::endl;
>         return *this;
>     }
> }
> class CanFly {
> 	public:
>     	void fly() {
>         	std::cout << "Flying..." << std::endl;
>     	}
> };
> // 多继承
> class Bird : public Animal, public CanFly {
> 	public:
>     	Bird(std::string _name) : Animal(_name) {};
>    		void chirp() {
>        		std::cout << "Bird " << name << " chirps." << std::endl;
>     	}
> };
> 
> 
> // 左值：标识内存地址的名称或表达式（变量、对象成员、数组元素、返回左值引用的函数）
> // 右值：无法标识内存地址的表达式（右值无法声明名称）（即将被销毁的临时对象或者表达式，字面值、临时对象、返回右值的函数等都是右值）
> // 右值引用：'&&'操作符表示，固化右值（使右值对象周期延长）
>  MyString&& strRef = MyString("World");
> ~~~
>
> 
>
> **指针**
>
> 1. 指针本质是一个变量，其值为内存地址。
> 2. 解引用操作符 `*` 
> 3. 指针可以被重新赋值指向不同的对象，允许为null
> 4. 指针算术运算，如指针加减操作
>
> **引用**
>
> 1. 对象的别名（已存在的对象）
> 2. 引用在声明时必须初始化，并且不能再次绑定到其他对象
>
> 
>
> **智能指针**
>
> 1. unique_ptr
> 2. shared_ptr
> 3. weak_ptr
>
> 
>
>  **函数与Lambda表达式**
>
> 1. ![image-20230423105420670](assets/image-20230423105420670.png) 
>
> 2. 捕获列表（捕获上下文变量，lambda中可使用的变量）
>
>    - `[]`不捕获任何变量，即使用时调用
>    - `[var]`：按值传递，捕获变量var，变量var可更具上下文变动在函数体中使用
>    - `[=]`：值传递方式捕获所有局部变量（包含this）
>    - `[&var]`：同上，使用引用传递
>    - `[&]`：同上，所有局部变量使用引用传递
>    - `[this]`：按值传递方式捕获当前类对象
>
> 3. 参数列表
>
> 4. 可变规则（默认是const，可以通过mutable取消常量限制）
>
> 5. 返回类型
>
> 6. ~~~c++
>    int y = 42;
>    // answer为函数
>    auto answer = [y]()constexpr{
>        int x = 10;
>        return y + x;
>    }
>    // 或者
>    auto answer = [](int n){
>        return 32+ n;
>    }
>    constexpr  int response = answer(10); 
>    ~~~
>
>    
>
> **特殊字符转义**
>
> | 值           | 转义序列 |
> | :----------- | :------- |
> | 换行符       | \n       |
> | 反斜杠       | \\       |
> | 水平制表符   | \t       |
> | 问号         | ? 或 \?  |
> | 垂直制表符   | \v       |
> | 单引号       | \'       |
> | 退格符       | \b       |
> | 双引号       | \"       |
> | 回车符       | \r       |
> | null 字符    | \0       |
> | 换页符       | \f       |
> | 八进制       | \ooo     |
> | 警报（响铃） | \a       |
> | 十六进制     | \xhhh    |

#### **C++中的异常处理**

> throw：
>
> ~~~C++
> // 可以抛出任意类型异常，
> void throw_run_error() {
>     throw "abcd";
> }
> // 不能抛出任何异常（如果函数执行异常，中断程序，无法catch) 等同noexcept
> void throw_run_error() throw();
> 
> // 抛出指定类型异常（异常可以是任意类型）
> // catch通过类型匹配（包含基类匹配），如果没有匹配成功，则程序退出
> void throw_run_error() throw(char,int);
> ~~~
>
> std::exception：异常父类，异常标准库 [`<stdexcept>`](https://learn.microsoft.com/zh-cn/cpp/standard-library/stdexcept?view=msvc-170) 
>
> | 异常                   | 描述                                                         |
> | :--------------------- | :----------------------------------------------------------- |
> | **std::exception**     | 该异常是所有标准 C++ 异常的父类。                            |
> | std::bad_alloc         | 该异常可以通过 **new** 抛出。                                |
> | std::bad_cast          | 该异常可以通过 **dynamic_cast** 抛出。                       |
> | std::bad_typeid        | 该异常可以通过 **typeid** 抛出。                             |
> | std::bad_exception     | 这在处理 C++ 程序中无法预期的异常时非常有用。                |
> | **std::logic_error**   | 编译异常（通常语法错误抛出）                                 |
> | std::domain_error      | 当使用了一个无效的数学域时，会抛出该异常。                   |
> | std::invalid_argument  | 当使用了无效的参数时，会抛出该异常。                         |
> | std::length_error      | 当创建了太长的 std::string 时，会抛出该异常。                |
> | std::out_of_range      | 该异常可以通过方法抛出，例如 std::vector 和 std::bitset<>::operator[]()。 |
> | **std::runtime_error** | 理论上不可以通过读取代码来检测到的异常。                     |
> | std::overflow_error    | 当发生数学上溢时，会抛出该异常。                             |
> | std::range_error       | 当尝试存储超出范围的值时，会抛出该异常。                     |
> | std::underflow_error   | 当发生数学下溢时，会抛出该异常。                             |
>
> - noexcept：指定某个函数是否可能会引发异常（无法确定异常情况下，代替 throw() 声明函数异常）
>
>   > noexcept：函数不会引发异常，**等效于noexcept(true)**，**当函数发生异常时将调用void terminate()终止程序**（类似于断言，断言一般判断值是否满足条件，noexcept则监听函数是否异常）
>   >
>   > noexcept(false)：函数可以引发任何类型的异常，代替throw(type)声明函数可能发生的异常
>   >
>   > - noexcept(express)：express：可以为noexcept(express)
>
> - **断言**：当运行到表达式为假时，打印异常消息，调用abort函数停止程序运行
>
>   > assert(int expression) ：expression 为0时发生异常退出程序（运行时检测）
>   >
>   > static_assert(bool_constexpt，message)：编译时检测
>
> - Terminate函数 (当存在异常未被捕获时，则通过调用abort()使其终止，不释放对象)
>
> - **异常资源回收：**
>
>   ~~~C++
>   // 异常信息与对象同一生命周期 (RAII)
>   template <typename T,int sz = 1> 
>   class Pwrap{
>    T *prt;
>   public:
>    class RangeError{};  
>    PWrap(){
>        prt = new T[sz];
>    }
>    ~Pwrap(){
>        delete [] prt;
>    }
>    // 取值时发生异常
>    T& operator[](int i) throw(RangeError){
>        if(i>=0 && i < sz) return prt[i];
>        // 抛出成员对象
>        throw RangeError();
>    }
>   }
>   ~~~

#### **C++预处理**

> 预处理指令 
>
> ![image-20230522213223039](assets/image-20230522213223039.png) 
>
> - define：定义宏，编译器可用标记字符串替换源文件中标识符的每个匹配项
>
> - error：指令在编译时发出用户指定的错误消息，然后终止编译
>
>   > \#error C++ compiler required.
>
> - `#if，#elif #else #endif`
>
> - include
>
> - line：指令指示预处理器将编译器的行号和文件名报告值设置为给定行号和文件名
>
> - undef：与define相反

#### [**C++模块**  （C++20）]((https://learn.microsoft.com/zh-cn/cpp/cpp/import-export-module?view=msvc-170))

>  ~~~C++
>  // 链接模块
>  export module Example;
>  // 使用模块
>  import Example;
>  ~~~





