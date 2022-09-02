## Lua 语法

> - 单行注释
>
>   ~~~lua
>   -- 单行注释
>   --[[ 多行注释，，
>        多行注释]]
>   ~~~
>
> - 关键字
>
>   ![image-20220902153421876](img\image-20220902153421876.png) 
>
> **数据类型**
>
> - nil
>
> - boolean
>
> - number
>
> - string：单引号，双引号，[[]] 表示
>
>   > ~~~lua
>   > len = "hello world"
>   > // 表示len字符长度
>   > print(#len) 
>   > ~~~
>
> - function
>
>   > ~~~lua
>   > function factoriall(n)
>   >     if n == 0 then
>   >       return 1
>   >     else 
>   >       return n * factoriall(n-1)
>   >     end
>   >  end 
>   > -- 匿名函数
>   > function testFun(tab,fun)
>   >     for k,v in pairs (tab) do 
>   >           print(fun(k,v));
>   >         end
>   >     end
>   > -- 函数当作参数传入
>   > testFun(tab,function(k,v)
>   >     print(k,v)
>   >   end)
>   > ~~~
>
> - userdata ：C或C++ 语言中数据结构
>
> - thread：执行的独立线程
>
> - table：关联数组，使用{}表示
>
>   > ~~~lua
>   > local tab = {"apple","pear","orange","grape"}
>   > // key 为tab下标，从1开始
>   > for key,val in pairs(tab) do 
>   >     print("key",key)
>   >     end 
>   > ~~~
>
> **变量**
>
> - 局部变量  local var_name
>
> - 变量赋值
>
>   ~~~lua
>   -- a,b 批量赋值
>   a,b = 10,20
>   -- a，b值交换
>   a,b = b,a
>   -- 多值返回函数 
>   a,b = f()
>   -- table 索引操作
>   t[i] 
>   t.i
>   ~~~
>
> **基本操作语句**
>
> - 循环
>
>   > while
>   >
>   > ~~~lua
>   > while(condition)
>   >  do 
>   >     statements
>   >  end
>   > ~~~
>   >
>   > for
>   >
>   > ~~~lua
>   > for var=exp1,exp2,exp3 do 
>   >      statements
>   >   end
>   > --table 循环
>   > for i, v in ipairs(a) do
>   >     print(i, v)
>   > end 
>   > ~~~
>   >
>   > repeat...until
>   >
>   > ~~~lua
>   > -- condition 为 true 停止循环，statements至少执行一次
>   > repeat 
>   >     statements
>   >     until(condition)
>   > ~~~
>
> - 函数
>
>   >~~~lua
>   >--多值返回
>   >function maximun(a)
>   >        local a = 1;
>   >        local m = a[a]
>   >        return a,m;
>   >  end
>   >-- 可变参数
>   >function add(fmt,...)
>   >    for i,v in ipairs{...} do 
>   >      statements
>   >     end
>   >    end
>   >-- 选取可变参数
>   >select('#', ...) -- 获取可变参数长度
>   >select(n,...) -- 获取从起点n开始到结束参数
>   >~~~
>
> - 运算符
>
>   > - == 判断等于   
>   > - ~= 判断不等于 ，不相等返回 treu
>   > - / 除法   // 整除
>   > -  and   or    not
>   > - .. 连接字串
>   > - `#` 返回字串长度或表长度
>   > - ^ 乘幂
>   >
>   > 优先级
>   >
>   > 1. ^
>   > 2. not  - 
>   > 3. `*   /  %`
>   > 4. `+  -`
>   > 5. ..
>   > 6. <  >  <= >=  ~=  ==
>   > 7. and  
>   > 8. or
>
> - 字符串
>
>   > ~~~lua
>   > --main 为要操作的字符串， find 为被替换的字符，replace 要替换的字符，num 替换次数
>   > string.gsub(main,find,replace,num)
>   > -- 查找substr在str中索引位置,init开始位置
>   > string.find(str,substr,init)
>   > -- 返回字符串string的n个拷贝
>   > string.rep(str,num)
>   > -- 字符截取  s原字符串，i开始位置，j结束位置（默认-1，最后一个字符）
>   > string.sub(s, i [, j])
>   > -- 字串格式化  
>   > string.format()
>   > ~~~
>
> - 迭代器
>
>   > ~~~lua
>   > ipairs 
>   > -- 无状态迭代器 (循环3次，初始值)
>   > for i,n in square,3,0 
>   >  do 
>   >     print(i,n)
>   >  end
>   > function square(iteratorMaxCount,currentNumber)
>   >      if currentNumber<iteratorMaxCount
>   >    then
>   >       currentNumber = currentNumber+1
>   >    return currentNumber, currentNumber*currentNumber
>   >    end
>   > end
>   > ~~~
>
> - table
>
>   > ~~~lua
>   > -- 初始化表
>   > table = {}
>   > -- 指定值
>   > table[1] = "Lua"
>   > -- 移除
>   > table[1] =nil
>   > table = nil
>   > -- table 操作
>   > -- 类似与join 将start，end 的元素使用sep连接
>   > table.concat(table,sep,start,end)  
>   > table.insert(table,pos,value)
>   > -- 返回key最大值
>   > table.maxn(table)
>   > table.remove(table,pos)
>   > ~~~
>
> - 模块话与包
>
>   > ~~~lua
>   > -- module.lua 作为文件
>   > module = {}
>   > -- module 常量
>   > module.constant = "str"
>   > -- module 函数
>   > module.func1()
>   >   print("hello world")
>   >  end
>   > return module
>   > 
>   > -- 使用require函数加载模块
>   > require("<模块名>")    require "<模块名>"
>   > -- 别名 
>   > local m  = require "<模块名>"
>   > ~~~
>   >
>   > require 加载模块需要放在LUA_PATH 目录下
>   >
>   > 
>   >
>   > C包加载
>   >
>   > ~~~lua
>   > loadlib(path,"name")
>   > assert(loadlib(path,"name"))
>   > 
>   > ~~~
>   >
>   > 