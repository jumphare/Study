--2022.01.24 (��)

--sql �Լ�
 
 select*from dept;
 describe dept;
 
 select 10+20 from dept; --row ����ŭ ��µ� -> 4��
 select * from dual; -- row��=1 -> 1�� ���
 --dual�� ���� ���Ǿ�-> ���� �ٸ� ������ ���̺��� sys.dual�� ���������� �����Ǿ������� ���̺������ �����ϰ� �ҷ��� �� ���� 

--1. ���� �Լ�
--abs(): ���밪
 select -10, abs(-10) from dual;
-- floor(): �Ҽ��� �Ʒ� ���� (������ ���)
select 34.5678, floor(34.5678) from dual; --34 ���
--trunc(): �Ҽ��� ���� �ڸ��� ����
select trunc(34.5678,2) from dual;  -- 34.56 ���
--round(): �Ҽ��� ���� �ڸ��� �ݿø�
select 34.5678, round(34.5678) from dual; --�Ҽ��� ���� - 35 ���
select 34.5678, round(34.5678, 2) from dual; --10^-2���� ��� - 34.57 ���
select 34.5678, round(34.5678, -1) from dual; --10^1���� ��� - 30 ���
-- mod(): ������
select mod(27,7) from dual; --6 ���
--�����ȣ Ȧ���� ��� �˻�
select * from emp where mod(empno,2)=1;

--2. ���� �Լ�
--upper(): �빮�� ��ȯ
select upper('welcome to oracle') from dual;
--������ manager�� ��� �˻�
select * from emp where job=upper('manager'); --������ �빮�ڷ� �Ǿ�������.. �빮�ڷ� ��ȯ�ؼ� �˻��ؾ�.
--lower(): �ҹ��� ��ȯ
select lower('WELCOME') from dual;
--initcap(): ù ���ڸ� �빮�ڷ� ��ȯ
select INITCAP('welCOMe to oraCle') from dual;
--length(): ������ ����
select length('����Ŭ'), length('oracle') from dual;  --3,6
--lengthb(): ������ ���� (byte����)  ---> �ѱ��� 2byte�� �����⵵ �ϰ� 3byte�� �����⵵ �ؼ� �� �Ⱦ�
select lengthb('����Ŭ'), lengthb('oracle') from dual; --9,6

--substr(): ���ڿ��̳� �������� '������ġ'���� '������ ����'��ŭ ���� ����
select substr('Welcome to oracle', 4, 3) from dual;   --4��° ���ں��� 3�� ���� ---> com ���
select substr('Welcome to oracle', -4, 3) from dual;   --�ڿ��� 4��° ���ں��� 3�� ���� ---> acl ���
--����� �Ի����� ������ ���� �����ؼ� ���
select substr(hiredate,1,2) "��",  substr(hiredate,4,2) "��",  substr(hiredate,7,2) "��" from emp;
--87�� �Ի� ����� �˻�
select * from emp where substr(hiredate,1,2)=87;
--������� E�� ������ ��� �˻�
select *from emp where ename like '%E';
select *from emp where substr(ename,-1,1)='E';

--instr(): Ư�� ������ ��ġ
select instr('WELCOME TO ORACLE', 'O') from dual; -- 5
select instr('WELCOME TO ORACLE', 'O', 6, 2) from dual; --6��° ����(M)���ķ� 2��° O ��ġ -> ORACLE�� O, ���鵵 ī��Ʈ -> 12
--�̸��� 3��° �̴ϼ��� R�� ��� �˻�
select * from emp where substr(ename, 3, 1)='R';
select * from emp where instr(ename, 'R', 3, 1)=3; 
select * from emp where ename like '__R%';

--lpad() / rpad(): ��/�����ʿ� Ư�� ��ȣ�� ä����
select lpad('oracle',20,'#') from dual; --##############oracle
select rpad('oracle',20,'#') from dual; --oracle##############

--ltrim() / rtrim(): ���ڿ� ��/������ ���� ����
--trim():���ڿ� �¿� ������ ���� ���� + Ư�� ���ڸ� �߶�
select trim('      oracle       ') from dual;
select trim('a' from 'aaaaaaaaaoracleaaaaaaaaaaa') from dual;

--3. ��¥ �Լ�
--sysdate: �ý��� ��¥ �����ִ� �Լ�
select sysdate-1 ����, sysdate ����, sysdate+1 ���� from dual;
--�������� ������� �ٹ��� �ϼ��� ���
select round(sysdate-hiredate) from emp;
--months_between(data1, data2): ��¥ ���� ���� ��
select trunc(months_between(sysdate,hiredate)) from emp;
--add_months(): ���ؿ��� �������� ���� ��¥ ���
select ename, hiredate, add_months(hiredate, 6) from emp;
-- next_day() : �ش� ��¥ �������� ���ƿ��� ������ �������� ��ȯ
select next_day(sysdate, '��') from dual; --����(22/01/24)���� ���ƿ��� ������� ��ĥ�ΰ� -> 22/01/29 ���
--last_day() : �ش� ���� ������ �� ��ȯ
select hiredate, last_day(hiredate) from emp;
select last_day(add_months(sysdate,2)) from dual; -- �ý��� ��¥���� �� �� ���� ���� �������� ��� -> 3�� �������� ���

--����
--3 ���� �ֱ� �Ի��� ����� ���
select ename,hiredate from emp order by hiredate desc;
select ename from (select * from emp order by hiredate desc, ename asc) where rownum=1;
select ename, hiredate from emp where hiredate=(select max(hiredate) from emp); --�ֱ� �Ի��� �˻��ؼ�/ �� ���� ���� hiredate�� ������ ��/ ���
--4 �ִ� �޿� �޴� ������ �ִ�޿� �ݾ� ���
select ename, sal from emp order by sal desc;
select ename, sal from (select * from emp order by sal desc, ename asc) where rownum=1;
select ename, sal from emp where sal=(select max(sal) from emp); --�ִ� �޿��� �˻��ؼ�/ �� ���� ���� sal�� ������ ��/ ename, sal ���