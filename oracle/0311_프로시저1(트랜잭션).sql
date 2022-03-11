--���ν����� begin ~ end; ������ SQL �翭������ �������� ��찡 ��κ��̴�. �� �������� ���
-- Ʈ����� : �ϳ��� ������ ó���ϴ� SQL ��ɵ� -> ��� �������Ǿ�� �Ѵ�. (commit)
-- �̹� ����� SQL����� ��Ұ� �Ǿ�� �Ѵ�. (rollback)

SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM TBL_BUY# tb; 
-- ������ ���� : ���ν����� Ʈ����� ó��
ALTER TABLE "TBL_BUY#" ADD MONEY number(8);
--ó�� ����1: wonder ���� CHR-J59�� 2�� �����Ѵ�.
INSERT INTO "TBL_BUY#"(BUY_SEQ,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
values(tbl_BUY_SEQ.nextval,'wonder','CHR-J59',2,sysdate);
--ó�� ����2: dual �ӽ����̺� �̿��ؼ� ���� seq�� ���ϱ�
SELECT tbl_buy_seq.currval FROM dual;	--nextval ���� �Ŀ��� Ȯ�� ����
--ó�� ����3: ������ ��ǰ�� ���� ���ϱ�
SELECT price FROM "TBL_PRODUCT#" tp WHERE pcode='CHR-J59';
--ó�� ����4: ó������1���� �߰��� �࿡ money�÷� ����ϰ� ����
UPDATE "TBL_BUY#" SET MONEY = 98700*QUANTITY WHERE BUY_SEQ =21;


CREATE OR REPLACE PROCEDURE proc_set_money(
	--ó�� ���� 1
	acustom_id IN varchar2,
	apcode IN varchar2,
	acnt IN NUMBER,
	isSuccess OUT varchar2
)
IS
	--ó�� ����2
	vseq NUMBER; -- ���� ����
	--ó�� ����3
	vprice NUMBER;
BEGIN
	INSERT INTO tbl_test values (2,acustom_id); --Ʈ������� �ϳ��� �������ϰ� �ӽ����̺� �����͸� �߰�
	--ó�� ���� 1
	INSERT INTO "TBL_BUY#"(buy_seq,CUSTOM_ID,PCODE,QUANTITY,BUY_DATE)
	VALUES (tbl_buy_seq.nextval,acustom_id,apcode,acnt,sysdate);		--�Ű����� ������ �߰�
	--ó�� ���� 2
	SELECT tbl_buy_seq.currval INTO vseq FROM dual;
	--ó�� ���� 3
	SELECT price INTO vprice FROM "TBL_PRODUCT#" tp WHERE PCODE = apcode ;
	--ó�� ���� 4
	UPDATE "TBL_BUY#" SET MONEY = vprice * QUANTITY WHERE BUY_SEQ = vseq ;
	DBMS_OUTPUT.PUT_LINE('���� ����');
	isSuccess :='success';
	COMMIT;
	EXCEPTION
		WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('���� ����');
	ROLLBACK;	--������ �߻��� sql ���� insert, update, delete�� ���
	isSuccess :='fail';
END;

--���ν��� ����
begin 
	proc_set_money('twice','C-BABQ1',4);
END;

	SELECT * FROM "TBL_BUY#" tb;
	SELECT * FROM tbl_test;

CREATE TABLE tbl_test(
	buy_seq number(8),
	custom_id varchar2(20)
);
