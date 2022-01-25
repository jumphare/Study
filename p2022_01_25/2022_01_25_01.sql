--2022.01.25 (ȭ)

--����ȯ �Լ�
--to_char(): ���������� ��ȯ
--1-1. ��¥�� ���ڷ�
select sysdate, to_char(sysdate, 'YYYY/MM/DD DY') from dual;
select sysdate, to_char(sysdate, 'HH24:MI:SS') from dual;
select to_char(hiredate, 'YYYY/MM/DD HH24:MI:SS DAY') from emp;

--1-2. ���ڸ� ���ڷ�
select to_char(sal, 'L000,000,000'), to_char(sal, 'L999,999,999') from emp;
--0�� 9�� ����!!!!

--to_date(): ��¥������ ��ȯ
--to_date('����','��¥ ����') �Ǵ� to_date(����,'��¥����')
select to_date(19800220,'YY/MM/DD') from dual; --80/02/20
select trunc(sysdate-to_date('20220111','YYYYMMDD')) from dual; --��¥ ������ ��

--to_number(): ���������� ��ȯ
select to_number('10,000','99,999')-sal from emp;

--nvl(): null���� �ٸ� �����κ�ȯ
--�߿��� �ǵ�, �� ���������� ��ġ���Ѿ� ��!
select mgr, nvl(to_char(mgr),'CEO') from emp;

---------------------
--decode(): switch case�� ����Ѱ�
--emp���� deptno�� �μ������� �ٲ� ���
select ename, deptno, decode(deptno, 10, 'ACCOUNGTING',
                                                    20, 'RESEARCH',
                                                    30, 'SALES',
                                                    40, 'OPERATIONS') dname from emp;
select ename, deptno, case when deptno=10 then 'ACCOUNGTING'
                                        when deptno=20 then 'RESEARCH'
                                        when deptno=30 then 'SALES'
                                        when deptno=40 then 'OPERATIONS'
                                        end dname from emp;
                                        
                                        
--------------
--�׷��Լ�
--sum(): ��
select 10,sum(10+20+30),30 from dual;
--avg(): ���
select sum(sal), round(avg(sal),2) from emp;
--max():�ִ� / min(): �ּ�
select max(hiredate) "�ֱ� �Ի�", min(hiredate) "���� �Ի�" from emp;
--count(): row�� ������ ��ȯ
select count(comm) from emp; --row=4��� ---> null���� ī��Ʈ���� ����
select count(*) from emp; --���̺��� �� row ��
select count(distinct job) from emp; --�ߺ� ������ job�� �� (=row)

--group by : � �÷��� �������� �׷��Լ� ���� ���� �� ���
select deptno from emp group by deptno; --deptno�� �������� ����
select deptno,round(avg(sal),2) from emp group by deptno; --deptno���� ����� ����
select deptno,max(sal),min(sal) from emp group by deptno; --deptno���� �ִ�޿�, �ּұ޿��� ����
select deptno, count(*) from emp group by deptno; --deptno���� �����(row)
--job �������� �޿��� �� ��� �ִ� �ּ� ���ϱ�
select job, sum(sal), trunc(avg(sal)), max(sal), min(sal) from emp group by job;

--having ����: �׷����� ���� ����� ������ �� �� ���
select deptno, avg(sal) from emp group by deptno HAVING avg(sal)>=2000;
--deptno�� �������� ����� ���ϴµ�, '����� 2000 �̻��� ����'�� ����(having)�� ��½�Ŵ
select deptno, max(sal) from emp group by deptno having max(sal)>=2900;
--deptno�� ��������, �ִ�޿��� 2900 �̻��� ���ǿ� ������ ��½�Ŵ