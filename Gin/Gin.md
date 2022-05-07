## Gin

> *Gin 是一个使用Go编写的HttpWeb框架，拥有极强的性能*

- #### 安装

  ~~~go
  // Gin 安装
  go get -u github.com/gin-gonic/gin
  // Govendor 工具
  go install github.com/kardianos/govendor@latest
  //使用govendor初始化项目 
  govendor init 
  // ini 文件读取模块
  github.com/go-ini/ini
  // beego 文件读取模块
  import _ "github.com/astaxie/beego/config/xml"
  // mysql 依赖驱动
  go get -u github.com/go-sql-driver/mysql
  // gorm ORM框架
  go get -u github.com/jinzhu/gorm
  // 表单校验
  go get -u github.com/astaxie/beego/validation
  // JWT 身份验证
  go get -u github.com/dgrijalva/jwt-go
  
  ~~~
  
- #### **gin 项目结构**

  >gin_project 
  >
  >​	--- conf
  >
  >​    --- middleware(中间件)
  >
  >​    --- models（数据库映射模型）
  >
  >​    --- pkg 第三方包（统一错误码，结构体，全局变量）
  >
  >​    --- routers 
  >
  >​    --- controllers（api）
  >
  >​    --- logs 日志文件
  >
  >​    --- main.go 

