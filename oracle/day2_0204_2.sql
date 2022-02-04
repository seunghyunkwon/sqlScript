--연습문제 : 작성자 권승현

--1. jobs 테이블 문제
--	1)min_salary 컬럼이 10,000이상인 job_title 조회
	SELECT JOB_TITLE FROM JOBS WHERE MIN_SALARY >= 10000;
--	2)job_title 컬럼이 programmer 인 행의 모든 컬럼 조회
	SELECT * FROM JOBS WHERE JOB_TITLE = 'Programmer';
	--대소문자 구문없이 조회가 가능하기 위해선 문자열 관련 오라클 함수 : upper(), lower();
	SELECT * FROM JOBS WHERE UPPER(JOB_TITLE) = 'PROGRAMMER';
	SELECT * FROM JOBS WHERE LOWER(JOB_TITLE) = 'programmer';
--	3)max_salary 컬럼의 최대값 조회
	SELECT MAX(max_salary) FROM JOBS ; 
	

--2. locations 테이블 문제
--	1)city 컬럼이 london인 postal_code 조회
	SELECT POSTAL_CODE FROM LOCATIONS WHERE CITY = 'London';
--	2)location_id 컬럼이 1700, 2700, 2500이 아니고 city 컬럼이 tokyo인 행의 모든 컬럼 조회
	SELECT * FROM LOCATIONS WHERE LOCATION_ID NOT IN (1700,2500,2700) AND CITY ='Tokyo';

--3. employees 테이블
	--	통계함수(집계 함수)를 조금 더 연습한다.
	SELECT count(*) FROM EMPLOYEES e;							--총개수	: 107
	SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';	--조건	: 5

	SELECT avg(SALARY) FROM EMPLOYEES e;						--평균임금	: 6461 
	SELECT avg(SALARY) FROM EMPLOYEES e WHERE JOB_ID='IT_PROG';	--조건임금	: 5760
	
	SELECT MAX(SALARY) FROM EMPLOYEES e;						--최대임금	: 24000
	SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';--조건최대	: 9000
	
	SELECT MIN(SALARY) FROM EMPLOYEES e;						--최저임금	: 2100
	SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG';--조건최저	: 4200

	-- 통계함수는 그룹함수이다. 해당함수 결과값을 구하기위해 데이터를 그룹화하고 실행한다.
	SELECT JOB_ID, MAX(SALARY) FROM EMPLOYEES e ;
	
	SELECT * FROM EMPLOYEES e2 WHERE SALARY = (
	--위의 max,min 구한 sql명령을 여기에 넣어보고 그 의미를 파악해보기
	SELECT MAX(SALARY) FROM EMPLOYEES e	
--	SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'
--	SELECT MIN(SALARY) FROM EMPLOYEES e
--	SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'
	);
	--SELECT 안에 쓰인 또 다른 SELECT 는 서브쿼리이다. 서브쿼리 결과값이 1개이므로 = 조건식에 사용할 수 있다.
	


--IT_PROG 중에서 최소급여를 받는 사람의 first_name, last_name 컬럼 조회
	SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES e2
	WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG')
	AND JOB_ID ='IT_PROG';


	--초가 : min_salary 의 평균값보다 작은 행의 JOB_ID, JOB_TITLE을 조회 -> group 진도 후에 진행
--	SELECT JOB_ID, JOB_TITLE FROM JOBS WHERE MIN_SALARY < AVG(MIN_SALARY); 

	--평균값
	SELECT avg(MIN_SALARY) FROM JOBS j2
	--평균값을 구하고 조건식에 이용하기 (서브쿼리)
	SELECT JOB_ID, JOB_TITLE FROM JOBS j 
	WHERE MIN_SALARY < (SELECT avg(MIN_SALARY) FROM JOBS j2);
	
	
	
	
	
	
	