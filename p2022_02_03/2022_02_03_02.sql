--2022.02.03 (목)

--객체 권한
--새로 생성된 user01 계정에게 scott 계정 소유의 emp테이블 객체에 대한 권한(select)을 부여
grant select on emp to user01;
--권한 부여 취소 revoke
revoke select on emp from user01;

-- with admin option : 객체 권한을 부여할 때 이 옵션을 추가하면,
-- 권한을 부여받은 사용자는 다른 사용자에게 /자신이 부여받은/ 객체 권한을 부여할 수 있음

--user02 계정에 scott 계정의 emp 테이블 객체에 대한 권한(select) 부여
grant select on emp to user02 with grant option;
--with grant option을 곁들여 select 권한 부여

--01. user01가 user03에게 scott 계정의 emp 테이블에 대한 권한 부여
grant select on scott.emp to user03;
-------권한 부여할 권한이 없으니 불가능

--02. user02가 user03에게 scott 계정의 emp 테이블에 대한 권한 부여
grant select on scott.emp to user03;
-------권한 부여할 권한 있어서 가능


----///사용자 정의 롤 - 객체권한 부여
grant select on emp to mrole02;
-----------------------------------------

----///디폴트 롤
grant select on emp to def_role;
grant update on emp to def_role;
grant delete on emp to def_role;
