-- UPDATE 형식
--UPDATE 테이블명
--SET 수정할 컬럼 = 값을 ,로 구분하여 나열
--WHERE 수정할 행에 대한 조건식

SELECT * FROM "TBL_CUSTOM#" tc ;

-- UPDATE와 DELETE는 조건식(WHERE)이 사용되는 것이 안전하다.
UPDATE "TBL_CUSTOM#" SET age =39 
WHERE CUSTOM_ID = 'twice';

UPDATE "TBL_CUSTOM#" SET age = 23, EMAIL ='nana@koreak.kr'
WHERE CUSTOM_ID = 'wonder';

--CUSTOM_ID : wonder와 twice에 대해 reg_date를 2022년2월5일로 변경
UPDATE "TBL_CUSTOM#" SET REG_DATE = '2022-02-05'
WHERE CUSTOM_ID IN ('wonder','twice');	--IN 연산자는 OR 대체 


--샘플 데이터 추가
INSERT INTO "TBL_PRODUCT#" (PCODE, CATEGORY, PNAME, PRICE)
VALUES ('GAL0112','A1','갤럭시',912300);
--DELETE 형식
--DELETE FROM 테이블명
--WHERE 조건식;
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE = 'GAL0112';	-- 정상 실행
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE = 'IPAD011';	-- 오류 : 무결성 위반

UPDATE "TBL_PRODUCT#" SET PNAME = '아이패드프로'
WHERE PCODE = 'IPAD011';

UPDATE "TBL_PRODUCT#" SET PCODE  = 'IPAD011X'
WHERE PCODE = 'IPAD011';

SELECT * FROM "TBL_CUSTOM#" tc ;
SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM "TBL_BUY#" tb ;

UPDATE "TBL_BUY#" SET PCODE = 'IPAD011X'
WHERE PCODE = 'IPAD011';

-- on DELETE on UPDATE(오라클에서는 불가) 속성 변경하여 외래키 재생성
ALTER TABLE IDEV."TBL_BUY#" DROP CONSTRAINT "FK_TBL_PRODUCT#";
ALTER TABLE IDEV."TBL_BUY#" ADD CONSTRAINT "FK_TBL_PRODUCT#" FOREIGN KEY (PCODE)
REFERENCES IDEV."TBL_PRODUCT#"(PCODE) ON DELETE CASCADE; --무결성을 위해 참조하는 값 삭제시 참조하는 행도 연쇄적으로 삭제

ALTER TABLE IDEV."TBL_CUSTOM#" MODIFY EMAIL NVARCHAR2(30) DEFAULT 'unknown';
-- ALTER TABLE 형식 : DROP, ADD, MODIFY (제약조건은 못한다.)


-- SELECT 의 JOIN : 둘 이상의 테이블(참조관계의 테이블)을 연결하여 데이터를 조회하는 명령
--				다음과 같을 때 둘 이상의 테이블은 공통된 컬럼을 갖고 이 컬럼을 이용하여 JOIN 합니다.
-- 형식 : SELECT FROM 테이블1 a, 테이블2 b	WHERE a.공통컬럼1=b.공통컬럼1;
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE ;	--동등 조인

-- JOIN을 쓰는 형식
SELECT * FROM "TBL_PRODUCT#" tp JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;		--동등 조인

-- mina012가 구매한 상품명은 무엇인가?
SELECT tp.PNAME FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb  
	WHERE tp.PCODE =tb.PCODE AND CUSTOM_ID = ('mina012') ; 

-- mina012가 구매한 상품명과 가격 조회하기
SELECT tp.PNAME, tp.PRICE FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb  
	WHERE tp.PCODE =tb.PCODE AND CUSTOM_ID = ('mina012') ;

--주의사항 : 공통된 칼럼은 테이블명을 지정해주지 않으면 오류가 발생한다. 
SELECT tp.PCODE, tp.PRICE FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb  
	WHERE tp.PCODE =tb.PCODE AND CUSTOM_ID = ('mina012') ;

SELECT * FROM "TBL_PRODUCT#" tp ;

SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE(+) ;	--외부 조인 (+)가 있는 곳이 NULL

-- JOIN을 쓰는 형식
SELECT * FROM "TBL_PRODUCT#" tp 
	LEFT OUTER JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;		--외부 조인


-- 테이블의 모든 데이터 삭제하기

--DELETE : rollback으로 삭제 취소 가능, truncate : 삭제 취소 불가능
--TRUNCATE : 참조 관계일 때, fk(외래키)를 비활성화하고 데이터 삭제해야한다.

--TRUNCATE TABLE "TBL_BUY#" ;		--참조테이블 데이터 먼저 삭제
--DELETE FROM "TBL_PRODUCT#" tp ; --전체 데이터 삭제시 디비버에서 경고
--TRUNCATE TABLE "TBL_CUSTOM#" ;	--오류








