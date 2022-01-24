--2022.01.24 (월)

--sql 함수
 
 select*from dept;
 describe dept;
 
 select 10+20 from dept; --row 수만큼 출력됨 -> 4개
 select * from dual; -- row수=1 -> 1개 출력
 --dual은 공개 동의어-> 보통 다른 계정의 테이블은 sys.dual로 참조하지만 공개되어있으면 테이블명으로 간결하게 불러올 수 있음 

--1. 숫자 함수
--abs(): 절대값
 select -10, abs(-10) from dual;
-- floor(): 소수점 아래 버림 (정수로 출력)
select 34.5678, floor(34.5678) from dual; --34 출력
--trunc(): 소수점 지정 자릿수 버림
select trunc(34.5678,2) from dual;  -- 34.56 출력
--round(): 소수점 지정 자릿수 반올림
select 34.5678, round(34.5678) from dual; --소수점 없이 - 35 출력
select 34.5678, round(34.5678, 2) from dual; --10^-2까지 출력 - 34.57 출력
select 34.5678, round(34.5678, -1) from dual; --10^1까지 출력 - 30 출력
-- mod(): 나머지
select mod(27,7) from dual; --6 출력
--사원번호 홀수인 사원 검색
select * from emp where mod(empno,2)=1;

--2. 문자 함수
--upper(): 대문자 변환
select upper('welcome to oracle') from dual;
--직급이 manager인 사원 검색
select * from emp where job=upper('manager'); --저장이 대문자로 되어있으니.. 대문자로 변환해서 검색해야.
--lower(): 소문자 변환
select lower('WELCOME') from dual;
--initcap(): 첫 글자만 대문자로 변환
select INITCAP('welCOMe to oraCle') from dual;
--length(): 데이터 길이
select length('오라클'), length('oracle') from dual;  --3,6
--lengthb(): 데이터 길이 (byte단위)  ---> 한글을 2byte로 내놓기도 하고 3byte로 내놓기도 해서 잘 안씀
select lengthb('오라클'), lengthb('oracle') from dual; --9,6

--substr(): 문자열이나 데이터의 '시작위치'부터 '선택한 개수'만큼 값을 추출
select substr('Welcome to oracle', 4, 3) from dual;   --4번째 글자부터 3개 추출 ---> com 출력
select substr('Welcome to oracle', -4, 3) from dual;   --뒤에서 4번째 글자부터 3개 추출 ---> acl 출력
--사원의 입사일을 연월일 별로 추출해서 출력
select substr(hiredate,1,2) "연",  substr(hiredate,4,2) "월",  substr(hiredate,7,2) "일" from emp;
--87년 입사 사원만 검색
select * from emp where substr(hiredate,1,2)=87;
--사원명이 E로 끝나는 사원 검색
select *from emp where ename like '%E';
select *from emp where substr(ename,-1,1)='E';

--instr(): 특장 문자의 위치
select instr('WELCOME TO ORACLE', 'O') from dual; -- 5
select instr('WELCOME TO ORACLE', 'O', 6, 2) from dual; --6번째 글자(M)이후로 2번째 O 위치 -> ORACLE의 O, 공백도 카운트 -> 12
--이름의 3번째 이니셜이 R인 사원 검색
select * from emp where substr(ename, 3, 1)='R';
select * from emp where instr(ename, 'R', 3, 1)=3; 
select * from emp where ename like '__R%';

--lpad() / rpad(): 왼/오른쪽에 특정 기호로 채워줌
select lpad('oracle',20,'#') from dual; --##############oracle
select rpad('oracle',20,'#') from dual; --oracle##############

--ltrim() / rtrim(): 문자열 왼/오른쪽 공백 삭제
--trim():문자열 좌우 양쪽의 공백 삭제 + 특정 문자를 잘라냄
select trim('      oracle       ') from dual;
select trim('a' from 'aaaaaaaaaoracleaaaaaaaaaaa') from dual;

--3. 날짜 함수
--sysdate: 시스템 날짜 구해주는 함수
select sysdate-1 어제, sysdate 오늘, sysdate+1 내일 from dual;
--직원들의 현재까지 근무한 일수를 출력
select round(sysdate-hiredate) from emp;
--months_between(data1, data2): 날짜 사이 개월 수
select trunc(months_between(sysdate,hiredate)) from emp;
--add_months(): 기준에서 개월수를 더한 날짜 출력
select ename, hiredate, add_months(hiredate, 6) from emp;
-- next_day() : 해당 날짜 기준으로 돌아오는 요일이 언제인지 반환
select next_day(sysdate, '토') from dual; --오늘(22/01/24)기준 돌아오는 토요일이 며칠인가 -> 22/01/29 출력
--last_day() : 해당 달의 마지막 날 반환
select hiredate, last_day(hiredate) from emp;
select last_day(add_months(sysdate,2)) from dual; -- 시스템 날짜에서 두 달 뒤의 달의 마지막날 출력 -> 3월 마지막날 출력

--과제
--3 가장 최근 입사한 사원명 출력
select ename,hiredate from emp order by hiredate desc;
select ename from (select * from emp order by hiredate desc, ename asc) where rownum=1;
select ename, hiredate from emp where hiredate=(select max(hiredate) from emp); --최근 입사일 검색해서/ 그 값과 같은 hiredate의 조건일 때/ 출력
--4 최대 급여 받는 사원명과 최대급여 금액 출력
select ename, sal from emp order by sal desc;
select ename, sal from (select * from emp order by sal desc, ename asc) where rownum=1;
select ename, sal from emp where sal=(select max(sal) from emp); --최대 급여를 검색해서/ 그 값과 같은 sal의 조건일 때/ ename, sal 출력