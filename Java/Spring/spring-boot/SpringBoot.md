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
  > - @EnableAutoConfiguration：加载在自定义配置之后，通过spring.factories完成配置
  >
  > 
  >
  > SpringWevMvc的自动装配
  >
  > - WebMvcAutoConfiguration：负责加载MVC相关的组件
  >   1. HttpMessageConverter：处理HTTP请求和响应消息的转换器，它负责将Java对象和HTTP消息之间进行相互转换
  >   2. configureAsyncSupport：异步支持
  >   3. defaultViewResolver：视图解析器
  >   4. LocaleResolver：处理请求中Accept- Language参数与LocaleChangeInterceptor使用
  >   5. RequestContextHolder：封装HttpServletRequest和Response对象，使其调用方在任意位置获取
  >   6. handlerMapping：uri映射处理器
  >   7. handlerAdapter：执行匹配url的handler逻辑
  > - ServletWebServerFactoryAutoConfiguration：配置Servlet类型的Web服务器工厂（自动化配置tomcat，Jetty，Undertow等web容器）
  > - EmbeddedTomcat：Tomcat的Bean配置
  > - DispatcherServlet：前端控制器，请求分发和处理
  >
  
- #### **IOC容器**

  > BeanFactory：IOC容器的顶级抽象，定义最基础的Bean对象管理
  >
  > 

