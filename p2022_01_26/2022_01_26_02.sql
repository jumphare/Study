--2022.01.26 (수)
--
--DDL(Date Definition Language: 데이터 정의어)
-- - create: 테이블 생성 (정의)
-- - alter: 테이블 구조 변경
-- - rename: 테이블 이름 변경
-- - drop: 테이블 삭제
-- - trincate: 데이터 삭제

--테이블 목록 검색
select * from tab;
select * from user_tables; --데이터 딕셔너리 이용 - 더 자세한 정보

--1. create
--데이터타입
--      - 숫자 데이터
--         number(n) : 정수 n자리까지 저장 ( 최대 38)
--         number(n1, n2) : n1=전체 자릿수, n2=소수점 자리수
--      - 문자 데이터
--         char(): 고정 길이 문자형   최대 2000byte
--         varchar2(): 가변 길이 문자형   최대 4000byte
--         long : 최대 2GB -> 검색 기능 지원하지 않음
--      - 날씨 데이터
--         date: 연/월/일
--         timestamp: 연/월/일 시:분:초

create table emp01(empno number(4), ename varchar2(20), sal number(7,2));
select * from emp02;

--서브쿼리로 테이블 생성 : 복사본 테이블 생성 (단, 제약조건은 복사되지 않음)
create table emp02 as select * from emp; 
--원하는 컬럼으로 구성된 복사본 테이블
create table emp3 as select empno, ename from emp;
select *from emp05;
 create table emp05 as select * from emp where 1=0;
 
 drop table emp3 purge; 
 
 desc emp01;
 
 --2.alter
 -- 01. 컬럼 추가 (add)
 alter table emp01 add(job varchar2(10), passwd varchar2(2));
 -- 02. 컬럼 수정 : 컬럼에 데이터가 없으면 데이터 타입, 컬럼 크기 변경 가능 / 데이터가 있으면 데이터 타입 변경불가, 컬럼 크기 더 크게만 가능
 alter table emp01 modify(job varchar2(30));
 -- 03. 컬럼 삭제
 alter table emp01 drop (passwd, job);
 
 --3. rename : 테이블명 변경
 rename emp01 to test;
 select *from tab;
 
 --4. truncate: 테이블 데이터 삭제
 truncate table emp02;
 
 --5. drop: 테이블 구조 삭제
 drop table emp02; --oracle 10g부터 임시테이블로 교체 (드러워짐)
 drop table test01 purge;  --이래야 완전히 삭제
 select * from tab;
 purge recyclebin;
 
 ----------------------------
-- * 오라클의 객체
--  테이블, 뷰, 시퀀스, 인덱스, 동의어, 프로시저, 트리거
--
--
--* 데이터 딕셔너리와 데이터 딕셔너리 뷰
--
--  - 데이터 딕셔너리 뷰 : user_xxxx
--     (가상 테이블)          all_xxxx
--		                          dba_xxxx
--
--  - 데이터 딕셔너리(시스템 테이블) : 뷰(가상 테이블)을 이용해 접근, 정보 확인할 수 있음
select *from tab; --기본적인 테이블 정보
select * from user_tables; --자세한 테이블 정보
select * from all_tables; --자기 계정 또는 권한 부여받은 테이블의 정보
select * from dba_tables; --오류 발생 -- 왜냐면 dba계정(sys, system)으로만 사용 가능함 --그리고 얘넨 관리계정이라 사실상 모든 테이블 다 보여주는것임

----------------------------------------
--DML(Data Manipulation Language: 데이터 조작어)
--1. insert : 데이터 입력
--
drop table dept01 purge;

create table dept01 as select * from dept where 1=0;
select * from dept01;

insert into dept01(deptno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept01 values(20, 'RESEARCH','DALLAS');
insert into dept01 values(30, '영업부','서울');

--null값 입력
insert into dept01(deptno, dname) values (40, '개발부');
insert into dept01 values(50, '기획부', null);

drop table dept02 purge;

create table dept02 as select * from dept where 1=0;
select * from dept02;

--서브쿼리로 데이터 입력
insert into dept02 select * from dept; --dept 검색해서 전체 데이터(*) 출력해서 insert해라 into dept02로
insert into dept02 select * from dept02; --지 데이터 지한테 집어넣으면 두 배씩 증가됨 아래로 계속 추가될테니까... += 같은 느낌

-- insert all -> 다중 테이블에 데이터 입력
create table emp_hir as select empno, ename, hiredate from emp where 1=0;
create table emp_mgr as select empno, ename, mgr from emp where 1=0;

insert all
into emp_hir values(empno, ename, hiredate)
into emp_mgr values(empno, ename, mgr)
select empno, ename, hiredate, mgr from emp where deptno=20;

select*from emp_hir;
select*from emp_mgr;


--2. update : 데이터 수정

create table emp01 as select*from emp; --조건 없으니까 데이터까지 싹 퍼감
select * from emp01;

update emp01 set sal=sal*1.1;

create table emp02 as select*from emp; 

update emp02 set sal=sal*1.1 where sal>=3000;

update emp02 set hiredate=sysdate where substr(hiredate,1,2)='87'; --hiredate의 연도 추출해서 87이랑 같으면 입사날짜 시스템날짜로 변경

select*from emp02;

--scott 입사일 오늘로, 급여 50으로, 커미션 4000으로

update emp02 set hiredate=sysdate, sal=50, comm=4000 where ename='SCOTT';

