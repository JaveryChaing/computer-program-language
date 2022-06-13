## JavaSE

- #### 计算机基础

  > **计算机位数：** 32位计算机表示能同时处理$2^{32}-1$个电信号（子长32位的电路信号）
  >
  > **浮点数：**![image-20220611140534147](img/image-20220611140534147.png)
  >
  > - 符号位 （0正数，1负数）
  > - 阶码位 （存储指数，$E=e+(2^{n-1}-1)$ E 表示阶码，e表示指数真值，8位阶码的指数范围为[-126，127]）
  > - 有效数（存储有效数） 
  
- #### **面向对象**

  > 面向对象编程（Object-Oriented Programming) 
  >
  >  *主要目标*
  >
  > - 可维护
  > - 可重用
  > - 可扩展
  >
  > ---
  >
  > *面对对象特性*
  >
  > - 封装 ，继承，多态，（抽象）
  >
  > ---
  >
  > - is - a ：LSP（里氏替换原则）父类引用直接使用子类引用代替，并可以编译正确执行，则使用继承关系 （extends）
  >
  > - can-do：(implement）
  > - contains - a：类是成员变量（组合）**组合成员与类生命周期一致**
  > - has - a ：类是成员变量（聚合） 聚合成员可以复用在其他类上
  > - use - a ：依赖（使用）  （通常作为入参使用）
  >
  > ---
  >
  > **序列化**
  >
  > *内存中数据对象进行二进制流转换进行数据持久化和网络传输*
  >
  > - Serializable  序列化
  > - Hessian 序列化
  > - JSON 数据交互格式

- #### **容器**

  > <img src="img/image-20220601001657543.png" alt="image-20220601001657543" style="zoom:50%;" /> 
  >
  > <img src="img/image-20220611155715269.png" alt="image-20220611155715269" style="zoom:50%;" /> 
  >
  > **数据结构**
  >
  > - 线性
  >
  >   > ArrayList
  >   >
  >   > > *以无参创建ArrayList时，实际上初始化一个空数组，当添加元素时才分配容（默认数组容量为10），每次扩容以源数组长度1.5倍进行扩容*
  >   > >
  >   > > ~~~java
  >   > >  private Object[] grow(int minCapacity) {
  >   > >         int oldCapacity = elementData.length;
  >   > >         if (oldCapacity > 0 || elementData != DEFAULTCAPACITY_EMPTY_ELEMENTDATA) {
  >   > >            // elementData 长度不足 扩充1.5倍
  >   > >             int newCapacity = ArraysSupport.newLength(oldCapacity,
  >   > >                     minCapacity - oldCapacity, /* minimum growth */
  >   > >                     oldCapacity >> 1           /* preferred growth */);
  >   > >             return elementData = Arrays.copyOf(elementData, newCapacity);
  >   > >         } else {
  >   > >             return elementData = new Object[Math.max(DEFAULT_CAPACITY, minCapacity)];
  >   > >         }
  >   > >     }
  >   > > // 需要目标数组，将原数组拷贝到你自己定义的数组里，而且可以选择拷贝的起点和长度以及放入新数组中的位置
  >   > > System.arraycopy()
  >   > >  //系统自动在内部新建一个数组，并返回该数组。底层调用System.arraycopy()
  >   > > Arrays.copyOf()
  >   > > ~~~
  >   >
  >   > LinkedList(实现List，Queue接口)
  >   >
  >   > > ~~~java
  >   > > // 双向链表结构
  >   > > private static class Node<E> {
  >   > >         E item;
  >   > >         Node<E> next;
  >   > >         Node<E> prev;
  >   > >         Node(Node<E> prev, E element, Node<E> next) {
  >   > >             this.item = element;
  >   > >             this.next = next;
  >   > >             this.prev = prev;
  >   > >         }
  >   > >     }
  >   > > 
  >   > > ~~~
  >   >
  >   > Queue
  >
  > - 树
  >
  >   > **二叉排序树(二叉搜索树)**
  >   >
  >   > - 所有子树的根节点的左子节点小于根节点
  >   > - 所有子树的根节点的右子节点大于根节点
  >   > - 二叉排序树删除
  >   >   - 叶子节点直接删除
  >   >   - 删除节点只存在左子树或右子树直接使用子树代替删除节点
  >   >   - 删除节点同时存在左子树和右子树
  >   >     - 删除节点左子树最大节点代替删除节点
  >   >     - 删除节点右子树最小节点代替删除节点
  >   >
  >   > **平衡二叉树(AVL)**  
  >   >
  >   > - **二叉排序树**
  >   > - **任意节点的子树高度差都小于或等于1**
  >   > - 删除或新增操时
  >   >   - 左旋：当右边子树高度大于左边时，使用某个节点为中心，将它沉入当前左节点位置，而让当前右子节点作为新树的根节点
  >   >   - 右旋：当左边子树高度大于右边时，使用某个节点为中心，将它沉入当前右节点位置，而让当前左子节点作为新树的根节点
  >   >   - <img src="img/image-20220612163454910.png" alt="image-20220612163454910" style="zoom:33%;" /> 
  >   >   - <img src="img/image-20220612163513094.png" alt="image-20220612163513094" style="zoom:33%;" /> 
  >   >
  >   > ---
  >   >
  >   > **多路查找树（B树）**
  >   >
  >   > - 2-3树  每个节点都具有2个字节点或3个子节点  **且左子树小于中子树小于右子树**
  >   >   - 任意节点到它的所有子节点深度相同，**绝对平衡树**
  >   >   - **中子树元素值位于父节点两个元素之间**
  >   >   - ![image-20220613161823984](img\image-20220613161823984.png) 
  >   >
  >   > ---
  >   >
  >   > **红黑树**（2-3-4树）   新增，查找，删除最差时间复杂度为$O(log_n)$
  >   >
  >   > - **二叉排序树**
  >   > - 节点具有红黑属性，黑色节点：对应2-3-4中子节点为2的节点 其他为红色节点
  >   > - **根节点和叶子节点都是黑色**
  >   > - 一条路径上不能存在相邻红色节点
  >   > - 根节点到叶子节点所有路径包含相同数目的黑色节点
  >   >
  >   > *红黑树的平衡性不如AVL树，维持一种大致上的平衡，可能平均查找次数不如AVL树（取决于树的高度），但在删除操作时，红黑树最多三次旋转后恢复平衡，而AVL可能需要$O(log_N)$次旋转才能恢复平衡，所以在对删除，插入操作频繁时，红黑树整体性能高于AVL树*
  >
  > - 哈希
  >
  >   > Map
  >   >
  >   > > HashMap 
  >   > >
  >   > > - 尺寸（size，实际存储Node个数）
  >   > >
  >   > >   - CAPACITY (桶)  数组实际长度   CAPACITY < size
  >   > >
  >   > > - 阈值（threshold，超过阈值扩容，计算方式 **capacity** * **loadFactor**）
  >   > >
  >   > > - 负载因子（loadFactor，**数组扩容系数**）
  >   > >
  >   > > - **数组初始容量**（DEFAULT_INITIAL_CAPACITY，默认16，必须是2的N次幂)
  >   > >
  >   > > - 数组最大容量（MAXIMUM_CAPACITY，默认$2^{30}$)
  >   > >
  >   > > - 链表转红黑树阈值（MIN_TREEIFY_CAPACITY，默认64）
  >   > >
  >   > > - 链表转红黑树阈值(TREEIFY_THRESHOLD，默认为8)
  >   > >
  >   > >   - **当链表长度超过8（存在Node节点再哈希超过8次）且size超过64才转换红黑树**
  >   > >
  >   > > - modCount 记入修改次数（防止多线程修改HashMap，抛出异常）
  >   > >
  >   > > - 扩容机制
  >   > >
  >   > >   - 空参构造函数在第一次put时初始化数组长度（16）
  >   > >   - 有参构造函数，resize()计算阈值，tableSizeFor()调整初始容量为2的n次幂
  >   > >   - 每次扩容，容量，阈值为原来的2倍
  >   > >
  >   > > - 结构（数组+链表+红黑树）
  >   > >
  >   > >   - <img src="img/image-20220611232504538.png" alt="image-20220611232504538" style="zoom:30%;" />  
  >   > >
  >   > >   - ~~~java
  >   > >     // 内部Node结构 
  >   > >     static class Node<K,V> implements Map.Entry<K,V> {
  >   > >             final int hash;
  >   > >             final K key;
  >   > >             V value;
  >   > >             Node<K,V> next;
  >   > >             Node(int hash, K key, V value, Node<K,V> next) {
  >   > >                 this.hash = hash;
  >   > >                 this.key = key;
  >   > >                 this.value = value;
  >   > >                 this.next = next;
  >   > >             }
  >   > >             
  >   > >             public final K getKey()        { return key; }
  >   > >             public final V getValue()      { return value; }
  >   > >             public final String toString() { return key + "=" + value; }
  >   > >             
  >   > >             public final int hashCode() {
  >   > >                 return Objects.hashCode(key) ^ Objects.hashCode(value);
  >   > >             }
  >   > >             
  >   > >             public final V setValue(V newValue) {
  >   > >                 V oldValue = value;
  >   > >                 value = newValue;
  >   > >                 return oldValue;
  >   > >             }
  >   > >             public final boolean equals(Object o) {
  >   > >                 if (o == this)
  >   > >                     return true;
  >   > >                 return o instanceof Map.Entry<?, ?> e
  >   > >                         && Objects.equals(key, e.getKey())
  >   > >                         && Objects.equals(value, e.getValue());
  >   > >             }
  >   > >         }
  >   > >     // put 元素过程
  >   > >     //onlyIfAbsent – 如果为 true，则不更改现有值 
  >   > >     // evict – 如果为 false，则表处于创建模式。
  >   > >     final V putVal(int hash, K key, V value, boolean onlyIfAbsent,
  >   > >                    boolean evict) {
  >   > >         Node<K,V>[] tab; Node<K,V> p; int n, i;
  >   > >         // 1.先判断此时的数组是否为空，如果为空则进行resize操作下
  >   > >         if ((tab = table) == null || (n = tab.length) == 0)
  >   > >             n = (tab = resize()).length;
  >   > >         // 2.以hash索引数组的长度-1与key的hash值进行与运算，得出在数组中的索引，如果索引指定的位置
  >   > >         // 为空，则代表可以插入，直接插入一个新的node
  >   > >         if ((p = tab[i = (n - 1) & hash]) == null)
  >   > >             tab[i] = newNode(hash, key, value, null);
  >   > >         else {
  >   > >             Node<K,V> e; K k;
  >   > >             // 3.判断当前key是否存在，如果是则进行替换操作
  >   > >             if (p.hash == hash &&
  >   > >                 ((k = p.key) == key || (key != null && key.equals(k))))
  >   > >                 e = p;
  >   > >             // 4.如果key不存在，则判断当前节点是否为树类型，如果是树类型的话，
  >   > >             // 则按照树的操作去追加新节点内容
  >   > >             else if (p instanceof TreeNode)
  >   > >                 e = ((TreeNode<K,V>)p).putTreeVal(this, tab, hash, key, value);
  >   > >             // 5.如果出现hash冲突的节点不是树类型，则说明当前发生的碰撞在链表里面，
  >   > >             // 则这个时候就进入循环处理逻辑
  >   > >             else {
  >   > >                 for (int binCount = 0; ; ++binCount) {
  >   > >                     // 6.先判断被碰撞的节点的下一个节点是否为空
  >   > >                     if ((e = p.next) == null) {
  >   > >                         // 如果为空则将新节点放到被碰撞节点的下一个节点
  >   > >                         p.next = newNode(hash, key, value, null);
  >   > >                         // 7.作为后继节点之后判断当前链表长度是否超过最大允许链表长度8，
  >   > >                         // 如果大于的话，则转为红黑树执行插入
  >   > >                         if (binCount >= TREEIFY_THRESHOLD - 1) // -1 for 1st
  >   > >                         // 8.如果map的索引表为空或者当前索引表长度还小于64（最大转红黑树的索引数组表长度），
  >   > >                         // 那么进行resize操作就行了；否则，如果被碰撞节点不为空，
  >   > >                         // 那么就顺着被碰撞节点这条树往后新增该新节点
  >   > >                             treeifyBin(tab, hash);
  >   > >                         break;
  >   > >                     }
  >   > >                     if (e.hash == hash &&
  >   > >                         ((k = e.key) == key || (key != null && key.equals(k))))
  >   > >                         break;
  >   > >                     p = e;
  >   > >                 }
  >   > >             }
  >   > >             // 如果替换成功，返回老的value
  >   > >             if (e != null) { // existing mapping for key
  >   > >                 V oldValue = e.value;
  >   > >                 if (!onlyIfAbsent || oldValue == null)
  >   > >                     e.value = value;
  >   > >                 afterNodeAccess(e);
  >   > >                 return oldValue;
  >   > >             }
  >   > >         }
  >   > >         ++modCount;
  >   > >         if (++size > threshold)
  >   > >             resize();
  >   > >         afterNodeInsertion(evict);
  >   > >         return null;
  >   > >     }
  >   > >             
  >   > >     ~~~
  >   >
  >   > ConcurrentHashMap
  >   >
  >   > ![image-20220603232657324](img/image.png)
  >   >
  >   > ---
  >   >
  >   > Set
  >   >
  >   > > LinkeHashMap 以插入时顺序排列元素（最近最少使用次序），迭代访问时性能优于HashMap
  >   >
  >   > TreeMap（基于红黑树实现，线程不安全）
  >   >
  >   > > ![image-20220613165034503](img\image-20220613165034503.png) 
  >   > >
  >   > > *sortedMap ：实现key有序不重复，支持队列方式获取元素*
  >   > >
  >   > > *NavigableMap： 根据指定的搜索条件返回最匹配的Key-Value元素（key属性查询）*
  >   > >
  >   > > TreeMap依靠Comparable或Comparator 实现Key的去重复
  >   > >
  >   > >  ~~~java
  >   > >  // TreeMap  entry 
  >   > >  static final class Entry<K,V> implements Map.Entry<K,V> {
  >   > >          K key;
  >   > >          V value;
  >   > >          Entry<K,V> left;
  >   > >          Entry<K,V> right;
  >   > >          Entry<K,V> parent;
  >   > >         // 红黑属性
  >   > >          boolean color = BLACK;
  >   > >  
  >   > >          /**
  >   > >           * Make a new cell with given key, value, and parent, and with
  >   > >           * {@code null} child links, and BLACK color.
  >   > >           */
  >   > >          Entry(K key, V value, Entry<K,V> parent) {
  >   > >              this.key = key;
  >   > >              this.value = value;
  >   > >              this.parent = parent;
  >   > >          }
  >   > >  
  >   > >          /**
  >   > >           * Returns the key.
  >   > >           *
  >   > >           * @return the key
  >   > >           */
  >   > >          public K getKey() {
  >   > >              return key;
  >   > >          }
  >   > >  
  >   > >          /**
  >   > >           * Returns the value associated with the key.
  >   > >           *
  >   > >           * @return the value associated with the key
  >   > >           */
  >   > >          public V getValue() {
  >   > >              return value;
  >   > >          }
  >   > >  
  >   > >          /**
  >   > >           * Replaces the value currently associated with the key with the given
  >   > >           * value.
  >   > >           *
  >   > >           * @return the value associated with the key before this method was
  >   > >           *         called
  >   > >           */
  >   > >          public V setValue(V value) {
  >   > >              V oldValue = this.value;
  >   > >              this.value = value;
  >   > >              return oldValue;
  >   > >          }
  >   > >  
  >   > >          public boolean equals(Object o) {
  >   > >              return o instanceof Map.Entry<?, ?> e
  >   > >                      && valEquals(key,e.getKey())
  >   > >                      && valEquals(value,e.getValue());
  >   > >          }
  >   > >  
  >   > >          public int hashCode() {
  >   > >              int keyHash = (key==null ? 0 : key.hashCode());
  >   > >              int valueHash = (value==null ? 0 : value.hashCode());
  >   > >              return keyHash ^ valueHash;
  >   > >          }
  >   > >  
  >   > >          public String toString() {
  >   > >              return key + "=" + value;
  >   > >          }
  >   > >      }
  >   > >  ~~~
  >   > >
  >   > > ![image-20220613172100847](img\image-20220613172100847.png) 
  >   > >
  >   > > ![image-20220613172133612](img\image-20220613172133612.png) 
  >   > >
  >   > > **TODO 红黑树操作**
  >
  > - 图
  >
  > ---
  >
  > **集合与泛型**
  >
  > - List<?> ：可以接收任何类型集合的引用赋值，**不能添加任何元素**，可以remove和clean，一般用来作为参数接收外部集合或者返回一个不知道具体元素类型集合
  > - <? extends T>：可以赋值任何T及T子类集合，取出来的元素需要向上强转为T类型，**不能添加任何元素**
  > - <? super T>：可以**赋值任何T及T父类集合**，get()返回为Object类型需要向下转型
  >
  > ---
  >
  > **元素比较**
  >
  > - Comparable：与自己比较，
  > - Comparator：与其他元素比较，用于集合排序
  >
  > ---
  >
  > **fail-fast与fail-safe机制**
  >
  > *集合的提前检错机制，当多线程对同一个集合内容操作时抛出异常*
  >
  > fail-safe 机制：在安全副本上进行遍历，修改。
  >
  > ---
  >
  > **Copy-On-Write 机制**
  >
  > *Copy-On-Write机制实现并发容器读写分离实现，对比Collections.synchronizedCollection()，**Copy-On-Write写操作性能弱于synchronized***
  >
  > 
  >
  > **Collections.synchronized**  通过加锁控制并发
  >
  > <img src="img/image-20220612145115147.png" alt="image-20220612145115147" style="zoom:50%;" /> 
  >
  > **Copy-On-Write ** 复制一个新集合 ， 在新集合内添加或删除元素。待一切修改完成之后 ， 再将原集合的可|用指向新的集合
  >
  > 

- #### 注解(元数据)

  > ![image-20220604024039265](img/image-20220604024039265.png) 
  >
  > 
  >
  > **apt工具**（注解处理器）
  >
  > *在**代码编译时期**对注解进行处理 @Data 并生成Java文件，减少手动输入代码过程*
  
- #### 并发

  > - Thread.yield() 线程让步（将当前获取CPU执行权让给其他线程，该线程进入就绪态，**不会释放锁**）
  >
  > - Thread.sleep()  线程睡眠（将当前CPU执行权让给其他线程，该线程进入阻塞态，**不会释放锁**）
  >
  > - daemon 后台线程 （非后台线程执行完后，程序终止，后台线程终止）
  >
  > - Thread.join()  等待一段时间直到**其他线程完成后执行**（**执行线程被暂停执行其他线程**，不会释放线程锁）
  >
  > - Thread.interrupt() 终止当前执行的线程，（当前线程被阻塞或对其操作则抛出异常)
  >
  >   > 当抛出该异常或者调用Thread.interrupted()方法，则中断被复位
  >
  > ---
  >
  > **ExecutorService**
  >
  > - newCachedThreadPool  根据需要创建新线程，规定时间内存在空闲线程则使用该线程执行任务，无空闲线程则新建。长时间无执行任务会自动释放线程
  >- FixedThreadPool   创建固定数量的线程执行任务。线程执行异常则新建线程代替。当所有线程处于执行态，则新加入任务在队列中等待。线程池中线程不会自动回收。
  > - SingleThreadExecutor  线程数量为1的FixedThreadPool
  > 
  > ---
  >
  > **UncaughtException-Handler 线程异常处理器**
  >
  > [异常处理案例](https://gitee.com/miaomiaole/java_project/blob/master/src/main/java/org/example/concurrency/ExceptionThread.java)
  >
  > ---
  >
  > **共享资源竞争**（多个线程竞争资源）
  >
  > Java并发模式下使用**序列化访问共享资源**模式（给定时刻只允许一个任务访问共享资源）
  >
  > 
  >
  > 防止任务在共享资源上产生冲突的第二种方式是**消除变量的共享**----（本地线程变量）
  >
  > ---
  >
  > **线程之间协作**（多线程之间按顺序执行任务）
  >
  > - Object.wait()   释放锁等待（一般用在线程执行完任务后手动释放占用资源）
  >
  >   > wait() 在此期间暂停，直到使用notify方法和时间后进入就绪态
  >  >
  >   > notifyAll()与wait() 配合while 循环判断某个条件是否满足唤醒和挂起=> 实现线程之间协作
  > 
  > - Object.notifyAll() 
  >
  >   > 调用wait() 和notify()时，**当前线程必须拥有锁**
  >  >
  >   > ~~~java
  >   > synchronized(x){
  >   >   // 手动释放x对象锁
  >   >   x.notifyAll()
  >   >   x.wait()
  >   > }
  >   > ~~~
  > 
  > - Condition （多线程协调通信工具类）
  >
  >   > - await() 当前线程进入等待状态除非被通知或中断
  >  >
  >   > - singal() 唤醒在Condition上的线程（进入就绪态）
  > 
  > - 使用BlockingQueue队列协作处理
  >
  >   > [队列协作处理](https://gitee.com/miaomiaole/java_project/blob/master/src/main/java/org/example/concurrency/Toast.java)
  >  >
  >   > offer(E e，long timeout，TimeUnit unit) 满队等待timeout时间放弃或被中断
  >   >
  >   > put(E e) 满队阻塞当前入队线程，直到队列空闲或线程中断
  >   >
  >   > add(E e) 满队抛出异常
  >   >
  >   > take()
  >   >
  >   > poll(long timeout,TimeUnit unit)
  >   >
  >   > ArrayBlockingQueue：指定容量，在入队或出队并发高情况下使用
  >   >
  >   > LinkedBlockingQueue：入队出队并发高情况下使用（入队和出队不竞争Queue）
  > 
  > ---
  >
  > **java.util.concurrent 线程工具类**
  >
  > - CountDownLatch  设置等待线程数，当计数为0时往下执行 
  >
  >   >  - countDown() 表示当前线程已完成  计数减一
  >  >
  >   >    > 当某个线程中断（发生异常）将导致await() 线程一直阻塞，不能重试
  >   >
  >   >  - await() 被阻塞的线程 当计数为0时进入就绪态
  > 
  > - CyclicBarrier  所有的线程达到屏障点后执行下一个线程
  >
  >   > new CycliBarrier((int parties, Runnable barrierAction)
  >  >
  >   > parties ：屏障数
  >   >
  >   > barrierAction ：满足屏障数后执行下一个线程
  >   >
  >   > ---
  >   >
  >   > - await()表示当前线程达到屏障点被阻塞等待其他线程(执行完后await)
  >   > - rest() 重新执行
  >   > - isBloken() 判断线程是否被中断
  > 
  > CyclicBarrier：重点是多个线程，在任意一个线程没有完成，所有的线程都必须等待。
  >
  > CountDownLatch：多个线程等待
  >
  > 
  >
  >  **DelayQueue**  延迟队列
  >
  >  *对象只能在到期时间才能从队列中取走，队头对象延时时间最长*
  >
  > - 设置元素有效期，有效期过后出队执行（线程睡眠等待元素到期）
  >- 定时任务调度
  > - Leader，Follower模式 
  > 
  > 
  >
  >  **Semaphore** 信号量
  >
  > *计数信号量允许n个任务同时访问资源，许可证，限制线程执行的数量，*
  >
  > 当一个线程执行时先通过其方法进行获取许可操作，获取到许可的线程继续执行业务逻辑，当线程执行完成后进行释放许可操作，未获取达到许可的线程进行等待或者直接结束。
  >
  > -  acquire(int permits) 获取指定数量许可（阻塞等待其他线程释放许可）
  >
  > - `boolean tryAcquire(int permits, long timeout, TimeUnit unit)` 尝试获取指定的许可数 可指定等待时间
  >
  > - void release()
  >
  > 
  >
  >   **Exchanger** 用于线程通信
  
  



  

