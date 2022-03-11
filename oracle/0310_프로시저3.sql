


--���ν����� ������ �� create : ������ �����, replace : ������ ��ü�ϱ�
CREATE OR REPLACE PROCEDURE dept_max_salary(
--�Ű����� �����ϴ� ��ġ : IN�� �Է� �Ű������μ� ������ �� ���޵Ǵ� ���� �����ϴ� �����̴�.
	dept_name IN DEPARTMENTS.DEPARTMENT_NAME %TYPE
)
IS
--�ʿ��� ���� �����ϴ� ��ġ
	dept_id NUMBER(8) ;
	max_sal NUMBER(8) ;
	emp EMPLOYEES%ROWTYPE;
BEGIN
	SELECT DEPARTMENT_ID 
	INTO dept_id 
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME =dept_name;
	SELECT max(salary) INTO max_sal
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;
	DBMS_OUTPUT.PUT_LINE(dept_name ||'�ְ� �����ݾ�(Sales�μ�) : ' || max_sal);
	SELECT * INTO emp FROM EMPLOYEES e2 
	WHERE DEPARTMENT_ID = dept_id AND e2.SALARY = max_sal ;
	DBMS_OUTPUT.PUT_LINE(dept_name ||'�ְ��� ����: ' || emp.last_name || ',' || emp.hire_date);
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
       
--���ν��� ����
CREATE OR REPLACE PROCEDURE dept_max_salary2(
	dept_name IN hr.DEPARTMENTS.DEPARTMENT_NAME %TYPE,
	--��� �Ű�����
	dept_id OUT hr.DEPARTMENTS.DEPARTMENT_ID %TYPE,
	max_sal OUT NUMBER
)
IS 
	vdept_id NUMBER(8);
BEGIN 
	select d.department_id
	INTO vdept_id	--��ȸ ����� ������ ����
	from departments d
	WHERE d.DEPARTMENT_NAME ='Sales';
 	--
	select DEPARTMENT_ID, max(salary) 
	INTO dept_id, max_sal	--��ȸ ����� ��¸Ű������� ����
    from employees 
    GROUP by DEPARTMENT_ID
    HAVING DEPARTMENT_ID =vdept_id;
END;

--������ �� ��� �Ű� ������ �����ؾ��Ѵ�.
DECLARE
	dept_id hr.employees.department_id %TYPE;
	max_sal NUMBER;
BEGIN
	dept_max_salary2('Sales',dept_id,max_sal);	--���ν��� ������ �Ŀ� ��¸Ű������� ���ؼ� ��ȸ�� ���� ���� �޴´�.
	DBMS_OUTPUT.PUT_LINE('�μ��ڵ�: ' || ':' || dept_id ||', �����ݾ� : ' || max_sal);
END;
