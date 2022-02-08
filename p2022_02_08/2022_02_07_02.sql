--2022.02.07 (��)

--��Ű�� : ���� �ִ� ���ν����� ȿ�������� ���� + ��Ű�� ������ ������ �� ���

--1. ��Ű�� ����
--��Ű�����=����: ��Ű���� �� ���ν���, �Լ����� ����
create or replace package exam_pack IS
    function cal_bonus(vempno in emp.empno%type)
    return number;
    procedure cursor_sample02;
end;           --���� begin�� ���� IS �ڿ� �����ϰ� end��
--��Ű���ٵ�=��ü��: ���ν���, �Լ��� ������ ���� ����
create or replace package BODY exam_pack IS
    FUNCTION cal_bonus(vempno in emp.empno%type)  --->�����Լ� ����
        return number   
        is
             vsal emp.sal%type;      
         begin
             select sal into vsal from emp where empno=vempno;
             RETURN vsal*2;        
         end; --�Լ� end
    PROCEDURE cursor_sample02                               ---> �������ν��� ����
         is
              vdept dept%rowtype;    
             cursor c1 is select*from dept; 
         begin
             DBMS_OUTPUT.PUT_line('�μ���ȣ   /   �μ��� /   ������ ');
             DBMS_OUTPUT.PUT_line('-----------------------------------------');
             for vdept in c1 loop   
               exit when c1%notfound; 
               DBMS_OUTPUT.PUT_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
             end loop;
         end; --���ν��� end
end; --��Ű�� �ٵ� end

--2. ��Ű�� �� ���ν���, �Լ� ȣ��
set SERVEROUTPUT ON
variable var_res number;
execute :var_res :=exam_pack.cal_bonus(7788); --�����Լ� ����
print var_res;
select ename, exam_pack.cal_bonus(7788) from emp where empno=7788; --sql������ �����Լ� ����
execute exam_pack.cursor_sample02;               --�������ν��� ����

--dbms_output��Ű�� Ȯ�� (system����)
select object_name from dba_obdects
where object_type='PACKAGE'
and object_name like 'DBMS_%'
order by object_name;

---------------------------------
--Ʈ����: � �̺�Ʈ�� �߻����� �� �ڵ����� ����Ǵ� ���ν���
drop table emp01 purge;
create table emp01 (empno number(4) primary key, ename varchar2(20), job varchar2(20));
select*from emp01;
--emp01 ���̺� ����� ����ϸ� ��� �޽����� ��µǴ� Ʈ����
create trigger emp01_trigger
after insert on emp01    --emp01�� insert �̺�Ʈ�� �߻��� �Ŀ� Ʈ���� �߻�!
begin
    DBMS_OUTPUT.PUT_LINE('���ο� ����� ��ϵǾ����ϴ�.');
end;
select *from user_triggers;
--���̺� �� �Է�
set SERVEROUTPUT ON   --dbms_��¼�� ��µǰ� �Ϸ��� �� on ����� ��
insert into emp01 values(1,'JAMES','MANAGER');
insert into emp01 values(2, 'SIRIUS', 'ANALYST');
insert into emp01 values(3, 'REMUS', 'CLERK');
delete from emp01;

--emp01 ���̺� ����� ����ϸ� sal01 ���̺� �޿� ������ �ڵ����� �߰��ϴ� Ʈ����
--1. sal01 ���̺� ����
create table sal01 (salno number(4) primary key, sal number(7,2),
                          empno number(4) references emp01(empno)); --foreign key
select*from sal01;
--2. ������ ����
create sequence sal01_salno_seq; --������ ����(���۰�, ����ġ ����Ʈ 1)
select*from seq;
--3. Ʈ���� ����
create or replace trigger sal_trigger
after insert on emp01
for each row
begin
    insert into sal01 values(sal01_salno_seq.nextval,100,:new.empno);
                --:new.empno--> �����ϰ� �ִ� ���̺� emp01�� insert�� empno�� ������ 
    DBMS_OUTPUT.put_line('�޿��� ��ϵǾ����ϴ�.');
end;
--3. ���̺� �� �Է�
set SERVEROUTPUT ON  
insert into emp01 values(1,'JAMES','MANAGER');
insert into emp01 values(2, 'SIRIUS', 'ANALYST');
insert into emp01 values(3, 'REMUS', 'CLERK');
select*from sal01;

--emp01 ���̺��� ����� �����Ǹ� sal01�� �޿� ������ �Բ� �����Ǵ� Ʈ����
delete from emp01 where empno=1;
---> �Ұ�����. �긦 �����ϰ� �ִ� ���̺�sal01�� �����ϱ� ������.
-- foreign key�� on delete cascade �ɼ��� �־�߸� ������
-- ������ Ʈ���ŷε� �����͸� �����ϵ��� ��ġ�� �� ����
--1. Ʈ���� ����
create or replace trigger del_trigger
after delete on emp01
for each row
begin
    delete from sal01 where empno=:old.empno;
    --:old.empno--> �����ϰ� �ִ� ���̺� emp01�� �����ϰ� �ִ� �ش� empno�� ������
end;
select *from user_triggers;
--2. �̺�Ʈ �߻�: emp01�� ������ ����
delete from emp01 where empno=1;
select*from sal01;
select*from emp01;