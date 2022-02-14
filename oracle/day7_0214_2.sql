--���� ����

DROP TABLE MEMBER_TBL_02 IF EXISTS ; sql�� ���Ϸ� ������ �� ���

CREATE TABLE member_tbl_02(
	custno NUMBER(6) NOT NULL,
	custname VARCHAR2(20),
	phone VARCHAR2(13),
	address VARCHAR2(60),
	joindate DATE,
	grade CHAR(1),
	city CHAR(2),
	CONSTRAINT pk_custno PRIMARY KEY(CUSTNO)
);

--CREATE SEQUENCE member_seq INCREMENT BY 1
--START WITH 100001;
DROP SEQUENCE MEMBER_SEQ IF EXISTS ;
DROP SEQUENCE sale_SEQ IF EXISTS ;
CREATE SEQUENCE member_seq START WITH  100001;
CREATE SEQUENCE sale_seq MINVALUE 2016001;


INSERT INTO MEMBER_TBL_02 (custno, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES (member_seq.nextval, '���ູ', '010-1111-2222', '���� ���빮�� �ְ�1��', '2015-12-02', 'A', '01');
INSERT INTO MEMBER_TBL_02 (custno, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES (member_seq.nextval, '���ູ', '010-1111-3333', '���� ���빮�� �ְ�2��', '2015-12-06', 'B', '01');
INSERT INTO MEMBER_TBL_02 (custno, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES (member_seq.nextval, '�����', '010-1111-4444', '�︪�� �︪�� ����1��', '2015-10-01', 'B', '30');
INSERT INTO MEMBER_TBL_02 (custno, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES (member_seq.nextval, '�ֻ��', '010-1111-5555', '�︪�� �︪�� ����2��', '2015-11-13', 'A', '30');
INSERT INTO MEMBER_TBL_02 (custno, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES (member_seq.nextval, '����ȭ', '010-1111-6666', '���ֵ� ���ֽ� �ܳ�����', '2015-12-25', 'B', '60');
INSERT INTO MEMBER_TBL_02 (custno, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)
VALUES (member_seq.nextval, '������', '010-1111-7777', '���ֵ� ���ֽ� ��������', '2015-12-11', 'C', '60');


CREATE TABLE money_tbl_02(
	custno NUMBER(6) NOT NULL,
	salenol NUMBER(8) NOT NULL,
	pcost NUMBER(8),
	amount NUMBER(4),
	price NUMBER(8),
	pcode VARCHAR2(4),
	sdate DATE,
	CONSTRAINT pk_CS PRIMARY KEY (custno,salenol)
);

INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100001, sale_seq.nextval, 500, 5, 2500, 'A001', '2016-01-01');
INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100001, sale_seq.nextval, 1000, 4, 4000, 'A002', '2016-01-01');
INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100001, sale_seq.nextval, 500, 3, 1500, 'A008', '2016-01-01');
INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100002, sale_seq.nextval, 2000, 1, 2000, 'A004', '2016-01-02');
INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100002, sale_seq.nextval, 500, 1, 500, 'A001', '2016-01-03');
INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100003, sale_seq.nextval, 1500, 2, 3000, 'A003', '2016-01-03');
INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100004, sale_seq.nextval, 500, 2, 1000, 'A001', '2016-01-04');
INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100004, sale_seq.nextval, 300, 1, 300, 'A005', '2016-01-04');
INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100004, sale_seq.nextval, 600, 1, 600, 'A006', '2016-01-04');
INSERT INTO MONEY_TBL_02 (custno, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES (100004, sale_seq.nextval, 3000, 1, 3000, 'A007', '2016-01-06');

--step 1) ȸ���� �����հ�
SELECT CUSTNO, SUM (PRICE) FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO ;

--step 2) ���� ���� Ȯ���ϱ�
SELECT CUSTNO, SUM (PRICE) AS ASUM FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO ORDER BY ASUM DESC;

--step 3)�������� �������� ���� JOIN
SELECT * FROM MEMBER_TBL_02 mt ,
	(SELECT CUSTNO, SUM (PRICE) AS ASUM FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO ORDER BY ASUM DESC) sale
	WHERE mt.CUSTNO = sale.CUSTNO ;

--step 4)�ʿ��� ������ ��ȸ�ϱ�
SELECT mt.CUSTNO, mt.CUSTNAME, mt.GRADE, sale.ASUM FROM MEMBER_TBL_02 mt ,
	(SELECT CUSTNO, SUM (PRICE) AS ASUM FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO ORDER BY ASUM DESC) sale
	WHERE mt.CUSTNO = sale.CUSTNO ;

--step 5)��� ǥ���ϱ�
SELECT mt.CUSTNO, mt.CUSTNAME, DECODE(mt.GRADE,'A','VIP','B','�Ϲ�','C','����') AS agrade, sale.ASUM 
	FROM MEMBER_TBL_02 mt, (SELECT CUSTNO, SUM (PRICE) AS ASUM FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO ORDER BY ASUM DESC) sale
	WHERE mt.CUSTNO = sale.CUSTNO ;

-- ���� ���� : ������ ���� ȸ���� ��ȸ���� �ʴ´�. �� ������ ���� ȸ���� 0���� ����Ѵ�.
--			1) null ���� 0���� ����ϴ� �Լ� : nvl
--			2) ������ ���� �ο� ��� : �ܺ����� 
--			3) �����հ谡 ������ ��� ȸ����ȣ ������ ����Ѵ�.

SELECT mt.CUSTNO, mt.CUSTNAME, DECODE(mt.GRADE,'A','VIP','B','�Ϲ�','C','����') AS agrade, nvl(ASUM,0) AS BSUM	 --1) nvl --3) AS BSUM
	FROM MEMBER_TBL_02 mt, (SELECT CUSTNO, SUM (PRICE) AS ASUM FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO ) sale
	WHERE mt.CUSTNO = sale.CUSTNO(+) --2) (+) 
ORDER BY BSUM DESC,custno ; --3) ��ġ ���� �� ���� �켱 ���� DESC ,Į���� �߰�
 
-- ���� ����� ������ view �� �����Ѵ�.
CREATE VIEW v_by_custno
AS
SELECT mt.CUSTNO, mt.CUSTNAME, DECODE(mt.GRADE,'A','VIP','B','�Ϲ�','C','����') AS agrade, sale.ASUM 
	FROM MEMBER_TBL_02 mt, (SELECT CUSTNO, SUM (PRICE) AS ASUM FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO ORDER BY ASUM DESC) sale
	WHERE mt.CUSTNO = sale.CUSTNO ;



