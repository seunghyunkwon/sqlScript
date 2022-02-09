--동등 조인(JOIN)

SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE ;

	
-- JOIN을 쓰는 형식 (표준)
SELECT * FROM "TBL_PRODUCT#" tp JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;		
	
--복습 1) : 아이패드를 구매한 사용자이름과 구매날짜 조회

SELECT NAME, REG_DATE FROM  "TBL_CUSTOM#" tc , "TBL_BUY#" tb 
	WHERE tc.CUSTOM_ID = tb.CUSTOM_ID AND PCODE  = 'IPAD011'; 
	
SELECT NAME, REG_DATE FROM "TBL_CUSTOM#" tc JOIN "TBL_BUY#" tb 
	ON tc.CUSTOM_ID = tb.CUSTOM_ID WHERE PCODE = 'IPAD011';
	


--day5 : alter table 형식
--테스트용 테이블
CREATE TABLE tbl# (
	acol varchar2(30) NOT NULL,
	bcol varchar2(10),
	ccol number(3)
);

INSERT INTO tbl# (ccol) values(12);				--오류 : NOT NULL 컬럼 값이 없다.
INSERT INTO tbl# (bcol, ccol) values('xytz',12);--오류 : NOT NULL 컬럼 값이 없다.
INSERT INTO tbl# (acol, ccol) values('main',12);--실행


--컬럼 추가
ALTER TABLE tbl# ADD (dcol timestamp DEFAULT sysdate);

SELECT * FROM tbl#;

--컬럼 변경
ALTER TABLE tbl# MODIFY (ccol NUMBER(3) DEFAULT '0');
INSERT INTO tbl# (acol) values('main22');

--컬럼 제거(drop)
ALTER TABLE tbl# DROP COLUMN dcol;

--제약조건 추가(제약조건 이름지정)
ALTER TABLE tbl# ADD CONSTRAINT pk_tbl# PRIMARY KEY (acol);

DELETE FROM tbl# WHERE acol='main22' AND ccol=0; 

--제약조건은 변경 명령이 없다. 삭제후 실행 필요
ALTER TABLE tbl# DROP CONSTRAINT pk_tbl#;


--tbl# 테이블에 age 컬럼 생성한다. check 제약조건 : 16이상 90이하의 값
ALTER TABLE tbl# ADD age number(3) check (age BETWEEN 16 AND 90); --age >= 16 AND age <=90

INSERT INTO tbl# (acol,age) VALUES ('app',23); --실행
INSERT INTO tbl# (acol,age) VALUES ('appss',23); --실행
INSERT INTO tbl# (acol,age) VALUES ('app',99); --오류 : 제약조건
 
--tbl# 테이블에 gender 컬럼 생성한다. check 제약조건 : 'M','F'
ALTER TABLE tbl# ADD gender char(1) check (gender IN ('M','F')); --age >= 16 AND age <=90
INSERT INTO tbl#(acol,gender) VALUES ('momo','F'); -- 실행
INSERT INTO tbl#(acol,gender) VALUES ('momo','X'); -- 오류 : 제약조건


-- SELECT 에 사용하는 오라클 함수
-- 조회결과를 조작하는 함수 : 예시 age컬럼 값이 null인 경우 0, gender 값이 'm'이면 남성, 'f'이면 여성
SELECT * FROM tbl#;
SELECT acol,nvl(age,0) AS age2, decode (gender, 'M','남성','F','여성') gender2 FROM tbl#;

--nvl는 null value, 컬럼명 별칭은 as 키워드를 쓰고 생략할 수 있다.





