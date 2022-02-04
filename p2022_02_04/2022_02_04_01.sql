--2022.02.04 (��)

------���Ǿ�
--����� ���Ǿ� ����--
--4. scott ���� ���� �� �˻� (conn scott)
select*from system.systbl;   --����.��ü ���·� �����ؾ� ��
--6. scott �������� ���Ǿ� ���� (conn scott)
create synonym systbl for system.systbl;
--7. ���Ǿ� ��� Ȯ�� (conn scott)
select*from user_synonyms;
--8. ���Ǿ�� �˻� (conn scott)
select*from systbl;

--���Ǿ� ����
-- ���Ǿ� ������ �������� �����ؾ� ��
drop synonym systbl;


----------------------------------------------------------------
----------------------------------------------------------------
--PL/SQL

--hello world ���
set serveroutput on
--serveroutput: �޽����� ȭ�鿡 ������ִ� ȯ�� ����, �⺻ off�� on���� �����ؾ� ��
begin
DBMS_OUTPUT.PUT_LINE('Hello world');   -- dbms_output : ��Ű��    put_line: ���ν���
end;     -- ��� ��


--���� ���
set serveroutput on
            --�길 ���� ���� �����Ű��, �Ʒ� �ڵ� �����ؾ� ���� �� ��
            --���� �ڵ�: Encountered the symbol "SET"
declare                          --����� ����
    vempno number(4);      --sql�� ������ ����-> ��Į�� ����
    vename varchar2(10);
begin                             --�����
    vempno :=7788;            --���� �� ������ := ���
    vename :='SCOTT';
    DBMS_OUTPUT.PUT_LINE('���    /   �̸�');
    DBMS_OUTPUT.PUT_LINE(VEMPNO ||'/'|| VENAME);
     -- ���ڿ� ����, �÷� ���� ������ �� ���� ���ʿ� || ���
end; 


--���۷��� ���� ��� ---> ����� �̸� �˻�
set serveroutput on

declare
    vempno emp.empno%type;      --���۷��� ���� ����
    vename emp.ename%type;
begin
    select empno, ename into vempno, vename from emp where ename='SCOTT'; 
    --vempno, vename ������(into) empno, ename ���� �ְڴ�
    DBMS_OUTPUT.PUT_LINE('���    /   �̸�');
    DBMS_OUTPUT.PUT_LINE(VEMPNO ||'/'|| VENAME);
end;


-----------------------------------------------------------------------
-------���ǹ�-------
--1. �Ϲ� if�� (if - then - end if)
--scott�� �μ���ȣdeptno�� �˻��� �μ����� ���
set serveroutput on
declare
    vempno number(4);
    vename varchar2(20);
    vdeptno emp.deptno%type;   --deptno �÷��� ��������, ũ�� �״�� ���ö�� �̷��� ������
    vdname varchar2(20) :=null; -- ����� ����־� ����ؾ� �ϴϱ� null
begin
    select empno, ename, deptno into vempno, vename, vdeptno from emp where ename='SCOTT';
    --emp ���̺��� SCOTT�� �ش��ϴ� row�� �˻��ؼ� �� row�� ���� �� �÷�(v-)�� ������ ����
    if vdeptno= 10 then
        vdname:='ACCOUNTING';
    end if;
    if vdeptno= 20 then
        vdname:='RESEARCH';
    end if;
    if vdeptno= 30 then
        vdname:='SALES';
    end if;
    if vdeptno= 40 then
        vdname:='OPPERATIONS';
    end if;
    DBMS_OUTPUT.PUT_LINE('���    /   �̸�  /   �μ�');
    DBMS_OUTPUT.PUT_LINE(vempno||'   /   '||vename||'   /   '||vdname);
end;

--2. if else��
--emp�� scott ����� ����sal ���
set serveroutput on
declare
    vemp emp%rowtype;    --emp���̺��� ��� �÷��� �״�� ������
    annsal number(7,2);
begin
    select*into vemp from emp where ename='SCOTT';
    --scott�� �ش��ϴ� row�� �����Ͱ� ���θ� vemp�� ������� ����
    -- annsal:=vemp.sal*12+vemp.comm;  --������.�÷��� ���·� ǥ��
                -- ��, comm=null�̶�� ������ �����Ƿ� �� �ٲ���� ��
                
    if vemp.comm is null then  --null���� �Ǵ��� �� [is null] ���!!!!
        annsal:=vemp.sal*12;    --�ƴϸ� vemp.comm=0���� �����ص� ��
    else
        annsal:=vemp.sal*12+vemp.comm; --null�� �ƴϸ� ������
    end if;
    
    DBMS_OUTPUT.PUT_LINE('���    /   ����');
    DBMS_OUTPUT.PUT_LINE(vemp.ename||'    /   '||annsal);
end;

--3. ���� if��
--scott�� �μ���ȣdeptno�� �̿��� �μ���dname�� ���
set SERVEROUTPUT on
declare
    vemp emp%rowtype;
    vdname varchar2(14);
begin
    select * into vemp from emp where ename='SCOTT'; --vemp�� ������ ����
    
    if vemp.deptno=10 then
        vdname:='ACCOUNTING';
    elsif vemp.deptno= 20 then
    
        vdname:='RESEARCH';
    elsif vemp.deptno= 30 then
        vdname:='SALES';
    else
        vdname:='OPERATIONS';
    end if;
    DBMS_OUTPUT.PUT_LINE('���    /   �̸�  /   �μ�');
    DBMS_OUTPUT.PUT_LINE(vemp.empno||'   /   '||vemp.ename||'   /   '||vdname);
end;

------------------------------------------------
----�ݺ���----
--1. basic loop
--1~5���� ���
set SERVEROUTPUT ON
declare
    n number:=1;        --������ �ʱ�ȭ
begin
    loop
        DBMS_OUTPUT.PUT_LINE (n);
        n:=n+1;
        if n>5 then
            exit;       --n�� 5���� ũ�� �ݺ� ��
        end if;
    end loop;
end;
--1���� 10������ ��
set SERVEROUTPUT ON
declare
    n number:=1;
    s number:=0;
begin
    loop
        s:=s+n;
        n:=n+1;
        if n>10 then
            exit;
        end if;
    end loop;
    DBMS_OUTPUT.PUT_LINE('1~10���� ��:'||s);
end;

--2. for loop
--1���� 5���� ���
set SERVEROUTPUT ON
--declare --���� ������ �� ������ ���� �� �ʿ� ����
begin
    for n in reverse 1..5 loop      --reverse: 1�� ����
        DBMS_OUTPUT.PUT_LINE (n);
    end loop;
end;

--dept�� ��� ������ ���
set SERVEROUTPUT ON
declare
    vdept dept%rowtype;
begin
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ  /   �μ���    /   ������');
    for cnt in 1..4 loop
        select* into vdept from dept where deptno=10*cnt;
        DBMS_OUTPUT.PUT_LINE(vdept.deptno||'    /   '||vdept.dname||'   /   '||vdept.loc);
    end loop;
end;

--3. while loop
--1���� 5���� ���
set SERVEROUTPUT ON
declare
    n number:=1;
begin
    while n<=5 loop
        DBMS_OUTPUT.PUT_LINE (n);
        n:=n+1;         --����ġ ���� ���� (for loop�� ����)
    end loop;
end;
-- *�� �ﰢ������ ���
set SERVEROUTPUT ON
declare
    c number:=1;
    str varchar2(100):=null;    --������ �ʱ�ȭ�� 0�� �ƴ϶� null
begin
    while c<=5 loop
        str:=str||'*';                 --���ڸ� �߰��� ���� || ���
        DBMS_OUTPUT.PUT_LINE(str);
        c:=c+1;                      --����ġ ����. ����� �� ��!!!!!!!
    end loop;
end;