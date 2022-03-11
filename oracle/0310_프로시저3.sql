


--프로시저를 생성할 때 create : 없으면 만들기, replace : 있으면 대체하기
CREATE OR REPLACE PROCEDURE dept_max_salary(
--매개변수 선언하는 위치 : IN은 입력 매개변수로서 실행할 때 전달되는 값을 저장하는 변수이다.
	dept_name IN DEPARTMENTS.DEPARTMENT_NAME %TYPE
)
IS
--필요한 변수 선언하는 위치
	dept_id NUMBER(8) ;
	max_sal NUMBER(8) ;
	emp EMPLOYEES%ROWTYPE;
BEGIN
	SELECT DEPARTMENT_ID 
	INTO dept_id 
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME =dept_name;
	SELECT max(salary) INTO max_sal
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;
	DBMS_OUTPUT.PUT_LINE(dept_name ||'최고 연봉금액(Sales부서) : ' || max_sal);
	SELECT * INTO emp FROM EMPLOYEES e2 
	WHERE DEPARTMENT_ID = dept_id AND e2.SALARY = max_sal ;
	DBMS_OUTPUT.PUT_LINE(dept_name ||'최고연봉 직원: ' || emp.last_name || ',' || emp.hire_date);
END;

BEGIN 
dept_max_salary('IT');
END;

SELECT * FROM EMPLOYEES ;

select d.department_id id, d.department_name dept , max_sal from departments d,
        (select DEPARTMENT_ID id, max(salary) max_sal
        from employees 
        GROUP by DEPARTMENT_ID) max_sal# 
    where d.DEPARTMENT_ID = max_sal#.id AND d.DEPARTMENT_NAME ='Sales';

   
 select DEPARTMENT_ID id, max(salary) max_sal
        from employees 
        GROUP by DEPARTMENT_ID
        HAVING DEPARTMENT_ID =80;
       
--프로시저 정의
CREATE OR REPLACE PROCEDURE dept_max_salary2(
	dept_name IN hr.DEPARTMENTS.DEPARTMENT_NAME %TYPE,
	--출력 매개변수
	dept_id OUT hr.DEPARTMENTS.DEPARTMENT_ID %TYPE,
	max_sal OUT NUMBER
)
IS 
	vdept_id NUMBER(8);
BEGIN 
	select d.department_id
	INTO vdept_id	--조회 결과를 저장할 변수
	from departments d
	WHERE d.DEPARTMENT_NAME ='Sales';
 	--
	select DEPARTMENT_ID, max(salary) 
	INTO dept_id, max_sal	--조회 결과를 출력매개변수에 저장
    from employees 
    GROUP by DEPARTMENT_ID
    HAVING DEPARTMENT_ID =vdept_id;
END;

--실행할 때 출력 매개 변수를 선언해야한다.
DECLARE
	dept_id hr.employees.department_id %TYPE;
	max_sal NUMBER;
BEGIN
	dept_max_salary2('Sales',dept_id,max_sal);	--프로시저 실행한 후에 출력매개변수를 통해서 조회한 값을 전달 받는다.
	DBMS_OUTPUT.PUT_LINE('부서코드: ' || ':' || dept_id ||', 연봉금액 : ' || max_sal);
END;
