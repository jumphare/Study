--2022.01.21 (��)

--���̺� ���
select *from tab;

--dept ������ �˻�: SQL���� ��/�ҹ��ڸ� �������� ����
select*from dept;

--dept ���̺� ����
describe dept;

--emp ���̺� ����
describe emp;

--emp ���̺� ������ �˻�
select * from emp;

--����Ŭ�� ������ Ÿ��
--1. ���� ������
    --number(n): n�ڸ� ���ڱ��� ����
    --number(n1,n2): n1 ��ü�ڸ���, n2 �Ҽ��� �ڸ���
--2. ���� ������
    --char(): ���� ���� ������ -> �ִ� 2000byte ���� ����
    --varchar2(): ���� ���� ������ -> �ִ� 4000byte ���� ����
    --long: �ִ� 2GB ���� ���� (�����Ͱ� �ʹ� Ŀ�� long�� column�� �˻� ����� �������� ����)
--3. ��¥ ������
    --date: ��/��/�� ���� ����
    --timestamp: ��/��/�� + ��:��:�� ���� ����

-- select Ư�� �÷��� �˻��ϰ� ������ �÷��� ���, ��ü �˻� �� *
 select loc, deptno, dname from dept;
 
 --��� ������ + - * /
 select sal+comm from emp;
 select * from emp;
 
 --���� ��� ---> �޿�(sal)*12+Ŀ�̼�(comm)
 select ename, sal, nvl(comm,0),sal*12+nvl(comm,0) "����AnN��" from emp;
 -- NVL(Į����, ��ȯ��): �÷��� null���� ������ ������ ��ȯ ex. NVL(comm,0)
 -- ��Ī �ο�: (as) "��Ī��"    // �ѱ�, ��ҹ���, Ư������, ���� �� ����
 -- �ֵ���ǥ ���� ��� ����빮�ڷθ� ��µ�
 
 --concatenation������ || : ���� �÷��� ���ڿ��� ������ �� ���
 select ename || ' is a ' || job from emp;
 
 --distinct : �ߺ��� �����ϰ� �ѹ��� ������
 
 select distinct deptno from emp;
 select deptno from emp;
 
 --emp ���̺��� ����� job�� �ѹ��� ���
 select distinct job from emp;

--count(�÷���): ������ ���� ���ϱ�
 select count(*) from emp;                  --14
 select count(job) from emp;               --14
 select count(distinct job) from emp;   --5 

 --where ������ (�� �����ڸ� �����)
 
 --1 ���� ������ �˻�
   --ex. emp���� sal 3000 �̻��� ��� �˻�
 select * from emp where sal>=3000;
  --ex. emp���� sal 1500������ ����� �����ȣ, �����, �޿� ���
  select empno, ename, sal from emp where sal<=1500;
  
 --2 ���� ������ �˻�
 -- 1) �˻� �� ��ҹ��� ����
 -- 2) �˻� �� �ܵ���ǥ (')
 select *from emp where ename='ford'; --��� ����
 select *from emp where ename='FORD'; --FORD�� row �˻�
  --ex. SCOTT ����� �����ȣ, �����, �޿� ���
 select empno, ename, sal from emp where ename='SCOTT';
 
 --3 ��¥ ������ �˻�
-- 1) �˻� �� ��¥ �¿쿡 �ܵ���ǥ (')
-- 2) �� �� �� ������ ���
 --ex. 1982�� 1�� 1�� ���� �Ի��� ��� �˻�
 select * from emp where hiredate>='1982/01/01' order by hiredate asc;
 
 --��������: and, or, not
 --ex. 10�� �μ� �Ҽ�'�̰�' ������ MANAGER�� ����� �����, �μ���ȣ, ������ ���
 select*from emp where deptno=10 and job='MANAGER';
 -- 10�� �μ� �Ҽ�'�̰ų�' ������ MANAGER�� ����� �����, �μ���ȣ, ������ ���
  select*from emp where deptno=10 or job='MANAGER';
  --10�� �μ� �Ҽ��� '�ƴ�' ����� �����, �μ���ȣ, ������ ���
    select*from emp where not deptno=10;
 --�޿��� 2000~3000 ������ ���
  select*from emp where sal>=2000 and sal<=3000;
   select*from emp where sal between 2000 and 3000;  --between and
-- 1987�⿡ �Ի��� ���
 select*from emp where hiredate between '87/01/01' and '87/12/31';
 --87�⿡ �Ի����� ���� ���
  select*from emp where hiredate not between '87/01/01'and '87/12/31';
  
  --Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ���
  select*from emp where comm=300 or comm=500 or comm=1400;
  select*from emp where comm in(300,500,1400); --in() ������ �ʵ忡 ���� or ������ ������ ��
  --Ŀ�̼��� 300,500,1400�� �ƴ� ���
   select*from emp where comm not in(300,500,1400);
   
   --Like ������
   -- %
    select*from emp where ename like '%A%'; -- A�� ���ԵǴ� �̸��̶�� �� ���
    -- _
     select*from emp where ename like '%E_'; --������ �ι�°�� E�� �̸� ���
    
    select*from emp where ename not like '%A%'; -- ����� A�� ���Ե��� �ʴ� ���
    
    
    --����1 emp���� hiredate 4�ڸ� ������ ���
         select '19'||hiredate from emp;
         select to_char(hiredate, 'YYYY/MM/DD') from emp;
    --����2 MGR�� ���� null�� �����͸� CEO�� ���
        select nvl(to_char(mgr),'CEO') from emp;
        select nvl(''||mgr,'CEO'||mgr) from emp;