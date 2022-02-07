-- *고객과 상품 테이블의 행(row)데이터를 구분한 CUSTOM_ID, PCODE는 중복되면 안된다.
--		ㄴ기본키 컬럼을 정한다.(중복된 값, NULL은 허용이 안된다.)
--		ㄴ기본키는 테이블의 행(row)을 식별하는 것이 목적이다.
--		ㄴ기본키 값으로 검색할 때 1개의 행으로만 결과가 조회된다.

-- **PRICE , QUANTITY 등의 컬럼은 반드시 필수 데이터로 저장되어야 한다.
--		ㄴ NOT NULL 컬럼으로 설정한다. (NULL인 경우 저장이 안된다.)

--*** 고객과 상품테이블에 없는 CUSTOM_ID, PCODE 컬럼 값을 사용하면 부정확한 데이터
--		ㄴ 외래키 컬럼을 정한다.(다른 테이블에서 값을 참조한다.(NULL 허용 불가))
--		ㄴ 외래키는 컬럼의 데이터가 참조값(다른 테이블 컬럼)을 사용하게 하는 것이 목적

-- 위의 NOT NULL, 기본키, 외래키는 대표적인 제약조건(CONSTRAINT) 설정이다.

-- 고객 테이블
CREATE TABLE TBL_CUSTOM#(
	custom_id varchar2(20) PRIMARY KEY,				
	name nvarchar2(20) NOT NULL,					
	email nvarchar2(20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);

-- 상품 테이블 
CREATE TABLE TBL_PRODUCT#(
	pcode varchar2(20) CONSTRAINT pk_product PRIMARY KEY,
	category char(2),
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL
);

-- 구매 테이블의 기본키는 별도로 컬럼을 추가한다.
CREATE TABLE TBL_BUY#(
	buy_seq number(8),	--구매정보 일련번호
	custom_id varchar2(20),
	pcode varchar2(20),
	quantity number(5) NOT NULL,
	buy_date timestamp,
	CONSTRAINT pk_buy_seq PRIMARY KEY(buy_seq),
	CONSTRAINT fk_custom_id FOREIGN KEY(custom_id) REFERENCES TBL_CUSTOM#(custom_id),
	CONSTRAINT fk_pcode FOREIGN KEY(pcode) REFERENCES TBL_PRODUCT#(pcode)
-- 외래키로 설정될 수 있는 컬럼은 기본키 또는 unique에 대해서만 가능하다.
);


-- 데이터의 추가 : INSERT
INSERT INTO IDEV.TBL_CUSTOM# (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '김미나', 'kimm@gmail.com', 20, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', '홍길동', 'gil@korea.com', 32, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '박모모', 'momo@daum.net', 29, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '이나나', 'lee@naver.com', 40, sysdate);

-- *custom 데이블의 행(row)데이터를 구분한 CUSTOM_ID, PCODE는 중복되면 안된다.
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '최모모', 'choi@naver.com', 33, sysdate);


INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '아이패드', 880000);
INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '동원참치선물세트', 54000);
INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '모션데스크', 234500);

-- **PRICE , QUANTITY 등의 컬럼은 반드시 필수 데이터로 저장되어야 한다.
INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME)
VALUES('dk_1433', 'A2', '모션데스크');


--오라클에서는 일련번호를 자동으로 증가해서 사용하게 할 수 있는 시퀀스 기능이 있다.
CREATE SEQUENCE TBL_BUY_SEQ;
--	ㄴ 한번 생성된 시퀀스는 값을 되돌릴 수 없다.
--	DROP SEQUENCE TBL_BUY_SEQ; 시퀀스를 삭제 이후 재생성
--	테이블의 데이터도 삭제하고 시퀀스 생성이후 데이터 추가



-- 김미나가 아이패드 1개를 어제 구매
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'IPAD011', 1, '2022-02-06');
-- 홍길동이 아이패드 2개를 오늘 구매
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'hongGD', 'IPAD011', 2, '2022-02-07');
-- 이나나가 참치선물세트 3개를 어제 구매
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'wonder', 'DOWON123a', 3, '2022-02-06');
-- 김미나가 모션데스크 1개를 오늘 구매
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'dk_143', 1, '2022-02-07');
-- 박모모가 참치선물세트 2개를 오늘 구매
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'twice', 'DOWON123a', 2, '2022-02-07');

--*** 고객과 상품테이블에 없는 CUSTOM_ID, PCODE 컬럼 값을 사용하면 부정확한 데이터
--	ㄴ 외래키로 설정된 custom_id는 tbl_custom# 테이블을 참조한다.
--	   참조테이블의 custom_id 컬럼값에 없는 것을 저장할 수 없다.	(외래키 위반, 무결성 제약조건 위반)
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'min012', 'dk_143', 1, sysdate);
--	ㄴ 외래키로 설정된 pcode는 tbl_custom# 테이블을 참조한다.
--	   참조테이블의 pcode 컬럼값에 없는 것을 저장할 수 없다.	(외래키 위반, 무결성 제약조건 위반)
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'd_143', 1, sysdate);


--1. custom# 테이블에서 age 가 30세 이상 모든 내용 조회
SELECT * FROM "TBL_CUSTOM#" tc WHERE AGE>30;

--2. custom# 테이블에서 custom_id 'twice' 의 email 조회
SELECT email FROM "TBL_CUSTOM#" tc WHERE CUSTOM_ID = 'twice';

--3. product# 테이블에서 category 'A2' 의 pname 조회
SELECT pname FROM "TBL_PRODUCT#" tp WHERE CATEGORY = 'A2';

--4. product# 테이블에서 price 의 최고값 조회
SELECT * FROM "TBL_PRODUCT#" tp WHERE PRICE = (SELECT MAX(PRICE) FROM "TBL_PRODUCT#" tp2); 

--5. buy# 테이블에서 'IPAD011' 총구매 수량 조회
SELECT SUM(QUANTITY) FROM "TBL_BUY#" tb  WHERE PCODE='IPAD011' ; 

--6. buy# 테이블에서 custom_id 'mina012' 의 모든 내용 조회
SELECT * FROM "TBL_BUY#" tb WHERE CUSTOM_ID = 'mina012';

--7. buy# 테이블에서 pcode 가 '1'이 포함된 것 조회
SELECT * FROM "TBL_BUY#" tb WHERE PCODE = '1';	-- 완전 일치 조회
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE  '%1%';	-- 부분일치 조회 1을 포함
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE  '1%';		-- 부분일치 조회 1로 시작
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE  '%1';		-- 부분일치 조회 1로 끝

--8. buy# 테이블에서 pcode에 'on'을 포함하는 것 조회
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE UPPER('%on%');
