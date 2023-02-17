## Gradle

- **Gradle项目结构**

> ![image-20230129160448332](img\image-20230129160448332.png) 
>
> 1. gradle wrapper：gradle构建插件，在项目新建时候生成，Gradle Wrapper 为 Gradle 包装器，是将 Gradle 再次包装
>
> 2. gradle wrapper启动脚本
>
> 3. 项目描述文件，定义项目名称，包含模块
>
>    > ```groovy
>    > // 项目名称
>    > rootProject.name = 'demo'
>    > // 包含模块
>    > include('app')
>    > ```
>
> 4. 项目构建脚本（项目依赖，打包方式）
>
>    > <img src="img\image-20230129161431564.png" alt="image-20230129161431564" style="zoom:67%;" /> 
>    >
>    > 1.  应用程序插件以添加用Java构建CLI应用程序的支持
>    >
>    >    ![image-20230129161711293](img\image-20230129161711293.png) 
>    >
>    > 2. 使用maven仓库解决依赖关系
>    >
>    > 3. 测试依赖
>    >
>    > 4. 应用依赖
>    >
>    > 5. main函数所在类

- #### **Groovy**  基于java的动态脚本语言

  > buildscript：声明是gradle脚本自身需要使用的资源。可以声明的资源包括依赖项、第三方插件、maven仓库地址等
  >
  > ext：自定义项目属性（管理所有第三方插件版本号）
  >
  > repositories：使用仓库，包含jcenter()、maven()和google()托管第三方插件的平台
  >
  > dependencies：项目依赖
  >
  > 1. 直接依赖：implementation （通过仓库下载到本地）
  >
  > 2. 本地依赖：
  >
  >    - implementation project(':mylibary') 项目模块间相互依赖，
  >    - implementation fileTree(dir: 'libs', include: ['*.jar'])  配置依赖文件夹
  >    - implementation files('libs/foo.jar', 'libs/bar.jar') 配置依赖文件
  >
  > 3. 远程依赖
  >
  >    - maven {url:"",name:""}
  >
  > 4. 依赖管理配置
  >
  >    - implementation：编译时只能在当前模块访问（其他模块使用该依赖时将无法通过编译），编译效率最高
  >
  >    - api：模块之间依赖可以编译传递
  >
  >    - compileOnly：只在编译时能访问，其依赖不会传递其他模块（减少程序体积）
  >
  >    - runtimeOnly：与compileOnly相反（可以通过编译）
  >
  >    - annotationProcessor：注解处理器的依赖配置
  >
  >    - 依赖冲突排除
  >
  >      - ~~~groovy
  >        // 排除该依赖中冲突模块
  >        compile('com.taobao.android:accs-huawei:1.1.2@aar') {
  >                // 禁用依赖传递
  >                transitive = false
  >                // 标识依赖统一
  >                force = true
  >                exclude group: 'com.taobao.android', module: 'accs_sdk_taobao'
  >        }
  >        ~~~
  >
  >      - ~~~groovy
  >        configurations {
  >            compile.exclude module: 'cglib'
  >             // 禁用依赖传递
  >             transitive = false
  >             // 标识依赖统一
  >             force = true
  >            //全局排除原有的tnet jar包与so包分离的配置，统一使用aar包中的内容
  >            all*.exclude group: 'com.taobao.android', module: 'tnet-jni'
  >            all*.exclude group: 'com.taobao.android', module: 'tnet-so'
  >        }
  >        ~~~
  >
  > plugins：
  >
  > 1. apply plugin：二进制插件，通常是jar包
  > 2. apply from：应用脚本插件
  >
  > task：定义任务
  >
  > 

- **gradle 全局配置文件**

  > ~~~java
  > allprojects {
  >     repositories {
  >         def ALIYUN_REPOSITORY_URL = 'https://maven.aliyun.com/repository/public'
  >         def ALIYUN_JCENTER_URL = 'https://maven.aliyun.com/repository/jcenter'
  >         def ALIYUN_GOOGLE_URL = 'https://maven.aliyun.com/repository/google'
  >         def ALIYUN_GRADLE_PLUGIN_URL = 'https://maven.aliyun.com/repository/gradle-plugin'
  >         def ALIYUN_GRAILS_CORE = 'https://maven.aliyun.com/repository/grails-core'
  > 
  >         def REPOSITORY_URL = 'https://repo1.maven.org/maven2/'
  >         def JCENTER_URL = 'https://jcenter.bintray.com/'
  >         def GOOGLE_URL = 'https://dl.google.com/dl/android/maven2/'
  >         def GRADLE_PLUGIN_URL = 'https://plugins.gradle.org/m2/'
  > 
  >         all { ArtifactRepository repo ->
  >             if (repo instanceof MavenArtifactRepository) {
  >                 def url = repo.url.toString()
  >                 if (url.startsWith(REPOSITORY_URL)) {
  >                     project.logger.lifecycle "Repository ${repo.url} replaced by $ALIYUN_REPOSITORY_URL."
  >                     remove repo
  >                 }
  >                 if (url.startsWith(JCENTER_URL)) {
  >                     project.logger.lifecycle "Repository ${repo.url} replaced by $ALIYUN_JCENTER_URL."
  >                     remove repo
  >                 }
  >                 if (url.startsWith(GOOGLE_URL)) {
  >                     project.logger.lifecycle "Repository ${repo.url} replaced by $ALIYUN_GOOGLE_URL."
  >                     remove repo
  >                 }
  >                 if (url.startsWith(GRADLE_PLUGIN_URL)) {
  >                     project.logger.lifecycle "Repository ${repo.url} replaced by $ALIYUN_GRADLE_PLUGIN_URL."
  >                     remove repo
  >                 }
  >             }
  >         }
  >         maven { url ALIYUN_REPOSITORY_URL }
  >         maven { url ALIYUN_JCENTER_URL }
  >         maven { url ALIYUN_GOOGLE_URL }
  >         maven { url ALIYUN_GRADLE_PLUGIN_URL }
  >         maven { url ALIYUN_GRAILS_CORE }
  >         maven { url REPOSITORY_URL }
  >         maven { url JCENTER_URL }
  >         maven { url GOOGLE_URL }
  >         maven { url GRADLE_PLUGIN_URL }
  >     }
  > }
  > 
  > 
  > ~~~
  >
  > 

- #### **Springboot 多模块构建  settings.gradle**

  > ~~~groovy
  > plugins {
  >     id 'java-library'
  >     id 'org.springframework.boot' version '3.0.2'
  >     id 'io.spring.dependency-management' version '1.1.0'
  >     id 'org.hibernate.orm' version '6.1.6.Final'
  >     id 'org.graalvm.buildtools.native' version '0.9.18'
  > }
  > 
  > 
  > allprojects {
  >     group = 'com.example'
  >     version = '0.0.1-SNAPSHOT'
  >     sourceCompatibility = '17'
  >     targetCompatibility = '17'
  >     apply plugin: 'java-library'
  >     apply plugin: 'org.springframework.boot'
  >     apply plugin: 'io.spring.dependency-management'
  >     apply plugin: 'org.hibernate.orm'
  >     apply plugin: 'org.graalvm.buildtools.native'
  > 
  >     repositories {
  >         maven {
  >             url 'https://maven.aliyun.com/repository/public'
  >         }
  >         mavenCentral()
  >     }
  > }
  > // 公共依赖
  > subprojects {
  >     dependencies {
  >         implementation 'org.springframework.boot:spring-boot-starter-webflux'
  >         compileOnly 'org.projectlombok:lombok'
  >         annotationProcessor 'org.projectlombok:lombok'
  >         testImplementation 'org.springframework.boot:spring-boot-starter-test'
  >         testImplementation 'io.projectreactor:reactor-test'
  >     }
  > 
  > }
  > 
  > ~~~
  >
  > 
