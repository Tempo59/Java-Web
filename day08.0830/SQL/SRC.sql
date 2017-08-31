-- �鿴MySQL�������������ݿ�
show databases;
-- ɾ��SRS���ݿ�
drop database if exists SRS;
-- ����ѧ��ѡ��ϵͳ(SRS)���ݿⲢָ��Ĭ���ַ���
create database SRS default charset utf8;
-- �л���SRS���ݿ�
use SRS;
-- �鿴��ǰ���ݿ������б�
show tables;
-- ����ѧ����
create table TbStudent
(
stuid integer not null,
stuname varchar(20) not null,
stusex bit default 1,
stubirth datetime not null,
stutel char(11),
stuaddr varchar(255),
stuphoto longblob,
primary key (stuid)
);
-- �޸�ѧ����ɾ��stutel��
alter table TbStudent drop column stutel;
-- �鿴ѧ����ṹ
desc TbStudent;
-- �����TbCourse�Ѿ����ھ�ɾ����
drop table if exists TbCourse;
-- �����γ̱�
create table TbCourse
(
cosid integer not null,
cosname varchar(50) not null,
coscredit tinyint not null,
cosintro varchar(255)
);
-- ���γ̱�ָ������
alter table TbCourse add constraint pk_course primary key (cosid);
-- ����ѧ��ѡ�μ�¼��
create table TbSC
(
scid integer primary key auto_increment,
sid integer not null,
cid integer,
scdate datetime not null,
score float
);
-- ����TbSC������Լ��
alter table TbSC add constraint fk_sid foreign key (sid) references TbStudent (stuid) on delete cascade on update cascade;
alter table TbSC add constraint fk_cid foreign key (cid) references TBCourse (cosid) on delete set null on update cascade;
-- ���ѧ����¼
insert into TbStudent values (1001, '������', default, '1978-1-1', '�ɶ���һ��·������17��', null);
insert into TbStudent (stuid, stuname, stubirth) values (1002, '����', '1980-2-2');
insert into TbStudent (stuid, stuname, stusex, stubirth, stuaddr) values (1003, '����', 0, '1982-3-3', '�ɶ��ж���·���Ķ�123��');
insert into TbStudent values (1004, '���޼�', 1, '1990-4-4', null, null);
insert into TbStudent values 
(1005, '�𴦻�', 1, '1983-5-5', '�����к�������ʢ��������28��', null),
(1006, '����һ', 1, '1985-6-6', '�����б������������5010��', null),
(1007, '������', 1, '1987-7-7', '֣���н�ˮ��γ��·21��', null),
(1008, '�ﲻ��', 0, '1989-8-8', '�人�й�ȴ��61��', null),
(1009, 'ƽһָ', 1, '1992-9-9', '������������������·52��', null),
(1010, '�ϲ���', 1, '1993-10-10', '�����������Ԫ��·310��', null);
insert into TbStudent values 
(1011, '����', 0, '1994-11-11', null, null),
(1012, '��������', 1, '1995-12-12', null, null),
(1013, '��Х��', 1, '1977-10-25', null, null);
-- ɾ��ѧ����¼
delete from TbStudent where stuid=1004;
-- ����ѧ����¼
update TbStudent set stubirth='1980-12-12', stuaddr='�Ϻ��б�ɽ��ͬ��֧·199��' where stuid=1002;
-- ��ӿγ̼�¼
insert into TbCourse values 
(1111, 'C���Գ������', 3, '���񼶽�ʦ�ڿ���Ҫ����'),
(2222, 'Java�������', 3, null),
(3333, '���ݿ����', 2, null),
(4444, '����ϵͳԭ��', 4, null);
-- ���ѧ��ѡ�μ�¼
insert into TbSC values 
(default, 1001, 1111, '2016-9-1', 95),
(default, 1002, 1111, '2016-9-1', 94),
(default, 1001, 2222, now(), null),
(default, 1001, 3333, '2017-3-1', 85),
(default, 1001, 4444, now(), null),
(default, 1002, 4444, now(), null),
(default, 1003, 2222, now(), null),
(default, 1003, 3333, now(), null),
(default, 1005, 2222, now(), null),
(default, 1006, 1111, now(), null),
(default, 1006, 2222, '2017-3-1', 80),
(default, 1006, 3333, now(), null),
(default, 1006, 4444, now(), null),
(default, 1007, 1111, '2016-9-1', null),
(default, 1007, 3333, now(), null),
(default, 1007, 4444, now(), null),
(default, 1008, 2222, now(), null),
(default, 1010, 1111, now(), null);
-- ��ѯ����ѧ����Ϣ

-- ��ѯ���пγ����Ƽ�ѧ��(ͶӰ�ͱ���)

-- ��ѯ����Ůѧ���������ͳ�������(ɸѡ)

-- ��ѯ����80��ѧ�����������Ա�ͳ�������(ɸѡ)
-- ����һ��

-- ������

-- ��ѯ������ѧ���������Ա�(ģ��)

-- ��ѯ�չ������ܹ������ֵ�ѧ��������(ģ��)

-- ��ѯ�չ������ܹ������ֵ�ѧ��������(ģ��)

-- ��ѯ�����������ֵ�ѧ��������(ģ��)

-- ��ѯû��¼���ͥסַ����Ƭ��ѧ������(������ɸѡ�Ϳ�ֵ����)

-- DESC tbstudent;
-- ��ѯѧ��ѡ�ε���������(ȥ��)

-- ��ѯѧ�������������հ�����Ӵ�С����(����)

-- ��ѯ����¼���˼�ͥסַ����ѧ�����������������ںͼ�ͥסַ�������С��������(������ɸѡ������)

-- ��ѯ��������ѧ���ĳ�������(�ۺϺ���)

-- ��ѯ������С��ѧ���ĳ�������(�ۺϺ���)

-- ��ѯ��Ůѧ��������(����;ۺϺ���)

-- ��ѯ�γ̱��Ϊ1111�Ŀγ̵�ƽ���ɼ�(ɸѡ�;ۺϺ���)

-- ��ѯѧ��Ϊ1001��ѧ�����пγ̵��ܳɼ�(ɸѡ�;ۺϺ���)

-- ��ѯƽ���ɼ����ڵ���90�ֵ�ѧ����ѧ�ź�ƽ���ɼ�



-- ��ѯ��������ѧ��������(�Ӳ�ѯ)

-- ��ѯѡ���������ϵĿγ̵�ѧ������(�Ӳ�ѯ/��������/��������)

-- ��ѯѡ��ѧ����������ƽ���ɼ�(�Ӳ�ѯ�����Ӳ�ѯ)
-- д��1:

-- д��2: 

-- ��ѯѧ����������ѡ�γ����ƺͳɼ�(���Ӳ�ѯ)
-- д��1:

-- д��2:

-- ��ѯÿ��ѧ����������ѡ������(�������Ӻ��Ӳ�ѯ)


