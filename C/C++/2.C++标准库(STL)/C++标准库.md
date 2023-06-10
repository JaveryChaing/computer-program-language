## [C++标准库](https://learn.microsoft.com/zh-cn/cpp/standard-library/cpp-standard-library-header-files?view=msvc-170)

> |       类别       |                          标准头文件                          |
> | :--------------: | :----------------------------------------------------------: |
> |       算法       |             `<algorithm>, <cstdlib>, <numeric>`              |
> |     原子操作     |                          `<atomic>`                          |
> |    C库包装器     | `<cassert>、<ccomplex>、<cctype>、<cerrno>、<cfenv>、<cfloat>、<cinttypes>、<ciso646>b、<climits>、<clocale>、<cmath>、<csetjmp>、<csignal>、<cstdalign> 、<cstdarg>、<cstdbool> 、<cstddef>、<cstdint>、<cstdio>、<cstdlib>、<cstring>、<ctgmath> 、<ctime>、<cuchar>、<cwchar>、<cwctype>` |
> |     序列容器     |     `<array>、<deque>、<forward_list>、<list>、<vector>`     |
> |     关联容器     |                        `<map>, <set>`                        |
> |   无序关联容器   |              `<unordered_map>、<unordered_set>`              |
> |    容器适配器    |                      `<queue>, <stack>`                      |
> |  错误和异常处理  |    `<cassert>、<exception>、<stdexcept>、<system_error>`     |
> |      工具类      | `<any>、<bit>、<bitset>、<cstdlib>、<execution>、<functional>、<memory>、<memory_resource>、<optional>、<ratio>、<scoped_allocator>、<tuple>、<type_traits>、<typeindex>、<utility>、<variant>` |
> |  I/O与格式设置   | `<cinttypes>、<cstdio>、<filesystem>、<fstream>、<iomanip>、<ios>、<iosfwd>、<iostream>、<istream>、<ostream>、<sstream>、<streambuf>、<strstream>、<syncstream>` |
> |      迭代器      |                         `<iterator>`                         |
> |     数学工具     | `<bit>、<cfenv>、<cmath>、<complex>、<cstdlib>、<limits>、<numeric>、<random>、<ratio>、<valarray>` |
> |     内存管理     | `<allocators>、<memory>、<memory_resource>、<new>、<scoped_allocator>` |
> |      多线程      | `<atomic>、<condition_variable>、<future>、<mutex>、<shared_mutex>14、<thread>` |
> |    正则表达式    |                          `<regex>`                           |
> | 字符串与字符数据 | `<charconv>、<cctype>、<cstdlib>、<cstring>、<cuchar>、<cwchar>、<cwctype>、<regex>、<string>、<string_view>` |
> |       时间       |                     `<chrono>、<ctime>`                      |
> |      本地化      | `<clocale>、<codecvt>、<cvt/wbuffer>、<cvt/wstring>、<locale>` |
> |     语言支持     | `<cfloat>、<climits>、<codecvt> 、<compare>、<contract>、<coroutine>、<csetjmp>、<csignal>、<cstdarg>、<cstddef>、<cstdint>、<cstdlib>、<exception>、<initializer_list>、<limits>、<new>、<typeinfo>、<version>` |
>

#### **C++11语言特性**

> - 使用nullprt代替0或NULL指针
>
> - auto自动类型推导
>
> - 一致性初始化（使用大括号初始化容器，类，结构体）
>
> - Range-Based for 循环（迭代器循环语法）
>
> - 右值引用（rvalue reference）与 move
>
> - 定义字符串常量 
>
> - noexcept：异常处理 noexcept(true)
>
> - constrxper
>

#### **algorithm：C++标准容器模板函数**(对各种数据结构进行操作)

> adjacent_find：查找容器中条件相等的元素 
>
> ~~~C++
> // twice 二元函数，返回bool值
> auto result =  adjacent_find(L.begin( ), L.end( ), twice )
> if(result == L.end()) // 未满足条件
> ~~~
>
> **辅助函数**
>
> ![image-20230526145931387](image-20230526145931387.png) 

#### **Chrono** 时间处理函数

> GMT：格林尼治时间地球自转时间（UTC=GMT +/-0.9)
>
> UTC：世界时间 标准格式为YYYY-MM-DD Thh:mm:ssZ（2023-05-26T16:00:00Z)
>
> ***GMT与UTC与时区无关，跨时区应用使用UTC作为标准时间***
>
> UNIX：时间戳，以1970-01-01T00:00:00为起点经过的秒数
>
> 时间相关类型
>
> - **C和POSIX提供的Date/Time函数**
>
>   ~~~C++
>   // 获取当期时间戳（实际上时间戳为UTC，与时区无关）
>   time_t tm = time(nullprt);
>   // 时间戳转为tm，同timep,未加上时区
>   tm* gmtime(const time_t * timep);
>   // 加上本地时区
>   tm* ltm = localtime(&tm);
>   // ts 转 time_t
>   time_t mktime(struct tm* time_ptr);
>   // tm 转字符 Mon Oct 24 11:41:17 2022，返回本地时间
>   char asctime(const struct tm time_ptr);
>   // tm格式化转str；
>   size_t strftime(char *str ,size_t count,const char * format,const struct tm* tm);
>   char strTime[100];
>   // tm格式化成字符串 2022-10-07 20:46:01
>   strftime(startTime,sizeof(startTime),"%Y-%m-%d %H:%M:%S",tm);
>   
>   // time_t 获取当期时间
>   time_t now = time(nullptr);
>   tm* ltm = localtime(&now);
>   time_point<system_clock> now = system_clock::now();
>   // 获取时间戳
>   long long timestamp = system_now.time_since_epoch().count()
>   // 等价于 duration<int64> sec(3);
>   seconds sec(3);
>   // 3000 毫秒，使用double类型包装
>   duration<double, std::milli> ms3k(3000);
>   ~~~
>
> - size_t：通常用在32位系统上时间戳处理（unsigned int)
>
> - tm：时间结构
>
>   ~~~C++
>   // C语言中 tm 结构
>   struct tm{
>    // 0~59
>    int tm_sec;
>   	// 0~59
>    int tm_min;
>    // 0~23
>    int tm_hour;
>   	// 1~31
>    int tm_mday;
>   	// 0~11
>    int tm_mon;
>   	//当期年份= tm_year+1900
>    int tm_year;
>    //0~6（0为周天）
>    int tm_wday;
>    // 0~365，从0开始 一年第多少天
>    int tm_yday;
>    // 夏令营时间 0 表示生效
>    int tm_isdst;
>    // 时区
>    char &tm_zone;
>   }
>   ~~~
>
> - Chrono：定义表示和操作持续时间及时刻的类和函数
>
>   ~~~C++
>   // duration类：时间间隔，默认以秒为单位
>   // 构造方法 Rep：次数，Period：倍率 std::ratio<1, 10>：表示1/10 的倍率 
>   // duration 支持重载算术运算符操作，计算时不必转换单位
>   template <class Rep, class Period> class duration;
>   template <class Rep, class Period = ratio<1>> class duration;
>   template <class Rep, class Period1, class Period2> class duration <duration<Rep, Period1>, Period2>;
>        
>   duration::period 获取单位类型
>   // 指定时间间隔类型20秒间隔，实际上为包装的 duration类型
>   std::chrono::seconds  sec(20);
>   std::chrono::hours aDay(24);
>   // 时间单位转换
>   hours m1 = duration_cast<seconds>(sec);
>   // C++14后可以用 constexpr表示一个常量时间间隔
>   constexpr auto twoDays = 48h;
>   constexpr auto my_duration_unit = 108ms;
> 
>![image-20230530095519797](image-20230530095519797.png) 

#### **cstdlib：程序钩子函数**

> ![image-20230523200308129](image-20230523200308129.png) 
>
> #### **字符转数字**
>
> ![image-20230523200701533](image-20230523200701533.png) 
>
> #### **数学运算**
>
> ![image-20230523200949274](image-20230523200949274.png) 
>
> ![image-20230523201006195](image-20230523201006195.png) 
>
> ![image-20230523201021098](image-20230523201021098.png) 

#### **STL标准模板库**

> 容器（Container）：**容器里存储的是元素的拷贝、副本。**通常元素需要满足复制构造函数，移动构造函数。
>
> - 元素类型
>   1. value_type
>   2. reference
>   3. const_reference
>   4. iterator
>   5. const_iterator
>   6. reverse_iterator
>   7. const_reverse_iterator
>   8. pointer
>   9. cosnt_pointer
> - 满足STL容器元素要求
>   1. 空参构造函数
>   2. Copy构造函数（深拷贝，不影响原值）
>   3. 重载`=`操作符（初始化对象时调用Copy构造函数）
>   4. Move构造函数（构造函数是右值引用，转移原值内存所有权）
>
> - 序列容器（顺序集合，使用数组，链表实现）
>
>   1. 底层C数组：array，vector（动态数组），deque(双端队列)：查询快，增减慢
>
>      > ![image-20230523201359757](image-20230523201359757.png) 
>      >
>      > **支持算数运算符重载**
>      >
>      > <img src="image-20230523205424508.png" alt="image-20230523205424508" style="zoom:100%;" /> 
>      >
>      > <img src="image-20230523205455532.png" alt="image-20230523205455532" style="zoom:100%;" />  
>
>   2. 指针结构链表：list，forward_list（单向链表）：查询慢，增减快
>
>      > | 名称                                                         | 说明                                                         |
>      > | :----------------------------------------------------------- | :----------------------------------------------------------- |
>      > | [`assign`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#assign) | 将元素从列表中擦除并将一组新的元素复制到目标列表。           |
>      > | [`back`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#back) | 返回对列表中最后一个元素的引用。                             |
>      > | [`begin`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#begin) | 返回发现列表中第一个元素的位置的迭代器。                     |
>      > | [`cbegin`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#cbegin) | 返回发现列表中第一个元素的位置的常量迭代器。                 |
>      > | [`cend`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#cend) | 返回发现一个列表中最后一个元素之后的位置的敞亮表达式。       |
>      > | [`clear`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#clear) | 消除列表中的全部元素。                                       |
>      > | [`crbegin`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#crbegin) | 返回发现反向列表中第一个元素的位置的常量迭代器。             |
>      > | [`crend`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#crend) | 返回用于发现反向列表中最后一个元素之后的位置的常量迭代器。   |
>      > | [`emplace`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#emplace) | 将构造的元素插入到列表中的指定位置。                         |
>      > | [`emplace_back`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#emplace_back) | 在列表的结尾处添加一个就地构造的元素。                       |
>      > | [`emplace_front`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#emplace_front) | 在列表的起始位置添加一个就地构造的元素。                     |
>      > | [`empty`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#empty) | 测试列表是否为空。                                           |
>      > | [`end`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#end) | 返回用于发现列表中最后一个元素之后的位置的迭代器。           |
>      > | [`erase`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#erase) | 从列表中的指定位置移除一个或一系列元素。                     |
>      > | [`front`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#front) | 返回对列表中第一个元素的引用。                               |
>      > | [`get_allocator`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#get_allocator) | 返回用于构造列表的 `allocator` 对象的一个副本。              |
>      > | [`insert`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#insert) | 将一个、几个或一系列元素插入列表中的指定位置。               |
>      > | [`max_size`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#max_size) | 返回列表的最大长度。                                         |
>      > | [`merge`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#merge) | 将元素从参数列表移除，将它们插入目标列表，将新的组合元素集以升序或其他指定顺序排序。 |
>      > | [`pop_back`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#pop_back) | 删除列表末尾的元素。                                         |
>      > | [`pop_front`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#pop_front) | 删除列表起始处的一个元素。                                   |
>      > | [`push_back`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#push_back) | 在列表的末尾添加元素。                                       |
>      > | [`push_front`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#push_front) | 在列表的开头添加元素。                                       |
>      > | [`rbegin`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#rbegin) | 返回发现反向列表中第一个元素的位置的迭代器。                 |
>      > | [`remove`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#remove) | 清除列表中与指定值匹配的元素。                               |
>      > | [`remove_if`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#remove_if) | 将满足指定谓词的元素从列表中消除。                           |
>      > | [`rend`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#rend) | 返回发现反向列表中最后一个元素之后的位置的迭代器。           |
>      > | [`resize`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#resize) | 为列表指定新的大小。                                         |
>      > | [`reverse`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#reverse) | 反转列表中元素的顺序。                                       |
>      > | [`size`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#size) | 返回列表中元素的数目。                                       |
>      > | [`sort`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#sort) | 按升序或其他顺序关系排列列表中的元素。                       |
>      > | [`splice`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#splice) | 将元素从自变量列表中删除或将它们插入目标列表。               |
>      > | [`swap`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#swap) | 交换两个列表的元素。                                         |
>      > | [`unique`](https://learn.microsoft.com/zh-cn/cpp/standard-library/list-class?view=msvc-170#unique) | 从列表中删除满足某些其他二元谓词的相邻重复元素或相邻元素。   |
>
> - 关联容器（已排序集合，使用二叉树实现）
>
>   1. set：元素更具value排序，不重复
>   2. multiset：元素排序，允许重复
>   3. map
>   4. multiamp：允许相同的key
>
> - 无序容器（无序集合，使用散列表实现）
>
>   1. unordered_map
>   2. unordered_set
>
> - 容器适配器（上述容器中满足指定的操作）
>
>   1. Stack：栈（LIFO)
>   2. Queue：队列
>   3. Priority Queue：优先队列
>
> **迭代器（Iterator）**
>
> 
>
> 算法（Algorithm）

#### **atomic**：创建支持原子操作的类型的类和类模板(不支持浮点)

> ~~~C++
> // 所属atomic::atomic命名空间
> // 构造方法
> atomic(const atomic &);
> atomic();
> atomic(Ty Value)noexcept;
> ~~~

#### **通用工具**

> pair：以key/value组成的struct数据模板结构，定义在<utility>中，用于构造map容器，及函数多返回值
>
> tuple：多元数据结构，可以存放任意数据类型，定义在<tuple>中,使用std空间，返回多个元组，
>
> - tuple_size(tupletype)::value : 获取元素个数
> - tuple_element<idx，tupletype>::type：获取第idx个元素类型
> - tuple_cat()：拼接多个tuple
>
> **Type Trait：模板类型判断**
>
> - ![image-20230526143638650](image-20230526143638650.png) 
> - ![image-20230526143737006](image-20230526143737006.png)  
> - ![image-20230526143830894](image-20230526143830894.png) 
> - ![image-20230526145000203](image-20230526145000203.png) 
> - ![image-20230526145159125](image-20230526145159125.png) 
>
> Reference Wrapper ：<functional>模板引用转换
>
> - ref(T value) = T & value
> - cref(T & value) = T value
>







 

