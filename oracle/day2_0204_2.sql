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
	
	--초가 : min_salary 의 평균값보다 작은 행의 모든 컬럼을 조회 -> group 진도 후에 진행
	SELECT JOB_ID, JOB_TITLE FROM JOBS WHERE MIN_SALARY < AVG(MIN_SALARY); 

--2. locations 테이블 문제
--	1)city 컬럼이 london인 postal_code 조회
	SELECT POSTAL_CODE FROM LOCATIONS WHERE CITY = 'London';
--	2)location_id 컬럼이 1700, 2700, 2500이 아니고 city 컬럼이 tokyo인 행의 모든 컬럼 조회
	SELECT * FROM LOCATIONS WHERE LOCATION_ID NOT IN (1700,2500,2700) AND CITY ='Tokyo';
--	3)