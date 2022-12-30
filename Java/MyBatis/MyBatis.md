## MyBatis

- #### JDBC (Java DataBase Connection) 

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
  
- **Mybatis**

  > **SQL工具类**
  >
  > - new SQL ：AbstractSQL()  其内部类 SQLStatement 用于拼接SQL
  >
  > - ScriptRunner：批量执行SQL脚本
  >
  >   - executeFullScript：一次性执行所有SQL
  >   - executeLineByLine：以分号结尾，逐行执行SQL
  >
  > - SqlRunner：SQL工具类，对JDBC进行封装处理
  >   - ![image-20221230171800667](img\image-20221230171800667.png) 
  > - MetaObject：MyBatis中的反射工具类，获取和设置Pojo对象属性
  >   - MetaObject meta = SystemMetaObject.forObject(rich);
  >   - ![image-20221230172532939](img\image-20221230172532939.png) 
  >
  > 

