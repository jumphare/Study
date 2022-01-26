--2022.01.26 (��)
--
--DDL(Date Definition Language: ������ ���Ǿ�)
-- - create: ���̺� ���� (����)
-- - alter: ���̺� ���� ����
-- - rename: ���̺� �̸� ����
-- - drop: ���̺� ����
-- - trincate: ������ ����

--���̺� ��� �˻�
select * from tab;
select * from user_tables; --������ ��ųʸ� �̿� - �� �ڼ��� ����

--1. create
--������Ÿ��
--      - ���� ������
--         number(n) : ���� n�ڸ����� ���� ( �ִ� 38)
--         number(n1, n2) : n1=��ü �ڸ���, n2=�Ҽ��� �ڸ���
--      - ���� ������
--         char(): ���� ���� ������   �ִ� 2000byte
--         varchar2(): ���� ���� ������   �ִ� 4000byte
--         long : �ִ� 2GB -> �˻� ��� �������� ����
--      - ���� ������
--         date: ��/��/��
--         timestamp: ��/��/�� ��:��:��

create table emp01(empno number(4), ename varchar2(20), sal number(7,2));
select * from emp02;

--���������� ���̺� ���� : ���纻 ���̺� ���� (��, ���������� ������� ����)
create table emp02 as select * from emp; 
--���ϴ� �÷����� ������ ���纻 ���̺�
create table emp3 as select empno, ename from emp;
select *from emp05;
 create table emp05 as select * from emp where 1=0;
 
 drop table emp3 purge; 
 
 desc emp01;
 
 --2.alter
 -- 01. �÷� �߰� (add)
 alter table emp01 add(job varchar2(10), passwd varchar2(2));
 -- 02. �÷� ���� : �÷��� �����Ͱ� ������ ������ Ÿ��, �÷� ũ�� ���� ���� / �����Ͱ� ������ ������ Ÿ�� ����Ұ�, �÷� ũ�� �� ũ�Ը� ����
 alter table emp01 modify(job varchar2(30));
 -- 03. �÷� ����
 alter table emp01 drop (passwd, job);
 
 --3. rename : ���̺�� ����
 rename emp01 to test;
 select *from tab;
 
 --4. truncate: ���̺� ������ ����
 truncate table emp02;
 
 --5. drop: ���̺� ���� ����
 drop table emp02; --oracle 10g���� �ӽ����̺�� ��ü (�巯����)
 drop table test01 purge;  --�̷��� ������ ����
 select * from tab;
 purge recyclebin;
 
 ----------------------------
-- * ����Ŭ�� ��ü
--  ���̺�, ��, ������, �ε���, ���Ǿ�, ���ν���, Ʈ����
--
--
--* ������ ��ųʸ��� ������ ��ųʸ� ��
--
--  - ������ ��ųʸ� �� : user_xxxx
--     (���� ���̺�)          all_xxxx
--		                          dba_xxxx
--
--  - ������ ��ųʸ�(�ý��� ���̺�) : ��(���� ���̺�)�� �̿��� ����, ���� Ȯ���� �� ����
select *from tab; --�⺻���� ���̺� ����
select * from user_tables; --�ڼ��� ���̺� ����
select * from all_tables; --�ڱ� ���� �Ǵ� ���� �ο����� ���̺��� ����
select * from dba_tables; --���� �߻� -- �ֳĸ� dba����(sys, system)���θ� ��� ������ --�׸��� ��� ���������̶� ��ǻ� ��� ���̺� �� �����ִ°���

----------------------------------------
--DML(Data Manipulation Language: ������ ���۾�)
--1. insert : ������ �Է�
--
drop table dept01 purge;

create table dept01 as select * from dept where 1=0;
select * from dept01;

insert into dept01(deptno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept01 values(20, 'RESEARCH','DALLAS');
insert into dept01 values(30, '������','����');

--null�� �Է�
insert into dept01(deptno, dname) values (40, '���ߺ�');
insert into dept01 values(50, '��ȹ��', null);

drop table dept02 purge;

create table dept02 as select * from dept where 1=0;
select * from dept02;

--���������� ������ �Է�
insert into dept02 select * from dept; --dept �˻��ؼ� ��ü ������(*) ����ؼ� insert�ض� into dept02��
insert into dept02 select * from dept02; --�� ������ ������ ��������� �� �辿 ������ �Ʒ��� ��� �߰����״ϱ�... += ���� ����

-- insert all -> ���� ���̺� ������ �Է�
create table emp_hir as select empno, ename, hiredate from emp where 1=0;
create table emp_mgr as select empno, ename, mgr from emp where 1=0;

insert all
into emp_hir values(empno, ename, hiredate)
into emp_mgr values(empno, ename, mgr)
select empno, ename, hiredate, mgr from emp where deptno=20;

select*from emp_hir;
select*from emp_mgr;


--2. update : ������ ����

create table emp01 as select*from emp; --���� �����ϱ� �����ͱ��� �� �۰�
select * from emp01;

update emp01 set sal=sal*1.1;

create table emp02 as select*from emp; 

update emp02 set sal=sal*1.1 where sal>=3000;

update emp02 set hiredate=sysdate where substr(hiredate,1,2)='87'; --hiredate�� ���� �����ؼ� 87�̶� ������ �Ի糯¥ �ý��۳�¥�� ����

select*from emp02;

--scott �Ի��� ���÷�, �޿� 50����, Ŀ�̼� 4000����

update emp02 set hiredate=sysdate, sal=50, comm=4000 where ename='SCOTT';

