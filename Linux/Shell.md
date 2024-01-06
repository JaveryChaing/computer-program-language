## Shell

> Shell语言种类
>
> 1. /bin/sh
> 2. **/bin/bash**
> 3. /usr/bin/csh
> 4. /usr/bin/ksh
> 5. /sbin/sh
>
> ~~~sh
> # 固定格式，声明使用shell语言
> #!/bin/bash  
> # 系统变量
> $0 #当前脚本名称
> $n #运行当前脚本的第n个参数
> $* #当前脚本的所有参数
> $? #脚本内命令是否执行成功，返回0表示成功
> $$ #执行当前脚本的PID
> $PATH/HOME/USER/PWD/HOSTNAME # 所有的系统变量
> 
> #逻辑判断
> if [-f/-d name]; then # 判断文件或文件夹是否存在
> if [[$scores -gt 85]]; then
> if (($NUM > 56)); then
> 
> ~~~
>
> 
