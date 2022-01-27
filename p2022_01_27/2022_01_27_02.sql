--2022.01.27 (��)

--TCL
--commit:Ʈ����� ����
--rollback: Ʈ����� ���
--savepoint : �������� ����

drop table dept01 purge;
create table dept01 as select*from dept;
select*from dept01;

--rollback : Ʈ����� ��� -> ������ ����
delete from dept01;
rollback;

--commit : Ʈ����� ����
delete from dept01 where deptno=20;
commit;
rollback; --commit���� ����Ȱ� �ѹ� �ȵ�

--�ڵ� Ŀ��
--1 �������� ����: quit, exit..
--2 DDL, DCL ���� 

--��. DDL ��� ���� create
delete from dept01 where deptno=40;

create table dept03 as select*from dept;  -- DDL ��� ���� -- �̽������� �ڵ� commit -- Ʈ����� ��� ����

rollback;  --�ѹ��ص� 40 ������ ���� ������ �翬�� Ŀ�������ϱ�

select*from dept01;

--���̺�����Ʈ
select*from dept03;

delete from dept03 where deptno=40;
commit;
delete from dept03 where deptno=30;
savepoint c1;
delete from dept03 where deptno=20;
savepoint c2;
delete from dept03 where deptno=10;
--rollback�� ���� �ֱٿ� ������ �������� �Ž��� �ö󰡸鼭 �����ؾ� ��
rollback to c2; -- c2���� ����
rollback to c1;
rollback; --�� Ʈ����� ���۵� �������� ����

select * from dept03;

------------------------
-- ���Ἲ ��������
-- ���̺� �������� �����Ͱ� �ԷµǴ� ���� �����ϱ� ����, ���̺��� ������ �� �� �÷��� ���� �����ϴ� �������� ��Ģ

--1. not null :  �ݵ�� ���� �Է��ؾ� �Ѵ� (null�� ������� �ʴ´�)
drop table emp02 purge;
select*from tab;
select*from emp02;

create table emp02( empno number(4) not null,
                              ename varchar2(12) not null,
                              job varchar2(12),
                              deptno number(2));

--�������ǿ� ������� �ʴ� ������ �Է�
insert into emp02 values(1111, 'REMUS', 'MANAGER','10');
--�������ǿ� ����Ǵ� ������ �Է�
insert into emp02 values(null, null, 'MANAGER','10');

--2. unique : ������ ���� �Է��� �� �ִ� 
drop table emp03 purge;
select*from tab;
select*from emp03;

create table emp03( empno number(4) unique,
                              ename varchar2(12) not null,
                              job varchar2(12),
                              deptno number(2));
                              
--�������ǿ� ������� �ʴ� ������ �Է�
insert into emp03 values(1111, 'SIRIUS', 'MANAGER',10);
--�������ǿ� ����Ǵ� ������ �Է�
insert into emp03 values(1111, 'SIRIUS', 'MANAGER',10);
--unique�� null �� �Է�
insert into emp03 values(null, 'REMUS', 'MANAGER','10');

--3. primary key (�⺻Ű): not null+unique = �ߺ����� �ʰ�, null�� �ƴϾ�� �� ---- row �ĺ���
select*from dept;

--unique �������� ���� (�ߺ�)
insert into dept values(10, '����', '����');
--not null �������� ���� (null)
insert into dept values(null, '����', '����');

create table emp05( empno number(4) primary key,
                              ename varchar2(12) not null,
                              job varchar2(12),
                              deptno number(2));
select*from emp05;
insert into emp05 values(1111, 'REMUS', 'MANAGER',10); --������ ������ �Է�
insert into emp05 values(1111, 'SIRIUS', 'MANAGER',20); --�ߺ� �Ұ�
insert into emp05 values(null, 'JAMES', 'MANAGER',30); --null �Ұ�


--�������Ǹ� ���
create table emp04( empno number(4) constraint emp04_empno_uk unique,
                              ename varchar2(12) constraint emp04_ename_nn not null,
                              job varchar2(9),
                              deptno number(2));
 desc emp04;                             
insert into emp04 values(1111, 'REMUS', 'MANAGER',10); --������ ������ �Է�
insert into emp04 values(1111, 'SIRIUS', 'MANAGER',20); --�ߺ� �Ұ�
