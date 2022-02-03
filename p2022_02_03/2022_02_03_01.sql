--2022.02.03 (��)

-- ������ sequence
--: ���̺� ���ڸ� �ڵ����� �������� �Է�---> �ߺ� ���� ---> ���̺� ���� ������ ����(������ ��)�� �ڵ����� �����ϴ� �߻���
--: ���۰�, ����ġ, ����Ŭ, �ִ밪�� ������ �� ���� +) �⺻������ ������ ����

--������ ����
create sequence dept_deptno_seq     --��������: ���̺��_�÷���_seq ������ ������ �� �Ϲ���
    start with 10                               --start with: ���۰� (�⺻��=1, ���� ����)
    increment by 10;                         --increment by: ����ġ (�⺻��=1, ���� ����)

select *from seq;                             --������ ��� Ȯ��
select *from user_sequences;            --������ ��� Ȯ��

--������ ����
--currval: ������ ���簪�� ��ȯ     nextval: ������ �������� ��ȯ

select dept_deptno_seq.nextval from dual; ---10, 20, 30... ������ ��µ� �� �������� ��� ��ȯ
select dept_deptno_seq.currval from dual; ---���� �������� ��ȯ�� ��=nextval�� ���� ���� �ֱٰ� ��ȯ

drop table emp01 purge;

--ex1. �������� ���̺��� �⺻Ű�� ����
--���̺� ����
create table emp01 ( empno number(4) primary key, ename varchar2(10), hiredate date);
--������ ����
create sequence emp01_empno_seq; --�ɼ� ��� ���� ---> ���۰�1, ����ġ1 (default)
--������ �Է�
insert into emp01 values(emp01_empno_seq.nextval, 'Sirius', sysdate); --empno�� ������ �Է�
--(����! nextval�̾�� �������� ��� ��ȯ��. currval�� �ֱ� ��ȯ���� ��� ��ȯ�ǹǷ� �ߺ�---> primary key�� �Է� �Ұ�)

--ex2.
--���̺� ����
create table dept_exp( deptno number(4) primary key, dname varchar2(10), loc varchar2(15));
--������ ����
create sequence dept_exp_seq
    start with 10
    increment by 10; --���۰�10, ����ġ10
--������ �Է�
insert into dept_exp values(dept_exp_seq.nextval, '�λ��', '����');
insert into dept_exp values(dept_exp_seq.nextval, '�渮��', '����');
insert into dept_exp values(dept_exp_seq.nextval, '�ѹ���', '����');
insert into dept_exp values(dept_exp_seq.nextval, '�����', '��õ');
select *from dept_exp;

--������ ����
drop sequence dept_exp_seq;

select *from seq;

--������ ����
drop sequence dept_deptno_seq;
create sequence dept_deptno_seq
    start with 10
    increment by 10
    maxvalue 30; --�ִ밪, �� �̻� �Ѿ�� ���� �߻� (cycle�� ����)
select dept_deptno_seq.nextval from dual;

alter sequence dept_deptno_seq maxvalue 1000000; --maxvalue �ִ밪 ����
select dept_deptno_seq.nextval from dual;



--�ε��� index
--: ���� �˻��� �ϱ� ���� ���Ǵ� ��ü

select *from user_indexes;
-- �⺻Űprimary key�� ������ �÷��� �ڵ����� ���� �ε����� �������. unique -> ���� �ε���

--�ε��� ������ ���� �˻� �ӵ� ��
--1. ���纻 ���̺� ���� ---> ���� ������ ������� ���� (primary key ���� �� ��)
create table emp01 as select*from emp; --���� ���� �����Ǿ����� �����Ƿ� �����ͱ��� �� �ܾ���
--2. ������ �Է�
insert into emp01 select*from emp01; --�ڱ� �����͸� �Ʒ��� �� �߰�.. �� �辿 ��� �߰�
--3. �˻� ������ �Է�
insert into emp01(empno, ename) values(1111, 'Sirius');
--4. �ð� ������ Ÿ�̸� ����
set timing on --����� �� off
--5. �˻� �ð� ����
----5-1. �ε��� ����
select *from emp01 where ename='Sirius';   --30.398��
----5-2. �ε��� ����
create index idx_emp01_ename on emp01(ename); --�ε��� ����
    ---> ���� �����Ͱ� ������ �� �ε��� �����ϸ� (ó�� �� ��) ���� �ð��� �� �ҿ��
select *from emp01 where ename='Sirius';   --0.135��

--�ε��� ����
drop index idx_emp01_ename;

----�ε��� ����
--���� �ε���: �ߺ��� �����Ͱ� ���� �÷��� ���� (���� ��� primary key)
--���� �ε���: �ߺ��� �����Ͱ� �ִ� �÷��� ����

----����, ����� �ε��� ��
--1. ���̺� ����
create table dept01 as select * from dept where 1=0; --���̺� ������
--2. ������ �Է� : loc �÷��� �ߺ� ������ �Է�
insert into dept01 values(10, '�λ��','����');
insert into dept01 values(20, '�ѹ���','����');
insert into dept01 values(30, '������','����');
select *from dept01;
--3. ���� �ε��� ���� (on deptno, �ߺ� �����Ͱ� �������� �ʴ� ����)
create unique index idx_dept01_deptno on dept01(deptno); --unique �ݵ��! �ٿ���!
   ----> ���� �ε����� �����ϴ� ���� �ߺ� �����͸� �Է��Ѵٸ�?
      insert into dept01 values(10, '�λ��','����'); --����
   ----> �ߺ� �����Ͱ� �����ϴ� ���� ���� �ε����� �����Ѵٸ�?
      create unique index idx_dept01_loc on dept01(loc); --����
--4. ����� �ε��� ���� (on loc, �ߺ� �����Ͱ� �����ϴ� ����)
create index idx_dept01_loc on dept01(loc);
--5. �ε��� ��
select*from user_indexes;

--���� �ε���: �� �̻��� �÷����� ������� �ε��� (�ϳ��� ���� �ε���, ���ݱ��� ���� �͵�)
  create index idx_dept01_com on dept01(deptno, dname);
  
--�Լ� ��� �ε���: �����̳� �Լ��� ������ ���� �ε���
create index idx_emp01_annsal on emp(sal*12);