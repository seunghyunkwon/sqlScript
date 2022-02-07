-- *���� ��ǰ ���̺��� ��(row)�����͸� ������ CUSTOM_ID, PCODE�� �ߺ��Ǹ� �ȵȴ�.
--		���⺻Ű �÷��� ���Ѵ�.(�ߺ��� ��, NULL�� ����� �ȵȴ�.)
--		���⺻Ű�� ���̺��� ��(row)�� �ĺ��ϴ� ���� �����̴�.
--		���⺻Ű ������ �˻��� �� 1���� �����θ� ����� ��ȸ�ȴ�.

-- **PRICE , QUANTITY ���� �÷��� �ݵ�� �ʼ� �����ͷ� ����Ǿ�� �Ѵ�.
--		�� NOT NULL �÷����� �����Ѵ�. (NULL�� ��� ������ �ȵȴ�.)

--*** ���� ��ǰ���̺� ���� CUSTOM_ID, PCODE �÷� ���� ����ϸ� ����Ȯ�� ������
--		�� �ܷ�Ű �÷��� ���Ѵ�.(�ٸ� ���̺��� ���� �����Ѵ�.(NULL ��� �Ұ�))
--		�� �ܷ�Ű�� �÷��� �����Ͱ� ������(�ٸ� ���̺� �÷�)�� ����ϰ� �ϴ� ���� ����

-- ���� NOT NULL, �⺻Ű, �ܷ�Ű�� ��ǥ���� ��������(CONSTRAINT) �����̴�.

-- �� ���̺�
CREATE TABLE TBL_CUSTOM#(
	custom_id varchar2(20) PRIMARY KEY,				
	name nvarchar2(20) NOT NULL,					
	email nvarchar2(20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);

-- ��ǰ ���̺� 
CREATE TABLE TBL_PRODUCT#(
	pcode varchar2(20) CONSTRAINT pk_product PRIMARY KEY,
	category char(2),
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL
);

-- ���� ���̺��� �⺻Ű�� ������ �÷��� �߰��Ѵ�.
CREATE TABLE TBL_BUY#(
	buy_seq number(8),	--�������� �Ϸù�ȣ
	custom_id varchar2(20),
	pcode varchar2(20),
	quantity number(5) NOT NULL,
	buy_date timestamp,
	CONSTRAINT pk_buy_seq PRIMARY KEY(buy_seq),
	CONSTRAINT fk_custom_id FOREIGN KEY(custom_id) REFERENCES TBL_CUSTOM#(custom_id),
	CONSTRAINT fk_pcode FOREIGN KEY(pcode) REFERENCES TBL_PRODUCT#(pcode)
-- �ܷ�Ű�� ������ �� �ִ� �÷��� �⺻Ű �Ǵ� unique�� ���ؼ��� �����ϴ�.
);


-- �������� �߰� : INSERT
INSERT INTO IDEV.TBL_CUSTOM# (CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', 'kimm@gmail.com', 20, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@korea.com', 32, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '�ڸ��', 'momo@daum.net', 29, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�̳���', 'lee@naver.com', 40, sysdate);

-- *custom ���̺��� ��(row)�����͸� ������ CUSTOM_ID, PCODE�� �ߺ��Ǹ� �ȵȴ�.
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�ָ��', 'choi@naver.com', 33, sysdate);


INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�', 880000);
INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);

-- **PRICE , QUANTITY ���� �÷��� �ݵ�� �ʼ� �����ͷ� ����Ǿ�� �Ѵ�.
INSERT INTO IDEV.TBL_PRODUCT#(PCODE, CATEGORY, PNAME)
VALUES('dk_1433', 'A2', '��ǵ���ũ');


--����Ŭ������ �Ϸù�ȣ�� �ڵ����� �����ؼ� ����ϰ� �� �� �ִ� ������ ����� �ִ�.
CREATE SEQUENCE TBL_BUY_SEQ;
--	�� �ѹ� ������ �������� ���� �ǵ��� �� ����.
--	DROP SEQUENCE TBL_BUY_SEQ; �������� ���� ���� �����
--	���̺��� �����͵� �����ϰ� ������ �������� ������ �߰�



-- ��̳��� �����е� 1���� ���� ����
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'IPAD011', 1, '2022-02-06');
-- ȫ�浿�� �����е� 2���� ���� ����
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'hongGD', 'IPAD011', 2, '2022-02-07');
-- �̳����� ��ġ������Ʈ 3���� ���� ����
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'wonder', 'DOWON123a', 3, '2022-02-06');
-- ��̳��� ��ǵ���ũ 1���� ���� ����
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'dk_143', 1, '2022-02-07');
-- �ڸ�� ��ġ������Ʈ 2���� ���� ����
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'twice', 'DOWON123a', 2, '2022-02-07');

--*** ���� ��ǰ���̺� ���� CUSTOM_ID, PCODE �÷� ���� ����ϸ� ����Ȯ�� ������
--	�� �ܷ�Ű�� ������ custom_id�� tbl_custom# ���̺��� �����Ѵ�.
--	   �������̺��� custom_id �÷����� ���� ���� ������ �� ����.	(�ܷ�Ű ����, ���Ἲ �������� ����)
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'min012', 'dk_143', 1, sysdate);
--	�� �ܷ�Ű�� ������ pcode�� tbl_custom# ���̺��� �����Ѵ�.
--	   �������̺��� pcode �÷����� ���� ���� ������ �� ����.	(�ܷ�Ű ����, ���Ἲ �������� ����)
INSERT INTO IDEV.TBL_BUY#(buy_seq, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.nextval,'mina012', 'd_143', 1, sysdate);


--1. custom# ���̺��� age �� 30�� �̻� ��� ���� ��ȸ
SELECT * FROM "TBL_CUSTOM#" tc WHERE AGE>30;

--2. custom# ���̺��� custom_id 'twice' �� email ��ȸ
SELECT email FROM "TBL_CUSTOM#" tc WHERE CUSTOM_ID = 'twice';

--3. product# ���̺��� category 'A2' �� pname ��ȸ
SELECT pname FROM "TBL_PRODUCT#" tp WHERE CATEGORY = 'A2';

--4. product# ���̺��� price �� �ְ� ��ȸ
SELECT * FROM "TBL_PRODUCT#" tp WHERE PRICE = (SELECT MAX(PRICE) FROM "TBL_PRODUCT#" tp2); 

--5. buy# ���̺��� 'IPAD011' �ѱ��� ���� ��ȸ
SELECT SUM(QUANTITY) FROM "TBL_BUY#" tb  WHERE PCODE='IPAD011' ; 

--6. buy# ���̺��� custom_id 'mina012' �� ��� ���� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE CUSTOM_ID = 'mina012';

--7. buy# ���̺��� pcode �� '1'�� ���Ե� �� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE PCODE = '1';	-- ���� ��ġ ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE  '%1%';	-- �κ���ġ ��ȸ 1�� ����
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE  '1%';		-- �κ���ġ ��ȸ 1�� ����
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE  '%1';		-- �κ���ġ ��ȸ 1�� ��

--8. buy# ���̺��� pcode�� 'on'�� �����ϴ� �� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE UPPER('%on%');
