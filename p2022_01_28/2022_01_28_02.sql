--2022.01.28 (금)
--01은 파일을 날려 남은게 없음 눈물남

--뷰view: 기본 테이블을 이용해 만들어진 가상 테이블
--dept_copy, emp_copy 생성
create table dept_copy as select *from dept;
create table emp_copy as select *from emp;

--뷰 생성
create view emp_view30 as select empno, ename, deptno from emp_copy where deptno=30;
--insufficient privileges 오류. 테이블 만드는 권한이 없기 때문에 (scott)
------> sys 계정으로 scott 계정에 테이블 생성 권한을 부여해야...
-- 보니까 일단 평범하게 select로 테이블 검색하는 식을 써놓고 create view 뷰이름 as 뒤에 붙이면 되는것같애

select *from tab;
select *from user_views;
select *from emp_view30;

-- 뷰에 insert로 데이터를 추가할 경우 기본 테이블(emp_copy)에도 값이 추가되는지?
--insert
insert into emp_view30 values(1111, '가나다',30);

select*from emp_view30;
select*from emp_copy; --예 추가되네요

-- 뷰 종류
--1. 단순 뷰 Simple view : 하나의 기본 테이블로 생성된 뷰
-- emp_copy를 이용해 20번 부서 소속 사원들의 empno, ename, deptno, mgr 출력하는 뷰(emp_view20)
create view emp_view20 as select empno, ename, deptno, mgr from emp_copy where deptno=20;
select*from emp_view20;
--2. 복합 뷰 Complex view
--각 부서 별(부서명으로 표시) 최대급여와 최소급여를 출력하는 뷰 (sal_view)
--emp랑 dept 조인하고 부서별로 그룹화하고 각 최대, 최소급여 출력함
create view sal_view as
select dname, max(sal) MAX, min(sal) MIN from emp_copy natural join dept_copy group by dname;
-- 아니면 from emp_copy, dept_copy where dept.deptno=dept_copy.deptno group by dname; 등가조인도 ㄱㅊ
select*from sal_view;

--옵션
--1. or replace
--뷰가 존재하지 않으면 생성insert, 뷰가 존재하면 내용을 수정update
----- 옵션 없이 이름 같은 뷰 생성(emp_view30)
create view emp_view30 as select empno, ename, deptno, sal, comm from emp_copy where deptno=30;
----- 옵션 추가 가보자고
create or replace view emp_view30 as select empno, ename, deptno, sal, comm from emp_copy where deptno=30;

select *from user_views;

--2. with check option
--where 조건절에 사용된 값을 수정할 수 없도록 제어
-----옵션 없
create or replace view emp_view30 as select empno, ename, deptno, sal, comm from emp_copy where deptno=30;
select*from emp_view30;
------> 급여가 1200인 사원들의 부서번호를 30에서 20으로 바꿈
update emp_view30 set deptno=20 where sal>=1200;
---------> 1200 넘는 사원들 부서번호 바뀌면서~ view에서 안보이게 됨 즉 where 값이 수정돼서 출력 범위도 바뀐 것임

-------옵션 있
create or replace view emp_view_chk30 as
select empno, ename, deptno, sal, comm from emp_copy where deptno=30 with check option;
select*from emp_view_chk30;
update emp_view_chk30 set deptno=20 where sal>=1200;

--3. with read only
--뷰를 통해서는 기본 테이블의 어떤 컬럼도 내용을 수정할 수 없음 오직 읽는 것만 가능
create or replace view view_read30 as
select empno, ename, sal, comm, deptno from emp_copy where deptno=30 with read only;
select*from view_read30;
update view_read30 set sal=3000;

----------------------------------------------
--rownum 컬럼
--1. 데이터의 저장 순서를 가지고 있는 논리적인 컬럼
--2. 1번부터 시작 ---> order by로 정렬해도 값이 바뀌지 않음 (정렬해서 데이터 바뀐다고 번호 바뀌는게 아니란 소리)
--3. rownum 값을 변경하기 위해서는 테이블을 통째로 변경해야 함

select rownum, ename, sal from emp order by sal desc;


--사원테이블에서 입사일이 빠른(오래된) 5명 ---> 입사일 기준 오름차순 (위가 숫자 작음) 
select empno, ename, hiredate from emp order by hiredate asc;
--뷰 생성
create or replace view hire_view as select empno, ename, hiredate from emp order by hiredate asc;
--입사일 빠른 사원 5명 출력
select rownum, empno, ename, hiredate from hire_view;   ---rownum 바뀌어있음 (테이블이 view로 바뀌었기 때문)
select rownum, empno, ename, hiredate from hire_view where rownum<=5;
--인라인 뷰 (=서브쿼리로 만들어진 뷰)
--입사일이 빠른 사원 5명 출력
select rownum, ename, hiredate from (
    select empno, ename, hiredate from emp order by hiredate asc) where rownum<=5;

--입사일이 3~5번째 빠른사원
select rnum, ename, hiredate from(select rownum rnum, board.* from (select * from emp order by hiredate) board)
where rnum between 3 and 5;

--empno가 빠른 사원 5명 
select rownum, empno, ename from(select empno, ename from emp order by empno) where rownum<=5;
--empno가 3~5번째인 사원
select rnum, empno, ename from(select rownum rnum, board.* from (select *from emp order by empno) board)
where rnum between 3 and 5;

create or replace view empno_view as select empno, ename from emp order by empno;
select rownum, empno, ename from empno_view where rownum<=5;

-- emp에서 급여를 많이 받는 사원 5명
select rownum, ename, sal from (select * from emp order by sal desc) where rownum<=5;

create or replace view maxsal_view as select ename, sal from emp order by sal desc;
select rownum, ename, sal from maxsal_view where rownum<=5;

--emp에서 급여를 3~5번째로 받는 사원
select rnum, ename, sal from (
    select rownum rnum, ename, sal from (   --rownum에 대한 별칭 부여를 위한 첫번째 서브쿼리
        select *from emp order by sal desc) ) --기존 서브쿼리를 두번째에 입력
            where rnum<=5 and rnum>=3;  --별칭 부여한 뒤 별칭으로 범위 잡으면 출력됨
--컬럼명을 간결하게 처리 (컬럼이 겁나 많을 때 유용할...)
select rnum, ename, sal from(
    select rownum rnum, board.* from ( --별칭 지정할 rownum 빼고 모든 컬럼을 *로 묶음
        select*from emp order by sal desc) board ) --두번째 서브쿼리 전체를 별칭으로 묶음
            where rnum>=3 and rnum<=5;

