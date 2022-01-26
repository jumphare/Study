--2022.01.26 (��)

-- * ANSI Join : ANSI(�̱� ǥ�� ��ȸ) ǥ�ؾȿ� ���� ������� join ���
-- ANSI outer join

create table dept01( deptno number(2), dname varchar2(14));
insert into dept01 values(10, 'ACCOUNTING');
insert into dept01 values(20, 'RESEARCH');
select * from dept01;

create table dept02( deptno number(2), dname varchar2(14));           
insert into dept02 values(10, 'ACCOUNTING');
insert into dept02 values(30, 'SALES');
select * from dept02;

--------- dept01�� dept02�� ������ ��, �����÷� deptno���� ��ġ�Ǵ� ���� 10�� �μ� 'ACCOUNTING' �ۿ� ����
--------- dept01�� 20�� �μ��� ����ϰ� �ʹٸ� LEFT OUTER JOIN (01 ���̺��� ���ʿ� �����ϱ�)
select * from dept01 left outer join dept02 using (deptno);
--------- dept02�� 30�� �μ��� ����ϰ� �ʹٸ� RIGHT OUTER JOIN (02 ���̺��� �����ʿ� ����)
select * from dept01 right outer join dept02 using (deptno); 
--------- ���� ���̺��� �μ��� ��� ����ϰ� �ʹٸ� FULL OUTER JOIN
select * from dept01 full outer join dept02 using (deptno) order by deptno;

--------------------------------
-- ��������
--   : �ϳ��� select ������ �� �ȿ� �Ǵٸ� select ������ �����ϴ� �� (�������� ���ο� ���������� ����)
--   : �񱳿������� �����ʿ�(�񱳰� �Ǵ� ������ �Ǿ�� �ϹǷ�), ��ȣ�� �̿��� �ϳ��� ���� ��ġ

-- SCOTT ����� �Ҽӵ� �μ����� ���
--������ �ι� �Ϸ��� emp ���̺��� SCOTT�� �μ���ȣ�� ���ϰ� -> dept ���̺��� �� �μ���ȣ�� �ش��ϴ� �μ����� ����ؾ� ��
--01. ���� ���
select dname from emp natural join dept where ename='SCOTT'; --natural join
select dname from emp, dept where emp.deptno=dept.deptno and ename='SCOTT'; --equi join
select dname from emp inner join dept on emp.deptno=dept.deptno where ename='SCOTT'; --inner join ~ on
select dname from emp inner join dept using(deptno) where ename='SCOTT'; --inner join ~ using
--02. �������� ���
select dname from dept where deptno=(select deptno from emp where ename='SCOTT');

--1. ������ ��������
-- 01. ���������� �˻� ����� �ϳ�
-- 02. ���� ������ where ���������� �񱳿����ڷ� ��� ����
-- ������̺��� ���� �ֱٿ� �Ի��� ����� ���
 select ename from emp where hiredate=(select max(hiredate) from emp);
-- ��� ���̺��� �ִ� �޿��� �޴� ������ �ִ� �޿� �ݾ��� ���
select ename, sal from emp where sal=(select max(sal) from emp);
-- mgr�� king�� ����� ������ �޿��� ���
select ename, sal from emp where mgr=(select empno from emp where ename='KING');

--2. ������ ��������
-- 01. ������������ ��ȯ�Ǵ� �˻� ����� �� �̻�
-- 02. ���� ������ where ���������� ������ ������ ��� ���� -> IN, ANY/SOME, ALL, EXIST

------ IN ������ : ���� ������ �� ���ǰ� �������� �˻� ����� �ϳ��� ��ġ�ϸ� �� (or ������)
--3000 �̻��� �޿��� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ������ ���
----------> 3000 �̻� �޿� �޴� ����� deptno�� ��ġ�ϴ� ������� ���!!!!!!!!!!!!
select deptno from emp where sal>=3000; --3000 �̻��� ����� �μ���ȣ ���
select * from emp where deptno in (select deptno from emp where sal>=3000) order by deptno;

------ ALL ������ : ���� ������ �� ������ �������� �˻� ����� ��� ���� ��ġ�ϸ� �� (and ������)
--30�� �μ� �Ҽ� ��� �� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� ���
--������
select ename, sal from emp where sal> (select max(sal) from emp where deptno=30);
--������
select ename, sal from emp where sal > all (select sal from emp where deptno=30);
-- ������ �ڿ� all�� �������� ������ -> ���ǿ����ڰ�, ������������ ���� ��� ������ Ŀ�� �Ѵٴ� ������ �� -> �ִ밪���� �翬�� Ŀ���� -> ���� ���

------ ANY ������ : ���� ������ �� ������ �������� �˻� ����� ���� �ϳ� �̻� ��ġ�ϸ� �� (in���� ������ all���� ������)
-- �μ���ȣ 30���� ����� ���� ���� �޿�(950)���� ���� �޿��� �޴� ��� ���
--������
select ename, sal from emp where sal > (select min(sal) from emp where deptno=30);
--������
select ename, sal from emp where sal > any (select sal from emp where deptno=30);
-- any�� �������� ������ -> ������������ ���� ��� ���� �ϳ� �̻� �����ؾ� -> �ּҰ����� ������ �ϳ��� �������� ���� 


-------------------------------