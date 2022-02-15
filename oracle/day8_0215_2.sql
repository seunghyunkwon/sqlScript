-- 데이터 내보내기

-- 1) 다른 컴퓨터로 데이터베이스 테이블(데이터 포함)을 복사하거나
-- 2) 같은 컴퓨터의 다른 스키마로 데이터베이스 테이블을 복사하는 경우 등 


--	1) 에 관한 실행

--	스크립트 파일(.sql)로 테이블 생성과 데이터 추가하기
--	1. DDL(CREATE)와 DML(INSERT)이 모두 필요하다.
--	2. DDL은 테이블 PROPERTIES에서 복사하고
--	3. INSERT 데이터는 내보내기로 한다.
--	4. 2)와 3)을 하나의 스크립트파일(.sql)로 저장해서 실행한다.
--	5. 테이블 참조관계(외래키 같은 경우)에 있는 경우 순서를 잘 고려하여야한다.

--	실행 설명
--	1. SQL> @파일명.sql과 같이 실행한다.
--	체크사항 : 현재 디렉토리 경로 - sql파일이 있는 위치에서 cmd를 실행하고 sqlplus를 입력
--			: @기호와 파일명을 정확히 입력한다.


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
	 
