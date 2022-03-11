--1)

CREATE SEQUENCE tblbuy_seq START WITH 2001;

-- CREATE SEQUENCE tblbuy_seq MINVALUE 2001;


--2)
CREATE TABLE tbl_postcode (
postcode char(6) PRIMARY KEY,
area1 varchar2(200) NOT NULL 
);

--3)
ALTER TABLE "TBL_CUSTOM#" ADD (postcode char(5) );

 

--4)
ALTER TABLE "TBL_CUSTOM#" ADD CONSTRAINTS fk_postcode
FOREIGN KEY (postcode) REFERENCES tbl_postcode(postcode);


--1)
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('137964','����Ư���� ���ʱ� ����2��');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('138761','����Ư���� ���ı� ������ 409880');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('412510','��⵵ ���� ���籸 ������');
INSERT INTO TBL_POSTCODE (POSTCODE,AREA1) VALUES ('409880','��õ������ ������ �ڿ���');

--2)
UPDATE "TBL_CUSTOM#" SET POSTCODE ='137964' WHERE CUSTOM_ID ='mina012';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='412510' WHERE CUSTOM_ID ='hongGD';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='409880' WHERE CUSTOM_ID ='wonder';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='138761' WHERE CUSTOM_ID ='sana';


--3�� 14�� ��
--������ ����� ���� : ���� / ������ ���� �м�
--1�� ���� ER ���̾�׷��� ���� ����������� ���踦 �����Ѵ�.
--	1) ������ Ÿ�� : number(n,m) n�� �ǹ��ϴ� �ٿ� m�� �ǹ��ϴ¹� 
--					����: number(5,0) �Ǵ� number (6,2)
--				 	char(n), varchar2(n) �ѱ۰� ������ ����, date Ÿ�� ��
--	2) �⺻Ű �÷� : �⺻Ű �÷��� �ǹ̿� ������ �ۼ��ϰ� ���÷� ����
--					����: tbl_custom# ���̺��� �⺻Ű custom_id�� ���� ��
--					�⺻Ű �÷��� ������ ���� �����ϰ� custom_id�÷��� ���� �ߺ��� ���� �ȵȴ�.
--					������ ���� ��� ���̺� ���� �⺻Ű �÷��� ����
--					�������� �⺻Ű�� ����� ��� �� ������ ����
--					�⺻Ű�� ���� ���� �÷��� ��� ������ �� �ִ�.
--	3) unique �������� : unique �� ������ ��, �� �ߺ��� ���� ������� �ʴ� �÷�
--	4) �������� �ܷ�Ű �������� : ��� ���迡 ���� �����ϼ���
--					��Ű���� : ����, �����÷�, �ܷ�Ű �÷� ���̺� ���÷� ����
--					�� on delete �ɼ�