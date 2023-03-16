## GraphQL

GraphQL 是一个用于 API 的查询语言（类似于REST API,，更改传统Http请求响应方式），是一个使用基于类型系统来执行查询的服务端运行时（类型系统由你的数据定义）。GraphQL 并没有和任何特定数据库或者存储引擎绑定，而是依靠你现有的代码和数据支撑。*Restful一个资源请求对应不同的操作（包含多个http请求），GraphQL则是一个请求描述多种资源操作*

> **GraphQL**
>
> 操作类型
>
> - query
>
>   ~~~json
>   query MethodName($variableName:ObjectType) {
>       hero(variableName:$variableName){
>        friends{
>          name
>         } 
>       }
>   }
>   // query MethodName() ：查询方法
>   // hero，friends  name ：查询数据字段
>   
>   ~~~
>
>   > **变量**（服务器接收，客户端传递）
>   >
>   > 声明变量：$variableName:ObjectType
>   >
>   > 默认变量值：$variableName:ObjectType = "JEDI"
>   >
>   > 非必要变量：$variableName:ObjectType!
>   >
>   > 使用变量：variableName: $variableName
>   >
>   > 
>   >
>   > **指令**（判断变量值）
>   >
>   > 判断变量：@include(if:$variableName)，@skip(if:Boolean)
>   >
>   >  
>   >
>   > **元字段**（获取字段类型）
>   >
>   > ~~~~json
>   > {
>   >     search(text:"an"){
>   >         __typename on Human{
>   >             name
>   >         }
>   >     }
>   > }
>   > ~~~~
>   >
>   > 
>   >
>   > 
>
> - mutation
>
>   > 
>
> - subscription



