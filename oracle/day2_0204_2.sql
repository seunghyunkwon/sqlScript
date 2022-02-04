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
	

--2. locations ���̺� ����
--	1)city �÷��� london�� postal_code ��ȸ
	SELECT POSTAL_CODE FROM LOCATIONS WHERE CITY = 'London';
--	2)location_id �÷��� 1700, 2700, 2500�� �ƴϰ� city �÷��� tokyo�� ���� ��� �÷� ��ȸ
	SELECT * FROM LOCATIONS WHERE LOCATION_ID NOT IN (1700,2500,2700) AND CITY ='Tokyo';

--3. employees ���̺�
	--	����Լ�(���� �Լ�)�� ���� �� �����Ѵ�.
	SELECT count(*) FROM EMPLOYEES e;							--�Ѱ���	: 107
	SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';	--����	: 5

	SELECT avg(SALARY) FROM EMPLOYEES e;						--����ӱ�	: 6461 
	SELECT avg(SALARY) FROM EMPLOYEES e WHERE JOB_ID='IT_PROG';	--�����ӱ�	: 5760
	
	SELECT MAX(SALARY) FROM EMPLOYEES e;						--�ִ��ӱ�	: 24000
	SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';--�����ִ�	: 9000
	
	SELECT MIN(SALARY) FROM EMPLOYEES e;						--�����ӱ�	: 2100
	SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';--��������	: 4200

	-- ����Լ��� �׷��Լ��̴�. �ش��Լ� ������� ���ϱ����� �����͸� �׷�ȭ�ϰ� �����Ѵ�.
	SELECT JOB_ID, MAX(SALARY) FROM EMPLOYEES e ;
	
	SELECT * FROM EMPLOYEES e2 WHERE SALARY = (
	--���� max,min ���� sql����� ���⿡ �־�� �� �ǹ̸� �ľ��غ���
	SELECT MAX(SALARY) FROM EMPLOYEES e	
--	SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'
--	SELECT MIN(SALARY) FROM EMPLOYEES e
--	SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'
	);
	--SELECT �ȿ� ���� �� �ٸ� SELECT �� ���������̴�. �������� ������� 1���̹Ƿ� = ���ǽĿ� ����� �� �ִ�.
	


--IT_PROG �߿��� �ּұ޿��� �޴� ����� first_name, last_name �÷� ��ȸ
	SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES e2
	WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG')
	AND JOB_ID ='IT_PROG';


	--�ʰ� : min_salary �� ��հ����� ���� ���� JOB_ID, JOB_TITLE�� ��ȸ -> group ���� �Ŀ� ����
--	SELECT JOB_ID, JOB_TITLE FROM JOBS WHERE MIN_SALARY < AVG(MIN_SALARY); 

	--��հ�
	SELECT avg(MIN_SALARY) FROM JOBS j2
	--��հ��� ���ϰ� ���ǽĿ� �̿��ϱ� (��������)
	SELECT JOB_ID, JOB_TITLE FROM JOBS j 
	WHERE MIN_SALARY < (SELECT avg(MIN_SALARY) FROM JOBS j2);
	
	
	
	
	
	
	