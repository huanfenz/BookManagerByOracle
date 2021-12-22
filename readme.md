# 图书管理系统Oracle版（Book Management System, Created by SpringBoot framework）

[![我的博客](https://img.shields.io/badge/%E6%88%91%E7%9A%84%E5%8D%9A%E5%AE%A2-huanfenz.top-brightgreen)](http://huanfenz.top)	[![演示地址](https://img.shields.io/badge/%E6%BC%94%E7%A4%BA%E5%9C%B0%E5%9D%80-%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B-blue)](https://github.com/huanfenz/BookManagerByOracle#演示地址)	[![联系方式](https://img.shields.io/badge/%E8%81%94%E7%B3%BB%E6%96%B9%E5%BC%8F-%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B-green)](https://github.com/huanfenz/BookManagerByOracle#联系方式)

## 项目介绍

该项目和[huanfenz/BookManager: 基于springboot的图书管理系统 (github.com)](https://github.com/huanfenz/BookManager)基本一致。

但是数据库从MySQL调整成了Oracle，所以很多东西不赘述了。该文档主要分析一下Oracle版本与MySQL版本的改动。

## 环境介绍

| 名称      | 描述                                     |
| --------- | ---------------------------------------- |
| Java版本  | JDK 1.8.0                                |
| IDE工具   | IntelliJ IDEA 2021.2.1(Ultimate Edition) |
| 构建工具  | Maven 3.3.9                              |
| Web服务器 | SpringBoot内嵌的Tomcat                   |
| 数据库    | Oracle11g                                |

## 改动

1.   因为Oracle中不能用user作为表名，所以我在所有表名前面加上了前缀t_

![image-20211204152806971](http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202112041528019.png)

2.   尤其要注意，无论表名还是字段名，都不区分大小写。如果是导入的，工具可能会强行区分，然后给每个字段名都加上了双引号，非常不方便。所以最好就全部大写，然后用下划线分割。
3.   部分数据类型的长度标准不同（具体自行查阅），所以字符串类型的长度我都增加为2倍。
4.   Oracle没有Limit关键字，所以做分页就得另辟蹊径。我这里的做法是给每个结果集加上了一个rownum字段，该字段会自动加上序号，然后再用where筛选一下，如下。

```sql
select * from(
    select rownum rn, t_book_type.*
    from t_book_type
)
where rn - 1 between #{begin} and (#{begin} + #{size} - 1)
```

4.   Oracle没有主键自增的功能，需要用序列+触发器自己做一下，全部代码如下。

```sql
-- 图书信息bookid处理自增问题
create sequence seq_t_book_info
minvalue 1
maxvalue 99999999
start with 100
increment by 1
cache 50;

create or replace trigger "t_book_info_trig"
    before insert on t_book_info
    referencing old as old new as new for each row
declare
begin
    select seq_t_book_info.nextval into :new.bookid from dual;
end dept_trig;

-- 图书类型booktypeid处理自增问题
create sequence seq_t_book_type
minvalue 1
maxvalue 99999999
start with 100
increment by 1
cache 50;

create or replace trigger "t_book_type_trig"
    before insert on t_book_type
    referencing old as old new as new for each row
declare
begin
    select seq_t_book_type.nextval into :new.booktypeid from dual;
end dept_trig;

-- 借书记录borrowid处理自增问题
create sequence seq_t_borrow
minvalue 1
maxvalue 99999999
start with 100
increment by 1
cache 50;

create or replace trigger "t_borrow_trig"
    before insert on t_borrow
    referencing old as old new as new for each row
declare
begin
    select seq_t_borrow.nextval into :new.borrowid from dual;
end dept_trig;

-- 用户表userid处理自增问题
create sequence seq_t_user
minvalue 1
maxvalue 99999999
start with 100
increment by 1
cache 50;

create or replace trigger "t_user_trig"
    before insert on t_user
    referencing old as old new as new for each row
declare
begin
    select seq_t_user.nextval into :new.userid from dual;
end dept_trig;
```

差不多就改动这些了。

## 演示地址

Oracle版和MySQL版功能完全一致，所以演示中还是使用MySQL数据库。

项目演示地址：http://47.97.104.230:8092/BookManager/

管理员账号`admin`，密码`admin`

读者账号`wangpeng`，密码`123456`

>   注意：请试用时尽量不要影响到原有的记录。

## 联系方式

我的博客地址：[个人博客](http://huanfenz.top)，[CSDN博客](https://blog.csdn.net/qq_34245098?spm=1000.2115.3001.5343)。欢迎大家来踩。

我的联系方式，欢迎联系我：

*   邮箱：`huanfenz@qq.com`
*   QQ：`894176237`





