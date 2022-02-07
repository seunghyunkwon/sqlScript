--날짜 타입 : date, timestamp (timezone 설정)
CREATE TABLE TABLE_DATE(
	acol DATE,
	bcol timestamp,
	ccol timestamp DEFAULT sysdate	-- 값을 지정하지 않았을 때 기본값(default) : sysdate는 현재 날짜 및 시간
);
-- 날짜형식은 문자열 타입과 자동캐스팅이 된다.
-- '	'안에 yyyy-mm-dd hh:mm:ss 문자열 형식으로 작성
INSERT INTO IDEV.TABLE_DATE (ACOL, BCOL)
VALUES('2022-02-07', '2022-02-07');

SELECT * FROM TABLE_DATE td ;


-- 문자열 타입

-- CHAR(길이)		: 고정길이, 단위(byte)
-- VARCHAR(길이) 	: 오라클에서 존재는 하되 사용하지 않는 예비자료형
-- VARCHAR2(길이)	: 가변형길이 단위(byte), 길이는 최대 길이이고 메모리는 데이터크기만큼 사용 
--					: 최대 2000 byte이다 UTF-8 인코딩에서 한글은 3byte이고 영문 숫자 기호는 1byte

CREATE TABLE TABLE_STRING(
	acol char(10),
	bcol varchar2(10),
	ccol nchar(10),
	dcol nvarchar2(10)
);

--CHAR TYPE TEST
INSERT INTO TABLE_STRING (acol) VALUES ('abcdefghij');

INSERT INTO TABLE_STRING (acol) VALUES ('abcde');

INSERT INTO TABLE_STRING (acol) VALUES ('가나다라'); --오류 : 4글자 총 12byte

INSERT INTO TABLE_STRING (acol) VALUES ('가나다');

--VARCHAR2 TYPE TEST : CHAR과 비교했을 때 추가되는 공백이 없다.
INSERT INTO TABLE_STRING (bcol) VALUES ('abcdefghij');

INSERT INTO TABLE_STRING (bcol) VALUES ('abcde');

INSERT INTO TABLE_STRING (bcol) VALUES ('가나다라'); --오류 : 4글자 총 12byte

INSERT INTO TABLE_STRING (bcol) VALUES ('가나다');

--NCHAR TYPE TEST : 고정길이는 입력값과 동일하되 단위가 BYTE가 아닌 문자 개수
INSERT INTO TABLE_STRING (ccol) VALUES ('abcdefghij');

INSERT INTO TABLE_STRING (ccol) VALUES ('abcde');

INSERT INTO TABLE_STRING (ccol) VALUES ('가나다라');

INSERT INTO TABLE_STRING (ccol) VALUES ('가나다');

INSERT INTO TABLE_STRING (ccol) VALUES ('가나다라마바사아자차');

INSERT INTO TABLE_STRING (ccol) VALUES ('가나다라마바사아자차카'); --오류 : 총 11글자이므로 오류 발생

--NVARCHAR2 TYPE TEST : 가변길이는 입력값과 동일하되 단위가 문자개수 공백이 제거된다.
INSERT INTO TABLE_STRING (dcol) VALUES ('abcdefghij');

INSERT INTO TABLE_STRING (dcol) VALUES ('abcde');

INSERT INTO TABLE_STRING (dcol) VALUES ('가나다라');

INSERT INTO TABLE_STRING (dcol) VALUES ('가나다');

INSERT INTO TABLE_STRING (dcol) VALUES ('가나다라마바사아자차');

INSERT INTO TABLE_STRING (dcol) VALUES ('가나다라마바사아자차카'); --오류 : 총 11글자이므로 오류 발생


--여러 종류의 언어 문자가 섞여있는 경우에는 NVARCHAR2 로 글자수를 계산하는 것이 권고사항이다.





