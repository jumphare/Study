--2022.01.27 (��)

--update
drop table dept01 purge;
create table dept01 as select * from dept;
select*from dept01;
--���������� ������ ����
--20�� �μ� �������� 40�� �μ� ���������� ����
update dept01 set loc=(select loc from dept01 where deptno=40) where deptno=20;

--delete: ������ ����
delete from dept01;
rollback;
--Ư�� ������ ���� -> where ������ ���
 delete from dept01 where deptno=30;
 
 select*from emp02;
 --emp02���̺��� �μ��� sales=deptno 30���� ��� ����
 delete from emp02 where deptno=(select deptno from dept01 where dname='SALES');
 
 
 --merge: ���̺� �պ�

create table emp01 as select * from emp;

 create table emp02 as select * from emp where job='MANAGER';

 update emp02 set job='Test';

 insert into emp02 values(8000, 'ahn', 'top', 7566, '2018/02/22',1200, 10, 20);

 select * from emp02; --(Ȯ��)

 merge into emp01
	using emp02
	on(emp01.empno = emp02.empno)
	when matched then
	     update set emp01.ename = emp02.ename,
			emp01.job = emp02.job,
			emp01.mgr = emp02.mgr,
			emp01.hiredate = emp02.hiredate,
			emp01.sal = emp02.sal,
			emp01.comm = emp02.comm,
			emp01.deptno = emp02.deptno
	when not matched then
	     insert values(emp02.empno, emp02.ename, emp02.job, 		         	         
		          emp02.mgr,emp02.hiredate, 
		         emp02.sal, emp02.comm,emp02.deptno);

select * from emp01; -- (�պ��� ��� Ȯ��)
rollback;

