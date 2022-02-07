-- ������ Ÿ�� NUMBER ���� ���̺�

--NUMBER : �ڹ��� byte,short,int,long,float,double�� �ش�
--		 : NUMBER(���е�,�Ҽ����ڸ���)


CREATE TABLE table_number(
	col1 NUMBER,	--�ڸ����� �������� ������ �ִ� 38�ڸ������� �����ϴ� (�ڹٿ����� BigDecimal)
	col2 NUMBER(5),
	col3 NUMBER(7,2),
	col4 NUMBER(2,5)
);

INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.00012);

--���� : col2 Į���� �ڸ����� 6�¸� �Է��Ͽ��� ������ �߻�
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 123456, 12345.67, 0.00012);

--���� : col3 Į���� �Ҽ��� ���� �ڸ��� 2���� ǥ���ϱ� ���� �ݿø��Ǿ� ǥ��
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.678, 0.00012);

--���� : col3 Į���� ��ü �ڸ���(7)�� �ʰ��Ͽ� ���� �߻�
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 123456.67, 0.00012);

--���� : col4 �÷��� number(2,5) : ��ü ��ȿ�ڸ��� 5�� �� ��ȿ �ڸ��� 0���� �ִ� 2��, �������� ������ 0
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.000126);

--���� : col4 �÷��� number(2,5) : ������ 3���� ��ȿ�ڸ��� �տ� 0 -> �̰��� �ƴϸ� ����
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.00125);


