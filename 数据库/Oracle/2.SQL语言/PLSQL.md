## PLSQL

> - **DCL语句**（数据控制）
>
>   > GRANT：赋值权限，角色
>   >
>   > REVOKE：解除权限，角色
>
> - **DDL语句**（数据定义）
>
>   > CREATE
>   >
>   > ALTER
>   >
>   > DROP
>   >
>   > RENAME
>   >
>   > TRUNCATE
>
> - **DML** (数据操作)
>
>   > Insert
>   >
>   > ~~~SQL
>   > -- 批量插入
>   > insert all 
>   > into table_name (column_1,column_2) values ('value','value')
>   > into table_name (column_1,column_2) values ('value','value')
>   > into table_name (column_1,column_2) values ('value','value')
>   > select 1 from dual;
>   > 
>   > insert into table_name (column_1,column_2) select id,code from (
>   >     select 1 as id, '1' as code  from dual 
>   >     union all   
>   >     select 1 as id, '1' as code  from dual     
>   >     union all   
>   >     select 1 as id, '1' as code  from dual        
>   >     union all   
>   >     select 1 as id, '1' as code  from dual         
>   > ); 
>   > 
>   > begin
>   > insert into oracle_table ( id, code ) values( 1 , '1' );  
>   > insert into oracle_table ( id, code ) values( 2 , '2' );  
>   > insert into oracle_table ( id, code ) values( 3 , '3' );   
>   > insert into oracle_table ( id, code ) values( 4 , '4' );
>   > end;
>   > 
>   > ~~~
>   >
>   > update
>   >
>   > ~~~SQL
>   > -- 连表更新（连表字段必须存在唯一约束）
>   > update (select * from a,b where a.column1 = b.column2) as M set a.column1 = b.column2
>   > 
>   > -- 根据查询条件执行相应操作
>   > merge into table_name alias_1   -- 主表
>   >       using [table | view |sub_query] alias_2 -- 驱动表
>   >       on (join condition) -- 连接条件
>   > when MATCHED then <sql> -- 满足连接条件执行
>   > when NOT MATCHED then  <sql> -- 不满足连接条件执行
>   > 
>   > -- 游标更新
>   > begin
>   > for cursor_1  in (SQL) loop 
>   > update table_name set ...
>   > end loop;
>   > end;
>   > ~~~
>   >
>   > delete
>   >
>   > ~~~SQL
>   > -- 删除字段重复的数据
>   > delete from table_name a where exists 
>   > (select * from table_name b where a.column = b.column and a.rowid > b.rowid)
>   > ~~~
>
> - **DQL**（数据查询）
>
>   > ~~~sql
>   > -- 递归查询 （查询树形结构表）
>   > select * from table_name <where condition> -- 主句
>   >   start with (condition) -- 开始条件
>   >   connect by (condition) -- 子父关联条件
>   >   
>   > -- 使用with构成的子查询  with：子查询构造语句，用作临时变量重复使用）
>   > -- query_name 具备参数绑定
>   > with query_name <(...column)> as (sql),
>   >      query_name2 <(...column)> as (sql),
>   >      ....
>   > select * from [table | query_name ] where (condition);
>   >  
>   >  -- 使用with语句构造递归查询
>   >  with query_name(...column) as (
>   >    select * from dual  -- 初始化数据
>   >      union all
>   >    select * from query_name where (condition) -- 通过上条sql查询的列数据约束自身查询
>   >  )
>   >  select * from query_name;
>   >  
>   >  -- 案例
>   > with dept_query(parent_code,code,name,path) as (
>   >    select t1.parent_code,t1.code,t1.name, t1.name as path  from blade_region t1 where t1.code = '00'
>   >     union all
>   >     -- t为条件约束语句
>   >    select t.parent_code,t.code,  t.name, t2.path || '->' || t.name as path   from dept_query t2 join blade_region t on t2.code = t.parent_code
>   >  )
>   > select * from dept_query order by parent_code asc;
>   > 
>   > 
>   > -- where 条件查询
>   > -- any：存在（or）lnlinesql存在一条结果集即为真 column {condition} any (inlinesql)，
>   > -- all：任意（and）lnlinesql所有结果集满足条件即为真
>   > -- in： 等同于 = any（inlinesql)
>   > -- exists：等同于 = all (inlinesql)
>   > 
>   > -- 分组汇总
>   > group by rollup(A,B,C)
>   >  -- 等效于 group by A，group by A,B，group by A,B,C，group by NULL 的union all 语句
>   >  
>   >  -- 分组组合
>   >  group by cure(A,B,C)
>   >   -- 等效于 group by A，group by B，group by C，group by A,B，group by A,C，- group by B,C，group by A,B,C，group by NULL 的union all 语句
>   >  group by cube ((A,B),C)
>   >   -- 等效于 group by A,B,C，group by A,B，group by C，group by NULL
>   >   
>   >  -- 排序 order by
>   >   -- row_number() over(order by COL)：根据COL字段排序生成行号
>   >   -- row_number() over(partition by COL1 order by COL2)：以COL1分组后通过COL2排序生成行号
>   >   
>   > -- 关联查询
>   >  -- 返回列结构相同  intersect（交集）union all（并集）minus（差集）
>   >  -- 连表查询（左，右，全连接）
>   >  -- 子查询（column，where，from）
>   >  
>   > ~~~
>
> **内置函数**
>
> - null函数
>
>   1. COALESCE(...expr)：返回非空的参数
>   2. NULLIF(expr1,expr2)：expr1,expr2相同则返回空值，否则返回第一个参数（expr1，与expr2类型相同）
>   3. NVL(expr1,expr2)：expr1为空返回expr2，否则返回expr1
>   4. NVL2（expr1,expr2,expr3) 同上
>   5. INNVL(expr1) ：判断字段是否为空或不为真
>   6. NANVL(expr,value)：判断表达式是否为数字，否则返回value
>   7. DECODE(expr,condition,value)：表达式expr与condition匹配，返回value，否则返回null
>   8. DECODE(expr,condition,value,default_value)：表达式expr与condition匹配，返回value，否则返回default_value（可以比较null值）
>
> - 字符处理函数
>
>   1. translate(expr,from_str,to_str)：一次替换多个字符(不能直接替换空串)
>
>      > 替换空串操作 select translate('1234567','?123' ,'?') from dual;
>
>   2. replace（string，search_str,[replace_str]）
>
>   3. substr(str,a,b)：截取字符串，从a位置开始截取b字符长
>
> - 时间处理函数
>
>   1. sysdate：返回当前日期和时间
>
>   2. systimestamp：返回当前日期和时间（包含时区）
>
>   3. current_date，current_timestamp，localtimestamp：**返回当前会话的时间**
>
>   4. to_char(date,format)：时间转字符
>
>      > 日期格式化
>      >
>      > YYYY：四位年份
>      >
>      > MM：当夜月份
>      >
>      > MON：月份缩写
>      >
>      > Q：季度
>      >
>      > W：当月第几周
>      >
>      > WW：当年第几周
>      >
>      > D：当周第几天
>      >
>      > DD：当月第几天
>      >
>      > DDD：当年第几天
>      >
>      > HH，HH12，HH24：小时
>      >
>      > MI：分钟
>      >
>      > SS：秒数
>      >
>      > SSSS：当天已过去的秒数
>
>   5. to_date(str,format)：字符转时间
>
>   6. numtoDSinterval(n,char_expr)：时间单位转换（时间间隔）
>
>   7. to_dsinterval(str)：字符转时间间隔
>
>   8. add_months(date,int)
>
>   9. last_day(date)：date最后一天日期
>
>   10. months_between(date,date)：返回两个日期月份差(存在小数)
>
> **PLSQL**
>
> ~~~SQL
> -- 记录数据类型
> declare 
> -- v_row_data 单行数据变量名，table1来源表，%ROWTYPE结构
> v_row_data table1%ROWTYPE;
> -- 引用table表中某列类型
> declare v_name table1.col%TYPE;
> 
> -- 数组类型
> type str_arr is table of varchar2(30);
>  
> ~~~
>
> **数组属性**
>
> | 属性         | 描述                                                         |
> | ------------ | ------------------------------------------------------------ |
> | count        | 返回集合中元素的个数                                         |
> | delete       | 删除集合中 **所有** 的元素及 **extend**                      |
> | delete(x)    | 删除元素下标为 `x` 的元素（`对 varry 非法`）                 |
> | delete(x,y)  | 删除元素下标从 `x 到 y` 的元素（`对 varry 非法`）            |
> | trim         | 从集合`末端`开始删除`一个`元素（`对 index by 非法)           |
> | trim(x)      | 从集合`末端`开始删除 `x` 个元素 （`对 index by 非法`）       |
> | exists(x)    | 如果集合元素 x 已经 初始化(extend) ，则返回 true，否则返回 false |
> | extend       | 在集合 末尾 添加一个元素（对 index by 非法）                 |
> | extend(x)    | 在集合 末尾 添加 x个元素 （对 index by 非法）                |
> | extend(x, n) | 在集合 末尾 添加元素 x 个下标为n 的 副本（对 index by 非法） |
> | first        | 返回集合中第一个元素的下标号，对 varry 集合 始终 返回 1（除非 未初始化 则为 空） |
> | last         | 返回集合中最后一个元素的下标号，对 varry 集合 值始终 等于 count （除非 未初始化 则为 空） |
> | limit        | 返回 varry 集合的最大的元素个数，对 index by 无效            |
> | next(x)      | 返回在第 x 个元素之后紧挨着它的元素下标(x+1)，若 x 是最后一个元素，则返回 null |
> | prior(x)     | 返回在第x个元素之前紧挨着它的 元素下标(x-1)，如果 x 是第一个元素，则返回 null |
>
> **内置异常**
>
> |        异常        |                             描述                             |
> | :----------------: | :----------------------------------------------------------: |
> |  ACCESS_INTO_NULL  |           当一个空对象被自动分配一个值时会引发它。           |
> |   CASE_NOT_FOUND   | 当没有选择`CASE`语句的`WHEN`子句中的任何选项时，会引发这个错误，并且没有`ELSE`子句。 |
> | COLLECTION_IS_NULL | 当程序尝试将`EXISTS`以外的集合方法应用于未初始化的嵌套表或`varray`时，或程序尝试将值分配给未初始化的嵌套表或`varray`的元素时，会引发此问题。 |
> |  DUP_VAL_ON_INDEX  |     当尝试将重复值存储在具有唯一索引的列中时引发此错误。     |
> |   INVALID_CURSOR   | 当尝试进行不允许的游标操作(例如关闭未打开的游标)时会引发此错误。 |
> |   INVALID_NUMBER   |    当字符串转换为数字时失败，因为字符串不代表有效的数字。    |
> |    LOGIN_DENIED    |     当程序尝试使用无效的用户名或密码登录到数据库时引发。     |
> |   NO_DATA_FOUND    |         当`SELECT INTO`语句不返回任何行时会引发它。          |
> |   NOT_LOGGED_ON    |             当数据库调用没有连接到数据库时引发。             |
> |   PROGRAM_ERROR    |                当PL/SQL遇到内部问题时会引发。                |
> |  ROWTYPE_MISMATCH  |        当游标在具有不兼容数据类型的变量中获取值时引发        |
> |    SELF_IS_NULL    |       当调用成员方法时引发，但对象类型的实例未初始化。       |
> |   STORAGE_ERROR    |             当PL/SQL用尽内存或内存已损坏时引发。             |
> |   TOO_MANY_ROWS    |             当`SELECT INTO`语句返回多行时引发。              |
> |    VALUE_ERROR     |    当发生算术，转换，截断或者`sizeconstraint`错误时引发。    |
> |    ZERO_DIVIDE     |                  当尝试将数字除以零时引发。                  |