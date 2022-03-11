-- hr ��Ű���� ���̺��� �̿��ؼ� ���ν��� �����մϴ�.

SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;

--Sales �μ��� �ְ� �����ݾ���?
SELECT MAX(SALARY) FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.DEPARTMENT_NAME ='Sales';

--���� join���� ��ȸ�� ���� ���ν��� Ȱ���ؼ� ���ϱ�
DECLARE
	dept_id departments.department_id %TYPE;
	max_sal NUMBER;		--������ Ÿ�� ũ�� ���� ����
	emp EMPLOYEES %ROWTYPE;
BEGIN
	--Sales �μ��� �μ�ID���ϱ�
	SELECT DEPARTMENT_ID INTO dept_id --������ ���� 
	FROM DEPARTMENTS d WHERE DEPARTMENT_NAME ='Sales';
	--������ �μ�ID�� �������̺��� �ְ� �����ݾ� ���ϱ�
	SELECT max(salary) INTO max_sal
	FROM EMPLOYEES e WHERE DEPARTMENT_ID =dept_id;
	DBMS_OUTPUT.PUT_LINE('�ְ� �����ݾ�(Sales�μ�) : ' || max_sal);
	--�߰� : 'Sales'�μ��� �ְ����ݾ��� �޴� ������ �������ϱ� ( �� ��ü�� ������ ����)
SELECT * INTO emp --rowtype ������ ��ȸ ��� ��� �÷��� ����
FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = dept_id AND e2.SALARY = max_sal ;
DBMS_OUTPUT.PUT_LINE('Sales �ְ��� ����: ' || emp.last_name || ',' || emp.hire_date);
END;