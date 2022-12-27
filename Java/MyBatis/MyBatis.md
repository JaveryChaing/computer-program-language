## MyBatis

- #### JDBC (Java DataBase Connection) 

  > *Sun公司定义一套操作关于所有关系型数据库的规范接口，各数据库厂商实现Java接口完成对不同数据库连接*
  >
  > **JDBC实现数据库操作**
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
  >    > Connection：数据库客户端对象（会
  >    >
  >    > 话）
  >    >
  >    > ![image-20221225135440311](img\image-20221225135440311.png) 
  >
  > 3. 获取数据库操作对象
  >
  >    > Wrapper：SQL包装器，使用unwrap方法对代理资源直接访问
  >
  > 4. 执行SQL语句，返回结构集
  >
  > 5. 处理SQL结果集
  >
  >    > 
  >
  > 6. 关闭连接资源
  >
  > 
