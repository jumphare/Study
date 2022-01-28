--2022.01.28 (��)
--01�� ������ ���� ������ ���� ������

--��view: �⺻ ���̺��� �̿��� ������� ���� ���̺�
--dept_copy, emp_copy ����
create table dept_copy as select *from dept;
create table emp_copy as select *from emp;

--�� ����
create view emp_view30 as select empno, ename, deptno from emp_copy where deptno=30;
--insufficient privileges ����. ���̺� ����� ������ ���� ������ (scott)
------> sys �������� scott ������ ���̺� ���� ������ �ο��ؾ�...
-- ���ϱ� �ϴ� ����ϰ� select�� ���̺� �˻��ϴ� ���� ����� create view ���̸� as �ڿ� ���̸� �Ǵ°Ͱ���

select *from tab;
select *from user_views;
select *from emp_view30;

-- �信 insert�� �����͸� �߰��� ��� �⺻ ���̺�(emp_copy)���� ���� �߰��Ǵ���?
--insert
insert into emp_view30 values(1111, '������',30);

select*from emp_view30;
select*from emp_copy; --�� �߰��ǳ׿�

-- �� ����
--1. �ܼ� �� Simple view : �ϳ��� �⺻ ���̺�� ������ ��
-- emp_copy�� �̿��� 20�� �μ� �Ҽ� ������� empno, ename, deptno, mgr ����ϴ� ��(emp_view20)
create view emp_view20 as select empno, ename, deptno, mgr from emp_copy where deptno=20;
select*from emp_view20;
--2. ���� �� Complex view
--�� �μ� ��(�μ������� ǥ��) �ִ�޿��� �ּұ޿��� ����ϴ� �� (sal_view)
--emp�� dept �����ϰ� �μ����� �׷�ȭ�ϰ� �� �ִ�, �ּұ޿� �����
create view sal_view as
select dname, max(sal) MAX, min(sal) MIN from emp_copy natural join dept_copy group by dname;
-- �ƴϸ� from emp_copy, dept_copy where dept.deptno=dept_copy.deptno group by dname; ����ε� ����
select*from sal_view;

--�ɼ�
--1. or replace
--�䰡 �������� ������ ����insert, �䰡 �����ϸ� ������ ����update
----- �ɼ� ���� �̸� ���� �� ����(emp_view30)
create view emp_view30 as select empno, ename, deptno, sal, comm from emp_copy where deptno=30;
----- �ɼ� �߰� �����ڰ�
create or replace view emp_view30 as select empno, ename, deptno, sal, comm from emp_copy where deptno=30;

select *from user_views;

--2. with check option
--where �������� ���� ���� ������ �� ������ ����
-----�ɼ� ��
create or replace view emp_view30 as select empno, ename, deptno, sal, comm from emp_copy where deptno=30;
select*from emp_view30;
------> �޿��� 1200�� ������� �μ���ȣ�� 30���� 20���� �ٲ�
update emp_view30 set deptno=20 where sal>=1200;
---------> 1200 �Ѵ� ����� �μ���ȣ �ٲ�鼭~ view���� �Ⱥ��̰� �� �� where ���� �����ż� ��� ������ �ٲ� ����

-------�ɼ� ��
create or replace view emp_view_chk30 as
select empno, ename, deptno, sal, comm from emp_copy where deptno=30 with check option;
select*from emp_view_chk30;
update emp_view_chk30 set deptno=20 where sal>=1200;

--3. with read only
--�並 ���ؼ��� �⺻ ���̺��� � �÷��� ������ ������ �� ���� ���� �д� �͸� ����
create or replace view view_read30 as
select empno, ename, sal, comm, deptno from emp_copy where deptno=30 with read only;
select*from view_read30;
update view_read30 set sal=3000;

----------------------------------------------
--rownum �÷�
--1. �������� ���� ������ ������ �ִ� ������ �÷�
--2. 1������ ���� ---> order by�� �����ص� ���� �ٲ��� ���� (�����ؼ� ������ �ٲ�ٰ� ��ȣ �ٲ�°� �ƴ϶� �Ҹ�)
--3. rownum ���� �����ϱ� ���ؼ��� ���̺��� ��°�� �����ؾ� ��

select rownum, ename, sal from emp order by sal desc;


--������̺��� �Ի����� ����(������) 5�� ---> �Ի��� ���� �������� (���� ���� ����) 
select empno, ename, hiredate from emp order by hiredate asc;
--�� ����
create or replace view hire_view as select empno, ename, hiredate from emp order by hiredate asc;
--�Ի��� ���� ��� 5�� ���
select rownum, empno, ename, hiredate from hire_view;   ---rownum �ٲ������ (���̺��� view�� �ٲ���� ����)
select rownum, empno, ename, hiredate from hire_view where rownum<=5;
--�ζ��� �� (=���������� ������� ��)
--�Ի����� ���� ��� 5�� ���
select rownum, ename, hiredate from (
    select empno, ename, hiredate from emp order by hiredate asc) where rownum<=5;

--�Ի����� 3~5��° �������
select rnum, ename, hiredate from(select rownum rnum, board.* from (select * from emp order by hiredate) board)
where rnum between 3 and 5;

--empno�� ���� ��� 5�� 
select rownum, empno, ename from(select empno, ename from emp order by empno) where rownum<=5;
--empno�� 3~5��°�� ���
select rnum, empno, ename from(select rownum rnum, board.* from (select *from emp order by empno) board)
where rnum between 3 and 5;

create or replace view empno_view as select empno, ename from emp order by empno;
select rownum, empno, ename from empno_view where rownum<=5;

-- emp���� �޿��� ���� �޴� ��� 5��
select rownum, ename, sal from (select * from emp order by sal desc) where rownum<=5;

create or replace view maxsal_view as select ename, sal from emp order by sal desc;
select rownum, ename, sal from maxsal_view where rownum<=5;

--emp���� �޿��� 3~5��°�� �޴� ���
select rnum, ename, sal from (
    select rownum rnum, ename, sal from (   --rownum�� ���� ��Ī �ο��� ���� ù��° ��������
        select *from emp order by sal desc) ) --���� ���������� �ι�°�� �Է�
            where rnum<=5 and rnum>=3;  --��Ī �ο��� �� ��Ī���� ���� ������ ��µ�
--�÷����� �����ϰ� ó�� (�÷��� �̳� ���� �� ������...)
select rnum, ename, sal from(
    select rownum rnum, board.* from ( --��Ī ������ rownum ���� ��� �÷��� *�� ����
        select*from emp order by sal desc) board ) --�ι�° �������� ��ü�� ��Ī���� ����
            where rnum>=3 and rnum<=5;

