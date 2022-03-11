--프로시저의 begin ~ end; 사이의 SQL 며열ㅇ들이 여러개인 경우가 대부분이다. 그 여러개의 명령
-- 트랜잭션 : 하나의 업무를 처리하는 SQL 명령들 -> 모두 정상실행되어야 한다. (commit)
-- 이미 실행된 SQL명령은 취소가 되어야 한다. (rollback)

SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM TBL_BUY# tb; 
-- 오늘의 주제 : 프로시저로 트랜잭션 처리
ALTER TABLE "TBL_BUY#" ADD MONEY number(8);
--처리 순서1: wonder 고객이 CHR-J59를 2개 구입한다.
INSERT INTO "TBL_BUY#"(BUY_SEQ,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
values(tbl_BUY_SEQ.nextval,'wonder','CHR-J59',2,sysdate);
--처리 순서2: dual 임시테이블 이용해서 현재 seq값 구하기
SELECT tbl_buy_seq.currval FROM dual;	--nextval 실행 후에만 확인 가능
--처리 순서3: 구매한 상품의 가격 구하기
SELECT price FROM "TBL_PRODUCT#" tp WHERE pcode='CHR-J59';
--처리 순서4: 처리순서1에서 추가된 행에 money컬럼 계산하고 저장
UPDATE "TBL_BUY#" SET MONEY = 98700*QUANTITY WHERE BUY_SEQ =21;


CREATE OR REPLACE PROCEDURE proc_set_money(
	--처리 순서 1
	acustom_id IN varchar2,
	apcode IN varchar2,
	acnt IN NUMBER,
	isSuccess OUT varchar2
)
IS
	--처리 순서2
	vseq NUMBER; -- 변수 선언
	--처리 순서3
	vprice NUMBER;
BEGIN
	INSERT INTO tbl_test values (2,acustom_id); --트랙잭션의 하나로 가정을하고 임시테이블에 데이터를 추가
	--처리 순서 1
	INSERT INTO "TBL_BUY#"(buy_seq,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
	VALUES (tbl_buy_seq.nextval,acustom_id,apcode,acnt,sysdate);		--매개변수 값으로 추가
	--처리 순서 2
	SELECT tbl_buy_seq.currval INTO vseq FROM dual;
	--처리 순서 3
	SELECT price INTO vprice FROM "TBL_PRODUCT#" tp WHERE PCODE = apcode ;
	--처리 순서 4
	UPDATE "TBL_BUY#" SET MONEY = vprice * QUANTITY WHERE BUY_SEQ = vseq ;
	DBMS_OUTPUT.PUT_LINE('실행 성공');
	isSuccess :='success';
	COMMIT;
	EXCEPTION
		WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('실행 실패');
	ROLLBACK;	--오류가 발생한 sql 앞의 insert, update, delete를 취소
	isSuccess :='fail';
END;

--프로시저 실행
begin 
	proc_set_money('twice','C-BABQ1',4);
END;

	SELECT * FROM "TBL_BUY#" tb;
	SELECT * FROM tbl_test;

CREATE TABLE tbl_test(
	buy_seq number(8),
	custom_id varchar2(20)
);
