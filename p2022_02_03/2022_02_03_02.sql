--2022.02.03 (��)

--��ü ����
--���� ������ user01 �������� scott ���� ������ emp���̺� ��ü�� ���� ����(select)�� �ο�
grant select on emp to user01;
--���� �ο� ��� revoke
revoke select on emp from user01;

-- with admin option : ��ü ������ �ο��� �� �� �ɼ��� �߰��ϸ�,
-- ������ �ο����� ����ڴ� �ٸ� ����ڿ��� /�ڽ��� �ο�����/ ��ü ������ �ο��� �� ����

--user02 ������ scott ������ emp ���̺� ��ü�� ���� ����(select) �ο�
grant select on emp to user02 with grant option;
--with grant option�� ��鿩 select ���� �ο�

--01. user01�� user03���� scott ������ emp ���̺� ���� ���� �ο�
grant select on scott.emp to user03;
-------���� �ο��� ������ ������ �Ұ���

--02. user02�� user03���� scott ������ emp ���̺� ���� ���� �ο�
grant select on scott.emp to user03;
-------���� �ο��� ���� �־ ����


----///����� ���� �� - ��ü���� �ο�
grant select on emp to mrole02;
-----------------------------------------

----///����Ʈ ��
grant select on emp to def_role;
grant update on emp to def_role;
grant delete on emp to def_role;
