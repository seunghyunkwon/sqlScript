--��¥ Ÿ�� : date, timestamp (timezone ����)
CREATE TABLE TABLE_DATE(
	acol DATE,
	bcol timestamp,
	ccol timestamp DEFAULT sysdate	-- ���� �������� �ʾ��� �� �⺻��(default) : sysdate�� ���� ��¥ �� �ð�
);
-- ��¥������ ���ڿ� Ÿ�԰� �ڵ�ĳ������ �ȴ�.
-- '	'�ȿ� yyyy-mm-dd hh:mm:ss ���ڿ� �������� �ۼ�
INSERT INTO IDEV.TABLE_DATE (ACOL, BCOL)
VALUES('2022-02-07', '2022-02-07');

SELECT * FROM TABLE_DATE td ;


-- ���ڿ� Ÿ��

-- CHAR(����)		: ��������, ����(byte)
-- VARCHAR(����) 	: ����Ŭ���� ����� �ϵ� ������� �ʴ� �����ڷ���
-- VARCHAR2(����)	: ���������� ����(byte), ���̴� �ִ� �����̰� �޸𸮴� ������ũ�⸸ŭ ��� 
--					: �ִ� 2000 byte�̴� UTF-8 ���ڵ����� �ѱ��� 3byte�̰� ���� ���� ��ȣ�� 1byte

CREATE TABLE TABLE_STRING(
	acol char(10),
	bcol varchar2(10),
	ccol nchar(10),
	dcol nvarchar2(10)
);

--CHAR TYPE TEST
INSERT INTO TABLE_STRING (acol) VALUES ('abcdefghij');

INSERT INTO TABLE_STRING (acol) VALUES ('abcde');

INSERT INTO TABLE_STRING (acol) VALUES ('�����ٶ�'); --���� : 4���� �� 12byte

INSERT INTO TABLE_STRING (acol) VALUES ('������');

--VARCHAR2 TYPE TEST : CHAR�� ������ �� �߰��Ǵ� ������ ����.
INSERT INTO TABLE_STRING (bcol) VALUES ('abcdefghij');

INSERT INTO TABLE_STRING (bcol) VALUES ('abcde');

INSERT INTO TABLE_STRING (bcol) VALUES ('�����ٶ�'); --���� : 4���� �� 12byte

INSERT INTO TABLE_STRING (bcol) VALUES ('������');

--NCHAR TYPE TEST : �������̴� �Է°��� �����ϵ� ������ BYTE�� �ƴ� ���� ����
INSERT INTO TABLE_STRING (ccol) VALUES ('abcdefghij');

INSERT INTO TABLE_STRING (ccol) VALUES ('abcde');

INSERT INTO TABLE_STRING (ccol) VALUES ('�����ٶ�');

INSERT INTO TABLE_STRING (ccol) VALUES ('������');

INSERT INTO TABLE_STRING (ccol) VALUES ('�����ٶ󸶹ٻ������');

INSERT INTO TABLE_STRING (ccol) VALUES ('�����ٶ󸶹ٻ������ī'); --���� : �� 11�����̹Ƿ� ���� �߻�

--NVARCHAR2 TYPE TEST : �������̴� �Է°��� �����ϵ� ������ ���ڰ��� ������ ���ŵȴ�.
INSERT INTO TABLE_STRING (dcol) VALUES ('abcdefghij');

INSERT INTO TABLE_STRING (dcol) VALUES ('abcde');

INSERT INTO TABLE_STRING (dcol) VALUES ('�����ٶ�');

INSERT INTO TABLE_STRING (dcol) VALUES ('������');

INSERT INTO TABLE_STRING (dcol) VALUES ('�����ٶ󸶹ٻ������');

INSERT INTO TABLE_STRING (dcol) VALUES ('�����ٶ󸶹ٻ������ī'); --���� : �� 11�����̹Ƿ� ���� �߻�


--���� ������ ��� ���ڰ� �����ִ� ��쿡�� NVARCHAR2 �� ���ڼ��� ����ϴ� ���� �ǰ�����̴�.





