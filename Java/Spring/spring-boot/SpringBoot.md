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
  > ApplicationEventPublisher：事件发布器
  >
  > - 事件发布与监听主要用于实现组件之间的解耦
  >
  > ApplicationContext：实例化配置Bean，Bean的装配，提供Bean的生命周期管理，提供事件发布和监听
  >
  > GenericApplicationContext：实现注解注入
  >
  >  
  >
  > 参数配置
  >
  > - PropertyResolver：属性解析器
  > - Enviroment：应用变量配置器
  >
  >  
  >
  > Bean的定义
  >
  > - BeanDefinition：
  >   1. Bean类信息
  >   2. Bean属性（作用域，描述信息，是否默认bean）
  >   3. Bean的行为（懒加载，自动注入，创建方式和销毁）
  >   4. Bean的依赖关系（子父级关系，依赖关系）
  >   5. Bean的配置属性（构造方法，属性变量值）
  > - BeanDefinitionRegistry：注册中心，存放IOC容器中所有的Bean信息
  > - Bean的处理器
  >   1. BeanPostProcessor：bean对象初始化前后进行自定义逻辑处理
  >   2. BeanFactoryPostProcessor：BeanDefinition注入到regisory中进行逻辑处理
  >
  > 

