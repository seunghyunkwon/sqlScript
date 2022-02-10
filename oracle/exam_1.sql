-- 연습) 회사 테이블 생성

CREATE TABLE HQ(
Department VARCHAR2(20)
);

-- 테이블 추가 생성
ALTER TABLE HQ ADD DECODE NUMBER(3);

ALTER TABLE HQ ADD F_DATE date;

-- 컬럼 생성 및 값 입력
INSERT INTO HQ (Department, DECODE)
VALUES ('공사부',001);

INSERT INTO HQ (Department, DECODE)
VALUES ('공무부',002);

INSERT INTO HQ (Department, DECODE)
VALUES ('안전부',003);

INSERT INTO HQ (Department, DECODE)
VALUES ('소방부',004);

INSERT INTO HQ (Department, DECODE)
VALUES ('전기부',005);

-- 컬럼 수정 및 값 입력
UPDATE HQ SET F_DATE = SYSDATE WHERE DECODE = 001;

