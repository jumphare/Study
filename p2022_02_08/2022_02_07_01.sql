--2022.02.07 (��)
------------------------------------------
--�ڹ� ������ ���ν��� ����
--ex1
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
--3. �ڹٿ��� ����
--���ν����� CallableStatement Ŭ������ ������
--4. ���� Ȯ��
select*from emp01;

--ex2
--1. ���ν��� ����
create or replace procedure del_ename(vename emp01.ename%type) --����Ʈ: IN
IS
begin
    delete from emp01 where ename=vename; --�Ű����� vename�� ��ġ�ϴ� ������ ����
end;
select*from user_source;
--2. emp01 ���̺� ����
drop table emp01 purge;
create table emp01 as select*from emp; --���纻 ���̺� ����
select*from emp01;
--3. �ڹٿ��� ����
--4. ���� Ȯ��
select*from emp01;

--ex3
--1. ���ν��� ����
create or replace procedure sel_customer
                    ( vname in customer.name%TYPE,
                      vemail out customer.email%TYPE,
                      vtel out customer.tel%TYPE)
is
begin
	select email, tel into vemail, vtel from customer where name = vname;
end;
select*from user_source;
--2. ���̺� Ȯ��
select*from customer order by no;
--3. ���ε� ����
         variable var_email varchar2(20);
         variable var_tal varchar2(20);
--4. ���ν��� ���� (����Ŭ)
execute sel_customer('������', :var_email, :var_tal);
--5. ���� Ȯ��
print var_email;
print var_tal;

---------------------------------------
--���� �Լ�: �������ν����� ������ ����� ���������� ���� ����� �����ִ� ������ �Ѵ�

--emp ���̺��� Ư�� ����� sal�� 200% �λ��� ����� �����ϴ� ���� �Լ�
--1. �����Լ� ����
create or replace function cal_bonus(vempno in emp.empno%type)
    RETURN number       --���ϵ� ���� �ڷ���
is
    vsal emp.sal%type;       --���� ���Ϲ��� �������� ����
begin
    select sal into vsal from emp where empno=vempno;
    RETURN vsal*2;          --200% �λ��� ����� ����
end;
--2. �����Լ� ��� Ȯ��
select*from user_source;
--3. ���ε� ���� ����
variable var_res number;
--4. �����Լ� ����
execute :var_res :=cal_bonus(7788);
execute :var_res :=cal_bonus(7900);
print var_res;
select sal, cal_bonus(7788) from emp where empno=7788;

--ename�� �Ű������� ������ �ش� ����� ����job�� �����ϴ� ���� �Լ�
--1. �����Լ� ����
create or replace function job_emp(vename in emp.ename%type)
    return varchar2           --���ϵ� ���� �ڷ���
is
    vjob emp.job%type;      --���� ���Ϲ��� �������� ����
begin
    select job into vjob from emp where ename=vename;
    return vjob;
end;
--2. �����Լ� ��� Ȯ��
select*from user_source;
--3. �����Լ� ����
select ename, job_emp('SCOTT') from emp where ename='SCOTT';
select ename, job_emp('KING') from emp where ename='KING';
--+) ���ε� ������ ȣ��
variable var_job varchar2(10);
execute :var_job :=job_emp('SCOTT');
print var_job;

-----------------------
--Ŀ��: 2�� �̻��� �����͸� ó���� �� ���

--ex1. dept���̺� ��� �����͸� ���
--�Ϲ� loop��
--1, ���� ���ν��� ����
set SERVEROUTPUT ON
create or replace procedure cursor_sample01
is
    vdept dept%rowtype;     --���̺� ��ü�� �����ϰ���
    cursor c1 is select*from dept;
begin
    DBMS_OUTPUT.PUT_line('�μ���ȣ   /   �μ��� /   ������ ');
    DBMS_OUTPUT.PUT_line('-----------------------------------------');
    open c1;
       loop
         fetch c1 into vdept.deptno, vdept.dname, vdept.loc;
         DBMS_OUTPUT.PUT_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
         exit when c1%notfound;
      end loop;
    close c1;
end;
select*from user_source;
--2. ���ν��� ����
execute cursor_sample01;

--ex2. dept ���̺��� ��� �����͸� ���
--for loop : ���� ���ǿ� Ŀ���� ������ ������ �ݺ��� ������
--�ڵ����� open-fetch(����)-close ������ ó���� -> �����ϰ� ����� �� ����!
--1. ���� ���ν��� ����
set SERVEROUTPUT ON
        create or replace procedure cursor_sample02
        is
            vdept dept%rowtype;     --���̺� ��ü�� �����ϰ��� (�����ͱ��� ����)
            cursor c1 is select*from dept; --dept�� ��ü ���̺�(*)�� Ŀ���� ����
        begin
            DBMS_OUTPUT.PUT_line('�μ���ȣ   /   �μ��� /   ������ ');
            DBMS_OUTPUT.PUT_line('-----------------------------------------');
               for vdept in c1 loop     --Ŀ�� c1�� vdept ���̺��� row���� �Ҵ�Ǵ� ���� ����
               -- ���ǿ� c1�� �ִٸ� -> ������ ������ �˾Ƽ� open�ؼ� fetch�ϰ� ���� ������ close��
               ---> ��, ���⼱ open, fetch, close�� �� �ʿ䰡 ���� �̰ɷ� ���� �ι� ���� 
                 exit when c1%notfound; --c1�� �Ҵ�� ���� �������� �ʴ´ٸ�(not found) ��
                 DBMS_OUTPUT.PUT_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
              end loop;
        end;
select*from user_source;
--2. ���ν��� ����
execute cursor_sample02;

--deptno�� �Ű������� ������ �μ��� �Ҽӵ� ��� ������ Ŀ���� �̿��� ���
--1. ���ν��� ����
set SERVEROUTPUT ON
create or replace procedure info_emp (vdeptno in emp.deptno%type)
is
    vemp emp%rowtype;     --emp ���̺� ��ü ����
    cursor c1 is select*from emp where deptno=vdeptno;
    --Ư�� �μ���ȣ�� �ش��ϴ� row�� ��� �����Ͱ��� Ŀ���� ������ ��
begin
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ  /   �����ȣ    /   �����  /  ����  /   �޿�' );
    DBMS_OUTPUT.PUT_line('-----------------------------------------');
    for vemp in c1 loop
        exit when c1%notfound;
        DBMS_OUTPUT.put_line(vemp.deptno||'/'||vemp.empno||'/'||vemp.ename||'/'||vemp.job||'/'||vemp.sal);
    end loop;
end;
select*from user_source;
--2. ���ν��� ����
execute info_emp(40);