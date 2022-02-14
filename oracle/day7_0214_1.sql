-- 집계함수 (통계함수, 그룹함수) : count, max, min, sum, avg
						--그 외에 분산, 표준편차, 중앙값 등의 함수도 있다.

-- group by : 특정 컬럼으로 그룹화하고 그에 대해서 집계함수를 적용한다.
-- 예시) 부서별 연봉평균, 지역별 직원수, 부서별 직원수, 업무별 연봉평균 ....

-- 그룹함수 복습
-- 업무별 연봉평균
--오류 : 그룹함수 결과와 일반컴럼을 함께 조회 못한다.
SELECT JOB_ID, count(*), avg(salary)
FROM EMPLOYEES e 
WHERE JOB_ID ='IT_PROG';


--group by를 적용하여 업무별로 count와 avg를 구한다.

SELECT JOB_ID, COUNT(*), avg(salary)
FROM EMPLOYEES e 
GROUP BY JOB_ID;

-- 부서별 count와 avg를 구한다. (그룹함수 결과와 함께 조회가 가능한 컬럼은 그룹화 컬럼만 가능하다.)
SELECT DEPARTMENT_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

-- DEPARTMENTS 테이블과 위의 부서별 집계를 JOIN하여 출력한다.
SELECT * FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*), AVG(SALARY)
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID ;

-- 원하는 컬럼만 조회하기 (앞에 테이블표시해주시면 된다.)
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2."인원수", d2."평균" FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", AVG(SALARY) AS "평균"
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID ;

--조회결과 출력되는 행의 순서를 인원수 내림차순
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2."인원수", d2."평균" FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", AVG(SALARY) AS "평균"
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
ORDER BY d2."인원수" DESC; -- 내림차순으로 지정할 때는 별도의 키워드가 필요하다 (desc)


--평균 급여 오름차순
--자릿수 지정 함수 : 내림 trunc, 올림 ceil, 반올림 round 을 사용하여 소수점 이하 자릿수 지정
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2."인원수", d2."평균" FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", ROUND(AVG(SALARY),0) AS "평균"
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
ORDER BY d2."평균";

--SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2.COUNT(*), d2.AVG(SALARY) FROM DEPARTMENTS d,
--	(SELECT DEPARTMENT_ID, COUNT(*), AVG(SALARY)
--		FROM EMPLOYEES e 
--		GROUP BY DEPARTMENT_ID) d2 
--WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
--ORDER BY d2.AVG(SALARY);

--위의 평균 급여 금액이 8,000 이상인 부서만 조회한다.
SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", ROUND(AVG(SALARY),0) AS "평균"
	FROM EMPLOYEES e 
--	WHERE e."평균">=8000		오류: 집계함수 결과값으로 WHERE 사용을 할 수 없다.
	GROUP BY DEPARTMENT_ID
	HAVING AVG(SALARY) >=8000 --HAVING : 집계함수 결과값으로 조건식을 직접 사용이 가능하다.
	ORDER BY "평균";

-- 명령문(키워드)의 순서 : FROM - > WHERE -> GROUP BY -> HAVING -> ORDER BY	

--ALL 키워드 : JOB_ID가 ST_CLERT인 모든 직원들의 급여보다 많이 받는 직원들 조회
SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK';

SELECT LAST_NAME, SALARY, JOB_ID FROM EMPLOYEES e 
WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK');
--기존 방법은 max 값보다 큰 것을 찾는다.
SELECT LAST_NAME, SALARY, JOB_ID FROM EMPLOYEES e 
WHERE SALARY > (SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK');
--ORDER BY SALARY ; (EMPLOYEES 테이블에 입력된 순서로 놓고 MAX값보다 큰 것만 결과로 조회한다.)






