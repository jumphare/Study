--2022.01.21 (금)

--테이블 목록
select *from tab;

--dept 데이터 검색: SQL문은 대/소문자를 구문하지 않음
select*from dept;

--dept 테이블 구조
describe dept;

--emp 테이블 구조
describe emp;

--emp 테이블 데이터 검색
select * from emp;

--오라클의 데이터 타입
--1. 숫자 데이터
    --number(n): n자리 숫자까지 저장
    --number(n1,n2): n1 전체자리수, n2 소수점 자리수
--2. 문자 데이터
    --char(): 고정 길이 문자형 -> 최대 2000byte 저장 가능
    --varchar2(): 가변 길이 문자형 -> 최대 4000byte 저장 가능
    --long: 최대 2GB 저장 가능 (데이터가 너무 커서 long형 column은 검색 기능을 지원하지 않음)
--3. 날짜 데이터
    --date: 연/월/일 정보 저장
    --timestamp: 연/월/일 + 시:분:초 정보 저장

-- select 특정 컬럼만 검색하고 싶으면 컬럼명 기술, 전체 검색 시 *
 select loc, deptno, dname from dept;
 
 --산술 연산자 + - * /
 select sal+comm from emp;
 select * from emp;
 
 --연봉 계산 ---> 급여(sal)*12+커미션(comm)
 select ename, sal, nvl(comm,0),sal*12+nvl(comm,0) "연봉AnN★" from emp;
 -- NVL(칼럼명, 변환값): 컬럼의 null값을 지정한 값으로 변환 ex. NVL(comm,0)
 -- 별칭 부여: (as) "별칭명"    // 한글, 대소문자, 특수문자, 띄어쓰기 다 가능
 -- 쌍따옴표 없을 경우 영어대문자로만 출력됨
 
 --concatenation연산자 || : 여러 컬럼과 문자열을 연결할 때 사용
 select ename || ' is a ' || job from emp;
 
 --distinct : 중복행 제거하고 한번만 보여줌
 
 select distinct deptno from emp;
 select deptno from emp;
 
 --emp 테이블에서 사원들 job을 한번만 출력
 select distinct job from emp;

--count(컬럼명): 데이터 갯수 구하기
 select count(*) from emp;                  --14
 select count(job) from emp;               --14
 select count(distinct job) from emp;   --5 

 --where 조건절 (비교 연산자를 곁들인)
 
 --1 숫자 데이터 검색
   --ex. emp에서 sal 3000 이상인 사원 검색
 select * from emp where sal>=3000;
  --ex. emp에서 sal 1500이하인 사원의 사원번호, 사원명, 급여 출력
  select empno, ename, sal from emp where sal<=1500;
  
 --2 문자 데이터 검색
 -- 1) 검색 시 대소문자 구분
 -- 2) 검색 시 외따옴표 (')
 select *from emp where ename='ford'; --결과 없음
 select *from emp where ename='FORD'; --FORD의 row 검색
  --ex. SCOTT 사원의 사원번호, 사원명, 급여 출력
 select empno, ename, sal from emp where ename='SCOTT';
 
 --3 날짜 데이터 검색
-- 1) 검색 시 날짜 좌우에 외따옴표 (')
-- 2) 비교 시 비교 연산자 사용
 --ex. 1982년 1월 1일 이후 입사한 사원 검색
 select * from emp where hiredate>='1982/01/01' order by hiredate asc;
 
 --논리연산자: and, or, not
 --ex. 10번 부서 소속'이고' 직급이 MANAGER인 사원의 사원명, 부서번호, 직급을 출력
 select*from emp where deptno=10 and job='MANAGER';
 -- 10번 부서 소속'이거나' 직급이 MANAGER인 사원의 사원명, 부서번호, 직급을 출력
  select*from emp where deptno=10 or job='MANAGER';
  --10번 부서 소속이 '아닌' 사원의 사원명, 부서번호, 직급을 출력
    select*from emp where not deptno=10;
 --급여가 2000~3000 사이인 사원
  select*from emp where sal>=2000 and sal<=3000;
   select*from emp where sal between 2000 and 3000;  --between and
-- 1987년에 입사한 사원
 select*from emp where hiredate between '87/01/01' and '87/12/31';
 --87년에 입사하지 않은 사원
  select*from emp where hiredate not between '87/01/01'and '87/12/31';
  
  --커미션이 300이거나 500이거나 1400인 사원
  select*from emp where comm=300 or comm=500 or comm=1400;
  select*from emp where comm in(300,500,1400); --in() 동일한 필드에 대한 or 조건이 여럿일 때
  --커미션이 300,500,1400이 아닌 사원
   select*from emp where comm not in(300,500,1400);
   
   --Like 연산자
   -- %
    select*from emp where ename like '%A%'; -- A가 포함되는 이름이라면 싹 출력
    -- _
     select*from emp where ename like '%E_'; --끝에서 두번째가 E인 이름 출력
    
    select*from emp where ename not like '%A%'; -- 사원명에 A가 포함되지 않는 사원
    
    
    --과제1 emp에서 hiredate 4자리 연도로 출력
         select '19'||hiredate from emp;
         select to_char(hiredate, 'YYYY/MM/DD') from emp;
    --과제2 MGR의 값이 null인 데이터를 CEO로 출력
        select nvl(to_char(mgr),'CEO') from emp;
        select nvl(''||mgr,'CEO'||mgr) from emp;