## Gin

~~~go
go get -u github.com/gin-gonic/gin
import “github.com/gin-gonic/gin”
import “net/http”
~~~

- #### **基本路由**

  > ~~~go
  >   // gin 路由使用
  >   r := gin.Default()
  >   r.GET("/", func(c *gin.Context) {
  >         c.String(http.StatusOK, "hello word")
  >     })
  >   r.POST("/xxxpost",getting)
  >   r.PUT("/xxxput")
  >   r.Run(":8000")
  > // API参数 Path 参数获取  /user/:name/*action
  > c.Param("key")
  > //URL参数获取
  >  name := c.DefaultQuery("name", "枯藤")
  >          c.Query()
  > // 表单参数获取
  >  types := c.DefaultPostForm("type", "post")
  >   username := c.PostForm("username")
  > //上传文件
  > //限制上传最大尺寸
  > r.MaxMultipartMemory = 8 << 20
  >  c.FormFile("file")
  >   c.SaveUploadedFile(file, file.Filename)
  >  form, err := c.MultipartForm()
  > // 路由组 管理相同的URL
  >  v1 := r.Group("/v1")
  > {
  >       v1.GET("/login", login)
  >       v1.GET("submit", submit)
  >    }
  > // JSON 数据绑定与解析
  > 
  > 
  > ~~~
  >
  > 
