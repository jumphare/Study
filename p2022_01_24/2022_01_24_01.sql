--2022.01.24 (월)

--null 검색
 select * from emp where comm is null;
 select * from emp where comm is not null;

--order by
-- 오름차순(ASC):     작은 숫자부터     사전 순으로      오래된 날짜 순으로      null 마지막에 출력       ---> 기본 정렬방식(생략 가능)
-- 내림차순(DESC):   큰 숫자부터        사전 역순으로    최근 날짜 순으로        null 처음에 출력
 select * from emp where comm is not null order by comm; --커미션 null 아닌 사원을 오름차순 정렬
  select ename,sal from emp order by sal desc, ename asc;   --급여 순으로 내림차순, 동일 급여일 때 이름 알파벳 순으로 출력
 select empno,ename,job,hiredate from emp order by hiredate ; --입사일 기준으로 오름차순 정렬, 사원번호,사원명,직급,입사일 출력
  select empno,ename from emp order by empno desc;