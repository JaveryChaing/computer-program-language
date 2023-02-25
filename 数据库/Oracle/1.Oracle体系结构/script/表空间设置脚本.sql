--查看现所有表空间使用率(包含临时表空间)
select * from (
                  Select a.tablespace_name,
                         (a.bytes- b.bytes) "表空间使用大小(BYTE)",
                         a.bytes/(1024*1024*1024) "表空间大小(GB)",
                         b.bytes/(1024*1024*1024) "表空间剩余大小(GB)",
                         (a.bytes- b.bytes)/(1024*1024*1024) "表空间使用大小(GB)",
                         to_char((1 - b.bytes/a.bytes)*100,'99.99999') || '%' "使用率"
                  from (select tablespace_name,
                               sum(bytes) bytes
                        from dba_data_files
                        group by tablespace_name) a,
                       (select tablespace_name,
                               sum(bytes) bytes
                        from dba_free_space
                        group by tablespace_name) b
                  where a.tablespace_name = b.tablespace_name
                  union all
                  select c.tablespace_name,
                         d.bytes_used "表空间使用大小(BYTE)",
                         c.bytes/(1024*1024*1024) "表空间大小(GB)",
                         (c.bytes-d.bytes_used)/(1024*1024*1024) "表空间剩余大小(GB)",
                         d.bytes_used/(1024*1024*1024) "表空间使用大小(GB)",
                         to_char(d.bytes_used*100/c.bytes,'99.99999') || '%' "使用率"
                  from
                      (select tablespace_name,sum(bytes) bytes
                       from dba_temp_files group by tablespace_name) c,
                      (select tablespace_name,sum(bytes_cached) bytes_used
                       from v$temp_extent_pool group by tablespace_name) d
                  where c.tablespace_name = d.tablespace_name
              )
order by tablespace_name;

--查询现所有表空间文件存放目录，file_name 就是文件存放路径
select b.file_id,b.file_name 数据文件路径,
       b.tablespace_name 表空间名称,
       b.autoextensible,
       b.bytes / 1024 / 1024 大小M,
       (b.bytes - sum(nvl(a.bytes, 0))) / 1024 / 1024 已使用M,
       substr((b.bytes - sum(nvl(a.bytes, 0))) / (b.bytes) * 100, 1, 5) 利用率
from dba_free_space a, dba_data_files b
where a.file_id = b.file_id
group by b.file_id,b.tablespace_name, b.file_name, b.bytes,b.autoextensible
order by b.file_id;

--单纯删除表空间
drop tablespace 表空间名称;

--删除表空间及内容（表空间名称要大写）
drop tablespace "表空间名称" including contents;

--完全删除（表空间 + 数据文件）
drop tablespace "表空间名称" including contents and datafiles cascade constraints;

--创建表空间
create tablespace 表空间名称
logging
datafile '数据文件路径'
size 25000m
autoextend on
next 100m maxsize 30000m
extent management local;

--更改表空间数据文件大小及设置自动扩展
alter database datafile 原数据文件路径 autoextend on;
alter database datafile 原数据文件路径 resize 1024M;

--为表空间增加新的数据文件并设置自动扩展（表空间满32G后不能再自动扩展）
alter tablespace '表空间名称' add datafile '新数据文件路径' size 1000m autoextend on next 100m;

--查看当前数据库默认临时表空间：
select * from database_properties
where property_name='DEFAULT_TEMP_TABLESPACE';

--获取当时创建某一表空间的语句
SELECT dbms_metadata.get_ddl('TABLESPACE', '表空间名称') FROM dual;

--为TEMP临时表空间增加新的数据文件并设置自动扩展
alter tablespace TEMP add tempfile '/****' size 1000m autoextend on next 100m;
