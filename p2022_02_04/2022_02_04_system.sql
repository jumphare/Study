--2022.02.04 (금)

--동의어(synonym)
--1. 비공개 동의어: 객체에 대한 권한을 부여받은 사용자가 정의한 동의어, 해당 사용자만 사용 가능

--------------------------------------
--비공개 동의어 생성--
--1. system 계정 접속 후 테이블 생성 (conn system)
create table systbl(ename varchar2(20));
--2. 데이터 추가 (conn system)
insert into systbl values('Sirius');
insert into systbl values('Remus');
--3. scott계정에 systbl에 대한 select 권한 부여 (conn system)
grant select on systbl to scott;
--4. scott 계정 접속 후 검색 (conn scott)
conn scott/tiger
select*from system.systbl;   --계정.객체 형태로 접근해야 함
--5. scott 계정에 동의어 생성 권한 부여(conn system)
grant create synonym to scott;
--6. scott 계정에서 동의어 생성 (conn scott)
conn scott/tiger
create synonym systbl for system.systbl;
--7. 동의어 목록 확인 (conn scott)
conn scott/tiger
select*from user_synonyms;
--8. 동의어로 검색 (conn scott)
select*from systbl;


--동의어 삭제
-- 동의어 생성한 계정에서 삭제해야 함
drop synonym systbl;

--------------------------------------
--공개 동의어--
--system 계정에서 생성해야 함
create public synonym pubdept for scott.dept;
select*from dba_synonyms; --공개 동의어는 dba로 검색!
drop public synonym pubdept;

