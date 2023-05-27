## **Kettle**

> [Kettle下载地址](https://udomain.dl.sourceforge.net/project/pentaho/Pentaho%208.3/client-tools/pdi-ce-8.3.0.0-371.zip)
>
> ETL：Extract，Transform，Local（抽取，装换，装载）
>
> RDS(Raw Data Store)：原始数据存储
>
> TDS(Transformed Data Store)：转换后数据存储（实际仓库数据）
>
> Extract：
>
> 1. 全量抽取：（源库中所有有效数据）
> 2. 增量抽取：（某个特定事件点后数据，需要与原始数据对比）
> 3. 联机抽取：通过数据源或日志
> 4. 脱机抽取：通过数据备份文件或重做日志获取数据
> 5. **变化数据获取(CDC)：**通过触发器，日志，快照，时间戳实现
>
> Tramsform：
>
> 1. 数据字典转换
> 2. 去重
> 3. 排序
> 4. 行列转换
> 5. 关联查询
> 6. 数据验证
> 7. 预计算
>
> **Kettle组件**
>
> - **转换**(Tramsform)
>
>   1. 步骤
>
>   2. 跳
>
>   3. 并行
>
>   4. 数据行
>
>   5. 数据类型转换
>
> **作业（Job)**
>
> 包含多个子作业（转换）



