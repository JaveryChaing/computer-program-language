## Beego_ORM

~~~go
go get github.com/astaxie/beego/orm
// 数据库配置
orm.RegisterDataBase("default", "mysql", "username:password@tcp(127.0.0.1:3306)/db_name?
                     charset=utf8", 30)
// 连接多个数据库
orm.RegisterDataBase("db1", "mysql", "root:root@/orm_db2?charset=utf8")
orm.RegisterDataBase("db2", "sqlite3", "data.db")
// 映射模型 
orm.RegisterModel(new(User), new(Post), new(Profile), new(Tag))
// orm 实例 NewOrm 创建一个新连接
o := orm.NewOrm()
o.Using("default") 
// 连接池管理
orm.NewOrmWithDB(driverName, aliasName, db)
// 获取连接池ORM
db, err := orm.GetDB()
// ORM CRUD
orm.Read(&user)
// ORM ReadOrCreate
orm.Read(&user,"FileName")
// ORM Insert  InsertMulti   Update Delete
orm.Insert InsertMulti Update Delete

// QuerySeter 高级查询
qs := o.QueryTable("user") 
qs = o.QueryTable(user)
qs.Filter("expr",value)
// qs expr  表达式
__ 间隔符  profile__age__gt 表示  WHERE profile.age > 18
name__iexact   //  WHERE name LIKE 'slene' name 大小写不敏感
name__contains // WHERE name LIKE BINARY '%slene%'  大小写敏感
name__icontains // WHERE name LIKE '%slene%' 大小写不敏感
name__startswith //  WHERE name LIKE BINARY 'slene%'  大小写敏感
name__istartswith //  WHERE name LIKE 'slene%'  大小写不敏感
name__endswith //  WHERE name LIKE BINARY '%slene'
profile__isnull // WHERE profile_id IS NULL 

age__in //  WHERE age IN (17, 18, 19, 20)


~~~

#### **QuerySeter提供方法**

>- Filter(string, …interface{}) QuerySeter
>- Exclude(string, …interface{}) QuerySeter
>- SetCond(*Condition) QuerySeter
>- Limit(int, …int64) QuerySeter
>- Offset(int64) QuerySeter
>- GroupBy(…string) QuerySeter
>  -OrderBy(…string) QuerySeter
>- Distinct() QuerySeter
>- RelatedSel(…interface{}) QuerySeter
>- Count() (int64, error)
>- Exist() bool
>- Update(Params) (int64, error)
>- Delete() (int64, error)
>- PrepareInsert() (Inserter, error)
>- All(interface{}, …string) (int64, error)
>- One(interface{}, …string) error
>- Values(*[\]Params, …string) (int64, error)
>- ValuesList(*[\]ParamsList, …string) (int64, error)]*
>- *ValuesFlat(*ParamsList, string) (int64, error)]

#### **使用原生SQL查询**

> ```go
> ids := []int{1, 2, 3}
> p.Raw("SELECT name FROM user WHERE id IN (?, ?, ?)", ids)
> ```
>
> - Exec() (sql.Result, error)
> - QueryRow(…interface{}) error
> - QueryRows(…interface{}) (int64, error)
> - SetArgs(…interface{}) RawSeter  单条SQL重复利用
> - Values(*[]Params, …string) (int64, error)   key => value 数据类型
> - ValuesList(*[]ParamsList, …string) (int64, error) 返回slice
> - ValuesFlat(*ParamsList, string) (int64, error)  返回单一字段的平铺 slice 数据
> - RowsToMap(*Params, string, string) (int64, error)
> - RowsToStruct(interface{}, string, string) (int64, error)
> - Prepare() (RawPreparer, error) 用于一次 prepare 多次 exec，以提高批量执行的速度。

#### **QueryBuilder构造器查询**

> ~~~go
> qb, _ := orm.NewQueryBuilder("mysql")
> qb.Select("user.name",
>     "profile.age").
>     From("user").
>     InnerJoin("profile").On("user.id_user = profile.fk_user").
>     Where("age > ?").
>     OrderBy("name").Desc().
>     Limit(10).Offset(0)
> // 导出 SQL 语句
> sql := qb.String()
> o := orm.NewOrm()
> o.Raw(sql, 20).QueryRows(&users)
> ~~~

#### **事务处理**

> ~~~go
> err := o.Begin()
> o.Rollback()
>  o.Commit()
> ~~~

#### **模型定义**

> 表名转换
>
> ```go
> AuthUser -> auth_user
> Auth_User -> auth__user
> DB_AuthUser -> d_b__auth_user
> // 自定义表名
> func (u *User) TableName() string {
>     return "auth_user"
> }
> // 自定义索引
> func (u *User) TableIndex() [][]string {
>     return [][]string{
>         []string{"Id", "Name"},
>     }
> }
> ```
