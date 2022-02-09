-- view : ���� ���̺�(���������� ���������ʰ� �������� ������� ���̺�)
--			�� �������� ���̺��� �̿��ؼ� �����Ѵ�.
--			�� �����(������)�� ���̺�ó�� select ��ȸ�� �� �� �ִ� ���̺�
--			�� grant resource, connect to idev; -> resource�� view ������ ����


CREATE VIEW v_buy
AS
SELECT PCODE, CUSTOM_ID FROM TBL_BUY#;	--���� : insufficient PRIVILEGES (���� ����)

--idve �������� CREATE view ������ �ֱ����ؼ� (SQL.plus)����
--SQL > connect system	: �Է�
--ENter password : 1234	: �Է�
--connected.	:	���
--SQL > grant CREATE VIEW TO idev; : �Է�
--GRANT succeeded. : ���

--view �� �̿��� select ��ȸ
SELECT * FROM V_BUY vb WHERE PCODE = 'dk_143';

--buy#, custom#�� �����Ͽ� custom_id, pcode, ���̸�, �̸���, ���ż���, ���ų�¥
--	�� v_sale �̸��� view�� ���弼��.

--CREATE VIEW V_sale AS 
--SELECT CUSTOM_ID, PCODE, NAME, EMAIL, QUANTITY, REG_DATE 
--FROM TBL_BUY# tb, TBL_COSTOM# tc 
--WHERE tb.CUSTOM_ID = tc.CUSTOM_ID;	--�����߻� : ���� ã��

CREATE VIEW V_sale
AS
SELECT tc.CUSTOM_ID, tb.PCODE, tc.NAME, tc.EMAIL, tb.QUANTITY, tb.BUY_DATE 
FROM "TBL_CUSTOM#" tc , "TBL_BUY#" tb 
WHERE tc.CUSTOM_ID = tb.CUSTOM_ID ;


