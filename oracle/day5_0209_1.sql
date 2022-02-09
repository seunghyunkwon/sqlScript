--���� ����(JOIN)

SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE ;

	
-- JOIN�� ���� ���� (ǥ��)
SELECT * FROM "TBL_PRODUCT#" tp JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;		
	
--���� 1) : �����е带 ������ ������̸��� ���ų�¥ ��ȸ

SELECT NAME, REG_DATE FROM  "TBL_CUSTOM#" tc , "TBL_BUY#" tb 
	WHERE tc.CUSTOM_ID = tb.CUSTOM_ID AND PCODE  = 'IPAD011'; 
	
SELECT NAME, REG_DATE FROM "TBL_CUSTOM#" tc JOIN "TBL_BUY#" tb 
	ON tc.CUSTOM_ID = tb.CUSTOM_ID WHERE PCODE = 'IPAD011';
	


--day5 : alter table ����
--�׽�Ʈ�� ���̺�
CREATE TABLE tbl# (
	acol varchar2(30) NOT NULL,
	bcol varchar2(10),
	ccol number(3)
);

INSERT INTO tbl# (ccol) values(12);				--���� : NOT NULL �÷� ���� ����.
INSERT INTO tbl# (bcol, ccol) values('xytz',12);--���� : NOT NULL �÷� ���� ����.
INSERT INTO tbl# (acol, ccol) values('main',12);--����


--�÷� �߰�
ALTER TABLE tbl# ADD (dcol timestamp DEFAULT sysdate);

SELECT * FROM tbl#;

--�÷� ����
ALTER TABLE tbl# MODIFY (ccol NUMBER(3) DEFAULT '0');
INSERT INTO tbl# (acol) values('main22');

--�÷� ����(drop)
ALTER TABLE tbl# DROP COLUMN dcol;

--�������� �߰�(�������� �̸�����)
ALTER TABLE tbl# ADD CONSTRAINT pk_tbl# PRIMARY KEY (acol);

DELETE FROM tbl# WHERE acol='main22' AND ccol=0; 

--���������� ���� ����� ����. ������ ���� �ʿ�
ALTER TABLE tbl# DROP CONSTRAINT pk_tbl#;


--tbl# ���̺� age �÷� �����Ѵ�. check �������� : 16�̻� 90������ ��
ALTER TABLE tbl# ADD age number(3) check (age BETWEEN 16 AND 90); --age >= 16 AND age <=90

INSERT INTO tbl# (acol,age) VALUES ('app',23); --����
INSERT INTO tbl# (acol,age) VALUES ('appss',23); --����
INSERT INTO tbl# (acol,age) VALUES ('app',99); --���� : ��������
 
--tbl# ���̺� gender �÷� �����Ѵ�. check �������� : 'M','F'
ALTER TABLE tbl# ADD gender char(1) check (gender IN ('M','F')); --age >= 16 AND age <=90
INSERT INTO tbl#(acol,gender) VALUES ('momo','F'); -- ����
INSERT INTO tbl#(acol,gender) VALUES ('momo','X'); -- ���� : ��������


-- SELECT �� ����ϴ� ����Ŭ �Լ�
-- ��ȸ����� �����ϴ� �Լ� : ���� age�÷� ���� null�� ��� 0, gender ���� 'm'�̸� ����, 'f'�̸� ����
SELECT * FROM tbl#;
SELECT acol,nvl(age,0) AS age2, decode (gender, 'M','����','F','����') gender2 FROM tbl#;

--nvl�� null value, �÷��� ��Ī�� as Ű���带 ���� ������ �� �ִ�.





