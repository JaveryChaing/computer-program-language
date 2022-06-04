## JavaSE

- #### 容器

  > <img src="img/image-20220601001657543.png" alt="image-20220601001657543" style="zoom:50%;" /> 
  >
  > HashMap 基于散列表实现 通过构造器容量和负载因子调整容器性能
  >
  > > HashMap 的性能因子
  > >
  > > - 容量：表中桶位数
  > > - 初始容量：创建表的容量
  > > - 尺寸：实际存储的数据长度
  > > - 负载因子：尺寸/容量 （负载因子较小产生hash冲突概率低），实际负载因子大于规定负载因子将进行扩容（再哈希）
  >
  > LinkeHashMap 以插入时顺序排列元素（最近最少使用次序），迭代访问时性能优于HashMap
  >
  > TreeMap 元素实现Comparable接口自动排序存在supMap()返回子树
  >
  > ConcurrentHashMap 线程安全Map
  >
  > WeakHashMap 弱键映射，允许释放映射所指对象
  >
  > IdentityHashMap 使用 == 代替equals()进行散列映射
  >
  > ![image-20220603232657324](img/image.png)
  >
  > // 只读容器
  >
  > Collections.unmodifiableCollection() 

- #### 持有引用

  > **Java引用机制**
  >
  > *在内存不足情况下 实现不需要的资源自动释放回收内存，GC*
  >
  > **Java的引用java.lang.ref.Reference及其子类封装了一个对象Object referent，当referent的可达性发生变化的时候，java.lang.ref.Reference会被垃圾收集器GC做一些操作，例如通知、触发资源回收等。**
  >
  > **当GC发现java.lang.ref.Reference封装的referent的可达性发生变化时，垃圾收集器会clear the reference（实际上就是referent = null，唯一的例外是FinalReference，FinalReference不会clear）并把对应的java.lang.ref.Reference加入关联的队列。**
  >
  >  
  >
  > **当JVM中垃圾收集时，GC发现referent为弱可达，那么GC将referent引用对象挂载到GC回收链表上，并发生一次线程通信，通知ReferenceHandler线程取走这些引用对象做后续处理，ReferenceHandler 判断时Cleaner实例，调用clean清理释放资资源，对于PhantomReference类型，需要放入ReferenceQueue队列，等待系统资源释放后删除。对于FinalReference，也几乎没有直接使用该类的，而都是直接使用其子类java.lang.ref.Finalizer，在队列中会发生第二次线程间通信，ReferenceHandler线程在将Reference对象入队列时，会通知FinalizerThread做进一步的处理——即调用FinalReference封装的referent重写的java.lang.Object的finalize()方法；**
  >
  > 
  >
  > - 强引用  
  >
  >   > 1. 包含Java堆内存
  >   > 2. 包含系统资源 （文件句柄，端口，网络连接）
  >
  > - 软引用（SoftReference，作用于内存敏感操作，堆内存不足时回收）
  >
  >   > ~~~java
  >   > Reference<User> reference = new SoftReference<User>(user);
  >   > reference.get()
  >   > ~~~
  >
  > - 弱引用（WeakReference，作用于不阻止key被回收的规范化映射，GC后回收)
  >
  >   > ~~~java
  >   > Reference<User> reference = new WeakReference<User>(user);
  >   > reference.get()
  >   > ~~~
  >
  > - 虚引用(PhantomReference，处理事后清理操作)
  >
  >   > ~~~java
  >   > ReferenceQueue<User> queue = new ReferenceQueue<User>();
  >   > Reference<User> reference = new PhantomReference<User>(new User(),queue);
  >   > ~~~
  >
  > - 兜底引用（FinalReference）
  >
  >   > TODO
  
- #### 注解(元数据)

  > ![image-20220604024039265](img/image-20220604024039265.png) 
  >
  > 
  >
  > **apt工具**（注解处理器）
  >
  > *在**代码编译时期**对注解进行处理 @Data 并生成Java文件，减少手动输入代码过程*
  >
  > 

