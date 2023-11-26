## PostgreeSQL基础

> 基本概念
>
> - Tablespace： 文件系统定义那些存储数据库对象的文件存放的位置
>
>   ~~~postgresql
>   create tablespace space_name [OWNER] location '/path'
>   alter tablespace name space_name to new_name
>   ~~~
>
> - Segment：数据文件
>
> - 数据库连接
>
>   ~~~postgresql
>   su postgres
>   psql
>   -- 查看public中的表,表结构
>   \d \d table_name
>   
>   -- 查看登录用户下表空间
>   \db
>   
>   -- 查看用户或角色
>   \du \dg
>   
>   -- 设置查询输出格式
>   \x
>   
>   -- 显示sql执行时间
>   \timing
>   
>   ~~~
>
> **数据类型及运算符**
>
> - smallint/integer/bigint：2/4/8字节（整数位无长度限制）
>
> - numberic/decimal
>
> - smallserial/serial/bigserial：自增整数
>
> - char(n)/varchar(n)/text：固长/变长/无限长字符串
>
>   字符串匹配运算符
>
>   1. like
>   2. similar to 
>   3. posix（正则表达式匹配）
>
> - bytea：二进制字符串
>
> - timestamp/data/time/interval：时间类型
>
>   时间格式转换 yyyymmdd
>
>   1. to_date