--2022.02.03 (��)

-- DB ������ ���� ����
--1. �ý��� ����: �����ͺ��̽� ������(dba)�� ������ �ִ� ���� ex) create user, drop user...
--     +) �����ͺ��̽� ���� ���� (grant ��ɾ� �̿�)
--            - create session: �����ͺ��̽� ���� ����
--            - create table: ���̺� ���� ����
--            - create view: �� ���� ����
--            - create sequence: ������ ���� ����
--            - create procedure: ���ν���(�Լ�) ���� ����

--����� ���� ���� (create user)
create user user01 identified by tiger;
select*from dba_users;
-----�� ��������, ������ ������ ���� ��Ͽ��� ���������� �α��� ������ ���� ������ �� ����
---------> system�� ������ ������, grant�� ������ �ο��ؾ���
--user01 ������ ���� �ο�: grant create session, ... to ������;
grant create session to user01; --DB ���� ���� �ο�
grant create session, create table, create view to user01; --�޸�(,)�� ���� ���� �� �ο� ����

--with admin option : �ý��� ������ �ο��� �� �� �ɼ��� �߰��ϸ�,
--������ �ο����� ����ڴ� DBA�� �ƴ����� �ٸ� ����ڿ��� /�ڽ��� �ο�����/ �ý��� ������ �ο��� �� ����
--���ο� ���� ����
create user user02 identified by tiger;
--db ���� ���� �ο�. �ٵ����� with admin option�� �����
grant create session to user02 with admin option;
--�Ǵٸ� ���� ����
create user user03 identified by tiger;
--01. user01�� user03���� ���� �ο�
-------���� �ο��� ������ ������ �Ұ���

--02. user02�� user03���� ���� �ο�
-------���� �ο��� ���� �־ ����


---------------------------------------------
--��Role : ���� ������ ������� ��
--����Ŭ���� �⺻������ �����Ǵ� ��
--connect(8��), resource(20�� ��), dba(130�� ��)

--1. ���� ����
create user user04 identified by tiger;
select*from dba_users;
-------�� �������� � ���ѵ� �ο����� ���� ��Ȳ - ���ӵ� �� ��
--2. role �ο�: connect, resource
grant connect, resource to user04;
-------���� �ο�


--����� ���� ��
--1. �� ����
create role mrole;
--2. ���� �߰� --- ����� �������, ���ϴ´��.
grant create session, create table, create view to mrole;
--3. ������ ����� ���� ��(mrole) �ο�
create user user05 identified by tiger; --���� ����
grant mrole to user05; --����� ���� ���� �̿��� ���� �ο�
--create table�� ������� ���̺� ���� �� ��! �� ũ�� �����ϰ�.. �� �� �ִµ�
--�̰� �׳� ����� ���� ���� ���ö�� ��������


--����� ���� ��- ��ü����
--1. �� ����
create role mrole02;
--2. ���� �߰� --- ��ü ����
conn scott/tiger;
grant select on emp to mrole02; --scott �������� ����!
--3. ������ ���� �ο�
conn system/oracle
grant mrole02 to user05;
--4. user05 �������� �˻�

----
--�� ȸ��: revoke �Ѹ� from ������;
revoke mrole,mrole02 from user05;

--�� ����
drop role mrole;
drop role mrole02;


-------------------------------------
--����Ʈ ��: �ý��� ����+��ü ����
--1. �� ���� (conn system)
create role def_role;
--2. �ý��� ���� �߰� (conn system)
grant create session, create table to def_role;
--3. ��ü ���� �߰� (conn scott)��
conn scott/tiger;
grant select on emp to def_role;
grant update on emp to def_role;
grant delete on emp to def_role;
----//�̰� ��� ������ �ȳ����� Ȥ�� �𸣴ϱ�? �ϳ���?
--4. ���� �ο��� ���� ���� (conn system)
create user user_a identified by tiger;
create user user_b identified by tiger;
create user user_c identified by tiger;
--5. def_role �ο� (conn system)
grant def_role to user_a;
grant def_role to user_b;
grant def_role to user_c;
--6. �ο��� �������� ���� �� �˻� ��������
conn user_a/tiger
select*from scott.emp;

