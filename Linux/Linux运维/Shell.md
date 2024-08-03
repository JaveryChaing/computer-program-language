## Shell

> Shell语言种类
>
> 1. /bin/sh
> 2. **/bin/bash**
> 3. /usr/bin/csh
> 4. /usr/bin/ksh
> 5. /sbin/sh
>
> **shell特殊字符**
>
> - ()：数组
> - (())：算术运算符表达式
> - []：引用数组元素，正则表达式
> - [[]]：逻辑运算符表达式
> - $：变量表达式
> - ''：字符串
> - ""：弱字符串（允许变量填充）
> - ``：命令替换

**日志分组打包及远程备份**

~~~shell
#!/bin/bash
for   i   in  'find /var/log  -name "*.log"'
do
    tar  -czf  2021_log$i.tgz  $i
done
for i in 'seq 100 200'
do 
    scp -r /tmp/jfedu.txt root@192.168.1.$i:/data/webapps/www
done
~~~

**Mysql数据备份**

~~~shell
#!/bin/bash 
#auto backup mysql
BAK_DIR=/data/backup/mysql/'date +%Y-%m-%d'
MYSQLDB=webapp
MYSQLPW=backup
MYSQLUSR=backup
#must use root user run scripts 必须使用root用户运行,$UID为系统变量
if	
   [ $UID -ne 0 ];then
   echo This script must use the root user!!! 
   sleep 2
   exit 0
fi
#Define DIR and mkdir DIR 判断目录是否存在,不存在则新建
if
   [ ！ -d  $BAKDIR ];then
   mkdir  -p  $BAKDIR
fi
#Use mysqldump backup Databases
/usr/bin/mysqldump -u$MYSQLUSR -p$MYSQLPW -d $MYSQLDB >$BAKDIR/
webapp_db.sql
echo  "The mysql backup successfully"
~~~

**Nginx一键安装**

~~~shell
#!/bin/bash
#Install Nginx Web
yum install -y wget gzip tar make gcc
yum install -y pcre pcre-devel zlib-devel
wget -c http://nginx.org/download/nginx-1.16.0.tar.gz
tar zxf nginx-1.16.0.tar.gz
cd nginx-1.16.0
./configure --prefix=/usr/local/nginx  --with-http_stub_status_module
make && make install
/usr/local/nginx/sbin/nginx
~~~

**MySQL一键安装**

~~~shell
#!/bin/bash
#Install Nginx Web
yum install -y gcc-c++ ncurses-devel cmake make perl gcc autoconf
yum install -y automake zlib libxml2 libxml2-devel libgcrypt libtool bison
wget -c http://mirrors.163.com/mysql/Downloads/MySQL-5.6/mysql-5.6.51.tar.gz
tar -xzf mysql-5.6.51.tar.gz
cd mysql-5.6.51
cmake  .  -DCMAKE_INSTALL_PREFIX=/usr/local/mysql56/ \
-DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
-DMYSQL_DATADIR=/data/mysql \
-DSYSCONFDIR=/etc \
-DMYSQL_USER=mysql \
-DMYSQL_TCP_PORT=3306 \
-DWITH_XTRADB_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_PARTITION_STORAGE_ENGINE=1 \
-DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_READLINE=1 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_EXTRA_CHARSETS=1 \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DEXTRA_CHARSETS=all \
-DWITH_BIG_TABLES=1 \
-DWITH_DEBUG=0
make
make install
#Config MySQL Set System Service
cd /usr/local/mysql56/ 
\cp support-files/my-large.cnf /etc/my.cnf
\cp support-files/mysql.server /etc/init.d/mysqld 
chkconfig --add mysqld 
chkconfig --level 35 mysqld on
mkdir  -p  /data/mysql
useradd  mysql
/usr/local/mysql56/scripts/mysql_install_db --user=mysql --datadir=/data/
mysql/ --basedir=/usr/local/mysql56/
ln  -s  /usr/local/mysql56/bin/* /usr/bin/
service  mysqld  restart
~~~

**tar增量备份**

~~~shell
#!/bin/bash
SOURCE_DIR=(
    $*
)
TARGET_DIR=/data/backup/
YEAR='date +%Y'
MONTH='date +%m'
DAY='date +%d'
WEEK='date +%u'
A_NAME='date +%H%M'
FILES=system_backup.tgz
CODE=$?
if
    [ -z "$*" ];then
    echo -e "\033[32mUsage:\nPlease Enter Your Backup Files or Directories\
n--------------------------------------------\n\nUsage: { $0 /boot /etc}\
033[0m"
    exit
fi

if
    [ ! -d $TARGET_DIR/$YEAR/$MONTH/$DAY ];then
    mkdir -p $TARGET_DIR/$YEAR/$MONTH/$DAY
    echo -e "\033[32mThe $TARGET_DIR Created Successfully !\033[0m"
fi
#EXEC Full_Backup Function Command
Full_Backup()
{
if
    [ "$WEEK" -eq "7" ];then
    rm -rf $TARGET_DIR/snapshot
    cd $TARGET_DIR/$YEAR/$MONTH/$DAY ;tar -g $TARGET_DIR/snapshot -czvf 
$FILES ${SOURCE_DIR[@]}
    [ "$CODE" == "0" ]&&echo -e  "---------------------------------------
-----\n\033[32mThese Full_Backup System Files Backup Successfully !\033[0m"
fi
}
#Perform incremental BACKUP Function Command
Add_Backup()
{
   if
        [ $WEEK -ne "7" ];then
        cd $TARGET_DIR/$YEAR/$MONTH/$DAY ;tar -g $TARGET_DIR/snapshot -czvf 
$A_NAME$FILES ${SOURCE_DIR[@]}
        [ "$CODE" == "0" ]&&echo -e  "------------------------------------
-----\n\033[32mThese Add_Backup System Files $TARGET_DIR/$YEAR/$MONTH/
$DAY/${YEAR}_$A_NAME$FILES Backup Successfully !\033[0m"
   fi
}
sleep 3 
Full_Backup;Add_Backup

~~~

