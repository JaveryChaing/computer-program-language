## **SpringJpa**

> **Repository接口**
>
> - Repository
> - CrudRepository
> - PagingAndSortRepository
> - QueryByExampleExcutor
> - JapRepository
> - JapSpecificationExecutor
> - QueryDslPredicateExcutor
>
> **Repository实现类**
>
> - SimpleJpaRepository
> - QueryDslJpaRepository
>
> <img src="img\image-20230309151734597.png" alt="image-20230309151734597" style="zoom:80%;" /> 
>
> **JPA 配置**
>
> | 属性                                               | 描述                                                         | 默认值                                          |
> | -------------------------------------------------- | ------------------------------------------------------------ | ----------------------------------------------- |
> | spring.jpa.database                                | 要操作的目标数据库，默认自动检测Database枚举                 | Database枚举                                    |
> | spring.jpa.database-platform                       | 要操作的目标数据库的名称，默认情况下是自动检测的             |                                                 |
> | spring.jpa.defer-datasource-initialization         | datasource初始化延迟                                         | false                                           |
> | spring.jpa.generate-ddl                            | 启动时是否初始化数据库schema                                 | false                                           |
> | spring.jpa.show-sql                                | 是否启用SQL语句日志记录                                      | false                                           |
> | spring.jpa.mapping-resources                       | 资源映射（一对多XML映射）                                    |                                                 |
> | spring.jpa.open-in-view                            | `OpenEntityManagerInViewInterceptor`注册,将`JPA EntityManager`绑定到线程，用于整个请求处理 | true                                            |
> | spring.jpa.properties                              | JPA提供程序上设置的其他本地属性                              |                                                 |
> | spring.data.jpa.repositories.enabled               | 是否启用JPA Repository                                       | true                                            |
> | spring.data.jpa.repositories.bootstrap-mode        | `JPA Repository`的引导模式<br />Default：Repository在容器启动过程中初始化（实体多时耗时长）<br />LAZY：Bean调用时初始化<br />DEFERRED：一般延迟加载 | DEFAULT(默认)<br />DEFERRED<br />LAZY           |
> | spring.jpa.hibernate.ddl-auto                      | DDL模式创建方式<br />create：删除后依据实体新增表（数据丢失）<br />create-drop ：会话关闭删除表（同上)<br />update 会根据 Mode 类自动更新表结构<br />validate 检查数据库中的表与java实体类是否匹配。如果不匹配，则运行失败 | create<br/>create-drop<br/>update<br />validate |
> | spring.jpa.hibernate.naming.implicit-strategy      | 全限定名的隐式命名策略                                       |                                                 |
> | spring.jpa.hibernate.naming.physical-strategy      | 物理命名策略的完全限定名                                     |                                                 |
> | spring.jpa.hibernate.use-new-id-generator-mappings | 是否使用Hibernate更新的                                      | true                                            |
>
> **JPA查询方法构造**
>
> | 关键字                            | 案例                                                        | JPQL                                                         |
> | --------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------ |
> | Distinct                          | findDistinctByLastnameAndFirstname                          | select distinct … where x.lastname = ?1 and x.firstname = ?2 |
> | Is`, `Equals                      | findByFirstname`,`findByFirstnameIs`,`findByFirstnameEquals | where x.firstname = ?1                                       |
> | Between                           | findByStartDateBetween                                      | where x.startDate between ?1 and ?2                          |
> | LessThan、LessThanEqual           | findByAgeLessThan                                           | where x.age < ?1<br />where x.age <= ?1                      |
> | GreaterThan<br />GreaterThanEqual | findByAgeGreaterThanEqual                                   | … where x.age >= ?1<br />where x.age > ?1                    |
> | After，Before                     | <   >                                                       |                                                              |
> | IsNull`, `Null                    | findByAge(Is)Null                                           | … where x.age is null<br /> where x.age not null             |
> | Like ，NotLike                    | findByFirstnameLike<br />findByFirstnameNotLike             | where x.firstname like ?1<br /> where x.firstname not like ?1 |
> | `StartingWith`                    | `findByFirstnameStartingWith`                               | `… where x.firstname like ?1` (parameter bound with appended `%`) |
> | `EndingWith`                      | `findByFirstnameEndingWith`                                 | `… where x.firstname like ?1` (parameter bound with prepended `%`) |
> | `Containing`                      | `findByFirstnameContaining`                                 | `… where x.firstname like ?1` (parameter bound wrapped in `%`) |
> | `OrderBy`                         | `findByAgeOrderByLastnameDesc`                              | `… where x.age = ?1 order by x.lastname desc`                |
> | `Not`                             | `findByLastnameNot`                                         | `… where x.lastname <> ?1`                                   |
> | `In`                              | `findByAgeIn(Collection<Age> ages)`                         | `… where x.age in ?1`                                        |
> | `NotIn`                           | `findByAgeNotIn(Collection<Age> ages)`                      | `… where x.age not in ?1`                                    |
> | `True`                            | `findByActiveTrue()`                                        | `… where x.active = true`                                    |
> | `False`                           | `findByActiveFalse()`                                       | `… where x.active = false`                                   |
> | `IgnoreCase`                      | `findByFirstnameIgnoreCase`                                 | `… where UPPER(x.firstname) = UPPER(?1)`                     |
>
> 

