--2022.01.27 (목)

--update
drop table dept01 purge;
create table dept01 as select * from dept;
select*from dept01;
--서브쿼리로 데이터 수정
--20번 부서 지역명을 40번 부서 지역명으로 수정
update dept01 set loc=(select loc from dept01 where deptno=40) where deptno=20;

--delete: 데이터 삭제
delete from dept01;
rollback;
--특정 데이터 삭제 -> where 조건절 사용
 delete from dept01 where deptno=30;
 
 select*from emp02;
 --emp02테이블에서 부서명 sales=deptno 30번인 사원 삭제
 delete from emp02 where deptno=(select deptno from dept01 where dname='SALES');
 
 
 --merge: 테이블 합병

create table emp01 as select * from emp;

 create table emp02 as select * from emp where job='MANAGER';

 update emp02 set job='Test';

 insert into emp02 values(8000, 'ahn', 'top', 7566, '2018/02/22',1200, 10, 20);

 select * from emp02; --(확인)

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

select * from emp01; -- (합병된 결과 확인)
rollback;

