-- view : 가상 테이블(물리적으로 존재하지않고 논리적으로 만들어진 테이블)
--			ㄴ 물리적인 테이블을 이용해서 생성한다.
--			ㄴ 사용자(개발자)가 테이블처럼 select 조회를 할 수 있는 테이블
--			ㄴ grant resource, connect to idev; -> resource에 view 생성은 제외


CREATE VIEW v_buy
AS
SELECT PCODE, CUSTOM_ID FROM TBL_BUY#;	--오류 : insufficient PRIVILEGES (권한 없음)

--idve 유저에게 CREATE view 권한을 주기위해서 (SQL.plus)실행
--SQL > connect system	: 입력
--ENter password : 1234	: 입력
--connected.	:	출력
--SQL > grant CREATE VIEW TO idev; : 입력
--GRANT succeeded. : 출력

--view 를 이용한 select 조회
SELECT * FROM V_BUY vb WHERE PCODE = 'dk_143';

--buy#, custom#을 조인하여 custom_id, pcode, 고객이름, 이메일, 구매수량, 구매날짜
--	ㄴ v_sale 이름의 view를 만드세요.

--CREATE VIEW V_sale AS 
--SELECT CUSTOM_ID, PCODE, NAME, EMAIL, QUANTITY, REG_DATE 
--FROM TBL_BUY# tb, TBL_COSTOM# tc 
--WHERE tb.CUSTOM_ID = tc.CUSTOM_ID;	--오류발생 : 원인 찾기

CREATE VIEW V_sale
AS
SELECT tc.CUSTOM_ID, tb.PCODE, tc.NAME, tc.EMAIL, tb.QUANTITY, tb.BUY_DATE 
FROM "TBL_CUSTOM#" tc , "TBL_BUY#" tb 
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID ;


