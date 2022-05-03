## **BeeGo**

- **app.conf 配置**

  > **配置方式**
  >
  > 1. 可以通过INI文件，JSON文件，YAML文件，XML文件对项目进行配置项目参数
  >
  > 2. 通过beego.BConfig.[FileName] 配置（代码中设置）
  >
  > **读取配置**
  >
  > - beego.AppConfig.String("FileName") 读取文件内容
  >
  > - Set(key, val string) error
  >
  > - String(key string) string
  >
  > - Strings(key string) []string
  >
  > - Int(key string) (int, error)
  >
  > - Int64(key string) (int64, error)
  >
  > - Bool(key string) (bool, error)
  >
  > - Float(key string) (float64, error)
  >
  > - DefaultString(key string, defaultVal string) string
  >
  > - DefaultStrings(key string, defaultVal []string)
  >
  > - DefaultInt(key string, defaultVal int) int
  >
  > - DefaultInt64(key string, defaultVal int64) int64
  >
  > - DefaultBool(key string, defaultVal bool) bool
  >
  > - DefaultFloat(key string, defaultVal float64) float64
  >
  > - DIY(key string) (interface{}, error)
  >
  > - GetSection(section string) (map[string]string, error)
  >
  > - SaveConfigFile(filename string) error
  >
  > - section操作
  >
  >   > :: 获取组下面数据
  >   >
  >   > iniconf.String("demo::key2")
  >
  > **不同环境配置**
  >
  > ~~~ini
  > appname = beepkg
  > httpaddr = "127.0.0.1"
  > httpport = 9090
  > runmode ="dev"
  > autorender = false
  > recoverpanic = false
  > viewspath = "myview"
  > 
  > [dev]
  > httpport = 8080
  > [prod]
  > httpport = 8088
  > [test]
  > httpport = 8888
  > // 读取不同模式下配置参数的方法  beego.AppConfig.String(“dev::mysqluser”)
  > // 读取系统环境变量
  > runmode = "${ProRunMode||dev}"
  > ~~~
  >
  > **加载其他的配置文件**
  >
  > - beego.LoadAppConfig(configType，path)
  >
  > 
  >
  > **App 配置参数**
  >
  > - AppName 项目名称 
  >
  > - RunMode  运行模式 prod ,dev ,test  默认是dev 
  >
  > - RouterCaseSensitive 路由忽略大小写配置
  >
  > - ServerName  beego 服务器默认在请求的时候输出 server 为 beego
  >
  > - RecoverPanic  是否异常恢复，默认值为 true，即当应用出现异常的情况，通过 recover 恢复回来，而不会导致应用异常退出。
  >
  > - CopyRequestBody  是否允许在 HTTP 请求时，返回原始请求体数据字节，默认为 false （GET or HEAD or 上传文件请求除外）。
  >
  > - EnableGzip  是否开启 gzip 支持，默认为 false 不支持 gzip，一旦开启了 gzip，那么在模板输出的内容会进行 gzip 或者 zlib 压缩，根据用户的 Accept-Encoding 来判断。
  >
  >   > - Gzip允许用户自定义压缩级别、压缩长度阈值和针对请求类型压缩:
  >   >   1. 压缩级别, `gzipCompressLevel = 9`,取值为 1~9,如果不设置为 1(最快压缩)
  >   >   2. 压缩长度阈值, `gzipMinLength = 256`,当原始内容长度大于此阈值时才开启压缩,默认为 20B(ngnix默认长度)
  >   >   3. 请求类型, `includedMethods = get;post`,针对哪些请求类型进行压缩,默认只针对 GET 请求压缩
  >
  > - MaxMemory  文件上传默认内存缓存大小，默认值是 `1 << 26`(64M)
  >
  > - EnableErrorsShow  是否显示系统错误信息，默认为 true。
  >
  > - EnableErrorsRender  是否将错误信息进行渲染，默认值为 true，即出错会提示友好的出错页面
  >
  > ---
  >
  > **Web 配置**
  >
  > - AutoRender  是否模板自动渲染，默认值为 true
  > - EnableDocs  是否开启文档内置功能，默认是 false
  > - FlashName  Flash 数据设置时 Cookie 的名称，默认是 BEEGO_FLASH
  > - FlashSeperator  Flash 数据的分隔符，默认是 BEEGOFLASH
  > - DirectoryIndex  是否开启静态目录的列表显示，默认不显示目录，返回 403 错误。
  > - StaticDir  静态文件目录设置，默认是static
  > - StaticExtensionsToGzip  允许哪些后缀名的静态文件进行 gzip 压缩，默认支持 .css 和 .js
  > - ViewsPath  模板路径，默认值是 views。
  > - EnableXSRF  是否开启 XSRF，默认为 false，不开启。
  > - XSRFKEY  XSRF 的 key 信息，默认值是 beegoxsrf。 EnableXSRF＝true 才有效
  > - XSRFExpire  XSRF 过期时间，默认值是 0，不过期。
  >
  > ---
  >
  > **监听配置**
  >
  > - Graceful 是否开启热升级，默认是 false，关闭热升级。
  > - ServerTimeOut   设置 HTTP 的超时时间，默认是 0，不超时。
  > - ListenTCP4  监听本地网络地址类型，默认是TCP6，可以通过设置为true设置为TCP4。
  > - EnableHTTP  是否启用 HTTP 监听，默认是 true。
  > - HTTPAddr  应用监听地址，默认为空，监听所有的网卡 IP。
  > - HTTPPort  应用监听端口，默认为 8080。
  > - EnableHTTPS  是否启用 HTTPS，默认是 false 关闭。当需要启用时，先设置 EnableHTTPS = true，并设置 `HTTPSCertFile` 和 `HTTPSKeyFile`
  > - HTTPSAddr  应用监听地址，默认为空，监听所有的网卡 IP。
  > - HTTPSPort 应用监听端口，默认为 10443
  > - HTTPSCertFile  开启 HTTPS 后，ssl 证书路径，默认为空。
  > - HTTPSKeyFile  开启 HTTPS 之后，SSL 证书 keyfile 的路径。
  > - EnableAdmin  是否开启进程内监控模块，默认 false 关闭。
  > - AdminAddr  监控程序监听的地址，默认值是 localhost 。
  > - AdminPort  监控程序监听的地址，默认值是 8088 。
  > - EnableFcgi 是否启用 fastcgi ， 默认是 false。
  > - EnableStdIo  通过fastcgi 标准I/O，启用 fastcgi 后才生效，默认 false。
  >
  > ---
  >
  > **Session配置**
  >
  > - SessionOn  session 是否开启，默认是 false。
  > - SessionProvider  session 的引擎，默认是 memory，目前支持还有 file、mysql、redis 等，配置文件对应的参数名：sessionprovider。
  > - SessionName  存在客户端的 cookie 名称，默认值是 beegosessionID。
  > - SessionGCMaxLifetime  session 过期时间，默认值是 3600 秒。
  > - SessionProviderConfig  配置信息，根据不同的引擎设置不同的配置信息置，设置对应 file、mysql、redis 引擎的保存路径或者链接地址，默认值是空，配置文件对应的参数：sessionproviderconfig。
  > - beego.BConfig.WebConfig.Session.SessionHashFunc   默认值为 sha1，采用 sha1 加密算法生产 sessionid
  > - SessionCookieLifeTime  session 默认存在客户端的 cookie 的时间，默认值是 3600 秒。
  > - SessionAutoSetCookie 是否开启SetCookie, 默认值 true 开启。
  > - SessionDomain  session cookie 存储域名, 默认空。
  >
  > ---
  >
  > **Log 配置**
  >
  > - AccessLogs  是否输出日志到 Log，默认在 prod 模式下不会输出日志，默认为 false 不输出日志
  > - FileLineNum  是否在日志里面显示文件名和输出日志行号，默认 true。此参数不支持配置文件配置。
  
- #### **路由配置**

  > - **固定路由**
  >
  >   > RESTful 函数路由在 router.go中配置，包含
  >   >
  >   > - beego.Get(router, beego.FilterFunc)
  >   > - beego.Post(router, beego.FilterFunc)
  >   > - beego.Put(router, beego.FilterFunc)
  >   > - beego.Patch(router, beego.FilterFunc)
  >   > - beego.Head(router, beego.FilterFunc)
  >   > - beego.Options(router, beego.FilterFunc)
  >   > - beego.Delete(router, beego.FilterFunc)
  >   > - beego.Any(router, beego.FilterFunc)
  >   >
  >   > **自定义handler实现**
  >   >
  >   > - beego.Handler(router,http.Handler)  // 将请求交给http.Handler 处理
  >   >
  >   > 
  >   >
  >   > **RESTful Controller 路由** （请求绑定Controller方法，对Get，Post 等方法进行复写） 
  >   >
  >   > - beggo.Router("/",&controllers.MainController{})
  >   >
  >   > - beego.Router("/admin", &admin.UserController{})
  >   >
  >   > - beego.Router("/admin/index", &admin.ArticleController{})
  >   >
  >   >   一个固定的路由，一个控制器，然后根据用户请求方法不同请求控制器中对应的方法
  >
  > - **正则路由 **sinatra 
  >
  >   > - /api/?:id    匹配api开头路径，变量:id 为后面字符  eg  /api/123  :id 为123
  >   > - /api/:id  不包含本身路由  /api/ 匹配失败
  >   > - /api/:id([0-9]+） id 使用正则表达式匹配
  >   > - /download/`*.*`  download 后任意层级路由   :path 为download后请求，:ext 为扩展文件名
  >   > - /download/ceshi/*  全匹配方式
  >   > - `/:id:int`  int 类型设置方式，匹配 :id为int 类型   /:hi:string 匹配 :hi 为 string 类型
  >   >
  >   > 
  >   >
  >   > **自定义方法及RESTful规则**
  >   >
  >   > - beego.Router("/", &IndexController{}, "*:Index") 
  >   >
  >   >   > `*`表示任意的 method 都执行该函数
  >   >   >
  >   >   > 使用 httpmethod:funcname 格式来展示
  >   >   >
  >   >   > 多个不同的格式使用 `;` 分割
  >   >   >
  >   >   > 多个 method 对应同一个 funcname，method 之间通过 `,` 来分割
  >   >   >
  >   >   > eg 
  >   >   >
  >   >   > ```go
  >   >   > beego.Router("/api/list",&RestController{},"*:ListFood")
  >   >   > beego.Router("/api/create",&RestController{},"post:CreateFood")
  >   >   > beego.Router("/api/delete",&RestController{},"delete:DeleteFood")
  >   >   > // 多个 HTTP Method 指向同一个函数的示例
  >   >   > beego.Router("/api",&RestController{},"get,post:ApiFunc")
  >   >   > // 不同的 method 对应不同的函数，通过 ; 进行分割的示例：
  >   >   > beego.Router("/simple",&SimpleController{},"get:GetFunc;post:PostFunc")
  >   >   > // * 与 HttpMethod 方法优先匹配 HttpMethod方法
  >   >   > beego.Router("/simple",&SimpleController{},"`*:AllFunc;post:PostFunc`")
  >   >   > ```
  >
  > - **自动路由**
  >
  >   > beego.AutoRouter(&controllers.ObjectController{})
  >   >
  >   >  *beego 通过反射获取该结构体中所有的实现方法，即/object/login*  object  为结构体名称，login为结构体方法
  >   >
  >   > ~~~go
  >   > beego.AutoRouter(&controllers.MainController{})
  >   > // 自动路由    /Main/GetUserName  大小写匹配
  >   > func (c *MainController) GetUserName() {
  >   > 	fmt.Println("GetUserName")
  >   > }
  >   > ~~~
  >   >
  >   > 可以通过 `this.Ctx.Input.Param(":ext")` 获取后缀名。
  >
  > - #### **注解路由**
  >
  >   > 无需在 router 中注册路由，只需要 Include 相应地 controller,然后在 controller 的 method 方法上面写上 router 注释（// [@router](https://github.com/router)）
  >   >
  >   > ~~~go
  >   > // 路由文件中指定扫描的Controller 
  >   > beego.Include(&CMSController{})
  >   > // @router /staticblock/:key [get]
  >   > func (this *CMSController) StaticBlock() {
  >   > 
  >   > }
  >   > //beego 自动会进行源码分析，注意只会在 dev 模式下进行生成，生成的路由放在 “/routers/commentsRouter.go” 文件中。
  >   > ~~~
  >
  > - #### **namespace**
  >
  >   > beego.AddNamespace()
  >   >
  >   > ~~~go
  >   > ns :=
  >   > web.NewNamespace("/v1",
  >   >     web.NSCond(func(ctx *context.Context) bool {
  >   >         if ctx.Input.Domain() == "api.beego.me" {
  >   >             return true
  >   >         }
  >   >         return false
  >   >     }),
  >   >     web.NSBefore(auth),
  >   >     web.NSGet("/notallowed", func(ctx *context.Context) {
  >   >         ctx.Output.Body([]byte("notAllowed"))
  >   >     }),
  >   >     web.NSRouter("/version", &AdminController{}, "get:ShowAPIVersion"),
  >   >     web.NSRouter("/changepassword", &UserController{}),
  >   >     web.NSNamespace("/shop",
  >   >         web.NSBefore(sentry),
  >   >         web.NSGet("/:id", func(ctx *context.Context) {
  >   >             ctx.Output.Body([]byte("notAllowed"))
  >   >         }),
  >   >     ),
  >   >     web.NSNamespace("/cms",
  >   >         web.NSInclude(
  >   >             &controllers.MainController{},
  >   >             &controllers.CMSController{},
  >   >             &controllers.BlockController{},
  >   >         ),
  >   >     ),
  >   > )
  >   > // 注册 namespace
  >   > beego.AddNamespace(ns)
  >   > ~~~
  >   >
  >   > 
  
  
  > - Init(ct *context.Context, childName string, app interface{}) 
  >
  >   > 这个函数主要初始化了 Context、相应的 Controller 名称，模板名，初始化模板参数的容器 Data，app 即为当前执行的 Controller 的 reflecttype，这个 app 可以用来执行子类的方法。
  >
  > - Prepare()   Method 方法之前执行
  >
  > - Finish()  Method 方法执行后
  >
  > - Render() error  主要用来实现渲染模板，如果 beego.AutoRender 为 true 的情况下才会执行。
  >
  > - StopRun() 提前终止
  >
  > - req.Param("key","value")
  >
  > - ioutil.ReadFile 文件流
  >
  > - req.Header(key，value)
  >
  >   
  >
  > ---
  >
  > **Ctx 字段**
  >
  > - Input  请求输入相关数据 
  >
  >   > ![image-20220502230408892](img\image-20220502230408892.png) 
  >   >
  >   > - Protocol  获取用户请求的协议
  >   > - Uri  用户请求的 RequestURI
  >   > - Site  请求的站点地址,scheme+doamin 的组合
  >   > - Scheme  请求的 scheme，例如 “http” 或者 “https”
  >   > - Domain  请求的域名 （与Host一致）
  >   > - Is  判断是否是某一个方法 
  >   > - IsAjax  判断是否是 AJAX 请求
  >   > - IsSecure  判断当前请求是否 HTTPS 请求
  >   > - IsWebsocket  判断当前请求是否 Websocket 请求
  >   > - IsUpload  判断当前请求是否有文件上传
  >   > - Proxy  返回用户代理请求的所有 IP
  >   > - Refer  返回请求的 refer 信息
  >   > - Port  返回请求的端口
  >   > - UserAgent  返回请求的 UserAgent 
  >   > - Param
  >   > - Query  返回 Get 请求和 Post 请求中的所有数据
  >   > - Header  返回相应的 header 信息
  >   > - Cookie  返回请求中的 cookie 数据
  >   > - session  获取存储在服务器端中的数据
  >   > - Body 
  >   > - GetData
  >   > - SetData
  >
  > - Output  响应操作
  >
  >   > ![image-20220502230527845](img\image-20220502230527845.png) 
  >   >
  >   > - Header
  >   > - Body
  >   > - Cookie
  >   > - Json  把 Data 格式化为 Json，然后调用 Body 输出数据
  >   > - Download  把 file 路径传递进来，然后输出文件给用户
  >   > - ContentType  设置输出的 ContentType
  >   > - SetStatus
  >   > - Session
  >   > - IsCachable  根据 status 判断，是否为缓存类的状态
  >   > - IsEmpty  根据 status 判断，是否为输出内容为空的状态
  >   > - IsOk  根据 status 判断，是否为 200 的状态
  >   > - IsSuccessful  根据 status 判断，是否为正常的状态
  >   > - IsServerError  根据 status 判断，是否为服务器端错误的状态
  
- #### **XSRF过滤**
  
  > CSRF/XSRF  跨站请求伪造，跨站伪造用户请求，模拟用户操作
  >
  > XSS 跨站执行脚本（javascript），在网页上注入脚本，执行非法操作
  >
  > ---
  >
  > CSRF预防关键在于**请求中存放不能伪造的信息，请求验证不能被伪造**，并且该信息不能存放在Cookie中，CSRF漏洞检测，CSRFTester，CSRF Request Builder
  >
  > ---
  >
  > **预防CSRF攻击**
  >
  > 1. 验证Http Referer 字段（记录该Http请求来源IP)，通常情况下，一个安全访问受限的请求来源于同一个地址，限制请求来源IP（存在修改Refer值风险，需要开发指定IP地址才能访问）
  > 2. 请求头中添加Token，及添加手机令牌，短信验证
  >
  > ---
  >
  > Beego CSRF 配置
  >
  > app.conf 配置
  >
  > > ```ini
  > > enablexsrf = true
  > > xsrfkey = 61oETzKXQAGaYdkL5gEmGeJJFuYh7EQnp2XdTP1o
  > > xsrfexpire = 3600
  > > ```
  > >
  > > *开启了 XSRF， beego 的 Web 应用将对所有用户设置一个 `_xsrf` 的 cookie 值，如果 `POST PUT DELET` 请求中没有这个 cookie 值，那么这个请求会被直接拒绝，如果你开启了这个机制，那么在所有被提交的表单中，你都需要加上一个域来提供这个值*
  
- #### **请求数据处理**
  
  > - GetString(key string) string
  > - GetStrings(key string) []string
  > - GetInt(key string) (int64, error)
  > - GetBool(key string) (bool, error)
  > - GetFloat(key string) (float64, error)
  >
  > **解析到struct**
  >
  > ```go
  > type user struct {
  >     Id    int         `form:"-"`
  >     Name  interface{} `form:"username"`
  >     Age   int         `form:"age"`
  >     Email string
  > }
  > ```
  >
  > **获取Request Body内容**
  >
  > ~~~go
  > func (this *ObjectController) Post() {
  >     var ob models.Object
  >     var err error
  >     if err = json.Unmarshal(this.Ctx.Input.RequestBody, &ob); err == nil {
  >         objectid := models.AddOne(ob)
  >         this.Data["json"] = "{\"ObjectId\":\"" + objectid + "\"}"
  >     } else {
  >         this.Data["json"] = err.Error()
  >     }
  >     this.ServeJSON()
  > }
  > ~~~
  >
  > **文件上传**
  >
  >  beego.MaxMemory = 1<<22
  >
  > - GetFile(key string) (multipart.File, `*multipart.FileHeader`, error)  // 获取文件流
  >
  > - SaveToFile(fromfile, tofile string) error //保存文件
  >
  > ![image-20220503010948698](img\image-20220503010948698.png) 
  >
  > 
  
- #### **Session控制**

  > ```ini
  > sessionon = true
  > ```
  >
  > - SetSession(name string, value interface{})
  > - GetSession(name string) interface{}
  > - DelSession(name string)
  > - SessionRegenerateID()
  > - DestroySession()

- #### **过滤器**

  > ```go
  > // pattern  路由规则
  > // position 执行 Filter 的地方  
  >  // BeforeStatic 静态地址之前
  >  // BeforeExec 找到路由之后，开始执行相应的 Controller 之前
  >  // AfterExec 执行完 Controller 逻辑之后执行的过滤器
  >  // FinishRouter 执行完逻辑之后执行的过滤器
  > // FilterFunc 执行函数
  > //设置 returnOnOutput 的值(默认 true), 如果在进行到此过滤之前已经有输出，是否不再继续执行此过滤器,默认设置为如果前面已有输出(参数为true)，则不再执行此过滤器
  > // 是否重置 filters 的参数，默认是 false，因为在 filters 的 pattern 和本身的路由的 pattern 冲突的时候，可以把 filters 的参数重置，这样可以保证在后续的逻辑中获取到正确的参数
  > beego.InsertFilter(pattern string, position int, filter FilterFunc, params ...bool)
  > 
  > ```

- #### **Flash数据**

  > *用于传递提示和错误消息，flash 中存放的所有数据会在紧接着的下一个逻辑中调用后清除*
  >
  > - Notice 提示信息
  > - Warning 警告信息
  > - Error 错误信息
  >
  > ```go
  > flash:=beego.NewFlash()
  > flash.Data["notice"]
  > ```

- #### **表单数据校验**

  > ```go
  > go get github.com/astaxie/beego/validation
  > ```
  >
  > ```go
  > // 使用显示代码校验 
  > valid.Required(u.Name, "name")
  >   valid.MaxSize(u.Name, 15, "nameMax")
  >  if valid.HasErrors() {
  >        
  >      for _, err := range valid.Errors {
  >             log.Println(err.Key, err.Message)
  >         }
  >     }
  > 
  > //使用structTag校验
  > type user struct {
  >     Id     int
  >     Name   string `valid:"Required;Match(/^Bee.*/)"` // Name 不能为空并且以 Bee 开头
  >     Age    int    `valid:"Range(1, 140)"` // 1 <= Age <= 140，超出此范围即为不合法
  >     Email  string `valid:"Email; MaxSize(100)"` // Email 字段需要符合邮箱格式，并且最大长度不能大于 100 个字符
  >     Mobile string `valid:"Mobile"` // Mobile 必须为正确的手机号
  >     IP     string `valid:"IP"` // IP 必须为一个正确的 IPv4 地址
  > }
  > func (u *user) Valid(v *validation.Validation) {
  >     if strings.Index(u.Name, "admin") != -1 {
  >         // 通过 SetError 设置 Name 的错误信息，HasErrors 将会返回 true
  >         v.SetError("Name", "名称里不能含有 admin")
  >     }
  > }
  > ```

- #### **错误处理**

  > ```go
  > 
  > func (this *AddController) Get() {
  >    // 页面跳转
  >     this.Redirect("/", 302)
  >     // 返回错误码 401,403,404,500,503 
  >     this.Abort("401")
  > }
  > ```

- #### **日志处理**

  > ```go
  > beego.Emergency("this is emergency")
  > beego.Alert("this is alert")
  > beego.Critical("this is critical")
  > beego.Error("this is error")
  > beego.Warning("this is warning")
  > beego.Notice("this is notice")
  > beego.Informational("this is informational")
  > beego.Debug("this is debug")
  > ```

- #### **Beego模块处理（作用于其它应用）**

  > **Session 模块**
  >
  > ```go
  > go get github.com/astaxie/beego/session
  > // 初始化对象
  > var globalSessions *session.Manager
  > // 设置配置参数
  > func init() {
  >   sessionConfig := &session.ManagerConfig{
  > CookieName:"gosessionid", 
  > EnableSetCookie: true, 
  > Gclifetime:3600,
  > Maxlifetime: 3600, 
  > Secure: false,
  > CookieLifeTime: 3600,
  > ProviderConfig: "./tmp",
  > }
  > globalSessions, _ = session.NewManager("memory",sessionConfig)
  > go globalSessions.GC()
  > }
  > ```
  >
  > 
  >
  > **Grace 模块**  
  >
  > *热升级，在**不停止服务的情况下**完成系统的升级与运行参数修改*
  >
  > - 发布新的bin文件去覆盖老的bin文件
  > - 发送一个信号量，告诉正在运行的进程，进行重启
  > - 正在运行的进程收到信号后，会以子进程的方式启动新的bin文件
  > - 新进程接受新请求，并处理
  > - 老进程不再接受请求，但是要等正在处理的请求处理完成，所有在处理的请求处理完之后，便自动退出
  > - 新进程在老进程退出之后，由init进程收养，但是会继续服务。
  >
  > ~~~go
  > // 基于http 的热升级
  > "github.com/beego/beego/v2/server/web/grace"
  >  err := grace.ListenAndServe("localhost:8080", mux)
  > ~~~
  >
  > 
  >
  > 
  >
  > **Cache模块**
  >
  > ~~~go
  > go get github.com/astaxie/beego/cache
  > bm, err := cache.NewCache("memory", `{"interval":60}`)
  > ~~~
  >
  >  **Toolbox模块**（单个应用使用，多个应用监测使用Prometheus）
  >
  > ~~~ini
  > # 开启进程内监控模块
  > enableadmin = true
  > adminaddr = "127.0.0.1"
  > adminport = 8088
  > ~~~
  >
  > ~~~go
  > go get github.com/astaxie/beego/toolbox
  > type DatabaseCheck struct {
  > }
  > 
  > func (dc *DatabaseCheck) Check() error {
  >     if dc.isConnected() {
  >         return nil
  >     } else {
  >         return errors.New("can't connect database")
  >     }
  > }
  > //profile 对于运行中的进程的性能监控是我们进行程序调优和查找问题的最佳方法，例如 GC、goroutine 等基础信息。profile 提供了方便的入口方便用户来调试程序，他主要是通过入口函数 ProcessInput 来进行处理各类请求，主要包括以下几种调试：
  > // 打印出来当前全部的 goroutine 执行的情况
  > lookup goroutine 
  > // 用来打印当前 heap 的信息
  > lookup heap
  > //查看创建线程的信息：
  > lookup threadcreate
  > // 查看 block 信息：
  > lookup block
  > // 开始记录 cpuprof 信息，生产一个文件 cpu-pid.pprof，开始记录当前进程的 CPU 处理信息
  > start cpuprof   stop cpuprof 
  > // 开启记录 memprof，生产一个文件 mem-pid.memprof
  > get memprof
  > //查看 GC 信息
  > gc summary
  > 
  > 
  > toolbox.StatisticsMap.AddStatistics("POST", "/api/user", "&admin.user", time.Duration(2000))
  > toolbox.StatisticsMap.AddStatistics("POST", "/api/user", "&admin.user", time.Duration(120000))
  > toolbox.StatisticsMap.AddStatistics("GET", "/api/user", "&admin.user", time.Duration(13000))
  > toolbox.StatisticsMap.AddStatistics("POST", "/api/admin", "&admin.user", time.Duration(14000))
  > toolbox.StatisticsMap.AddStatistics("POST", "/api/user/astaxie", "&admin.user", time.Duration(12000))
  > toolbox.StatisticsMap.AddStatistics("POST", "/api/user/xiemengjun", "&admin.user", time.Duration(13000))
  > toolbox.StatisticsMap.AddStatistics("DELETE", "/api/user", "&admin.user", time.Duration(1400))
  >  // 获取所有接口统计信息
  > toolbox.StatisticsMap.GetMap(os.Stdout)
  > 
  > // 创建定时器 cron 表达式
  >  tk1 := toolbox.NewTask("tk1", "0 12 * * * *", func() error { fmt.Println("tk1"); return nil })
  > 
  > ~~~
  >
  > **Config 模块**
  >
  > 支持解析的文件格式有 ini、json、xml、yaml
  >
  > ~~~go
  > iniconf, err := NewConfig("ini", "testini.conf")
  > if err != nil {
  >     t.Fatal(err)
  > }
  > ~~~
  >
  > 
  >
  > **l18n 模块**
  >
  > *实现多语言界面与反馈，增强用户体验*
  >
  > ~~~go
  > go get github.com/beego/i18n
  > // 在控制器中使用
  > 
  > // Initialized language type list.
  > langs := strings.Split(beego.AppConfig.String("lang::types"), "|")
  > names := strings.Split(beego.AppConfig.String("lang::names"), "|")
  > langTypes = make([]*langType, 0, len(langs))
  > for i, v := range langs {
  >     langTypes = append(langTypes, &langType{
  >         Lang: v,
  >         Name: names[i],
  >     })
  > }
  > for _, lang := range langs {
  >     beego.Trace("Loading language: " + lang)
  >     if err := i18n.SetMessage(lang, "conf/"+"locale_"+lang+".ini"); err != nil {
  >         beego.Error("Fail to set message file: " + err.Error())
  >         return
  >     }
  > }
  > ~~~
  >
  
- #### **API自动文档**
  
  > **路由解析，仅支持namespace方式，且dev环境下**
  >
  > ~~~ini
  > EnableDocs = true
  > // 启动参数
  > bee run -gendoc=true -downdoc=true
  > ~~~
  >
  > 
  >
  > 
  >
  > 1. `// @APIVersion 1.0.0`
  > 2. `// @Title mobile API`
  > 3. `// @Description mobile has every tool to get any job done, so codename for the new mobile APIs.`
  > 4. `// @Contact astaxie@gmail.com`
  >
  > ---
  >
  > 1. `// @Title getStaticBlock`
  > 2. `// @Description get all the staticblock by key`
  > 3. `// @Param    key        path     string    true        "The email for login"`
  > 4. `// @Success 200 {object} models.ZDTCustomer.Customer `
  > 5. `// @Failure 400 Invalid email supplied`
  > 6. `// @Failure 404 User not found`
  > 7. `// @router /staticblock/:key [get]`
  >
  > - @Title  这个 API 所表达的含义，是一个文本
  >
  > - @Description  这个 API 详细的描述，是一个文本，空格之后的内容全部解析为 Description
  >
  > - @Param  表示需要传递到服务器端的参数(使用空格或者 tab 分割)
  >
  >   > 1. 参数名
  >   > 2. 参数类型 ( formData、query、path、body、header，formData)
  >   > 3. 参数类型
  >   > 4. 是否必须
  >   > 5. 注释
  >
  > - @Success  成功返回给客户端的信息
  >
  >   > 1. statuscode 状态码
  >   > 2. 返回的类型  使用{}表达 
  >   > 3. 返回的对象或者字符串信息
  >
  > - @Failure  失败返回的信息
  >
  >   > 1. status code
  >   > 2. 表示错误信息
  >
  > - @router  路由信息
  >
  >   > 1. 请求的路由地址
  >   > 2. 第二个参数是支持的请求方法
  >
  
- #### **Beego 部署**
  
  > - bee new ProjectName   # bee 脚手架
  > - bee api projectName   # 创建一个api接口项目
  > - bee run #运行项目
  > - bee pack #打包项目
  > - bee pack  -be GOOS = linux 打包环境
  > - bee generate  自动化的生成代码（一键生成model）
  > - bee migrate 应用的数据库迁移命令(降级的SQL管理)
  >
  > 
  >
  > **linux**
  >
  > - 基于nohup 命令部署
  >
  > - 基于Supervisord 部署
  >   > *分布式环境应用启动与停止*
  >   >
  >   > ~~~shell
  >   > yum install epel-release 
  >   > yum install -y supervisor
  >   > # 启动
  >   > /usr/bin/supervisord -c /etc/supervisord.conf
  >   > ~~~
  >   >
  >   > supervisord.conf 配置文件
  >   >
  >   > 
  
  
  
  

