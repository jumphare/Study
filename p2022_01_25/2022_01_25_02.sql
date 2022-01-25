--2022.01.25 (ȭ)

--����
--: �� �� �̻��� ���̺��� ������ �� ���� ���Ƿ� ���ϴ� ������ ���ؿ��� ��
--1-1. emp���� scott����� �μ���ȣ
select deptno from emp where ename='SCOTT'; --20
--1-2. dept���� 20�� �μ��� �μ���
select dname from dept where deptno=20;

--cross join
select*from dept,emp; --4*14=56 row ������ �˻�
--1. equi join� ����: ������ �÷��� �������� ����
select * from emp, dept where emp.deptno=dept.deptno;  --deptno�� �������� �� ���̺� ����
select ename,dname from emp, dept where emp.deptno=dept.deptno and ename='SCOTT'; --�����ؼ� SCOTT�� �μ����� ���
select emp.deptno, ename,dname from emp, dept where emp.deptno=dept.deptno and ename='SCOTT'; --�����÷�(deptno)�� ��� ���̺��� ������ �� ����ؾ���!

--���̺� ��Ī �ο�
--1. ���̺� ���� ��Ī�� �ο��� �������� ���̺�� ��� �Ұ� --> ������ ��Ī�� ���!
--2. ��Ī���� ��ҹ��� �������� ����
--3. �����÷�(deptno)�� ��Ī��.�����÷��� �������� ��� (d.deptno)
--4. �����÷��� �ƴ� ��(ename,dname)�� ��Ī�� ���� ���� (���̺�� ������ �Ͱ� ����)
select e.deptno, ename,dname from emp E, dept D where e.deptno=d.deptno and ename='SCOTT'; 

--2. non-equi join ������: ������ �÷� ���� �ٸ� ������ ����� ����
select ename, sal, grade from emp, salgrade where sal between losal and hisal;
--���� �÷� ���� �� ���̺��� ���� -> salgrade�� ������ ��������, �� sal�� ���ϴ� ������ �ش��ϴ� row�� ������
-- ���� ��� sal=800�̶�� salgrade�� losal=700�� hisal=1200 ������ ������ ��ġ�ϹǷ� �� ������ ��ġ�Ǵ� grade �÷��� ��(=1)�� sal=800�� row�� ���εǴ� ��

--3. self join : �� ���̺� ������ ����(�ڱ� �ڽŰ� ����)
select empl.ename, mger.ename from emp empl, emp mger where empl.mgr=mger.empno;
--���� ���̺��� �� ��Ī���� �и��� �����ϰ� �� ��Ī�� Į���� ��ġ���� ������
-- empl�� mgr�� mger�� empno�� �����ϴ� �� -> empl�� ����ȣ�� �ش��ϴ� ������ ���� �Ǵ� ��
-- KING�� mgr�� null�̹Ƿ� ��ġ�Ǵ� ���� ���� -> �����ϰ� ��µ�

--4. outer join�ܺ�����: ���� ������ �������� �ʴ� �����͵� ���
-- ���̺��� ������ �� ������ ���̺��� �����Ͱ� ������ �ٸ� ���̺��� �������� �ʴ� ���, ������ ���´�� �� ��½�Ű�� ��
-- ������ ������ ���� (+) �߰�
select empl.ename, mger.ename from emp empl, emp mger where empl.mgr=mger.empno(+);
--empl�� KING�� ����ȣ null�� ��ġ�Ǵ� mger�� ������� �������� ���� -> mger ���̺� (+) �پ����
select ename, d.deptno, dname from dept d, emp e where d.deptno=e.deptno(+) order by deptno;
-- dept�� 40�� �μ��� ��ġ�Ǵ� emp�� �μ���ȣ�� �������� ���� -> emp ���̺� (+) �پ�� ��


-----------------------------
--ANSI join
--ANSI(�̱� ǥ�� ��ȸ) ǥ�ؾȿ� ���� ������� join ���

--ANSI cross join
select *from emp cross join dept; --14*4=56�� row �˻�

--ANSI inner join
--inner join���� ������ ���̺� ���
-- ON���� ���� ���� ���
-- ��Ÿ ������ where�� ����
------SCOTT ����� �Ҽӵ� �μ����� ���
select ename, dname from emp inner join dept ON emp.deptno=dept.deptno WHERE ename='SCOTT';
-- INNER JOIN���� emp�� dept ���̺� ����
--ON ���� emp.deptno=dept.deptno ���� ���� ���
-- where�� ���ΰ� ���� ���� ��Ÿ ����( ename='SCOTT') ����
----ON�� �� �� �����ϰ� ǥ���ϱ�