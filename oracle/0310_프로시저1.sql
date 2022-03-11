-- PL/SQL : Procedure(절차,순서), 기존의 단순한 SQL이 확장된 언어
--			변수, 제어문(if,반복문)을 사용하여 프로그래밍언어와 같이 sql 실행의 흐름을 제어




--프로시저 기본형식
DECLARE	--변수 선언
--	vcustomid varchar2(20);
--	vage number(3,0);
	vcustomid tbl_custom#.custom_id %TYPE; --테이블명.컬럼명 로 지정된 타입과 동일하게 한다.
	vage tbl_custom#.age %TYPE;
BEGIN	--프로시저 시작
	--프로시저 내부에는 주로 DML 명령문들을 작성한다. (함께 실행해야할 여러 SQL : 트랜잭션)
	SELECT custom_id,age 
	INTO vcustomid , vage --프로시저 구문 : 검색결과를 변수에 저장
	FROM "TBL_CUSTOM#" tc 
	WHERE CUSTOM_ID ='mina012';	-- 1개 행만 결과 조회되는 조건
	-- 변수값을 콘솔에 출력(프로시저 명령)
	DBMS_OUTPUT.PUT_LINE('고객이름 : '|| vcustomid);
	DBMS_OUTPUT.PUT_LINE('고객나이 : '|| vage);
	EXCEPTION
	WHEN no_data_found THEN	--예외 이름은 다양하다. OTHERS 예외는 모든 경우
		DBMS_OUTPUT.PUT_LINE('찾는 데이터가 없습니다.');
END;	--끝