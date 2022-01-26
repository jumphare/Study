--2022.01.26 (수)

-- * ANSI Join : ANSI(미국 표준 협회) 표준안에 따라서 만들어진 join 방법
-- ANSI outer join

create table dept01( deptno number(2), dname varchar2(14));
insert into dept01 values(10, 'ACCOUNTING');
insert into dept01 values(20, 'RESEARCH');
select * from dept01;

create table dept02( deptno number(2), dname varchar2(14));           
insert into dept02 values(10, 'ACCOUNTING');
insert into dept02 values(30, 'SALES');
select * from dept02;

--------- dept01와 dept02를 조인할 때, 공통컬럼 deptno에서 등치되는 값은 10번 부서 'ACCOUNTING' 밖에 없음
--------- dept01의 20번 부서를 출력하고 싶다면 LEFT OUTER JOIN (01 테이블이 왼쪽에 있으니까)
select * from dept01 left outer join dept02 using (deptno);
--------- dept02의 30번 부서를 출력하고 싶다면 RIGHT OUTER JOIN (02 테이블이 오른쪽에 있음)
select * from dept01 right outer join dept02 using (deptno); 
--------- 양쪽 테이블의 부서를 모두 출력하고 싶다면 FULL OUTER JOIN
select * from dept01 full outer join dept02 using (deptno) order by deptno;

--------------------------------
-- 서브쿼리
--   : 하나의 select 문장의 절 안에 또다른 select 문장을 포함하는 것 (메인쿼리 내부에 서브쿼리가 존재)
--   : 비교연산자의 오른쪽에(비교가 되는 조건이 되어야 하므로), 괄호를 이용해 하나로 묶어 배치

-- SCOTT 사원이 소속된 부서명을 출력
--귀찮게 두번 하려면 emp 테이블에서 SCOTT의 부서번호를 구하고 -> dept 테이블에서 그 부서번호에 해당하는 부서명을 출력해야 함
--01. 조인 사용
select dname from emp natural join dept where ename='SCOTT'; --natural join
select dname from emp, dept where emp.deptno=dept.deptno and ename='SCOTT'; --equi join
select dname from emp inner join dept on emp.deptno=dept.deptno where ename='SCOTT'; --inner join ~ on
select dname from emp inner join dept using(deptno) where ename='SCOTT'; --inner join ~ using
--02. 서브쿼리 사용
select dname from dept where deptno=(select deptno from emp where ename='SCOTT');

--1. 단일행 서브쿼리
-- 01. 서브쿼리의 검색 결과가 하나
-- 02. 메인 쿼리의 where 조건절에서 비교연산자로 사용 가능
-- 사원테이블에서 가장 최근에 입사한 사원명 출력
 select ename from emp where hiredate=(select max(hiredate) from emp);
-- 사원 테이블에서 최대 급여를 받는 사원명과 최대 급여 금액을 출력
select ename, sal from emp where sal=(select max(sal) from emp);
-- mgr이 king인 사원의 사원명과 급여를 출력
select ename, sal from emp where mgr=(select empno from emp where ename='KING');

--2. 다중행 서브쿼리
-- 01. 서브쿼리에서 반환되는 검색 결과가 둘 이상
-- 02. 메인 쿼리의 where 조건절에서 다중행 연산자 사용 가능 -> IN, ANY/SOME, ALL, EXIST

------ IN 연산자 : 메인 쿼리의 비교 조건과 서브쿼리 검색 결과가 하나라도 일치하면 참 (or 연산자)
--3000 이상의 급여를 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보를 출력
----------> 3000 이상 급여 받는 사원의 deptno와 일치하는 사원들을 출력!!!!!!!!!!!!
select deptno from emp where sal>=3000; --3000 이상인 사원의 부서번호 출력
select * from emp where deptno in (select deptno from emp where sal>=3000) order by deptno;

------ ALL 연산자 : 메인 쿼리의 비교 조건이 서브쿼리 검색 결과의 모든 값과 일치하면 참 (and 연산자)
--30번 부서 소속 사원 중 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사원의 이름과 급여를 출력
--단일행
select ename, sal from emp where sal> (select max(sal) from emp where deptno=30);
--다중행
select ename, sal from emp where sal > all (select sal from emp where deptno=30);
-- 연산자 뒤에 all로 서브쿼리 묶으면 -> 조건연산자가, 서브쿼리에서 나온 모든 값보다 커야 한다는 조건이 됨 -> 최대값보다 당연히 커야함 -> 같은 결과

------ ANY 연산자 : 메인 쿼리의 비교 조건이 서브쿼리 검색 결과의 값과 하나 이상 일치하면 참 (in보다 빡세고 all보단 유연함)
-- 부서번호 30번인 사원중 가장 낮은 급여(950)보다 높은 급여를 받는 사원 출력
--단일행
select ename, sal from emp where sal > (select min(sal) from emp where deptno=30);
--다중행
select ename, sal from emp where sal > any (select sal from emp where deptno=30);
-- any로 서브쿼리 묶으면 -> 서브쿼리에서 나온 모든 값과 하나 이상 만족해야 -> 최소값보다 작으면 하나도 만족하지 못함 


-------------------------------