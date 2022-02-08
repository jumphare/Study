--2022.02.07 (월)

--패키지 : 관련 있는 프로시저를 효율적으로 관리 + 패키지 단위로 배포할 때 사용

--1. 패키지 생성
--패키지헤드=명세부: 패키지에 들어갈 프로시저, 함수들을 선언
create or replace package exam_pack IS
    function cal_bonus(vempno in emp.empno%type)
    return number;
    procedure cursor_sample02;
end;           --따로 begin은 없고 IS 뒤에 선언하고 end함
--패키지바디=몸체부: 프로시저, 함수들 각각의 내용 정의
create or replace package BODY exam_pack IS
    FUNCTION cal_bonus(vempno in emp.empno%type)  --->저장함수 선언
        return number   
        is
             vsal emp.sal%type;      
         begin
             select sal into vsal from emp where empno=vempno;
             RETURN vsal*2;        
         end; --함수 end
    PROCEDURE cursor_sample02                               ---> 저장프로시저 선언
         is
              vdept dept%rowtype;    
             cursor c1 is select*from dept; 
         begin
             DBMS_OUTPUT.PUT_line('부서번호   /   부서명 /   지역명 ');
             DBMS_OUTPUT.PUT_line('-----------------------------------------');
             for vdept in c1 loop   
               exit when c1%notfound; 
               DBMS_OUTPUT.PUT_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
             end loop;
         end; --프로시저 end
end; --패키지 바디 end

--2. 패키지 내 프로시저, 함수 호출
set SERVEROUTPUT ON
variable var_res number;
execute :var_res :=exam_pack.cal_bonus(7788); --저장함수 실행
print var_res;
select ename, exam_pack.cal_bonus(7788) from emp where empno=7788; --sql문으로 저장함수 실행
execute exam_pack.cursor_sample02;               --저장프로시저 실행

--dbms_output패키지 확인 (system계정)
select object_name from dba_obdects
where object_type='PACKAGE'
and object_name like 'DBMS_%'
order by object_name;

---------------------------------
--트리거: 어떤 이벤트가 발생했을 때 자동으로 실행되는 프로시저
drop table emp01 purge;
create table emp01 (empno number(4) primary key, ename varchar2(20), job varchar2(20));
select*from emp01;
--emp01 테이블에 사원을 등록하면 등록 메시지가 출력되는 트리거
create trigger emp01_trigger
after insert on emp01    --emp01에 insert 이벤트가 발생한 후에 트리거 발생!
begin
    DBMS_OUTPUT.PUT_LINE('새로운 사원이 등록되었습니다.');
end;
select *from user_triggers;
--테이블에 값 입력
set SERVEROUTPUT ON   --dbms_어쩌고 출력되게 하려면 꼭 on 해줘야 함
insert into emp01 values(1,'JAMES','MANAGER');
insert into emp01 values(2, 'SIRIUS', 'ANALYST');
insert into emp01 values(3, 'REMUS', 'CLERK');
delete from emp01;

--emp01 테이블에 사원을 등록하면 sal01 테이블에 급여 정보를 자동으로 추가하는 트리거
--1. sal01 테이블 생성
create table sal01 (salno number(4) primary key, sal number(7,2),
                          empno number(4) references emp01(empno)); --foreign key
select*from sal01;
--2. 시퀀스 생성
create sequence sal01_salno_seq; --시퀀스 생성(시작값, 증가치 디폴트 1)
select*from seq;
--3. 트리거 생성
create or replace trigger sal_trigger
after insert on emp01
for each row
begin
    insert into sal01 values(sal01_salno_seq.nextval,100,:new.empno);
                --:new.empno--> 참조하고 있는 테이블 emp01에 insert된 empno를 가져옴 
    DBMS_OUTPUT.put_line('급여가 등록되었습니다.');
end;
--3. 테이블에 값 입력
set SERVEROUTPUT ON  
insert into emp01 values(1,'JAMES','MANAGER');
insert into emp01 values(2, 'SIRIUS', 'ANALYST');
insert into emp01 values(3, 'REMUS', 'CLERK');
select*from sal01;

--emp01 테이블에서 사원이 삭제되면 sal01의 급여 정보도 함께 삭제되는 트리거
delete from emp01 where empno=1;
---> 불가능함. 얘를 참조하고 있는 테이블sal01이 존재하기 때문에.
-- foreign key에 on delete cascade 옵션이 있어야만 가능함
-- 하지만 트리거로도 데이터를 삭제하도록 조치할 수 있음
--1. 트리거 생성
create or replace trigger del_trigger
after delete on emp01
for each row
begin
    delete from sal01 where empno=:old.empno;
    --:old.empno--> 참조하고 있는 테이블 emp01에 존재하고 있던 해당 empno를 가져옴
end;
select *from user_triggers;
--2. 이벤트 발생: emp01의 데이터 삭제
delete from emp01 where empno=1;
select*from sal01;
select*from emp01;