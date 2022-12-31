## MyBatis

- ## JDBC (Java DataBase Connection) 

  > *Sun公司定义一套操作关于所有关系型数据库的规范接口，各数据库厂商实现Java接口完成对不同数据库连接*
  >
  > 
  >
  > 1. 注册驱动
  >
  >    > 使用内部类加载第三方厂商驱动
  >    >
  >    > ~~~java
  >    > Class.forName("com.mysql.cj.jdbc.Driver");
  >    > // Reflection获取驱动反射对象
  >    > Reflection.getCallerClass()
  >    > ~~~
  >    >
  >    > Dirver：数据库驱动接口，用于获取数据库连接
  >    >
  >    > DriverManager：用于管理一组JDBC驱动程序的基本服务，获取数据库连接对象
  >    >
  >    > DataSourcer：管理数据库连接池，性能优于DriverManager
  >    >
  >    > 
  >    >
  >    > **各厂商数据库驱动实现类及JDBCURL**
  >    >
  >    > | 数据库     | 实现驱动                        | URL                                                          |
  >    > | ---------- | ------------------------------- | ------------------------------------------------------------ |
  >    > | Oracle     | oracle.jdbc.driver.OracleDriver | jdbc: oracle:thin:@//<host>:<port>/ServiceName<br>jdbc:oracle:thin:@<host>:<port>:<SID> |
  >    > | Mysql      | com.mysql.jdbc.Driver           | jdbc: mysql://<host>:<port>/<database_name>                  |
  >    > | IBMDB2     | com.ibm.db2.jcc.DB2Driver       | jdbc:db2://<host>[:<port>]/<database_name>                   |
  >    > | postgresql | org.postgresql.Dr               | jdbc:postgresql://<host>[:<port>]/<database>                 |
  >    >
  >    > 
  >    >
  >    > JDBC驱动类型
  >    >
  >    > - JDBC-ODBC Bridge Driver （桥接ODBC）
  >    >
  >    >   <img src="img\image-20221225134733943.png" alt="image-20221225134733943" style="zoom:67%;" /> 
  >    >
  >    > - Native API Driver
  >    >
  >    >   > <img src="img\image-20221225134827419.png" alt="image-20221225134827419" style="zoom:67%;" /> 
  >    >
  >    > - JDBC-Net Dirver
  >    >
  >    >   > <img src="img\image-20221225134909891.png" alt="image-20221225134909891" style="zoom:67%;" /> 
  >
  > 2. 获取连接对象
  >
  >    > Connection：数据库连接对象（用于创建Statement）
  >    >
  >    > <img src="img\image-20221225135440311.png" alt="image-20221225135440311" style="zoom:67%;" />  
  >    >
  >    > Wrapper：SQL包装器，对非JDBC的标准方法进行扩充（unwrap方法对代理资源直接访问）
  >    >
  >    > **Connection，Statement，ResultSet关系**
  >    >
  >    > <img src="img\image-20221230143753967.png" alt="image-20221230143753967" style="zoom:67%;" /> 
  >    >
  >    > **javax.sql相关内容**
  >    >
  >    > <img src="img\image-20221230144102339.png" alt="image-20221230144102339" style="zoom:67%;" /> 
  >    >
  >    > - **RowSet：** 可滚动、可更新、可序列化的JavaBean对象，数据库数据与应用内存对象的映射，可用于离线操作数据库。
  >    >
  >    > - **Statement：** 与数据库进行交互，编译及执行SQL语句
  >    >
  >    >   - <img src="img\image-20221230151150811.png" alt="image-20221230151150811" style="zoom:50%;" /> <img src="img\image-20221230151247940.png" alt="image-20221230151247940" style="zoom: 50%;" />
  >    >   - **PreparedStatement：**预编译的SQL语句
  >    >   - **CallableStatement**：继承PreparedStatement接口，增加存储过程调用
  >    >
  >    > - **ResultSet：** 提供检索(游标)和操作SQL执行结果
  >    >
  >    >   - ResultSet类型
  >    >     1. TYPE_FORWARD_ONLY：不可滚动，游标只能向前移动
  >    >     2. TYPE_SCROLL_INSENSITIVE：可滚动的，它的游标可以相对于当前位置向前或向后移动，也可以移动到绝对位置（ResultSet对象更改不影响数据库中数据）
  >    >     3. TYPE_SCROLL_SENSITIVE：可滚动的，它的游标可以相对于当前位置向前或向后移动，也可以移动到绝对位置（ResultSet对象更改影响数据库中数据）
  >    >   - ResultSet并行
  >    >     1. CONCUR_READ_ONLY：只能从ResulSet对象中读取数据
  >    >     2. CONCUR_UPDATABLE：允许读取，修改
  >    >   - ResultSet可保持性：
  >    >     1. HOLD_CURSORS_OVER_COMMIT：当调用Connection中提交事务时，**不关闭当前事务创建的ResultSet对象**
  >    >     2. CLOSE_CURSORS_AT_COMMIT：当前事务提交后，关闭ResultSet对象
  >    >   - ResultSet中修改数据
  >    >     - <img src="img\image-20221230153802581.png" alt="image-20221230153802581" style="zoom:60%;" /> 
  >    >
  >    > - **DataBaseMetaDatal**：用于获取数据库的结构、存储过程，函数，数据源事务支持。
  >    >
  >    >   - <img src="img\image-20221230154522853.png" alt="image-20221230154522853" style="zoom:50%;" /> 
  >    >
  >
  > **JDBC事务**
  >
  > - 事务隔离级别
  >   1. 读未提交（读取其他事务中未提交的数据）脏读
  >   2. 读已提交(事务A多次读取**其他事务修改的数据**,导致数据在A事务中有多次不同结果)  不可重复读
  >   3. 可重复读（事务A多次读取**其他事务新增或删除的数据**，导致数据在A事务中有不同的结果集）幻读
  >   4. 可序化（事务串行执行，不允许并发）
  
- ## **Mybatis**

  > #### **SQL工具类**
  >
  > *SQL类用于在Java代码中动态拼接SQL，SqlRunner和ScriptRunner为Jdbc进行封装扩展，MetaObject，MetaClass对应数据库数据与JavaBean对象字段映射和生成*
  >
  > - new SQL ：AbstractSQL()  其内部类 SQLStatement 用于拼接SQL
  > - ScriptRunner：批量执行SQL脚本
  >
  >   - executeFullScript：一次性执行所有SQL
  >   - executeLineByLine：以分号结尾，逐行执行SQL
  > - SqlRunner：SQL工具类，对JDBC进行封装处理
  >   - ![image-20221230171800667](img\image-20221230171800667.png) 
  > - MetaObject：MyBatis中的反射工具类，获取和设置Pojo对象属性
  >   - MetaObject meta = SystemMetaObject.forObject(rich);
  >   - ![image-20221230172532939](img\image-20221230172532939.png) 
  > - MetaClass：Mybatis中类反射工具，获取类的构造方法
  >   - <img src="img\image-20221231152409507.png" alt="image-20221231152409507" style="zoom:70%;" /> 
  >
  > - ObjectFactory：创建Mapper映射结果对象实例，DefaultObjectFactory唯一实现接口
  > - ProxyFactory：创建动态代理对象，实现Mybatis懒加载功能，CglibProxyFactory和**Javassist**ProxyFactory实现动态代理
  >
  >  
  >
  > #### **Mybatis操作数据库流程**
  >
  > - ~~~java
  >   // 读取Mybatis 配置信息（数据库连接信息）   
  >   InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
  >   // SqlSessionFactory创建数据库连接，全局唯一
  >   SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
  >   // SqlSession为JDBC包装类，通过它进行数据库交互
  >   SqlSession sqlSession = factory.openSession();
  >   //获取UserMapper代理对象（数据库与Pojo映射）
  >   UserMapper usermapper= sqlSession.getMapper(UserMapper.class);
  >   User user = usermapper.getUser(1);  
  >    
  >   // 方式二配置
  >   Reader mybatisConfig = Resources.getResourceAsReader("mybatis-config.xml");
  >   SqlSessionManager sqlSessionManager = SqlSessionManager.newInstance(mybatisConfig);
  >   sqlSessionManager.startManagedSession();
  >   UserMapper mapper = sqlSessionManager.getMapper(UserMapper.class);
  >   ~~~
  >
  >   <img src="img\image-20221231160108408.png" alt="image-20221231160108408" style="zoom:67%;" /> 
  >
  > - SqlSession：Mybatis提供面向用户操作数据库API
  >
  > - Executor：Mybatis的SQL执行器，MyBatis中对数据库所有的增删改查操作都是由Executor组件完成
  >
  > - StatementHandler/ParameterHandler：对JDBC的Statement进行封装
  >
  > - ResultSetHandler：将ResultSet转换为Java对象
  >
  > - TypeHandler：Mybatis类型处理器
  >
  >   
  >
  > **Mybatis配置**
  >
  > | 设置名                             | 描述                                                         | 有效值                                                       | 默认值                                                |
  > | :--------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :---------------------------------------------------- |
  > | cacheEnabled                       | 全局性地开启或关闭所有映射器配置文件中已配置的任何缓存。     | true \| false                                                | true                                                  |
  > | lazyLoadingEnabled                 | 延迟加载的全局开关。当开启时，所有关联对象都会延迟加载。 特定关联关系中可通过设置 `fetchType` 属性来覆盖该项的开关状态。 | true \| false                                                | false                                                 |
  > | aggressiveLazyLoading              | 开启时，任一方法的调用都会加载该对象的所有延迟加载属性。 否则，每个延迟加载属性会按需加载（参考 `lazyLoadTriggerMethods`)。 | true \| false                                                | false （在 3.4.1 及之前的版本中默认为 true）          |
  > | multipleResultSetsEnabled          | 是否允许单个语句返回多结果集（需要数据库驱动支持）。         | true \| false                                                | true                                                  |
  > | useColumnLabel                     | 使用列标签代替列名。实际表现依赖于数据库驱动，具体可参考数据库驱动的相关文档，或通过对比测试来观察。 | true \| false                                                | true                                                  |
  > | useGeneratedKeys                   | 允许 JDBC 支持自动生成主键，需要数据库驱动支持。如果设置为 true，将强制使用自动生成主键。尽管一些数据库驱动不支持此特性，但仍可正常工作（如 Derby）。 | true \| false                                                | False                                                 |
  > | autoMappingBehavior                | 指定 MyBatis 应如何自动映射列到字段或属性。 NONE 表示关闭自动映射；PARTIAL 只会自动映射没有定义嵌套结果映射的字段。 FULL 会自动映射任何复杂的结果集（无论是否嵌套）。 | NONE, PARTIAL, FULL                                          | PARTIAL                                               |
  > | autoMappingUnknownColumnBehavior   | 指定发现自动映射目标未知列（或未知属性类型）的行为。`NONE`: 不做任何反应`WARNING`: 输出警告日志（`'org.apache.ibatis.session.AutoMappingUnknownColumnBehavior'` 的日志等级必须设置为 `WARN`）`FAILING`: 映射失败 (抛出 `SqlSessionException`) | NONE, WARNING, FAILING                                       | NONE                                                  |
  > | defaultExecutorType                | 配置默认的执行器。SIMPLE 就是普通的执行器；REUSE 执行器会重用预处理语句（PreparedStatement）； BATCH 执行器不仅重用语句还会执行批量更新。 | SIMPLE REUSE BATCH                                           | SIMPLE                                                |
  > | defaultStatementTimeout            | 设置超时时间，它决定数据库驱动等待数据库响应的秒数。         | 任意正整数                                                   | 未设置 (null)                                         |
  > | defaultFetchSize                   | 为驱动的结果集获取数量（fetchSize）设置一个建议值。此参数只可以在查询设置中被覆盖。 | 任意正整数                                                   | 未设置 (null)                                         |
  > | defaultResultSetType               | 指定语句默认的滚动策略。（新增于 3.5.2）                     | FORWARD_ONLY \| SCROLL_SENSITIVE \| SCROLL_INSENSITIVE \| DEFAULT（等同于未设置） | 未设置 (null)                                         |
  > | safeRowBoundsEnabled               | 是否允许在嵌套语句中使用分页（RowBounds）。如果允许使用则设置为 false。 | true \| false                                                | False                                                 |
  > | safeResultHandlerEnabled           | 是否允许在嵌套语句中使用结果处理器（ResultHandler）。如果允许使用则设置为 false。 | true \| false                                                | True                                                  |
  > | mapUnderscoreToCamelCase           | 是否开启驼峰命名自动映射，即从经典数据库列名 A_COLUMN 映射到经典 Java 属性名 aColumn。 | true \| false                                                | False                                                 |
  > | localCacheScope                    | MyBatis 利用本地缓存机制（Local Cache）防止循环引用和加速重复的嵌套查询。 默认值为 SESSION，会缓存一个会话中执行的所有查询。 若设置值为 STATEMENT，本地缓存将仅用于执行语句，对相同 SqlSession 的不同查询将不会进行缓存。 | SESSION \| STATEMENT                                         | SESSION                                               |
  > | jdbcTypeForNull                    | 当没有为参数指定特定的 JDBC 类型时，空值的默认 JDBC 类型。 某些数据库驱动需要指定列的 JDBC 类型，多数情况直接用一般类型即可，比如 NULL、VARCHAR 或 OTHER。 | JdbcType 常量，常用值：NULL、VARCHAR 或 OTHER。              | OTHER                                                 |
  > | lazyLoadTriggerMethods             | 指定对象的哪些方法触发一次延迟加载。                         | 用逗号分隔的方法列表。                                       | equals,clone,hashCode,toString                        |
  > | defaultScriptingLanguage           | 指定动态 SQL 生成使用的默认脚本语言。                        | 一个类型别名或全限定类名。                                   | org.apache.ibatis.scripting.xmltags.XMLLanguageDriver |
  > | defaultEnumTypeHandler             | 指定 Enum 使用的默认 `TypeHandler` 。（新增于 3.4.5）        | 一个类型别名或全限定类名。                                   | org.apache.ibatis.type.EnumTypeHandler                |
  > | callSettersOnNulls                 | 指定当结果集中值为 null 的时候是否调用映射对象的 setter（map 对象时为 put）方法，这在依赖于 Map.keySet() 或 null 值进行初始化时比较有用。注意基本类型（int、boolean 等）是不能设置成 null 的。 | true \| false                                                | false                                                 |
  > | returnInstanceForEmptyRow          | 当返回行的所有列都是空时，MyBatis默认返回 `null`。 当开启这个设置时，MyBatis会返回一个空实例。 请注意，它也适用于嵌套的结果集（如集合或关联）。（新增于 3.4.2） | true \| false                                                | false                                                 |
  > | logPrefix                          | 指定 MyBatis 增加到日志名称的前缀。                          | 任何字符串                                                   | 未设置                                                |
  > | logImpl                            | 指定 MyBatis 所用日志的具体实现，未指定时将自动查找。        | SLF4J \| LOG4J（3.5.9 起废弃） \| LOG4J2 \| JDK_LOGGING \| COMMONS_LOGGING \| STDOUT_LOGGING \| NO_LOGGING | 未设置                                                |
  > | proxyFactory                       | 指定 Mybatis 创建可延迟加载对象所用到的代理工具。            | CGLIB （3.5.10 起废弃） \| JAVASSIST                         | JAVASSIST （MyBatis 3.3 以上）                        |
  > | vfsImpl                            | 指定 VFS 的实现                                              | 自定义 VFS 的实现的类全限定名，以逗号分隔。                  | 未设置                                                |
  > | useActualParamName                 | 允许使用方法签名中的名称作为语句参数名称。 为了使用该特性，你的项目必须采用 Java 8 编译，并且加上 `-parameters` 选项。（新增于 3.4.1） | true \| false                                                | true                                                  |
  > | configurationFactory               | 指定一个提供 `Configuration` 实例的类。 这个被返回的 Configuration 实例用来加载被反序列化对象的延迟加载属性值。 这个类必须包含一个签名为`static Configuration getConfiguration()` 的方法。（新增于 3.2.3） | 一个类型别名或完全限定类名。                                 | 未设置                                                |
  > | shrinkWhitespacesInSql             | 从SQL中删除多余的空格字符。请注意，这也会影响SQL中的文字字符串。 (新增于 3.5.5) | true \| false                                                | false                                                 |
  > | defaultSqlProviderType             | 指定一个拥有 provider 方法的 sql provider 类 （新增于 3.5.6）. 这个类适用于指定 sql provider 注解上的`type`（或 `value`） 属性（当这些属性在注解中被忽略时）。 (e.g. `@SelectProvider`) | 类型别名或者全限定名                                         | 未设置                                                |
  > | nullableOnForEach                  | 为 'foreach' 标签的 'nullable' 属性指定默认值。（新增于 3.5.9） | true \| false                                                | false                                                 |
  > | argNameBasedConstructorAutoMapping | 当应用构造器自动映射时，参数名称被用来搜索要映射的列，而不再依赖列的顺序。（新增于 3.5.10） | true \| false                                                | false                                                 |
  >
  > 
  >
  > **Mybatis默认类型处理器**
  >
  > | 类型处理器                   | Java 类型                       | JDBC 类型                                                    |
  > | :--------------------------- | :------------------------------ | :----------------------------------------------------------- |
  > | `BooleanTypeHandler`         | `java.lang.Boolean`, `boolean`  | 数据库兼容的 `BOOLEAN`                                       |
  > | `ByteTypeHandler`            | `java.lang.Byte`, `byte`        | 数据库兼容的 `NUMERIC` 或 `BYTE`                             |
  > | `ShortTypeHandler`           | `java.lang.Short`, `short`      | 数据库兼容的 `NUMERIC` 或 `SMALLINT`                         |
  > | `IntegerTypeHandler`         | `java.lang.Integer`, `int`      | 数据库兼容的 `NUMERIC` 或 `INTEGER`                          |
  > | `LongTypeHandler`            | `java.lang.Long`, `long`        | 数据库兼容的 `NUMERIC` 或 `BIGINT`                           |
  > | `FloatTypeHandler`           | `java.lang.Float`, `float`      | 数据库兼容的 `NUMERIC` 或 `FLOAT`                            |
  > | `DoubleTypeHandler`          | `java.lang.Double`, `double`    | 数据库兼容的 `NUMERIC` 或 `DOUBLE`                           |
  > | `BigDecimalTypeHandler`      | `java.math.BigDecimal`          | 数据库兼容的 `NUMERIC` 或 `DECIMAL`                          |
  > | `StringTypeHandler`          | `java.lang.String`              | `CHAR`, `VARCHAR`                                            |
  > | `ClobReaderTypeHandler`      | `java.io.Reader`                | -                                                            |
  > | `ClobTypeHandler`            | `java.lang.String`              | `CLOB`, `LONGVARCHAR`                                        |
  > | `NStringTypeHandler`         | `java.lang.String`              | `NVARCHAR`, `NCHAR`                                          |
  > | `NClobTypeHandler`           | `java.lang.String`              | `NCLOB`                                                      |
  > | `BlobInputStreamTypeHandler` | `java.io.InputStream`           | -                                                            |
  > | `ByteArrayTypeHandler`       | `byte[]`                        | 数据库兼容的字节流类型                                       |
  > | `BlobTypeHandler`            | `byte[]`                        | `BLOB`, `LONGVARBINARY`                                      |
  > | `DateTypeHandler`            | `java.util.Date`                | `TIMESTAMP`                                                  |
  > | `DateOnlyTypeHandler`        | `java.util.Date`                | `DATE`                                                       |
  > | `TimeOnlyTypeHandler`        | `java.util.Date`                | `TIME`                                                       |
  > | `SqlTimestampTypeHandler`    | `java.sql.Timestamp`            | `TIMESTAMP`                                                  |
  > | `SqlDateTypeHandler`         | `java.sql.Date`                 | `DATE`                                                       |
  > | `SqlTimeTypeHandler`         | `java.sql.Time`                 | `TIME`                                                       |
  > | `ObjectTypeHandler`          | Any                             | `OTHER` 或未指定类型                                         |
  > | `EnumTypeHandler`            | Enumeration Type                | VARCHAR 或任何兼容的字符串类型，用来存储枚举的名称（而不是索引序数值） |
  > | `EnumOrdinalTypeHandler`     | Enumeration Type                | 任何兼容的 `NUMERIC` 或 `DOUBLE` 类型，用来存储枚举的序数值（而不是名称）。 |
  > | `SqlxmlTypeHandler`          | `java.lang.String`              | `SQLXML`                                                     |
  > | `InstantTypeHandler`         | `java.time.Instant`             | `TIMESTAMP`                                                  |
  > | `LocalDateTimeTypeHandler`   | `java.time.LocalDateTime`       | `TIMESTAMP`                                                  |
  > | `LocalDateTypeHandler`       | `java.time.LocalDate`           | `DATE`                                                       |
  > | `LocalTimeTypeHandler`       | `java.time.LocalTime`           | `TIME`                                                       |
  > | `OffsetDateTimeTypeHandler`  | `java.time.OffsetDateTime`      | `TIMESTAMP`                                                  |
  > | `OffsetTimeTypeHandler`      | `java.time.OffsetTime`          | `TIME`                                                       |
  > | `ZonedDateTimeTypeHandler`   | `java.time.ZonedDateTime`       | `TIMESTAMP`                                                  |
  > | `YearTypeHandler`            | `java.time.Year`                | `INTEGER`                                                    |
  > | `MonthTypeHandler`           | `java.time.Month`               | `INTEGER`                                                    |
  > | `YearMonthTypeHandler`       | `java.time.YearMonth`           | `VARCHAR` 或 `LONGVARCHAR`                                   |
  > | `JapaneseDateTypeHandler`    | `java.time.chrono.JapaneseDate` | `DATE`                                                       |
  >
  >  
  >
  > #### **Executor组件**
  >
  > 

