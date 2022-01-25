--2022.01.25 (화)

--형변환 함수
--to_char(): 문자형으로 변환
--1-1. 날짜를 문자로
select sysdate, to_char(sysdate, 'YYYY/MM/DD DY') from dual;
select sysdate, to_char(sysdate, 'HH24:MI:SS') from dual;
select to_char(hiredate, 'YYYY/MM/DD HH24:MI:SS DAY') from emp;

--1-2. 숫자를 문자로
select to_char(sal, 'L000,000,000'), to_char(sal, 'L999,999,999') from emp;
--0과 9의 차이!!!!

--to_date(): 날짜형으로 변환
--to_date('문자','날짜 형식') 또는 to_date(숫자,'날짜형식')
select to_date(19800220,'YY/MM/DD') from dual; --80/02/20
select trunc(sysdate-to_date('20220111','YYYYMMDD')) from dual; --날짜 연산할 때

--to_number(): 숫자형으로 변환
select to_number('10,000','99,999')-sal from emp;

--nvl(): null값을 다른 값으로변환
--중요한 건데, 꼭 데이터형을 일치시켜야 함!
select mgr, nvl(to_char(mgr),'CEO') from emp;

---------------------
--decode(): switch case문 비슷한거
--emp에서 deptno를 부서명으로 바꿔 출력
select ename, deptno, decode(deptno, 10, 'ACCOUNGTING',
                                                    20, 'RESEARCH',
                                                    30, 'SALES',
                                                    40, 'OPERATIONS') dname from emp;
select ename, deptno, case when deptno=10 then 'ACCOUNGTING'
                                        when deptno=20 then 'RESEARCH'
                                        when deptno=30 then 'SALES'
                                        when deptno=40 then 'OPERATIONS'
                                        end dname from emp;
                                        
                                        
--------------
--그룹함수
--sum(): 합
select 10,sum(10+20+30),30 from dual;
--avg(): 평균
select sum(sal), round(avg(sal),2) from emp;
--max():최대 / min(): 최소
select max(hiredate) "최근 입사", min(hiredate) "예전 입사" from emp;
--count(): row의 개수를 반환
select count(comm) from emp; --row=4출력 ---> null값은 카운트하지 않음
select count(*) from emp; --테이블의 총 row 수
select count(distinct job) from emp; --중복 제외한 job의 수 (=row)

--group by : 어떤 컬럼을 기준으로 그룹함수 값을 구할 때 사용
select deptno from emp group by deptno; --deptno를 기준으로 묶음
select deptno,round(avg(sal),2) from emp group by deptno; --deptno마다 평균을 구함
select deptno,max(sal),min(sal) from emp group by deptno; --deptno마다 최대급여, 최소급여를 구함
select deptno, count(*) from emp group by deptno; --deptno마다 사원수(row)
--job 기준으로 급여의 합 평균 최대 최소 구하기
select job, sum(sal), trunc(avg(sal)), max(sal), min(sal) from emp group by job;

--having 조건: 그룹으로 묶은 결과에 조건을 걸 때 사용
select deptno, avg(sal) from emp group by deptno HAVING avg(sal)>=2000;
--deptno를 기준으로 평균을 구하는데, '평균이 2000 이상인 조건'에 한정(having)해 출력시킴
select deptno, max(sal) from emp group by deptno having max(sal)>=2900;
--deptno를 기준으로, 최대급여가 2900 이상인 조건에 한정해 출력시킴