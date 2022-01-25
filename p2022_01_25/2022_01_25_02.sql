--2022.01.25 (화)

--조인
--: 두 개 이상의 테이블을 결합해 한 번의 질의로 원하는 정보를 구해오는 것
--1-1. emp에서 scott사원의 부서번호
select deptno from emp where ename='SCOTT'; --20
--1-2. dept에서 20번 부서의 부서명
select dname from dept where deptno=20;

--cross join
select*from dept,emp; --4*14=56 row 데이터 검색
--1. equi join등가 조인: 동일한 컬럼을 기준으로 조인
select * from emp, dept where emp.deptno=dept.deptno;  --deptno를 기준으로 두 테이블 조인
select ename,dname from emp, dept where emp.deptno=dept.deptno and ename='SCOTT'; --조인해서 SCOTT의 부서명을 출력
select emp.deptno, ename,dname from emp, dept where emp.deptno=dept.deptno and ename='SCOTT'; --기준컬럼(deptno)은 어느 테이블의 것인지 꼭 명시해야함!

--테이블 별칭 부여
--1. 테이블에 대한 별칭이 부여된 다음부터 테이블명 사용 불가 --> 무조건 별칭명만 사용!
--2. 별칭명은 대소문자 구분하지 않음
--3. 공통컬럼(deptno)은 별칭명.공통컬럼명 형식으로 사용 (d.deptno)
--4. 공통컬럼이 아닌 것(ename,dname)은 별칭명 생략 가능 (테이블명 생략한 것과 같이)
select e.deptno, ename,dname from emp E, dept D where e.deptno=d.deptno and ename='SCOTT'; 

--2. non-equi join 비등가조인: 동일한 컬럼 없이 다른 조건을 사용해 조인
select ename, sal, grade from emp, salgrade where sal between losal and hisal;
--공통 컬럼 없는 두 테이블을 조인 -> salgrade의 범위를 조건으로, 각 sal이 속하는 범위에 해당하는 row와 연결함
-- 예를 들어 sal=800이라면 salgrade의 losal=700과 hisal=1200 사이의 범위에 위치하므로 이 범위에 등치되는 grade 컬럼의 값(=1)이 sal=800인 row와 조인되는 것

--3. self join : 한 테이블 내에서 조인(자기 자신과 조인)
select empl.ename, mger.ename from emp empl, emp mger where empl.mgr=mger.empno;
--같은 테이블을 두 별칭으로 분리해 조인하고 각 별칭의 칼럼과 등치시켜 연결함
-- empl의 mgr와 mger의 empno를 연결하는 것 -> empl의 상사번호에 해당하는 상사명이 들어가게 되는 것
-- KING은 mgr이 null이므로 등치되는 값이 없음 -> 제외하고 출력됨

--4. outer join외부조인: 조인 조건을 만족하지 않는 데이터도 출력
-- 테이블을 조인할 때 한쪽의 테이블에는 데이터가 있지만 다른 테이블에는 존재하지 않는 경우, 없으면 없는대로 다 출력시키는 것
-- 정보가 부족한 곳엔 (+) 추가
select empl.ename, mger.ename from emp empl, emp mger where empl.mgr=mger.empno(+);
--empl의 KING의 상사번호 null에 등치되는 mger의 사원명이 존재하지 않음 -> mger 테이블에 (+) 붙어야함
select ename, d.deptno, dname from dept d, emp e where d.deptno=e.deptno(+) order by deptno;
-- dept의 40번 부서와 등치되는 emp의 부서번호가 존재하지 않음 -> emp 테이블에 (+) 붙어야 함


-----------------------------
--ANSI join
--ANSI(미국 표준 협회) 표준안에 따라서 만들어진 join 방법

--ANSI cross join
select *from emp cross join dept; --14*4=56개 row 검색

--ANSI inner join
--inner join으로 조인할 테이블 명시
-- ON으로 조인 조건 명시
-- 기타 조건을 where에 지정
------SCOTT 사원이 소속된 부서명을 출력
select ename, dname from emp inner join dept ON emp.deptno=dept.deptno WHERE ename='SCOTT';
-- INNER JOIN으로 emp와 dept 테이블 조인
--ON 으로 emp.deptno=dept.deptno 공통 조건 명시
-- where에 조인과 연관 없는 기타 조건( ename='SCOTT') 지정
----ON을 좀 더 간단하게 표현하기