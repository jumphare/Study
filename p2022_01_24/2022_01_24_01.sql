--2022.01.24 (��)

--null �˻�
 select * from emp where comm is null;
 select * from emp where comm is not null;

--order by
-- ��������(ASC):     ���� ���ں���     ���� ������      ������ ��¥ ������      null �������� ���       ---> �⺻ ���Ĺ��(���� ����)
-- ��������(DESC):   ū ���ں���        ���� ��������    �ֱ� ��¥ ������        null ó���� ���
 select * from emp where comm is not null order by comm; --Ŀ�̼� null �ƴ� ����� �������� ����
  select ename,sal from emp order by sal desc, ename asc;   --�޿� ������ ��������, ���� �޿��� �� �̸� ���ĺ� ������ ���
 select empno,ename,job,hiredate from emp order by hiredate ; --�Ի��� �������� �������� ����, �����ȣ,�����,����,�Ի��� ���
  select empno,ename from emp order by empno desc;