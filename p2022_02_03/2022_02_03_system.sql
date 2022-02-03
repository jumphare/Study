--2022.02.03 (목)

-- DB 보안을 위한 권한
--1. 시스템 권한: 데이터베이스 관리자(dba)가 가지고 있는 권한 ex) create user, drop user...
--     +) 데이터베이스 관리 권한 (grant 명령어 이용)
--            - create session: 데이터베이스 접속 권한
--            - create table: 테이블 생성 권한
--            - create view: 뷰 생성 권한
--            - create sequence: 시퀀스 생성 권한
--            - create procedure: 프로시저(함수) 생성 권한

--사용자 계정 생성 (create user)
create user user01 identified by tiger;
select*from dba_users;
-----이 시점에서, 생성된 계정이 계정 목록에는 존재하지만 로그인 권한이 없어 접속할 수 없음
---------> system이 생성된 계정에, grant로 권한을 부여해야함
--user01 계정에 권한 부여: grant create session, ... to 계정명;
grant create session to user01; --DB 접속 권한 부여
grant create session, create table, create view to user01; --콤마(,)로 권한 여러 개 부여 가능

--with admin option : 시스템 권한을 부여할 때 이 옵션을 추가하면,
--권한을 부여받은 사용자는 DBA가 아니지만 다른 사용자에게 /자신이 부여받은/ 시스템 권한을 부여할 수 있음
--새로운 계정 생성
create user user02 identified by tiger;
--db 접속 권한 부여. 근데이제 with admin option을 곁들인
grant create session to user02 with admin option;
--또다른 계정 생성
create user user03 identified by tiger;
--01. user01가 user03에게 권한 부여
-------권한 부여할 권한이 없으니 불가능

--02. user02가 user03에게 권한 부여
-------권한 부여할 권한 있어서 가능


---------------------------------------------
--롤Role : 여러 권한을 묶어놓은 것
--오라클에서 기본적으로 제공되는 롤
--connect(8개), resource(20여 개), dba(130여 개)

--1. 계정 생성
create user user04 identified by tiger;
select*from dba_users;
-------이 시점에서 어떤 권한도 부여되지 않은 상황 - 접속도 안 됨
--2. role 부여: connect, resource
grant connect, resource to user04;
-------권한 부여


--사용자 정의 롤
--1. 롤 생성
create role mrole;
--2. 권한 추가 --- 사용자 마음대로, 원하는대로.
grant create session, create table, create view to mrole;
--3. 계정에 사용자 정의 롤(mrole) 부여
create user user05 identified by tiger; --계정 생성
grant mrole to user05; --사용자 정의 롤을 이용해 권한 부여
--create table만 가지고는 테이블 생성 안 됨! 뭐 크기 정의하고.. 뭐 더 있는듯
--이건 그냥 사용자 정의 롤의 예시라고 생각하자


--사용자 정의 롤- 객체권한
--1. 롤 생성
create role mrole02;
--2. 권한 추가 --- 객체 권한
conn scott/tiger;
grant select on emp to mrole02; --scott 계정에서 실행!
--3. 계정에 권한 부여
conn system/oracle
grant mrole02 to user05;
--4. user05 계정으로 검색

----
--롤 회수: revoke 롤명 from 계정명;
revoke mrole,mrole02 from user05;

--롤 삭제
drop role mrole;
drop role mrole02;


-------------------------------------
--디폴트 롤: 시스템 권한+객체 권한
--1. 롤 생성 (conn system)
create role def_role;
--2. 시스템 권한 추가 (conn system)
grant create session, create table to def_role;
--3. 객체 권한 추가 (conn scott)★
conn scott/tiger;
grant select on emp to def_role;
grant update on emp to def_role;
grant delete on emp to def_role;
----//이거 묶어도 에러는 안나던데 혹시 모르니까? 하나씩?
--4. 권한 부여할 계정 생성 (conn system)
create user user_a identified by tiger;
create user user_b identified by tiger;
create user user_c identified by tiger;
--5. def_role 부여 (conn system)
grant def_role to user_a;
grant def_role to user_b;
grant def_role to user_c;
--6. 부여한 계정으로 접속 후 검색 ㄱㅂㅈㄱ
conn user_a/tiger
select*from scott.emp;

