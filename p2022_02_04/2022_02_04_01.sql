--2022.02.04 (금)

------동의어
--비공개 동의어 생성--
--4. scott 계정 접속 후 검색 (conn scott)
select*from system.systbl;   --계정.객체 형태로 접근해야 함
--6. scott 계정에서 동의어 생성 (conn scott)
create synonym systbl for system.systbl;
--7. 동의어 목록 확인 (conn scott)
select*from user_synonyms;
--8. 동의어로 검색 (conn scott)
select*from systbl;

--동의어 삭제
-- 동의어 생성한 계정에서 삭제해야 함
drop synonym systbl;


----------------------------------------------------------------
----------------------------------------------------------------
--PL/SQL

--hello world 출력
set serveroutput on
--serveroutput: 메시지를 화면에 출력해주는 환경 변수, 기본 off라 on으로 변경해야 함
begin
DBMS_OUTPUT.PUT_LINE('Hello world');   -- dbms_output : 패키지    put_line: 프로시저
end;     -- 블록 끝


--변수 사용
set serveroutput on
            --얘만 따로 먼저 실행시키고, 아래 코드 실행해야 오류 안 남
            --오류 코드: Encountered the symbol "SET"
declare                          --선언부 시작
    vempno number(4);      --sql과 유사한 선언-> 스칼라 변수
    vename varchar2(10);
begin                             --실행부
    vempno :=7788;            --변수 값 대입은 := 사용
    vename :='SCOTT';
    DBMS_OUTPUT.PUT_LINE('사번    /   이름');
    DBMS_OUTPUT.PUT_LINE(VEMPNO ||'/'|| VENAME);
     -- 문자와 변수, 컬럼 등을 연결할 때 문자 양쪽에 || 사용
end; 


--레퍼런스 변수 사용 ---> 사번과 이름 검색
set serveroutput on

declare
    vempno emp.empno%type;      --레퍼런스 변수 선언
    vename emp.ename%type;
begin
    select empno, ename into vempno, vename from emp where ename='SCOTT'; 
    --vempno, vename 안으로(into) empno, ename 값을 넣겠다
    DBMS_OUTPUT.PUT_LINE('사번    /   이름');
    DBMS_OUTPUT.PUT_LINE(VEMPNO ||'/'|| VENAME);
end;


-----------------------------------------------------------------------
-------조건문-------
--1. 일반 if문 (if - then - end if)
--scott의 부서번호deptno를 검색해 부서명을 출력
set serveroutput on
declare
    vempno number(4);
    vename varchar2(20);
    vdeptno emp.deptno%type;   --deptno 컬럼의 데이터형, 크기 그대로 따올라고 이렇게 참조함
    vdname varchar2(20) :=null; -- 결과를 집어넣어 출력해야 하니까 null
begin
    select empno, ename, deptno into vempno, vename, vdeptno from emp where ename='SCOTT';
    --emp 테이블의 SCOTT에 해당하는 row를 검색해서 그 row의 값을 각 컬럼(v-)에 대입할 것임
    if vdeptno= 10 then
        vdname:='ACCOUNTING';
    end if;
    if vdeptno= 20 then
        vdname:='RESEARCH';
    end if;
    if vdeptno= 30 then
        vdname:='SALES';
    end if;
    if vdeptno= 40 then
        vdname:='OPPERATIONS';
    end if;
    DBMS_OUTPUT.PUT_LINE('사번    /   이름  /   부서');
    DBMS_OUTPUT.PUT_LINE(vempno||'   /   '||vename||'   /   '||vdname);
end;

--2. if else문
--emp의 scott 사원의 연봉sal 출력
set serveroutput on
declare
    vemp emp%rowtype;    --emp테이블의 모든 컬럼을 그대로 가져옴
    annsal number(7,2);
begin
    select*into vemp from emp where ename='SCOTT';
    --scott에 해당하는 row의 데이터값 전부를 vemp에 집어넣을 것임
    -- annsal:=vemp.sal*12+vemp.comm;  --변수명.컬럼명 형태로 표시
                -- 단, comm=null이라면 계산되지 않으므로 값 바꿔줘야 함
                
    if vemp.comm is null then  --null인지 판단할 땐 [is null] 사용!!!!
        annsal:=vemp.sal*12;    --아니면 vemp.comm=0으로 변경해도 됨
    else
        annsal:=vemp.sal*12+vemp.comm; --null이 아니면 더해줌
    end if;
    
    DBMS_OUTPUT.PUT_LINE('사원    /   연봉');
    DBMS_OUTPUT.PUT_LINE(vemp.ename||'    /   '||annsal);
end;

--3. 다중 if문
--scott의 부서번호deptno를 이용해 부서명dname을 출력
set SERVEROUTPUT on
declare
    vemp emp%rowtype;
    vdname varchar2(14);
begin
    select * into vemp from emp where ename='SCOTT'; --vemp에 데이터 저장
    
    if vemp.deptno=10 then
        vdname:='ACCOUNTING';
    elsif vemp.deptno= 20 then
    
        vdname:='RESEARCH';
    elsif vemp.deptno= 30 then
        vdname:='SALES';
    else
        vdname:='OPERATIONS';
    end if;
    DBMS_OUTPUT.PUT_LINE('사번    /   이름  /   부서');
    DBMS_OUTPUT.PUT_LINE(vemp.empno||'   /   '||vemp.ename||'   /   '||vdname);
end;

------------------------------------------------
----반복문----
--1. basic loop
--1~5까지 출력
set SERVEROUTPUT ON
declare
    n number:=1;        --변수의 초기화
begin
    loop
        DBMS_OUTPUT.PUT_LINE (n);
        n:=n+1;
        if n>5 then
            exit;       --n이 5보다 크면 반복 끝
        end if;
    end loop;
end;
--1부터 10까지의 합
set SERVEROUTPUT ON
declare
    n number:=1;
    s number:=0;
begin
    loop
        s:=s+n;
        n:=n+1;
        if n>10 then
            exit;
        end if;
    end loop;
    DBMS_OUTPUT.PUT_LINE('1~10까지 합:'||s);
end;

--2. for loop
--1부터 5까지 출력
set SERVEROUTPUT ON
--declare --변수 선언할 게 없으면 굳이 쓸 필요 없음
begin
    for n in reverse 1..5 loop      --reverse: 1씩 감소
        DBMS_OUTPUT.PUT_LINE (n);
    end loop;
end;

--dept의 모든 정보를 출력
set SERVEROUTPUT ON
declare
    vdept dept%rowtype;
begin
    DBMS_OUTPUT.PUT_LINE('부서번호  /   부서명    /   지역명');
    for cnt in 1..4 loop
        select* into vdept from dept where deptno=10*cnt;
        DBMS_OUTPUT.PUT_LINE(vdept.deptno||'    /   '||vdept.dname||'   /   '||vdept.loc);
    end loop;
end;

--3. while loop
--1부터 5까지 출력
set SERVEROUTPUT ON
declare
    n number:=1;
begin
    while n<=5 loop
        DBMS_OUTPUT.PUT_LINE (n);
        n:=n+1;         --증가치 제어 가능 (for loop랑 차이)
    end loop;
end;
-- *을 삼각형으로 출력
set SERVEROUTPUT ON
declare
    c number:=1;
    str varchar2(100):=null;    --문자의 초기화는 0이 아니라 null
begin
    while c<=5 loop
        str:=str||'*';                 --문자를 추가할 때는 || 사용
        DBMS_OUTPUT.PUT_LINE(str);
        c:=c+1;                      --증가치 지정. 까먹지 말 것!!!!!!!
    end loop;
end;