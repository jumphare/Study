--2022.02.04 (��)

--���� ���ν���

drop table emp01 purge;
create table emp01 as select*from emp; --���纻 ���̺� ����
select*from emp01;
-----�Ű����� ���� ���� ���ν���
--1. ���� ���ν��� ����
create or replace procedure del_all
IS
begin
    delete from emp01;
end;

--2. ���ν��� ��� Ȯ��
select*from user_source;
--3. ���� ���ν��� ����
execute del_all;
--4. ���� Ȯ��
select*from emp01;  --������ ���� Ȯ��
rollback;
-- ������ ���� (����! create�� ���ν����� ������ �ڿ��� �ڵ� Ŀ�ԵǹǷ� ������ �����Ȱ� ���� �Ұ�)

insert into emp01 select *from emp; --������ ����
select*from emp01;

-----�Ű����� �ִ� ���� ���ν���
--1. ���ν��� ����
create or replace procedure del_ename(vename emp01.ename%type) --����Ʈ: IN
IS
begin
    delete from emp01 where ename=vename; --�Ű����� vename�� ��ġ�ϴ� ������ ����
end;

--2. ���ν��� ��� Ȯ��
select*from user_source;
--3. ���� ���ν��� ����
execute del_ename('SCOTT'); --�Ű����� �ݵ�� �ۼ�!
--4. ���� Ȯ��
select*from emp01;
rollback;

-----�Ű����� ���� �� �ִ� ���ν���
----      - [mode]
--         in: �Ű������� �����͸� ���޹޴� ����
--         out: �Ű������� ���� �����ϴ� ����
--         inout: �� �� (�� ���� ������?)

--empno�� �Ű������� ���޹޾�, �� ����� ename, sal, job�� ���� ����
--1. ���ν��� ����
create or replace procedure sal_empno(      --�Ű����� ����
                vempno in emp.empno%type,
                vename out emp.ename%type,
                vsal out emp.sal%type,
                vjob out emp.job%type )
IS
begin
    select ename, sal, job into vename, vsal, vjob from emp
    where empno=vempno;    --�Է¹��� ������ vempno�� empno�� �� ���ϵ� �÷� �˻�
end;
--2. ���ν��� ��� Ȯ��
select*from user_source;
--3. ���� ���ν��� ����
-----�� out���� ���Ϲ��� �����͸� ������ ���ε� ������ �̸� �����ؾ� ��!
-----    ���ε� ����
variable var_ename varchar2(12);
variable var_sal number;
variable var_job varchar2(10);
-----�� out �Ű������� ���� ���Ϲ��� ��, ���� �տ� [ : ] �� �ٿ��� ��!
exec sal_empno(7788, :var_ename, :var_sal, :var_job);
--4. ���� Ȯ��
print var_ename;
print var_sal;
print var_job;
--DBMS_OUTPUT.PUT_LINE(var_ename||' / '||var_sal||' / '||var_job);
--�� �ȵǴ� ����... �� begin end �ȿ��� ������ �ϴϱ�!

------------------------------------------
--�ڹ� ������ ���ν��� ����
--1. ���ν��� ���� --- ����Ŭ����!
create or replace procedure del_all
IS
begin
    delete from emp01;
end;
select*from user_source;
--2. emp01 ���̺� ����
drop table emp01 purge;
create table emp01 as select*from emp; --���纻 ���̺� ����
select*from emp01;
--3. �ڹٿ��� �����Ұž�
--���ν����� CallableStatement Ŭ������ ������