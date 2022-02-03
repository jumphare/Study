--2022.02.03 (목)

-- 시퀀스 sequence
--: 테이블에 숫자를 자동으로 증가시켜 입력---> 중복 없음 ---> 테이블 내의 유일한 숫자(유일한 값)를 자동으로 생성하는 발생기
--: 시작값, 증가치, 사이클, 최대값을 지정할 수 있음 +) 기본적으로 증가만 가능

--시퀀스 생성
create sequence dept_deptno_seq     --시퀀스명: 테이블명_컬럼명_seq 형식을 따르는 게 일반적
    start with 10                               --start with: 시작값 (기본값=1, 지정 가능)
    increment by 10;                         --increment by: 증가치 (기본값=1, 지정 가능)

select *from seq;                             --시퀀스 목록 확인
select *from user_sequences;            --시퀀스 목록 확인

--시퀀스 적용
--currval: 시퀀스 현재값을 반환     nextval: 시퀀스 다음값을 반환

select dept_deptno_seq.nextval from dual; ---10, 20, 30... 마지막 출력된 그 다음값을 계속 반환
select dept_deptno_seq.currval from dual; ---가장 마지막에 반환된 값=nextval로 찍은 가장 최근값 반환

drop table emp01 purge;

--ex1. 시퀀스를 테이블의 기본키에 적용
--테이블 생성
create table emp01 ( empno number(4) primary key, ename varchar2(10), hiredate date);
--시퀀스 생성
create sequence emp01_empno_seq; --옵션 모두 생략 ---> 시작값1, 증가치1 (default)
--데이터 입력
insert into emp01 values(emp01_empno_seq.nextval, 'Sirius', sysdate); --empno에 시퀀스 입력
--(주의! nextval이어야 다음값이 계속 반환됨. currval은 최근 반환값이 계속 반환되므로 중복---> primary key로 입력 불가)

--ex2.
--테이블 생성
create table dept_exp( deptno number(4) primary key, dname varchar2(10), loc varchar2(15));
--시퀀스 생성
create sequence dept_exp_seq
    start with 10
    increment by 10; --시작값10, 증가치10
--데이터 입력
insert into dept_exp values(dept_exp_seq.nextval, '인사과', '서울');
insert into dept_exp values(dept_exp_seq.nextval, '경리과', '서울');
insert into dept_exp values(dept_exp_seq.nextval, '총무과', '대전');
insert into dept_exp values(dept_exp_seq.nextval, '기술과', '인천');
select *from dept_exp;

--시퀀스 삭제
drop sequence dept_exp_seq;

select *from seq;

--시퀀스 수정
drop sequence dept_deptno_seq;
create sequence dept_deptno_seq
    start with 10
    increment by 10
    maxvalue 30; --최대값, 이 이상 넘어가면 오류 발생 (cycle도 없고)
select dept_deptno_seq.nextval from dual;

alter sequence dept_deptno_seq maxvalue 1000000; --maxvalue 최대값 수정
select dept_deptno_seq.nextval from dual;



--인덱스 index
--: 빠른 검색을 하기 위해 사용되는 객체

select *from user_indexes;
-- 기본키primary key가 설정된 컬럼은 자동으로 고유 인덱스가 만들어짐. unique -> 고유 인덱스

--인덱스 유무에 따른 검색 속도 비교
--1. 복사본 테이블 생성 ---> 제약 조건은 복사되지 않음 (primary key 존재 안 함)
create table emp01 as select*from emp; --따로 조건 지정되어있지 않으므로 데이터까지 싹 긁었음
--2. 데이터 입력
insert into emp01 select*from emp01; --자기 데이터를 아래에 또 추가.. 두 배씩 계속 추가
--3. 검색 데이터 입력
insert into emp01(empno, ename) values(1111, 'Sirius');
--4. 시간 측정용 타이머 설정
set timing on --취소할 땐 off
--5. 검색 시간 측정
----5-1. 인덱스 없음
select *from emp01 where ename='Sirius';   --30.398초
----5-2. 인덱스 있음
create index idx_emp01_ename on emp01(ename); --인덱스 생성
    ---> 많은 데이터가 존재할 때 인덱스 생성하면 (처음 한 번) 생성 시간이 꽤 소요됨
select *from emp01 where ename='Sirius';   --0.135초

--인덱스 삭제
drop index idx_emp01_ename;

----인덱스 종류
--고유 인덱스: 중복된 데이터가 없는 컬럼에 적용 (예를 들면 primary key)
--비교유 인덱스: 중복된 데이터가 있는 컬럼에 적용

----고유, 비고유 인덱스 비교
--1. 테이블 생성
create table dept01 as select * from dept where 1=0; --테이블 골조만
--2. 데이터 입력 : loc 컬럼에 중복 데이터 입력
insert into dept01 values(10, '인사과','서울');
insert into dept01 values(20, '총무과','대전');
insert into dept01 values(30, '교육과','대전');
select *from dept01;
--3. 고유 인덱스 생성 (on deptno, 중복 데이터가 존재하지 않는 곳에)
create unique index idx_dept01_deptno on dept01(deptno); --unique 반드시! 붙여야!
   ----> 고유 인덱스가 존재하는 곳에 중복 데이터를 입력한다면?
      insert into dept01 values(10, '인사과','대전'); --오류
   ----> 중복 데이터가 존재하는 곳에 고유 인덱스를 생성한다면?
      create unique index idx_dept01_loc on dept01(loc); --오류
--4. 비고유 인덱스 생성 (on loc, 중복 데이터가 존재하는 곳에)
create index idx_dept01_loc on dept01(loc);
--5. 인덱스 비교
select*from user_indexes;

--결합 인덱스: 둘 이상의 컬럼으로 만들어진 인덱스 (하나는 단일 인덱스, 지금까지 만든 것들)
  create index idx_dept01_com on dept01(deptno, dname);
  
--함수 기반 인덱스: 수식이나 함수를 적용해 만든 인덱스
create index idx_emp01_annsal on emp(sal*12);