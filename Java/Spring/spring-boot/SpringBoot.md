## SpringBoot

- ### 自动装配

  > 手动装配模式：
  >
  > 1. @configuation 与 @bean
  > 2. @Component 与 @ComponeScan
  > 3. XML配置
  >
  > @Component与@Bean装配区别：Component只对类装配（默认无参构造函数创建bean）。Bean方法级别的注解，实例化时可以设置属性，注入其他依赖，并且可以在方法内部编写复杂的初始化逻辑或依赖其他@Bean方法来构建Bean间的依赖关系。
  >
  > **自动装配要素**
  >
  > 1. ImportSelector：根据运行时条件动态地决定导入哪些类（通常是配置类，模块装配）。
  > 2. 基于@Profile，@Conditional，@ConditionOnxxx条件装配
  > 3. spring.factories中SPI机制：通过非class文件定义接口
  >
  >  
  >
  > Springboot装配机制
  >
  > - @Component：扫描指定目录下的类，并实例化到IOC容器
  > - @EnableAut
