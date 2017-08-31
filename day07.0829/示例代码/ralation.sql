CREATE DATABASE test;
USE test;
CREATE TABLE person(
	per_id int auto_increment PRIMARY KEY,
	per_name varchar(10) NOT NULL
);
CREATE TABLE id_card(
	card_id INT auto_increment PRIMARY KEY,
	card_no CHAR(18)
);
ALTER TABLE id_card ADD per_id INT;
ALTER TABLE id_card ADD CONSTRAINT fk_card_person FOREIGN KEY(per_id) REFERENCES person(per_id);
ALTER TABLE id_card MODIFY per_id INT UNIQUE;

INSERT INTO person VALUES(DEFAULT,'张三丰'),(DEFAULT,'李四民');
INSERT INTO id_card VALUES(DEFAULT,'500110199610209527',1);
SELECT * FROM id_card;

SHOW CREATE TABLE id_card;

CREATE TABLE student(
	stu_id int auto_increment PRIMARY KEY,
	stu_name varchar(10) not null,
	stu_no char(11) NOT NULL UNIQUE
);
-- 	从表主键引用主表的主键（主外键约束）：从表主键依赖于主表主键
CREATE TABLE student_info(
	info_id INT PRIMARY KEY,
	addr varchar(30),
	phone varchar(11),
	gender enum('female','male'),
	CONSTRAINT fk_info_student FOREIGN KEY(info_id) REFERENCES student(stu_id)
);
INSERT INTO student VALUES(DEFAULT,'华胜','9527'),(DEFAULT,'华安','9528');
SELECT * FROM student;
INSERT INTO student_info(info_id,	phone) VALUES(1,'9090910');

--  1:M ===============【部门员工】
CREATE TABLE dep(
	dep_id INT auto_increment PRIMARY KEY,
	dep_name VARCHAR(20) NOT NULL,
	dep_date date,
	dep_addr varchar(50)
);

CREATE TABLE emp(
	emp_id INT PRIMARY KEY auto_increment,
	emp_name varchar(20),
	dep_id INT,
	CONSTRAINT fk_emp_dep FOREIGN KEY(dep_id) REFERENCES dep(dep_id)
);
INSERT INTO dep VALUES (DEFAULT,'技术支持部','2010-10-20','CD-Lippo'),
(DEFAULT,'片源部','2010-10-20','CD-Lippo');
INSERT INTO emp VALUES(DEFAULT,'张三丰',NULL),
(DEFAULT,'韦一笑',2),(DEFAULT,'张无忌',2);
SELECT * FROM emp;