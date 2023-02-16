## GarbageFirst收集器

- **GarbageFirst 设计**

  > 分区：分区空间为2的幂（1~32MB)，在JVM运行期间，所有分区大小一样且不变
  >
  > Rset：关联记忆集合，记录跟踪其他**分区内引用**（引用指针）避免整个堆进行扫描
  >
  > 分区类型：
  >
  > 1. 可用分区
  > 2. eden
  > 3. survivor
  > 4. old（默认缺省值堆45%  -XX:initiatingHeapOccupancyPercent 控制）
  > 5. 超大对象空间（对象大小超过分区的50%，开辟连续的分区进行存储）
  >
  > <img src="img\image-20230208160331117.png" alt="image-20230208160331117" style="zoom: 50%;" />  
  >
  >  
  >
  > **G1并发过程**
  >
  > 1. 初始标记：STW后，收起Eden，Survivor根对象
  > 2. 并发根分区扫描：Java线程允许执行，在下一次GC之前必须完成所有引用对象扫描
  > 3. 并发标记：
  > 4. 重新标记及清除 STW后，重启标记多线程环境中漏扫的对象
  >
  > 



  

