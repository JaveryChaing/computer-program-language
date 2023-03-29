## TypeScript

> TypeScript 是 JavaScript 的一个超集，支持 ECMAScript 6 标准，可以编译成纯 JavaScript，编译出来的 JavaScript 可以运行在任何浏览器上。
>
> ~~~c
> npm install -g typescript
> tsc -v
> // 编译成js
> tsc app.ts 
> ~~~
>
> **语言特性**
>
> 1. 数据类型编译检查与类型推断
> 2. 接口
> 3. 面向对象编程（Class)
> 4. 函数重载（包含返回类型重载）
> 5. 枚举数据类型
> 6. 泛型
> 7. 命名空间
> 8. 元组
> 9. Await
>
> **基础数据类型**
>
> | 关键字    | 数据类型     | 描述                                                         |
> | --------- | ------------ | ------------------------------------------------------------ |
> | any       | 任意数据类型 | 编译器动态推断该数据类型                                     |
> | string    | 字符串       | 使用""  ``描述                                               |
> | number    | 双精度浮点值 |                                                              |
> | boolean   | 布尔         |                                                              |
> | []        | 数组         | let arr : number[]                                           |
> |           | 元组         | 已知元素数量和类型的数组（包含不同元素类型的数组）<br /> let tuple_name = [value,value2]<br />let [variable,variable1] = value |
> | enum      | 枚举         | enum Color {Red,Green,Blue}<br />let c: Color = Color.Blue   |
> | void      |              |                                                              |
> | null      |              |                                                              |
> | undefined |              |                                                              |
> | never     |              | never 是其它类型（包括 null 和 undefined）的子类型，通常用于返回错误 |
> |           | 联合类型     | let var_name :string\|number 变量var_name 只允许赋值string或number类型 |
>
> 
>
> **TypeScript函数**
>
> ~~~typescript
> //可选参数,默认参数，剩余参数
> function fun_name(param1:type, param2?:string, param3:string = default_value, ...params4:string[]):return_type{
>     
> }
> // 匿名函数
> let msg = function(){
> }
> msg();
> // 自调用
> (function () { 
>     var x = "Hello!!";   
>     console.log(x)     
>  })();
> // lambda 函数
> let foo = (x:number) => 10+x;
> foo(199)
> 
> ~~~
>
> **TypeScript 接口**
>
> ~~~typescript
> interface interface_name{
>     // 声明字段
>     field_name:string,
>     // 声明函数
>     func_name:()=>string
>     // 联合成员变量
>     field_name1:string[]|string|(()=>string);
> }
> //实现接口
> let variable_name:interface_name = {
>       field_name:"string",
>       func_name:()=>{return "str"}
> }
> // 接口继承（接口扩展）
> child_interface_name extends super_interface_name,super_interface_name2
> ~~~
>
> **TypeScript类**
>
> ~~~typescript
> class calss_name{
>    
>   private field_name:string;
>   // 静态变量
>   static  field_name1:number;
>   // 构造函数
>   constructor(param:string) { 
>         this.engine = engine 
>    }  
>   // 方法
>   method_name():type {
>     
>   }
> }
> // 创建类对象
> let object_name = new class_name();
> //类继承（单继承）
> class child_class_name extends super_interface_name{
>     
> }
> 
> // 引用其他ts文件
> /// <reference path = "IShape.ts" /> 
> 
> // 命名空间(解决对象，方法，变量重名)
> namespace  namespace_name{
>     // 外部使用需要export描述
>     export variable_name;
> }
> 
> 
> ~~~
>
> **TypeScript声明文件**

