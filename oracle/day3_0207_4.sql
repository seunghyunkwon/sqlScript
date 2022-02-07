-- *고객과 상품 테이블의 행(row)데이터를 구분한 CUSTOM_ID, PCODE는 중복되면 안된다.
--		ㄴ기본키 컬럼을 정한다.(중복된 값, NULL은 허용이 안된다.)

-- **PRICE , QUANTITY 등의 컬럼은 반드시 필수 데이터로 저장되어야 한다.
--		ㄴ NOT NULL 컬럼으로 설정한다. (NULL인 경우 저장이 안된다.)

--*** 고객과 상품테이블에 없는 CUSTOM_ID, PCODE 컬럼 값을 사용하면 부정확한 데이터
--		ㄴ 외래키 컬럼을 정한다.(다른 테이블에서 값을 참조한다.(NULL 허용 불가))

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

-- 구매 테이블
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
