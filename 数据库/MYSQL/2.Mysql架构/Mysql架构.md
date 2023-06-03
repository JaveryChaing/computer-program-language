## mysql架构

> ![image-20211228104450238](image-20211228104450238.png)  
>
> - 连接池组件
>
>   > 不同客户端连接都会在服务器创建一个线程来执行SQL操作（*服务器会对连接线程进行缓存*）。
>   >
>   > TCP/IP 套接字连接
>   >
>   > SOCKET 套接字连接
>
> - 插件式存储引擎
>
>   > - InnoDB存储引擎（支持行锁，外键），MVCC多版本并发控制，支持插入缓存，二次写，自适应哈希索引，预读等高性能和高可用功能。
>   >
>   > - MyISAM 引擎（不支持事务，表锁设计，全文索引） 
>   >
>   > - NDB存储引擎 （集群存储引擎）类似ORACLE的RAC集群
>   > - Memory引擎（基于内存的存储）
>   > - Archive （只支持Insert和Select操作）
>   > - Maria （取代MyISAM设计）
>   >
>   > ![image-20211228110222606](image-20211228110222606.png) 
>
> - 物理文件
>
>   > - frm存放表结构，myd存放数据，myi存放索引，分区表文件使用#进行扩充
>   >
>   > - .ibd 和ibdata文件，存放Innodb索引和数据文件
>   >
>   > - error log  MYSQL异常日志
>   >
>   > - binarg log 用于数据恢复，主从复制
>   >
>   > - redo undo 事务提交/事务回滚日志
>   >
>   > - slow query log 慢查询日志
>   >
>   > - query log 慢查询日志
>
> - 系统库
>
>   > 1. mysql ：存储用户账号及权限信息
>   >
>   > 2. performance_schema：MySQL服务器运行过程状态信息（性能监控及配置状态）
>   >
>   >    > | 表名                              | 注释                                                         |
>   >    > | --------------------------------- | ------------------------------------------------------------ |
>   >    > | setup_table                       | 设置表，配置监控选项                                         |
>   >    > | current_events_table              | 记录当前那些thread                                           |
>   >    > | history_table                     | 发生的各种事件的历史记录表                                   |
>   >    > | summary_table                     | 对各种事件的统计表                                           |
>   >    > | setup_consumers\setup_instruments | 描述各种事件, 设置哪些事件能够被收集                         |
>   >    > | setup_instruments                 | 描述这个数据库下的表名以及是否开启监控                       |
>   >    > | setup_timers                      | 描述监控选项已经采样频率的时间间隔                           |
>   >    > | threads                           | 监控服务器所有连接                                           |
>   >    > | performance_timers                | 设置一些监控信息, 指定mysql服务可用的监控周期，CYCLE表示按每秒检测2603393034次, 目前 performance-schema 只支持’wait’时间的监控，代码树上 wait/ 下的函数都可以监控到 |
>   >
>   > 3. information_schema：数据库的元数据（表名，列数据类型，访问权限，触发器）
>   >
>   >    > |                  表                   |                  说明                   |
>   >    > | :-----------------------------------: | :-------------------------------------: |
>   >    > |               SCHEMATA                |       数据库信息（show database）       |
>   >    > |                TABLES                 |          表信息（show tables）          |
>   >    > |                COLUMNS                | 字段信息（show columns from tablename） |
>   >    > |              STATISTICS               |                索引信息                 |
>   >    > |            USER_PRIVILEGES            |        用户权限信息（来源mysql)         |
>   >    > |                 VIEWS                 |                  视图                   |
>   >    > |               TRIGGERS                |                 触发器                  |
>   >    > |               ROUTINES                |                存储过程                 |
>   >    > | TABLE_CONSTRAINTS<br>KEY_COLUMN_USAGE |             约束字段及外键              |
>   >    > |                                       |                                         |
>   >
>   > 4. sys：查询库（服务器状态，数据库，表，存储过程，触发器信息通过视图关联查询）

#### **InnoDB引擎**

> ![图1](image-20211223145856095.png) 
>
> - Buffer Pool：内存池（缓存表中的数据和索引，提高查询速度）
>
>   > ![image-20211228151419821](image-20211228151419821.png) 
>
> - redo log：重做日志（事务提交时把修改缓存页提交到磁盘）
>
>   > 1. redo log buffer：记录数据更改后的值（脏页）
>   >
>   >    > redo log buffer更新策略（LRU）
>   >
>   > 2. 事务提交时，将redo log buffer内容追加到redo log file中（异步）
>   >
>   >    > innodb_flush_log_at_trx_commit：控制刷盘策略
>   >    >
>   >    > - 0：系统默认间隔1s对redo log file进行同步
>   >    > - 1：事务提交时进行同步（默认，CheckPoint策略）
>   >    > - 2：事务提交时将redo log buffer提交到操作系统，由操作系统写入redo log file
>   >    >
>   >    > 效率2最高，安全性1最高
>   >
>   > CheckPoint：事务提交时保存脏页数据到redo log 中（原子性）
>
> - undo log：回滚日志（数据版本控制）
>
>   > 
>
> - 线程
>
>   > 1. Mster Thread：负责将缓存池中的数据异步刷新到磁盘中（脏页刷新，合并插入缓存，undo页回收）
>   > 2. IO Thread
>   > 3. Purge Thread：事务提交线程（回收已使用的undo)
>
> InnoDB性能监控
>
> ~~~SQL
> -- 查看Innodb 状态
> show engine innodb status\G;
> -- Buffer pool size 当前页数
> -- Free buffers 空闲页数
> -- Database pages 数据页 （Database + free <= buffer pool）
> -- pages made young 显示LRU列表移动前端次数
> -- buffer pool hit rate 缓存命中率（1000% 缓存池运行良好，通常不小于95%，小于95%存在全表扫描引起的LRU表污染）
> ~~~





