-- hr 스키마의 테이블을 이용해서 프로시저 연습합니다.

SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;

--Sales 부서의 최고 연봉금액은?
SELECT MAX(SALARY) FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.DEPARTMENT_NAME ='Sales';

--위의 join으로 조회한 것을 프로시저 활용해서 구하기
DECLARE
	dept_id departments.department_id %TYPE;
	max_sal NUMBER;		--데이터 타입 크기 생략 가능
	emp EMPLOYEES %ROWTYPE;
BEGIN
	--Sales 부서의 부서ID구하기
	SELECT DEPARTMENT_ID INTO dept_id --변수에 저장 
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME ='Sales';
	--구해진 부서ID로 직원테이블에서 최고 연봉금액 구하기
	SELECT max(salary) INTO max_sal
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;
	DBMS_OUTPUT.PUT_LINE('최고 연봉금액(Sales부서) : ' || max_sal);
	--추가 : 'Sales'부서의 최고연봉금액을 받는 직원의 정보구하기 ( 행 전체를 변수에 저장)
SELECT * INTO emp --rowtype 변수에 조회 결과 모든 컬럼을 저장
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = dept_id AND e2.SALARY = max_sal ;
DBMS_OUTPUT.PUT_LINE('Sales 최고연봉 직원: ' || emp.last_name || ',' || emp.hire_date);
END;