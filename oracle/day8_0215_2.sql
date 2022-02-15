-- ������ ��������

-- 1) �ٸ� ��ǻ�ͷ� �����ͺ��̽� ���̺�(������ ����)�� �����ϰų�
-- 2) ���� ��ǻ���� �ٸ� ��Ű���� �����ͺ��̽� ���̺��� �����ϴ� ��� �� 


--	1) �� ���� ����

--	��ũ��Ʈ ����(.sql)�� ���̺� ������ ������ �߰��ϱ�
--	1. DDL(CREATE)�� DML(INSERT)�� ��� �ʿ��ϴ�.
--	2. DDL�� ���̺� PROPERTIES���� �����ϰ�
--	3. INSERT �����ʹ� ��������� �Ѵ�.
--	4. 2)�� 3)�� �ϳ��� ��ũ��Ʈ����(.sql)�� �����ؼ� �����Ѵ�.
--	5. ���̺� ��������(�ܷ�Ű ���� ���)�� �ִ� ��� ������ �� ����Ͽ����Ѵ�.

--	���� ����
--	1. SQL> @���ϸ�.sql�� ���� �����Ѵ�.
--	üũ���� : ���� ���丮 ��� - sql������ �ִ� ��ġ���� cmd�� �����ϰ� sqlplus�� �Է�
--			: @��ȣ�� ���ϸ��� ��Ȯ�� �Է��Ѵ�.


CREATE TABLE "EMPLOYEES" 
	("EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20), 
	"LAST_NAME" VARCHAR2(25) CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL , 
	"EMAIL" VARCHAR2(25) CONSTRAINT "EMP_EMAIL_NN" NOT NULL , 
	"PHONE_NUMBER" VARCHAR2(20), 
	"HIRE_DATE" DATE CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL , 
	"JOB_ID" VARCHAR2(10) CONSTRAINT "EMP_JOB_NN" NOT NULL , 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0), 
	 CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
	 );
	 
CREATE TABLE "DEPARTMENTS" 
	("DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30) CONSTRAINT "DEPT_NAME_NN" NOT NULL, 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0), 
	 CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
	 );
	 
