--�������� : �ۼ��� �ǽ���

--1. jobs ���̺� ����
--	1)min_salary �÷��� 10,000�̻��� job_title ��ȸ
	SELECT JOB_TITLE FROM JOBS WHERE MIN_SALARY >= 10000;
--	2)job_title �÷��� programmer �� ���� ��� �÷� ��ȸ
	SELECT * FROM JOBS WHERE JOB_TITLE = 'Programmer';
	--��ҹ��� �������� ��ȸ�� �����ϱ� ���ؼ� ���ڿ� ���� ����Ŭ �Լ� : upper(), lower();
	SELECT * FROM JOBS WHERE UPPER(JOB_TITLE) = 'PROGRAMMER';
	SELECT * FROM JOBS WHERE LOWER(JOB_TITLE) = 'programmer';
--	3)max_salary �÷��� �ִ밪 ��ȸ
	SELECT MAX(max_salary) FROM JOBS ; 
	
	--�ʰ� : min_salary �� ��հ����� ���� ���� ��� �÷��� ��ȸ -> group ���� �Ŀ� ����
	SELECT JOB_ID, JOB_TITLE FROM JOBS WHERE MIN_SALARY < AVG(MIN_SALARY); 

--2. locations ���̺� ����
--	1)city �÷��� london�� postal_code ��ȸ
	SELECT POSTAL_CODE FROM LOCATIONS WHERE CITY = 'London';
--	2)location_id �÷��� 1700, 2700, 2500�� �ƴϰ� city �÷��� tokyo�� ���� ��� �÷� ��ȸ
	SELECT * FROM LOCATIONS WHERE LOCATION_ID NOT IN (1700,2500,2700) AND CITY ='Tokyo';
--	3)