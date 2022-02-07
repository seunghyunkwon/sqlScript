-- 데이터 타입 NUMBER 연습 테이블

--NUMBER : 자바의 byte,short,int,long,float,double에 해당
--		 : NUMBER(정밀도,소수점자리수)


CREATE TABLE table_number(
	col1 NUMBER,	--자릿수를 지정하지 않으면 최대 38자리수까지 가능하다 (자바에서는 BigDecimal)
	col2 NUMBER(5),
	col3 NUMBER(7,2),
	col4 NUMBER(2,5)
);

INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.00012);

--오류 : col2 칼럼의 자릿수가 6걔를 입력하여서 오류가 발생
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 123456, 12345.67, 0.00012);

--실행 : col3 칼럼은 소수점 이하 자릿수 2개를 표시하기 위해 반올림되어 표시
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.678, 0.00012);

--오류 : col3 칼럼의 전체 자리수(7)를 초과하여 오류 발생
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 123456.67, 0.00012);

--실행 : col4 컬럼의 number(2,5) : 전체 유효자리수 5개 중 유효 자리수 0포함 최대 2개, 나머지는 무조건 0
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.000126);

--오류 : col4 컬럼은 number(2,5) : 나머지 3개는 유효자릿수 앞에 0 -> 이것이 아니면 오류
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.00125);


