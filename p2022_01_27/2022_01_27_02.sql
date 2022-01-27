--2022.01.27 (목)

--TCL
--commit:트랜잭션 종료
--rollback: 트랜잭션 취소
--savepoint : 복구시점 지정

drop table dept01 purge;
create table dept01 as select*from dept;
select*from dept01;

--rollback : 트랜잭션 취소 -> 데이터 복구
delete from dept01;
rollback;

--commit : 트랜잭션 종료
delete from dept01 where deptno=20;
commit;
rollback; --commit으로 종료된건 롤백 안됨

--자동 커밋
--1 정상적인 종료: quit, exit..
--2 DDL, DCL 수행 

--예. DDL 명령 실행 create
delete from dept01 where deptno=40;

create table dept03 as select*from dept;  -- DDL 명령 실행 -- 이시점에서 자동 commit -- 트랜잭션 모두 저장

rollback;  --롤백해도 40 삭제된 상태 유지됨 당연함 커밋했으니까

select*from dept01;

--세이브포인트
select*from dept03;

delete from dept03 where deptno=40;
commit;
delete from dept03 where deptno=30;
savepoint c1;
delete from dept03 where deptno=20;
savepoint c2;
delete from dept03 where deptno=10;
--rollback은 가장 최근에 저장한 지점부터 거슬러 올라가면서 복구해야 함
rollback to c2; -- c2부터 복구
rollback to c1;
rollback; --새 트랜잭션 시작된 시점으로 복구

select * from dept03;

------------------------
-- 무결성 제약조건
-- 테이블에 부적절한 데이터가 입력되는 것을 방지하기 위해, 테이블을 생성할 때 각 컬럼에 대해 정의하는 여러가지 규칙

--1. not null :  반드시 값을 입력해야 한다 (null을 허용하지 않는다)
drop table emp02 purge;
select*from tab;
select*from emp02;

create table emp02( empno number(4) not null,
                              ename varchar2(12) not null,
                              job varchar2(12),
                              deptno number(2));

--제약조건에 위배되지 않는 데이터 입력
insert into emp02 values(1111, 'REMUS', 'MANAGER','10');
--제약조건에 위배되는 데이터 입력
insert into emp02 values(null, null, 'MANAGER','10');

--2. unique : 유일한 값만 입력할 수 있다 
drop table emp03 purge;
select*from tab;
select*from emp03;

create table emp03( empno number(4) unique,
                              ename varchar2(12) not null,
                              job varchar2(12),
                              deptno number(2));
                              
--제약조건에 위배되지 않는 데이터 입력
insert into emp03 values(1111, 'SIRIUS', 'MANAGER',10);
--제약조건에 위배되는 데이터 입력
insert into emp03 values(1111, 'SIRIUS', 'MANAGER',10);
--unique에 null 값 입력
insert into emp03 values(null, 'REMUS', 'MANAGER','10');

--3. primary key (기본키): not null+unique = 중복되지 않고, null이 아니어야 함 ---- row 식별용
select*from dept;

--unique 제약조건 위배 (중복)
insert into dept values(10, '개발', '서울');
--not null 제약조건 위배 (null)
insert into dept values(null, '개발', '서울');

create table emp05( empno number(4) primary key,
                              ename varchar2(12) not null,
                              job varchar2(12),
                              deptno number(2));
select*from emp05;
insert into emp05 values(1111, 'REMUS', 'MANAGER',10); --멀쩡한 데이터 입력
insert into emp05 values(1111, 'SIRIUS', 'MANAGER',20); --중복 불가
insert into emp05 values(null, 'JAMES', 'MANAGER',30); --null 불가


--제약조건명 명시
create table emp04( empno number(4) constraint emp04_empno_uk unique,
                              ename varchar2(12) constraint emp04_ename_nn not null,
                              job varchar2(9),
                              deptno number(2));
 desc emp04;                             
insert into emp04 values(1111, 'REMUS', 'MANAGER',10); --멀쩡한 데이터 입력
insert into emp04 values(1111, 'SIRIUS', 'MANAGER',20); --중복 불가
