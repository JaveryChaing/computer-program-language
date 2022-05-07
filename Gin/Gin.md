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
  // 实现热升级
  go get -u github.com/fvbock/endless
  // swagger 工具
  go get -u github.com/swaggo/swag/cmd/swag
  // gin swagger 
  go get -u github.com/swaggo/gin-swagger
  go get -u github.com/swaggo/gin-swagger/swaggerFiles
  // Dockerfile 
  // golang 环境 可以使用 scratch 代替
  FROM golang:latest
  // 工作目录（后续可以进入镜像更改）
  WORKDIR $GOPATH/src/github.com/EDDYCJY/go-gin-example
  // 将当前项目拷贝到镜像中位置
  COPY . $GOPATH/src/github.com/EDDYCJY/go-gin-example
  // 执行命令
  RUN go build .
  // 指令是声明运行时容器提供服务端口，这只是一个声明，在运行时并不会因为这个声明应用就会开启这个端口的服务，
  EXPOSE 8000
  // 镜像启动命令 及参数
  ENTRYPOINT ["./go-gin-example"]
  
  // gin 定时器
   go get -u github.com/robfig/cron
  
  // GO 依赖管理工具 dep
  go install github.com/golang/dep/cmd/dep@latest
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

