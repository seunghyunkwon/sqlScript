--시험 준비(1)

--데이터의 무결성 = 데이터의 일관성, 유효성, 정확성을 보장한다.

--DDL	CREATE/DROP/ALTER

--테이블 생성
CREATE TABLE ANIMAL_INS(
ANIMAL_ID VARCHAR(50),
ANIMAL_TYPE VARCHAR(50),
DATETIME DATE,
INTAKE_CONDITION VARCHAR(50),
NAME VARCHAR(50) NOT NULL,
SEX_UPON_INTAKE VARCHAR(50)
);

CREATE TABLE BEAST_INS(
ANIMAL_ID VARCHAR(50),
ANIMAL_TYPE VARCHAR(50),
DATETIME DATE,
INTAKE_CONDITION VARCHAR(50),
NAME VARCHAR(50) NOT NULL,
SEX_UPON_INTAKE VARCHAR(50)
);

--테이블 삭제
DROP TABLE BEAST_INS;

--테이블 추가
ALTER TABLE ANIMAL_INS ADD COLOR VARCHAR(50);	--컬럼 추가
ALTER TABLE ANIMAL_INS MODIFY COLOR VARCHAR(30); --컬럼 수정
ALTER TABLE ANIMAL_INS DROP COLUMN COLOR ; --컬럼 삭제

ALTER TABLE ANIMAL_INS ADD CONSTRAINT pk_ANIMAL_ID PRIMARY KEY(ANIMAL_ID);	--고정키 추가
ALTER TABLE ANIMAL_INS DROP CONSTRAINT pk_ANIMAL_ID;	--고정키 삭제
ALTER TABLE BEAST_INS ADD CONSTRAINT pk_ANIMAL_TYPE PRIMARY KEY (ANIMAL_TYPE); --고정키 추가
--프라이머리 키의 특징 테이블당 1개만 설정이 가능하고 NULL이 불가하며 중복또한 불가하다.
--CONSTRAINT PK_이름 PRIMARY KEY(컬럼);
ALTER TABLE ANIMAL_INS ADD CONSTRAINT fk_ANIMAL_TYPE FOREIGN KEY (ANIMAL_TYPE)
	REFERENCES BEAST_INS(ANIMAL_TYPE); --외래키 추가 --ON DELETE CASCADE	--연쇄 삭제 명령어
--외래키의 특징 테이블의 공통된 데이터가 존재해야한다.
--CONSTRAINT FK_이름 FOREIGN KEY(컬럼) REFERENCES 부모테이블(참조컬럼);


--시퀀스 
CREATE SEQUENCE SEQ_NUM3; --시퀀스 생성
CREATE SEQUENCE SEQ_NUM START WITH 100 ; --시퀀스 100부터 시작
CREATE SEQUENCE SEQ_NUM2 START WITH 100 INCREMENT BY 1; --100부터 시작 1씩 증가
DROP SEQUENCE SEQ_NUM ; -- 시퀀스 삭제
--뷰
CREATE VIEW v_animal
AS
SELECT ANIMAL_ID , NAME AS 이름 FROM ANIMAL_INS;	-- 뷰 생성
--별도의 권한 필요 SQL PLUS에서 SYSTEM 접속 후 grant create view to 계정명 실행


--DML  INSERT/DELETE/UPDATE/SELECT

--인서트
--INSERT INTO 테이블명(컬럼명) VALUES (데이터값); 
INSERT INTO ANIMAL_INS(ANIMAL_ID,ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE)
VALUES('A350276','Cat','2017-08-13','Normal','Jewel','Spayed Female');	--데이터 입력
INSERT INTO ANIMAL_INS(ANIMAL_ID,ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE)
VALUES('A396810','Dog','2016-08-22','Injured','Raven','Spayed Female');
INSERT INTO BEAST_INS (ANIMAL_ID,ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE)
VALUES('A349996','Cat','2018-01-22','Normal','Sugar','Neutered Male');
INSERT INTO BEAST_INS (ANIMAL_ID,ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE)
VALUES('A350276','Dog','2017-08-13','Normal','Jewel','Spayed Female');

--업데이트
--UPDATE 테이블명 SET 컬럼명 = 바꿀내용 WHERE 해당 행
UPDATE BEAST_INS SET NAME = 'Riot' WHERE INTAKE_CONDITION = 'Injured'; --데이터 수정

--딜렉트
--DELETE FROM 테이블명 WHERE 해당 행
DELETE FROM BEAST_INS bi WHERE ANIMAL_TYPE = 'Cat'; --데이터 삭제
DELETE FROM ANIMAL_INS ai  WHERE ANIMAL_ID  = 'A410668'; --데이터 삭제

