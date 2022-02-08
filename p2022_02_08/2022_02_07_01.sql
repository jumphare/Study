--2022.02.07 (월)
------------------------------------------
--자바 연동해 프로시저 실행
--ex1
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
--3. 자바에서 실행
--프로시저는 CallableStatement 클래스로 실행함
--4. 실행 확인
select*from emp01;

--ex2
--1. 프로시저 생성
create or replace procedure del_ename(vename emp01.ename%type) --디폴트: IN
IS
begin
    delete from emp01 where ename=vename; --매개변수 vename과 일치하는 데이터 삭제
end;
select*from user_source;
--2. emp01 테이블 생성
drop table emp01 purge;
create table emp01 as select*from emp; --복사본 테이블 생성
select*from emp01;
--3. 자바에서 실행
--4. 실행 확인
select*from emp01;

--ex3
--1. 프로시저 생성
create or replace procedure sel_customer
                    ( vname in customer.name%TYPE,
                      vemail out customer.email%TYPE,
                      vtel out customer.tel%TYPE)
is
begin
	select email, tel into vemail, vtel from customer where name = vname;
end;
select*from user_source;
--2. 테이블 확인
select*from customer order by no;
--3. 바인드 변수
         variable var_email varchar2(20);
         variable var_tal varchar2(20);
--4. 프로시저 실행 (오라클)
execute sel_customer('가가가', :var_email, :var_tal);
--5. 실행 확인
print var_email;
print var_tal;

---------------------------------------
--저장 함수: 저장프로시저와 유사한 기능을 수행하지만 실행 결과를 돌려주는 역할을 한다

--emp 테이블에서 특정 사원의 sal을 200% 인상한 결과를 리턴하는 저장 함수
--1. 저장함수 생성
create or replace function cal_bonus(vempno in emp.empno%type)
    RETURN number       --리턴될 값의 자료형
is
    vsal emp.sal%type;       --값을 리턴받을 지역변수 선언
begin
    select sal into vsal from emp where empno=vempno;
    RETURN vsal*2;          --200% 인상한 결과를 리턴
end;
--2. 저장함수 목록 확인
select*from user_source;
--3. 바인드 변수 생성
variable var_res number;
--4. 저장함수 실행
execute :var_res :=cal_bonus(7788);
execute :var_res :=cal_bonus(7900);
print var_res;
select sal, cal_bonus(7788) from emp where empno=7788;

--ename을 매개변수로 전달해 해당 사원의 직급job을 리턴하는 저장 함수
--1. 저장함수 생성
create or replace function job_emp(vename in emp.ename%type)
    return varchar2           --리턴될 값의 자료형
is
    vjob emp.job%type;      --값을 리턴받을 지역변수 선언
begin
    select job into vjob from emp where ename=vename;
    return vjob;
end;
--2. 저장함수 목록 확인
select*from user_source;
--3. 저장함수 실행
select ename, job_emp('SCOTT') from emp where ename='SCOTT';
select ename, job_emp('KING') from emp where ename='KING';
--+) 바인드 변수로 호출
variable var_job varchar2(10);
execute :var_job :=job_emp('SCOTT');
print var_job;

-----------------------
--커서: 2개 이상의 데이터를 처리할 때 사용

--ex1. dept테이블 모든 데이터를 출력
--일반 loop문
--1, 저장 프로시저 생성
set SERVEROUTPUT ON
create or replace procedure cursor_sample01
is
    vdept dept%rowtype;     --테이블 전체를 참조하겠음
    cursor c1 is select*from dept;
begin
    DBMS_OUTPUT.PUT_line('부서번호   /   부서명 /   지역명 ');
    DBMS_OUTPUT.PUT_line('-----------------------------------------');
    open c1;
       loop
         fetch c1 into vdept.deptno, vdept.dname, vdept.loc;
         DBMS_OUTPUT.PUT_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
         exit when c1%notfound;
      end loop;
    close c1;
end;
select*from user_source;
--2. 프로시저 실행
execute cursor_sample01;

--ex2. dept 테이블의 모든 데이터를 출력
--for loop : 루프 조건에 커서가 있으면 루프가 반복될 때마다
--자동으로 open-fetch(인출)-close 과정이 처리됨 -> 간결하게 사용할 수 있음!
--1. 저장 프로시저 생성
set SERVEROUTPUT ON
        create or replace procedure cursor_sample02
        is
            vdept dept%rowtype;     --테이블 전체를 참조하겠음 (데이터까지 전부)
            cursor c1 is select*from dept; --dept의 전체 테이블(*)을 커서로 선언
        begin
            DBMS_OUTPUT.PUT_line('부서번호   /   부서명 /   지역명 ');
            DBMS_OUTPUT.PUT_line('-----------------------------------------');
               for vdept in c1 loop     --커서 c1에 vdept 테이블의 row값이 할당되는 동안 루프
               -- 조건에 c1가 있다면 -> 루프할 때마다 알아서 open해서 fetch하고 루프 끝나면 close됨
               ---> 즉, 여기선 open, fetch, close를 쓸 필요가 없음 이걸로 오류 두번 났다 
                 exit when c1%notfound; --c1에 할당된 값이 존재하지 않는다면(not found) 끝
                 DBMS_OUTPUT.PUT_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
              end loop;
        end;
select*from user_source;
--2. 프로시저 실행
execute cursor_sample02;

--deptno을 매개변수로 전달해 부서에 소속된 사원 정보를 커서를 이용해 출력
--1. 프로시저 생성
set SERVEROUTPUT ON
create or replace procedure info_emp (vdeptno in emp.deptno%type)
is
    vemp emp%rowtype;     --emp 테이블 전체 참조
    cursor c1 is select*from emp where deptno=vdeptno;
    --특정 부서번호에 해당하는 row의 모든 데이터값을 커서로 선언할 것
begin
    DBMS_OUTPUT.PUT_LINE('부서번호  /   사원번호    /   사원명  /  직급  /   급여' );
    DBMS_OUTPUT.PUT_line('-----------------------------------------');
    for vemp in c1 loop
        exit when c1%notfound;
        DBMS_OUTPUT.put_line(vemp.deptno||'/'||vemp.empno||'/'||vemp.ename||'/'||vemp.job||'/'||vemp.sal);
    end loop;
end;
select*from user_source;
--2. 프로시저 실행
execute info_emp(40);