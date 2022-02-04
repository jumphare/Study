--2022.02.04 (��)

--���Ǿ�(synonym)
--1. ����� ���Ǿ�: ��ü�� ���� ������ �ο����� ����ڰ� ������ ���Ǿ�, �ش� ����ڸ� ��� ����

--------------------------------------
--����� ���Ǿ� ����--
--1. system ���� ���� �� ���̺� ���� (conn system)
create table systbl(ename varchar2(20));
--2. ������ �߰� (conn system)
insert into systbl values('Sirius');
insert into systbl values('Remus');
--3. scott������ systbl�� ���� select ���� �ο� (conn system)
grant select on systbl to scott;
--4. scott ���� ���� �� �˻� (conn scott)
conn scott/tiger
select*from system.systbl;   --����.��ü ���·� �����ؾ� ��
--5. scott ������ ���Ǿ� ���� ���� �ο�(conn system)
grant create synonym to scott;
--6. scott �������� ���Ǿ� ���� (conn scott)
conn scott/tiger
create synonym systbl for system.systbl;
--7. ���Ǿ� ��� Ȯ�� (conn scott)
conn scott/tiger
select*from user_synonyms;
--8. ���Ǿ�� �˻� (conn scott)
select*from systbl;


--���Ǿ� ����
-- ���Ǿ� ������ �������� �����ؾ� ��
drop synonym systbl;

--------------------------------------
--���� ���Ǿ�--
--system �������� �����ؾ� ��
create public synonym pubdept for scott.dept;
select*from dba_synonyms; --���� ���Ǿ�� dba�� �˻�!
drop public synonym pubdept;

