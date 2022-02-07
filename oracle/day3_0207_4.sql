-- *���� ��ǰ ���̺��� ��(row)�����͸� ������ CUSTOM_ID, PCODE�� �ߺ��Ǹ� �ȵȴ�.
--		���⺻Ű �÷��� ���Ѵ�.(�ߺ��� ��, NULL�� ����� �ȵȴ�.)

-- **PRICE , QUANTITY ���� �÷��� �ݵ�� �ʼ� �����ͷ� ����Ǿ�� �Ѵ�.
--		�� NOT NULL �÷����� �����Ѵ�. (NULL�� ��� ������ �ȵȴ�.)

--*** ���� ��ǰ���̺� ���� CUSTOM_ID, PCODE �÷� ���� ����ϸ� ����Ȯ�� ������
--		�� �ܷ�Ű �÷��� ���Ѵ�.(�ٸ� ���̺��� ���� �����Ѵ�.(NULL ��� �Ұ�))

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

-- ���� ���̺�
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
