## Docker

- #### **虚拟机与容器**

  > <img src="img\image-20221221173135219.png" alt="image-20221221173135219" style="zoom:67%;" /> 
  >
  > ![image-20221221173936266](D:\computer-program-language\中间件\Docker\img\image-20221221173936266.png) 
  >
  > **虚拟机：**指通过软件模拟的具有完整硬件系统功能的、运行在一个完全隔离环境中的完整计算机系统。与宿主机相互隔离，可移植性差。（VMware vSphere，VirtualBox，Xen，Hyper-V，KVM）
  >
  > 
  >
  > **容器：** 特殊进程。将应用依赖和所需配置打包放在任意机器上，不影响软件运行。(LXC，Docker，Kubernetes)

- #### **Docker**

  > - Image：镜像包（构建docker容器）
  >
  > - Container 容器
  > - Registry 仓库中心
  > - Repository 仓库
  >
  > **Docker 操作**
  >
  > ~~~dockerfile
  > # 获取镜像详细信息
  > docker inspect imageName;
  > # 载入与载出镜像
  > docker save -o target_file.tar source_file
  > docker load < target_file.tar 
  > # 进入容器
  > docker exec -it pid /bin/bash
  > docker attach pid
  > # 复制文件
  > docker cp /root/boot.war my-centos:/usr/loacl/
  > # 查看容器应用日志
  > docker logs -f pid
  > # 创建运行容器
  > docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
  > OPTIONS：
  >   -i：运行容器
  >   -t：容器启动后会进入其命令行
  >   --name：创建容器名称
  >   -v：目录映射关系(宿主机目录：容器目录)
  >   -d：守护式运行
  >   -p：端口映射（前面是宿主机端口，后面是容器端口）
  > ~~~
  >
  
- **Dockerfile**

  > - FROM ：基础镜像
  >
  > - MAINTAINER ：镜像作者（姓名+邮箱）
  >
  > - RUN ：镜像构建的时候被需要运行的命令
  >
  >   > RUN <command> (shell 模式)
  >   >
  >   > RUN ["executable", "param1", "param2"]  (exec 模式)
  >
  > - CMD：容器启动时自动执行的指令（已最后一条执行为准）
  >
  > - ENTRYPOINT :同CMD，执行的命令不易被覆盖
  >
  > - ADD ：添加依赖文件（自动解压）
  >
  >   > add <src> <dest> 将指定路径的文件拷贝到容器中
  >
  > - COPY ：同ADD
  >
  > - VOLUME: 创建一个从本地主机的挂载点
  >
  >   > VOLUME ["/data"]
  >
  > - USER：指定容器运行用户名
  >
  > - WORKDIR :RUN，CMD，ENTRYPOINT 指令执行目录
  >
  > - EXPOST :保留端口配置()
  >
  > - ENV ：环境变量(key value 格式)
  >
  > docker build -t  imageName . 
  >
  > 

