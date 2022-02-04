--2022.02.04 (금)

--저장 프로시저

drop table emp01 purge;
create table emp01 as select*from emp; --복사본 테이블 생성
select*from emp01;
-----매개변수 없는 저장 프로시저
--1. 저장 프로시저 생성
create or replace procedure del_all
IS
begin
    delete from emp01;
end;

--2. 프로시저 목록 확인
select*from user_source;
--3. 저장 프로시저 실행
execute del_all;
--4. 실행 확인
select*from emp01;  --데이터 삭제 확인
rollback;
-- 데이터 복구 (주의! create로 프로시저를 생성한 뒤에는 자동 커밋되므로 이전에 삭제된건 복구 불가)

insert into emp01 select *from emp; --데이터 복구
select*from emp01;

-----매개변수 있는 저장 프로시저
--1. 프로시저 생성
create or replace procedure del_ename(vename emp01.ename%type) --디폴트: IN
IS
begin
    delete from emp01 where ename=vename; --매개변수 vename과 일치하는 데이터 삭제
end;

--2. 프로시저 목록 확인
select*from user_source;
--3. 저장 프로시저 실행
execute del_ename('SCOTT'); --매개변수 반드시 작성!
--4. 실행 확인
select*from emp01;
rollback;

-----매개변수 여러 개 있는 프로시저
----      - [mode]
--         in: 매개변수로 데이터를 전달받는 역할
--         out: 매개변수로 값을 리턴하는 역할
--         inout: 둘 다 (쓸 일이 있을까?)

--empno를 매개변수로 전달받아, 그 사원의 ename, sal, job을 구해 리턴
--1. 프로시저 생성
create or replace procedure sal_empno(      --매개변수 지정
                vempno in emp.empno%type,
                vename out emp.ename%type,
                vsal out emp.sal%type,
                vjob out emp.job%type )
IS
begin
    select ename, sal, job into vename, vsal, vjob from emp
    where empno=vempno;    --입력받을 데이터 vempno가 empno일 때 리턴될 컬럼 검색
end;
--2. 프로시저 목록 확인
select*from user_source;
--3. 저장 프로시저 실행
-----※ out으로 리턴받을 데이터를 저장할 바인드 변수를 미리 선언해야 함!
-----    바인드 변수
variable var_ename varchar2(12);
variable var_sal number;
variable var_job varchar2(10);
-----※ out 매개변수의 값을 리턴받을 때, 변수 앞에 [ : ] 를 붙여야 함!
exec sal_empno(7788, :var_ename, :var_sal, :var_job);
--4. 실행 확인
print var_ename;
print var_sal;
print var_job;
--DBMS_OUTPUT.PUT_LINE(var_ename||' / '||var_sal||' / '||var_job);
--얘 안되는 이유... 얜 begin end 안에서 돌려야 하니까!

------------------------------------------
--자바 연동해 프로시저 실행
--1. 프로시저 생성 --- 오라클에서!
create or replace procedure del_all
IS
begin
    delete from emp01;
end;
select*from user_source;
--2. emp01 테이블 생성
drop table emp01 purge;
create table emp01 as select*from emp; --복사본 테이블 생성
select*from emp01;
--3. 자바에서 실행할거야
--프로시저는 CallableStatement 클래스로 실행함