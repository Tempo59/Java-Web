DROP DATABASE IF EXISTS oa_join;
CREATE DATABASE oa_join;
use oa_join;

drop table if exists dep;
-- 创建部门表
create table dep(
	depno int primary key auto_increment,
	dname varchar(20) not null,
	loc varchar(20)
);
DROP TABLE IF EXISTS location;
-- 地址表（部门）
create table location(
	id int primary key  auto_increment,
	tel varchar(20),
	constraint fk_dep_location foreign key(id) references dep(depno)
);
-- 添加数据
insert into dep values
(10,'ACCOUNTING','NEW YORK' ),                                              
(20,'RESEARCH','DALLAS' ),                                                  
(30,'SALES','CHICAGO'  ),                                                
(40,'OPERATIONS','BOSTON' );
insert into location values
(10,'110' ),                                              
(20,'1102' );
-- insert into dep set dname='',loc='';
-- 创建雇员表
drop table if exists emp;
create table emp(
	empno int primary key auto_increment,
	ename varchar(20),
	job varchar(10),
	mgr int,
	hired_date date,
	sal decimal(10,2) unsigned,
	comm smallint unsigned,
	depno int,
	constraint fk_dep_emp foreign key(depno) references dep(depno)
);
-- 添加测试数据
insert into emp values
(7369, 'SMITH', 'CLERK',7902, '1980-12-17', 800,NULL, 20),
(7499, ' ALLEN', 'SALESMAN', 7698, '1981-2-20',1600,300,30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-2-22', 1250,500,30),                          
(7566, 'JONES', 'MANAGER', 7839, '1981-4-2', 2975,NULL,20),                          
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-9-28', 1250, 1400,30),                         
(7698, 'BLAKE', 'MANAGER', 7839,'1981-5-1', 2850,NULL,30 ),                         
(7782, 'CLARK', 'MANAGER', 7839,'1981-6-9', 2450,NULL,10 ),                         
(7788, 'SCOTT', 'ANALYST ', 7566,'1987-4-19', 3000,NULL,20  ),                        
(7839, 'KING', 'PRESIDENT', NULL,'1981-11-17',5000,NULL,10 ),                        
(7844, 'TURNER', 'SALESMAN', 7698, '1981-9-18',1500,0,30),                          
(7876, 'ADAMS', 'LERK', 7788, '1987-5-23', 1100,NULL,20),                         
(7900, 'JAMES', 'CLERK', 7698, '1981-12-3', 950,NULL,30 ),                        
(7902, 'FORD', 'ANALYST', 7566, '1981-12-3', 3000,NULL,20),                          
(7934, 'MILLER', 'CLERK', 7782, ' 1982-1-23', 1300,NULL,10);
insert into emp values
(10001, '张无忌', 'CLERK', 10006, '1990-10-20', 5000, null, 10),
(10002, '杨逍', 'MANAGER', 10001, '1997-7-1', 4000,null, 10),
(10003, '谢逊', 'CLERK', null, '1990-10-20', 3800, 200, 10),
(10004, '韦一笑', 'SALESMAN', 10001, '1990-10-20', 3000, 100, 10),
(10005, '布袋和尚', 'SALESMAN', 10001, '2003-1-1', 3000, 100, 10),
(10006, '赵敏', 'MANAGER', null, '1992-10-20', 6000, 1000, 20),
(10007, '阿大', 'CLERK', 10001, '1990-10-20', 4900, null, 20),
(10008, '阿二', 'CLERK', 10001, '1997-7-1', 3700, 0, 20),
(10009, '鹿杖客', 'CLERK', 10006, '1981-12-3', 3500,null, 20),
(100010, '笔管翁', 'CLERK', 10006, '1981-12-3', 3500, null, 20);

SELECT * FROM dep;
SELECT * from emp;
SELECT count(1) FROM dep;
SELECT count(*) from emp;
-- 内连接
SELECT ename,job,hired_date,sal,comm,dname,loc FROM dep,emp;
SELECT ename,job,hired_date,sal,comm,dname,loc FROM dep INNER JOIN emp;
SELECT ename,job,hired_date,sal,comm,dname,loc FROM dep CROSS JOIN emp;

SELECT ename,job,hired_date,sal,comm,dname,loc 
FROM dep INNER JOIN emp
WHERE dep.depno = emp.depno;
-- 取别名
SELECT e.*,d.* 
FROM dep AS d INNER JOIN emp AS e
WHERE d.depno = e.depno;

-- 使用on作为连接条件
SELECT ename,job,hired_date,sal,comm,dname,loc 
FROM dep INNER JOIN emp
ON dep.depno = emp.depno;

-- 使用using作为连接条件
SELECT ename,job,hired_date,sal,comm,dname,loc 
FROM dep INNER JOIN emp
USING(depno);

-- 新入职员工，还不知道是哪个部门
insert into emp values
(100011, '王大锤', 'CLERK', 10006, '1990-10-20', 5000, null, NULL);

SELECT ename,job,hired_date,sal,comm,dname,loc 
FROM dep INNER JOIN emp
USING(depno);

-- 左外连接（如果负责连接的字段不真实存在，将保留左边的数据，右边连接不上置空处理）
SELECT ename,job,hired_date,sal,comm,dname,loc 
FROM emp LEFT OUTER JOIN dep
ON emp.depno = dep.depno;

insert into dep values
(50,'片源部','Lippo' );
-- 右外连接（如果负责连接的字段不真实存在，将保留右表的数据，左边连接不上置空处理）
SELECT ename,job,hired_date,sal,comm,dname,loc 
FROM emp RIGHT OUTER JOIN dep
ON emp.depno = dep.depno;

SELECT ename,job,hired_date,sal,comm,dname,loc 
FROM emp RIGHT OUTER JOIN dep
using(depno);


-- 自然连接（不需要指定连接条件，MYsql内部自己判断）
-- 自然内连接（相当于内连接使用using作为连接条件
SELECT ename,job,hired_date,sal,comm,dname,loc 
FROM emp NATURAL JOIN dep;

-- 自然左外连接
SELECT ename,job,hired_date,sal,comm,dname,loc
FROM emp NATURAL LEFT JOIN dep;
-- 自然右外连接
SELECT ename,job,hired_date,sal,comm,dname,loc
FROM emp NATURAL RIGHT JOIN dep;

SELECT ename,job,hired_date,sal,comm,dname,loc
FROM emp NATURAL RIGHT JOIN dep;
USE oa;

SELECT * from emp where depno IS NULL;
DELETE FROM dep WHERE depno = 20;

ALTER TABLE emp add CONSTRAINT fk_emp_dep FOREIGN KEY(depno) REFERENCES dep(depno)
ON UPDATE CASCADE
ON DELETE SET NULL;

