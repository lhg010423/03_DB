-- 한 줄 주석
/*
 * 범위 주석
 * */

-- 11G 버전 이전의 문법을 사용 가능하도록 함
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- CTRL + ENTER : 선택한 SQL 수행

-- 사용자 계정 생성
CREATE USER gwajae_lhg IDENTIFIED BY gwajae_lhg;

-- 사용자 계정에 권한 부여
GRANT RESOURCE, CONNECT TO gwajae_lhg;

-- 객체가 생성될 수 있는 공간 할당량 지정
ALTER USER gwajae_lhg DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
--                                         무제한의 저장공간을 부여한다


-- 비번 변경 코드
ALTER USER kh_lhg IDENTIFIED BY kh1234;
--       비번바꿀아이디           변경할 비번입력






