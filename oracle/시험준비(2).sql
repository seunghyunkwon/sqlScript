--�����غ�(2)
--Ű������ ���� FROM - WHERE - GROUP BY - HAVING - ORDER BY
--DDL

CREATE TABLE TBL_CUSTOM#( --��
	custom_id varchar2(20) PRIMARY KEY,				
	name nvarchar2(20) NOT NULL,					
	email nvarchar2(20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);

CREATE TABLE TBL_PRODUCT#( --��ǰ
	pcode varchar2(20) CONSTRAINT pk_product PRIMARY KEY,
	category char(2),
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL
);

CREATE TABLE TBL_BUY#( --����
	buy_seq number(8),	
	custom_id varchar2(20),
	pcode varchar2(20),
	quantity number(5) NOT NULL,
	buy_date timestamp
);

ALTER TABLE TBL_CUSTOM# ADD phone NUMBER(11); --Į�� �߰�
ALTER TABLE TBL_CUSTOM# MODIFY phone NVARCHAR2(13); --Į�� ����
ALTER TABLE TBL_CUSTOM# DROP COLUMN phone; --Į�� ����

ALTER TABLE "TBL_BUY#" ADD CONSTRAINT pk_buy_seq PRIMARY KEY(buy_seq); --�⺻Ű �߰� 
ALTER TABLE "TBL_BUY#" ADD CONSTRAINT fk_custom_id FOREIGN KEY(custom_id) 
REFERENCES TBL_CUSTOM#(custom_id); --�ܷ�Ű �߰�
ALTER TABLE "TBL_BUY#" ADD CONSTRAINT fk_pcode FOREIGN KEY(pcode) 
REFERENCES TBL_PRODUCT#(pcode); --�ܷ�Ű �߰�

CREATE SEQUENCE TBL_BUY_SEQ; --������ ����
DROP SEQUENCE TBL_BUY_SEQ; --������ ����

CREATE VIEW V_TBL
AS
SELECT CUSTOM_ID FROM TBL_BUY#; --�� ����

--DML

INSERT INTO TBL_CUSTOM# (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', 'kimm@gmail.com', 20, sysdate);
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@korea.com', 32, sysdate);
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '�ڸ��', 'momo@daum.net', 29, sysdate);
INSERT INTO TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�̳���', 'lee@naver.com', 40, sysdate);

INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�', 880000);
INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);

-- ��̳��� �����е� 1���� ���� ����
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'IPAD011', 1, '2022-02-06');
-- ȫ�浿�� �����е� 2���� ���� ����
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'hongGD', 'IPAD011', 2, '2022-02-07');
-- �̳����� ��ġ������Ʈ 3���� ���� ����
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'wonder', 'DOWON123a', 3, '2022-02-06');
-- ��̳��� ��ǵ���ũ 1���� ���� ����
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'dk_143', 1, '2022-02-07');
-- �ڸ�� ��ġ������Ʈ 2���� ���� ����
INSERT INTO TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'twice', 'DOWON123a', 2, '2022-02-07');


INSERT INTO "TBL_CUSTOM#" (CUSTOM_ID,NAME,EMAIL,AGE,REG_DATE)
VALUES ('test','�׽�Ʈ','test01@gmail.com',11,sysdate);
UPDATE "TBL_CUSTOM#" SET CUSTOM_ID = 'take' WHERE NAME='�׽�Ʈ';
DELETE FROM "TBL_CUSTOM#" tc WHERE NAME ='�׽�Ʈ';

--�ϳ��� ���̺��� �Ϲ����� ��ȸ
SELECT * FROM "TBL_CUSTOM#" tc WHERE AGE >=30;
--�ϳ��� ���̺��� �������� ����� ��ȸ
SELECT * FROM "TBL_PRODUCT#" tp WHERE PRICE = (SELECT MAX(PRICE) FROM "TBL_PRODUCT#" tp2);
--�׷�ȭ�� �׷��Լ�(����Լ�)�� �̿��� ��ȸ
SELECT CUSTOM_ID, SUM(QUANTITY) FROM "TBL_BUY#" tb 
GROUP BY CUSTOM_ID ;
--���� ����
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE ;
SELECT * FROM "TBL_PRODUCT#" tp JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;
SELECT NAME, REG_DATE FROM  "TBL_CUSTOM#" tc , "TBL_BUY#" tb 
	WHERE tc.CUSTOM_ID = tb.CUSTOM_ID AND PCODE  = 'IPAD011'; 
SELECT NAME, REG_DATE FROM "TBL_CUSTOM#" tc JOIN "TBL_BUY#" tb 
	ON tc.CUSTOM_ID = tb.CUSTOM_ID WHERE PCODE = 'IPAD011';
--�ܺ� ����
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE(+) ;	--�ܺ� ���� (+)�� �ִ� ���� NULL
SELECT * FROM "TBL_PRODUCT#" tp 
	LEFT OUTER JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;		--OUTER JOIN�� ���� ����
SELECT mt.CUSTNO, mt.CUSTNAME, DECODE(mt.GRADE,'A','VIP','B','�Ϲ�','C','����') AS agrade, nvl(ASUM,0) AS BSUM
	FROM MEMBER_TBL_02 mt, (SELECT CUSTNO, SUM (PRICE) AS ASUM FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO ) sale
	WHERE mt.CUSTNO = sale.CUSTNO(+) --�ܺ����� 
ORDER BY BSUM DESC,custno ;
--to_char �Լ��� ��¥ / �ð� ������� ����
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:ss')FROM "TBL_BUY#" tb  ; --SYSDATE ��� ���� ����
SELECT TO_CHAR(SYSDATE, '""YYYY"�� "MM"�� "DD"��"'),
	TO_CHAR(SYSDATE, '""HH24"�� "MI"�� "SS"��"')FROM "TBL_BUY#" tb ; 
--order by
SELECT custom_id , tb.pcode, quantity * price AS money FROM "TBL_BUY#" tb , "TBL_PRODUCT#" tp 
WHERE tb.PCODE = tp.PCODE ORDER BY money;
--��ȸ �÷��� ���� ����ϱ�
SELECT custom_id , tb.pcode, quantity * price AS money FROM "TBL_BUY#" tb , "TBL_PRODUCT#" tp 
WHERE tb.PCODE = tp.PCODE ;

--day4_0208_1 UPDATE, JOIN
--day5_0209_1 join, check, decode --day5_0209_2 commit, rollback --day5_0209_3 view
--day6_0210_1 DISTINCT
--day7_0214_1 HAVING --day7_0214_2 nvl
--day8_0215_1 SUBSTR --day8_0215_2 ������ ��������