--시험준비(2)
--키워드의 순서 FROM - WHERE - GROUP BY - HAVING - ORDER BY
--DDL

CREATE TABLE TBL_CUSTOM#( --고객
	custom_id varchar2(20) PRIMARY KEY,				
	name nvarchar2(20) NOT NULL,					
	email nvarchar2(20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);

CREATE TABLE TBL_PRODUCT#( --상품
	pcode varchar2(20) CONSTRAINT pk_product PRIMARY KEY,
	category char(2),
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL
);

CREATE TABLE TBL_BUY#( --구매
	buy_seq number(8),	
	custom_id varchar2(20),
	pcode varchar2(20),
	quantity number(5) NOT NULL,
	buy_date timestamp
);

ALTER TABLE TBL_CUSTOM# ADD phone NUMBER(11); --칼럼 추가
ALTER TABLE TBL_CUSTOM# MODIFY phone NVARCHAR2(13); --칼럼 수정
ALTER TABLE TBL_CUSTOM# DROP COLUMN phone; --칼럼 삭제

ALTER TABLE "TBL_BUY#" ADD CONSTRAINT pk_buy_seq PRIMARY KEY(buy_seq); --기본키 추가 
ALTER TABLE "TBL_BUY#" ADD CONSTRAINT fk_custom_id FOREIGN KEY(custom_id) 
REFERENCES TBL_CUSTOM#(custom_id); --외래키 추가
ALTER TABLE "TBL_BUY#" ADD CONSTRAINT fk_pcode FOREIGN KEY(pcode) 
REFERENCES TBL_PRODUCT#(pcode); --외래키 추가

CREATE SEQUENCE TBL_BUY_SEQ; --시퀀스 생성
DROP SEQUENCE TBL_BUY_SEQ; --시퀀스 삭제

CREATE VIEW V_TBL
AS
SELECT CUSTOM_ID FROM TBL_BUY#; --뷰 생성

--DML

INSERT INTO TBL_CUSTOM# (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '김미나', 'kimm@gmail.com', 20, sysdate);
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', '홍길동', 'gil@korea.com', 32, sysdate);
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '박모모', 'momo@daum.net', 29, sysdate);
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '이나나', 'lee@naver.com', 40, sysdate);

INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '아이패드', 880000);
INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '동원참치선물세트', 54000);
INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '모션데스크', 234500);

-- 김미나가 아이패드 1개를 어제 구매
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'IPAD011', 1, '2022-02-06');
-- 홍길동이 아이패드 2개를 오늘 구매
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'hongGD', 'IPAD011', 2, '2022-02-07');
-- 이나나가 참치선물세트 3개를 어제 구매
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'wonder', 'DOWON123a', 3, '2022-02-06');
-- 김미나가 모션데스크 1개를 오늘 구매
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'dk_143', 1, '2022-02-07');
-- 박모모가 참치선물세트 2개를 오늘 구매
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'twice', 'DOWON123a', 2, '2022-02-07');


INSERT INTO "TBL_CUSTOM#" (CUSTOM_ID,NAME,EMAIL,AGE,REG_DATE)
VALUES ('test','테스트','test01@gmail.com',11,sysdate);
UPDATE "TBL_CUSTOM#" SET CUSTOM_ID = 'take' WHERE NAME='테스트';
DELETE FROM "TBL_CUSTOM#" tc WHERE NAME ='테스트';

--하나의 테이블에서 일반적인 조회
SELECT * FROM "TBL_CUSTOM#" tc WHERE AGE >=30;
--하나의 테이블에서 서브쿼리 사용한 조회
SELECT * FROM "TBL_PRODUCT#" tp WHERE PRICE = (SELECT MAX(PRICE) FROM "TBL_PRODUCT#" tp2);
--그룹화와 그룹함수(통계함수)를 이용한 조회
SELECT CUSTOM_ID, SUM(QUANTITY) FROM "TBL_BUY#" tb 
GROUP BY CUSTOM_ID ;
--동등 조인
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE ;
SELECT * FROM "TBL_PRODUCT#" tp JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;
SELECT NAME, REG_DATE FROM  "TBL_CUSTOM#" tc , "TBL_BUY#" tb 
	WHERE tc.CUSTOM_ID = tb.CUSTOM_ID AND PCODE  = 'IPAD011'; 
SELECT NAME, REG_DATE FROM "TBL_CUSTOM#" tc JOIN "TBL_BUY#" tb 
	ON tc.CUSTOM_ID = tb.CUSTOM_ID WHERE PCODE = 'IPAD011';
--외부 조인
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE(+) ;	--외부 조인 (+)가 있는 곳이 NULL
SELECT * FROM "TBL_PRODUCT#" tp 
	LEFT OUTER JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;		--OUTER JOIN을 쓰는 형식
SELECT mt.CUSTNO, mt.CUSTNAME, DECODE(mt.GRADE,'A','VIP','B','일반','C','직원') AS agrade, nvl(ASUM,0) AS BSUM
	FROM MEMBER_TBL_02 mt, (SELECT CUSTNO, SUM (PRICE) AS ASUM FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO ) sale
	WHERE mt.CUSTNO = sale.CUSTNO(+) --외부조인 
ORDER BY BSUM DESC,custno ;
--to_char 함수로 날짜 / 시간 출력패턴 변경
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:ss')FROM "TBL_BUY#" tb  ; --SYSDATE 출력 패턴 변경
SELECT TO_CHAR(SYSDATE, '""YYYY"년 "MM"월 "DD"일"'),
	TO_CHAR(SYSDATE, '""HH24"시 "MI"분 "SS"초"')FROM "TBL_BUY#" tb ; 
--order by
SELECT custom_id , tb.pcode, quantity * price AS money FROM "TBL_BUY#" tb , "TBL_PRODUCT#" tp 
WHERE tb.PCODE = tp.PCODE ORDER BY money;
--조회 컬럼에 수식 사용하기
SELECT custom_id , tb.pcode, quantity * price AS money FROM "TBL_BUY#" tb , "TBL_PRODUCT#" tp 
WHERE tb.PCODE = tp.PCODE ;

--day4_0208_1 UPDATE, JOIN
--day5_0209_1 join, check, decode --day5_0209_2 commit, rollback --day5_0209_3 view
--day6_0210_1 DISTINCT
--day7_0214_1 HAVING --day7_0214_2 nvl
--day8_0215_1 SUBSTR --day8_0215_2 데이터 내보내기