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
  > - Set(key, val string) error
  > - String(key string) string
  > - Strings(key string) []string
  > - Int(key string) (int, error)
  > - Int64(key string) (int64, error)
  > - Bool(key string) (bool, error)
  > - Float(key string) (float64, error)
  > - DefaultString(key string, defaultVal string) string
  > - DefaultStrings(key string, defaultVal []string)
  > - DefaultInt(key string, defaultVal int) int
  > - DefaultInt64(key string, defaultVal int64) int64
  > - DefaultBool(key string, defaultVal bool) bool
  > - DefaultFloat(key string, defaultVal float64) float64
  > - DIY(key string) (interface{}, error)
  > - GetSection(section string) (map[string]string, error)
  > - SaveConfigFile(filename string) error
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
  > - SessionProvider  session 的引擎，默认是 memory，详细参见 `session 模块`。
  > - SessionName  存在客户端的 cookie 名称，默认值是 beegosessionID。
  > - SessionGCMaxLifetime  session 过期时间，默认值是 3600 秒。
  > - SessionProviderConfig  配置信息，根据不同的引擎设置不同的配置信息，详细的配置请看下面的引擎设置，详细参见 session 模块
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
  
   