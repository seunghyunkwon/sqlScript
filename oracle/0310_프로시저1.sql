-- PL/SQL : Procedure(����,����), ������ �ܼ��� SQL�� Ȯ��� ���
--			����, ���(if,�ݺ���)�� ����Ͽ� ���α׷��־��� ���� sql ������ �帧�� ����




--���ν��� �⺻����
DECLARE	--���� ����
--	vcustomid varchar2(20);
--	vage number(3,0);
	vcustomid tbl_custom#.custom_id %TYPE; --���̺��.�÷��� �� ������ Ÿ�԰� �����ϰ� �Ѵ�.
	vage tbl_custom#.age %TYPE;
BEGIN	--���ν��� ����
	--���ν��� ���ο��� �ַ� DML ��ɹ����� �ۼ��Ѵ�. (�Բ� �����ؾ��� ���� SQL : Ʈ�����)
	SELECT custom_id,age 
	INTO vcustomid , vage --���ν��� ���� : �˻������ ������ ����
	FROM "TBL_CUSTOM#" tc 
	WHERE CUSTOM_ID ='mina012';	-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('���̸� : '|| vcustomid);
	DBMS_OUTPUT.PUT_LINE('������ : '|| vage);
	EXCEPTION
	WHEN no_data_found THEN	--���� �̸��� �پ��ϴ�. OTHERS ���ܴ� ��� ���
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;	--��