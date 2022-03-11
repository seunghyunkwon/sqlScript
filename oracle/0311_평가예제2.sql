-- 회원이 도서를 대여하는 업무처리와 관련된 테이블

CREATE TABLE TBL_MEMBER(
	mem_idx number(5) PRIMARY KEY,
	name varchar2(20) NOT NULL,
	email varchar2(20) NOT NULL,
	tel varchar2(20),
	password varchar2(10)
);

CREATE TABLE TBL_BOOK(
	bcode char(5) PRIMARY KEY,
	title varchar2(30) NOT NULL,
	writer varchar2(20),
	publisher varchar2(20),
	pdate date
);
-- 회원번호 시퀀스
CREATE SEQUENCE memidx_seq START WITH 10001;

CREATE TABLE TBL_BOOKRENT(
	--기본키
	rent_no number(5) PRIMARY KEY,
	mem_idx number(5) NOT NULL,
	bcode char(5) NOT NULL,
	rent_date DATE NOT NULL,	--대여 날짜
	exp_date DATE NOT NULL,		--반납예정 날짜
	return_date DATE,			--실제반납 날짜
	delay_days number(3),		--연체일
	--참조관계
	CONSTRAINT fk1 FOREIGN KEY (mem_idx) REFERENCES TBL_MEMBER(mem_idx),
	CONSTRAINT fk2 FOREIGN KEY (bcode) REFERENCES TBL_BOOK(bcode)
);

--대여 일련번호를 위한 시퀀스
CREATE SEQUENCE bookrent_seq;

--회원데이터 추가
INSERT INTO TBL_MEMBER (mem_idx,name,email,tel,password)
VALUES (memidx_seq.nextval,'이하니','honey@naver.com','010-9889-0567','1122');
insert into tbl_member(mem_idx,name,email,tel,password)
values(memidx_seq.nextval,'이세종','jong@daum.net','010-2354-6773','2345');
insert into tbl_member(mem_idx,name,email,tel,password)
values(memidx_seq.nextval,'최행운','lucky@korea.com','010-5467-8792','9876');
insert into tbl_member(mem_idx,name,email,tel,password)
values(memidx_seq.nextval,'나길동','nadong@kkk.net','010-3456-8765','3456');
insert into tbl_member(mem_idx,name,email,tel,password)
values(memidx_seq.nextval,'강감찬','haha@korea.net','010-3987-9087','1234');

INSERT INTO TBL_BOOK (bcode,title,writer,PUBLISHER,PDATE)
values ('A1101','코스모스','칼세이건','사이언스북스',to_date('06/12/01','YY/MM/DD'));
-- 문자열에서 날짜타입으로는 자동캐스팅된다. 함수를 사용할 때에는 to_date() 함수를 사용한다.
INSERT INTO TBL_BOOK (bcode,title,writer,PUBLISHER,PDATE)
values ('B1101','해커스토익','이해커','해커스랩',to_date('18/07/10','YY/MM/DD'));
INSERT INTO TBL_BOOK (bcode,title,writer,PUBLISHER,PDATE)
values ('C1101','푸른사자 와니니','이현','창비',to_date('15/06/20','YY/MM/DD'));
INSERT INTO TBL_BOOK (bcode,title,writer,PUBLISHER,PDATE)
values ('A1102','페스트','알베르트 까뮈','민음사',to_date('11/03/01','YY/MM/DD'));

SELECT * FROM TBL_BOOK tb ;

--프로시저 예시 = 대여날짜 +14
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE)
values(bookrent_seq.nextval,10001,'A1101','2021-10-11','2021-10-25');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
values(bookrent_seq.nextval,10001,'B1101','2021-09-01','2021-09-15','2021-09-14');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
values(bookrent_seq.nextval,10002,'C1101','2021-09-12','2021-09-26','2021-09-29');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE)
values(bookrent_seq.nextval,10003,'A1102','2021-10-04','2021-10-18');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
values(bookrent_seq.nextval,10003,'B1101','2021-09-03','2021-09-17','2021-09-17');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE)
values(bookrent_seq.nextval,10004,'C1101','2021-10-02','2021-10-16');

--'대여' 업무처리 (조건 : 회원은 하루에 1개의 책만 대여할 수 있다.)
--1) 대여한다. : insert 를 rent_date만하고 exp_date는 rent_date +14
--				입력매개변수는 회원idx, bcode, 대여날짜
-- 시험문제 2)
--2) 반납한다. : 입력매개변수는 회원idx, bocde, 반납날짜
--				해당되는 rent_no를 구해서 그 값을 조건으로 update return_date, delay_days

SELECT rent_no, MEM_IDX FROM TBL_BOOKRENT tb 
WHERE BCODE ='A1101' AND MEM_IDX =10001 AND RETURN_DATE IS NULL;

UPDATE TBL_BOOKRENT SET RETURN_DATE = '2021-10-24' WHERE RENT_NO =1;
UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETURN_DATE - EXP_DATE WHERE RENT_NO =1;
--다른 행 값으로 테스트(return_date가 있는 행)
UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETURN_DATE - EXP_DATE WHERE RENT_NO =5;

SELECT * FROM TBL_BOOKRENT tb;
----------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE return_book(
	amem_idx IN TBL_MEMBER.MEM_IDX%TYPE,
	abcode IN TBL_BOOK.BCODE%TYPE,
	areturn_date IN TBL_BOOKRENT.RETURN_DATE%TYPE,
	--출력 매개 변수로 성공 또는 실패 문자열 전달하기
	isSuccess OUT varchar2
)
IS
	vrent_no NUMBER;
	v_idx NUMBER;
	cnt number;
BEGIN
	SELECT count(*) INTO cnt 
		FROM TBL_BOOKRENT tb2
		WHERE BCODE = abcode AND MEM_IDX =amem_idx AND RETURN_DATE IS NULL;
	SELECT rent_no, MEM_IDX INTO vrent_no, v_idx 
		FROM TBL_BOOKRENT tb 
		WHERE BCODE =abcode AND MEM_IDX =amem_idx AND RETURN_DATE IS NULL;
	if(v_idx=amem_idx AND cnt=1) THEN
	UPDATE TBL_BOOKRENT SET RETURN_DATE = areturn_date WHERE RENT_NO = vrent_no ;
	UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETURN_DATE - EXP_DATE WHERE RENT_NO =vrent_no ;
	END IF;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('성공');
	isSuccess :='success';
	EXCEPTION WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('실패');
	isSuccess :='fail';
	ROLLBACK;
END;

DECLARE
	vresult varchar2(20);
BEGIN
	return_book (10002,'B1101','2021-10-29', vresult);
	DBMS_OUTPUT.PUT_LINE('결과 : ' || vresult);
END;


