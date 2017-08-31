desc student;
DROP TABLE IF EXISTS course;
CREATE TABLE course(
	cou_id INT PRIMARY KEY auto_increment COMMENT '课程id，主键，自增长',
	cou_name VARCHAR(10) NOT NULL UNIQUE COMMENT '课程名称 唯一，非空的',
	cou_score TINYINT UNSIGNED DEFAULT 6
) auto_increment=1 CHARACTER SET=utf8;
SHOW CREATE TABLE course;
DESC course;
SHOW CREATE TABLE emp;
-- 插入数据(插入全部列）
INSERT INTO course(cou_id,cou_name,cou_score) VALUES (1,'C语言程序设计',5);
-- 插入指定列
INSERT INTO course(cou_name) VALUES ('数据库原理');
-- 使用set语句插入数据
INSERT INTO course SET cou_name='Java程序设计',cou_score=10;
-- 插入时如果没有指定列，那么表示列顺序插入值
INSERT INTO course VALUES (4,'数据库系统原理',5);
INSERT INTO course VALUES (DEFAULT,'HTML网页设计',DEFAULT);
INSERT INTO course VALUES (NULL,'CSS',DEFAULT);
INSERT INTO course VALUES (DEFAULT,'JAVAScript',NULL);
-- 插入多条数据
INSERT INTO course VALUES 
(DEFAULT,'javaEE',20),
(DEFAULT,'Ajax',2),
(DEFAULT,'Spring',10);

-- 查询全部信息（所有的列字段信息可以使用*通配符
SELECT * FROM course;
-- 查询指定列信息
SELECT cou_name,cou_score FROM course;
-- 使用投影（别名)
SELECT cou_name AS '课程名称' FROM course;
SELECT cou_name '课程名称',cou_score '学分' FROM course;
SELECT 1 + 100 FROM course;
-- 指定条件查询
SELECT cou_name,cou_score FROM course WHERE 1;
SELECT cou_name,cou_score FROM course WHERE cou_name='数据库原理';

-- 删除数据--删除所有
DELETE FROM course;	
DELETE FROM course WHERE 1;
DELETE FROM course WHERE cou_score < 6;
-- 清空表数据
TRUNCATE course;
SELECT * FROM course;

-- 修改操作
UPDATE course SET cou_score = 10;
UPDATE course SET cou_score = 10 WHERE 1;
UPDATE course SET cou_score = 20 WHERE cou_id = 1;