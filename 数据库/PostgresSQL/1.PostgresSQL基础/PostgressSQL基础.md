## PostgreeSQL基础

> - 初始化数据库
>
>   ~~~shell
>   # 默认工具位置
>   /usr/pgsql-16/bin
>   # 默认数据库及文件位置
>   /var/lib/pgsql/16
>   # 开启远程访问
>   vim postgresql.conf
>    -- listen_addresses = '*'
>   vim pg_hba.conf
>    -- host all all 0.0.0.0/0 scram-sha-256
>    
>   # 连接数据库
>   su postgres
>   psql -h <ip> -p <port> -U <user> -d <database>
>   
>   \d # 查看当前数据库中表，视图，序列
>   \db # 查看表空间
>   \du # 查看用户
>   \timing # 开启查询时间
>   ~~~
>
> - Tablespace： 文件系统定义那些存储数据库对象的文件存放的位置
>
>   ~~~postgresql
>   create tablespace space_name location '/path';
>   
>   select * from pg_tablespace;
>   
>   -- 移动表空间下对象(移动期间涉及的对象将被锁定)
>   alter table all in tablespace old_space set tablespace new_space;
>   
>   
>   ~~~
>
> - 创建表
>
>   ~~~postgresql
>   -- 创建分区表
>   create table table_name () partition by {list | range }(field_name) tablespace table_space;
>   
>   -- 添加字段注释
>   comment on column table_name.field_name is 'text';
>   
>   --子表
>   create table table_name_partition partition of table_name for values from ('start_value') to ('end_value');
>   
>   create table table_name_partition partition of table_name for in ('values')  
>   -- check 约束，约束字段范围，
>   check(field_name > 'value' | field_name_2)
>   
>   -- 非空约束 NOT NULL。 唯一约束 UNIQUE， 主键约束 PARIMAEY KEY，默认约束 DEFAULT
>   
>   -- 创建自增序列
>   create sequence seq_name start with 1 increment by 1 no minvalue no maxvalue cache 1; 
>   
>   -- 查看seq
>   select nextval('seq_name');
>   
>   ~~~
>
> - 数据类型及其运算符
>
>   ~~~postgresql
>   -- 整数
>   smallint/integer/bigint
>   -- 浮点数
>   numeric/decimal 
>   
>   --字符类型
>   char(n)/varchar(n)/text
>   -- 支持的运算符
>   ||：字符拼接， like  similar to  ～ ：模糊查询
>   
>   -- 时间类型 支持基本的算术运算符
>   timestamp/date/time/interval
>   
>   -- 布尔类型  true/false/unkonw
>   boolean
>   
>   -- 枚举
>   create type week as enum('value');
>   
>   -- 几何类型
>   point/line/lseg/box/path/polygon/circle
>   -- line/lesg '{A,B,C}' line '(x,y)(x,y)'
>   
>   -- JSON数据类型
>   json/jsonb(支持索引)
>   select '{"key":"value"}'::jsonb;
>   -- 支持的运算符
>   json->'key | index ' -- 获取json下标为index 或key的元素
>   json ->> ''          -- 输出为text 或 int
>   json #> '{}'         -- 嵌套读取json 
>   json #>> '{}'				 -- 嵌套读取json,输出为文本
>   
>   jsonb ? 'key'        -- key是否存在最外层json中
>   jsonb ?| array['key']  -- key是否存在最外层json中
>   jsonb || jsonb        -- 合并两个json
>   jsonb - ''            -- 删除指定的key
>   
>   --范围数据类型
>   int8range/numberange/tsrange/daterange
>   --范围值输入 '[start,end]' / '(start,end)'
>   --支持的运算符 
>   --  @> 包含 <@ 被包含
>   --  -|- 是否相邻
>   --  && 是否重叠
>   --  + * - 并交差
>   
>   -- 数组类型,支持切片访问
>   array['value'] / '{"str","str2"}'
>   --支持的运算符
>   -- || 拼接数组
>   ~~~
>
> - 常用函数
>
>   ~~~postgresql
>   -- 格式化字符串输出
>   -- type: %S:字符串占位， %I:双引号占位 ，%L:SQL占位
>   format('%[position][flags][with]type')
>   
>   -- json函数，将任意类型数据转为jsonb
>   to_jsonb(anyelement)
>   
>   -- 数组转json
>   array_to_json(),row_to_json
>   
>   -- 
>   ~~~
>
>   