--1)

CREATE SEQUENCE tblbuy_seq START WITH 2001;

-- CREATE SEQUENCE tblbuy_seq MINVALUE 2001;


--2)
CREATE TABLE tbl_postcode (
postcode char(6) PRIMARY KEY,
area1 varchar2(200) NOT NULL 
);

--3)
ALTER TABLE "TBL_CUSTOM#" ADD (postcode char(5) );

 

--4)
ALTER TABLE "TBL_CUSTOM#" ADD CONSTRAINTS fk_postcode
FOREIGN KEY (postcode) REFERENCES tbl_postcode(postcode);


--1)
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('137964','서울특별시 서초구 서초2동');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('138761','서울특별시 송파구 장지동 409880');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('412510','경기도 고양시 덕양구 벽제동');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('409880','인천광역시 옹진군 자월면');

--2)
UPDATE "TBL_CUSTOM#" SET POSTCODE ='137964' WHERE CUSTOM_ID ='mina012';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='412510' WHERE CUSTOM_ID ='hongGD';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='409880' WHERE CUSTOM_ID ='wonder';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='138761' WHERE CUSTOM_ID ='sana';


--3월 14일 평가
--데이터 입출력 구현 : 논리적 / 물리적 설계 분석
--1번 문제 ER 다이어그램을 보고 데이터저장소 설계를 설명한다.
--	1) 데이터 타입 : number(n,m) n이 의미하는 바와 m이 의미하는바 
--					예시: number(5,0) 또는 number (6,2)
--				 	char(n), varchar2(n) 한글과 영문의 차이, date 타입 등
--	2) 기본키 컬럼 : 기본키 컬럼의 의미와 역할을 작성하고 예시로 설명
--					예시: tbl_custom# 테이블에서 기본키 custom_id로 했을 때
--					기본키 컬럼을 값으로 행을 구별하고 custom_id컬럼의 같은 중복된 값은 안된다.
--					문제에 나온 모든 테이블에 대해 기본키 컬럼을 설명
--					시퀀스를 기본키로 사용한 경우 그 이유를 설명
--					기본키는 여러 개의 컬럼을 묶어서 설정할 수 있다.
--	3) unique 제약조건 : unique 는 유일한 값, 즉 중복된 값은 허용하지 않는 컬럼
--	4) 참조관계 외래키 제약조건 : 모든 관계에 대해 설명하세요
--					ㄴ키워드 : 참조, 참조컬럼, 외래키 컬럼 테이블 예시로 설명
--					ㄴ on delete 옵션