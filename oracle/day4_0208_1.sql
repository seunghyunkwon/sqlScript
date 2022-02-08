-- UPDATE ����
--UPDATE ���̺��
--SET ������ �÷� = ���� ,�� �����Ͽ� ����
--WHERE ������ �࿡ ���� ���ǽ�

SELECT * FROM "TBL_CUSTOM#" tc ;

-- UPDATE�� DELETE�� ���ǽ�(WHERE)�� ���Ǵ� ���� �����ϴ�.
UPDATE "TBL_CUSTOM#" SET age =39 
WHERE CUSTOM_ID = 'twice';

UPDATE "TBL_CUSTOM#" SET age = 23, EMAIL ='nana@koreak.kr'
WHERE CUSTOM_ID = 'wonder';

--CUSTOM_ID : wonder�� twice�� ���� reg_date�� 2022��2��5�Ϸ� ����
UPDATE "TBL_CUSTOM#" SET REG_DATE = '2022-02-05'
WHERE CUSTOM_ID IN ('wonder','twice');	--IN �����ڴ� OR ��ü 


--���� ������ �߰�
INSERT INTO "TBL_PRODUCT#" (PCODE, CATEGORY, PNAME, PRICE)
VALUES ('GAL0112','A1','������',912300);
--DELETE ����
--DELETE FROM ���̺��
--WHERE ���ǽ�;
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE = 'GAL0112';	-- ���� ����
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE = 'IPAD011';	-- ���� : ���Ἲ ����

UPDATE "TBL_PRODUCT#" SET PNAME = '�����е�����'
WHERE PCODE = 'IPAD011';

UPDATE "TBL_PRODUCT#" SET PCODE  = 'IPAD011X'
WHERE PCODE = 'IPAD011';

SELECT * FROM "TBL_CUSTOM#" tc ;
SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM "TBL_BUY#" tb ;

UPDATE "TBL_BUY#" SET PCODE = 'IPAD011X'
WHERE PCODE = 'IPAD011';

-- on DELETE on UPDATE(����Ŭ������ �Ұ�) �Ӽ� �����Ͽ� �ܷ�Ű �����
ALTER TABLE IDEV."TBL_BUY#" DROP CONSTRAINT "FK_TBL_PRODUCT#";
ALTER TABLE IDEV."TBL_BUY#" ADD CONSTRAINT "FK_TBL_PRODUCT#" FOREIGN KEY (PCODE)
REFERENCES IDEV."TBL_PRODUCT#"(PCODE) ON DELETE CASCADE; --���Ἲ�� ���� �����ϴ� �� ������ �����ϴ� �൵ ���������� ����

ALTER TABLE IDEV."TBL_CUSTOM#" MODIFY EMAIL NVARCHAR2(30) DEFAULT 'unknown';
-- ALTER TABLE ���� : DROP, ADD, MODIFY (���������� ���Ѵ�.)


-- SELECT �� JOIN : �� �̻��� ���̺�(���������� ���̺�)�� �����Ͽ� �����͸� ��ȸ�ϴ� ���
--				������ ���� �� �� �̻��� ���̺��� ����� �÷��� ���� �� �÷��� �̿��Ͽ� JOIN �մϴ�.
-- ���� : SELECT FROM ���̺�1 a, ���̺�2 b	WHERE a.�����÷�1=b.�����÷�1;
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE ;	--���� ����

-- JOIN�� ���� ����
SELECT * FROM "TBL_PRODUCT#" tp JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;		--���� ����

-- mina012�� ������ ��ǰ���� �����ΰ�?
SELECT tp.PNAME FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb  
	WHERE tp.PCODE =tb.PCODE AND CUSTOM_ID = ('mina012') ; 

-- mina012�� ������ ��ǰ��� ���� ��ȸ�ϱ�
SELECT tp.PNAME, tp.PRICE FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb  
	WHERE tp.PCODE =tb.PCODE AND CUSTOM_ID = ('mina012') ;

--���ǻ��� : ����� Į���� ���̺���� ���������� ������ ������ �߻��Ѵ�. 
SELECT tp.PCODE, tp.PRICE FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb  
	WHERE tp.PCODE =tb.PCODE AND CUSTOM_ID = ('mina012') ;

SELECT * FROM "TBL_PRODUCT#" tp ;

SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
	WHERE  tp.PCODE = tb.PCODE(+) ;	--�ܺ� ���� (+)�� �ִ� ���� NULL

-- JOIN�� ���� ����
SELECT * FROM "TBL_PRODUCT#" tp 
	LEFT OUTER JOIN "TBL_BUY#" tb 
	ON tp.PCODE = tb.PCODE ;		--�ܺ� ����


-- ���̺��� ��� ������ �����ϱ�

--DELETE : rollback���� ���� ��� ����, truncate : ���� ��� �Ұ���
--TRUNCATE : ���� ������ ��, fk(�ܷ�Ű)�� ��Ȱ��ȭ�ϰ� ������ �����ؾ��Ѵ�.

--TRUNCATE TABLE "TBL_BUY#" ;		--�������̺� ������ ���� ����
--DELETE FROM "TBL_PRODUCT#" tp ; --��ü ������ ������ �������� ���
--TRUNCATE TABLE "TBL_CUSTOM#" ;	--����








