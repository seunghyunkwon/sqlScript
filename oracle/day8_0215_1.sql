--DML ����

-- ��ü ������ ��ȸ�ϱ�
SELECT COUNT(*) FROM "TBL_CAMPAREA" tc  ;

--������ ������ ���� ��ȸ�ϱ�
SELECT COUNT(*) FROM "TBL_CAMPAREA" tca 
	WHERE ADDRESS LIKE '����%';

SELECT DISTINCT substr(address,1,instr(ADDRESS,' ')) FROM TBL_CAMPAREA tc ;	--SUBSTR(���ڿ�,������ġ,����) 



--�������� �ڵ����߿��� �߿��� �̸��� �δ�ü� ��ȸ�ϱ�
SELECT CAMP_NAME, ETC1, ETC2 FROM "TBL_CAMPAREA" tca 
	WHERE ADDRESS LIKE '����%' AND CAMP_TYPE like '%�ڵ���%';

--�ڵ��� �߿��� ������ 50�� �̻��� �� �߿��� �̸�, �ּ� ��ȸ�ϱ�
SELECT CAMP_NAME, ADDRESS FROM "TBL_CAMPAREA" tca
	WHERE CAR_CNT >=50 AND CAMP_TYPE like '%�ڵ���%';

--ī��� �ִ� �߿��� �̸�, �ּ�, ī��� ���� ��ȸ�ϱ�
SELECT CAMP_NAME, ADDRESS, CARA_CNT FROM "TBL_CAMPAREA" tca 
WHERE CARA_CNT NOT IN 0 ORDER BY ADDRESS ;
