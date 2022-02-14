-- �����Լ� (����Լ�, �׷��Լ�) : count, max, min, sum, avg
						--�� �ܿ� �л�, ǥ������, �߾Ӱ� ���� �Լ��� �ִ�.

-- group by : Ư�� �÷����� �׷�ȭ�ϰ� �׿� ���ؼ� �����Լ��� �����Ѵ�.
-- ����) �μ��� �������, ������ ������, �μ��� ������, ������ ������� ....

-- �׷��Լ� ����
-- ������ �������
--���� : �׷��Լ� ����� �Ϲ��ķ��� �Բ� ��ȸ ���Ѵ�.
SELECT JOB_ID, count(*), avg(salary)
FROM EMPLOYEES e 
WHERE JOB_ID ='IT_PROG';


--group by�� �����Ͽ� �������� count�� avg�� ���Ѵ�.

SELECT JOB_ID, COUNT(*), avg(salary)
FROM EMPLOYEES e 
GROUP BY JOB_ID;

-- �μ��� count�� avg�� ���Ѵ�. (�׷��Լ� ����� �Բ� ��ȸ�� ������ �÷��� �׷�ȭ �÷��� �����ϴ�.)
SELECT DEPARTMENT_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

-- DEPARTMENTS ���̺�� ���� �μ��� ���踦 JOIN�Ͽ� ����Ѵ�.
SELECT * FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*), AVG(SALARY)
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID ;

-- ���ϴ� �÷��� ��ȸ�ϱ� (�տ� ���̺�ǥ�����ֽø� �ȴ�.)
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2."�ο���", d2."���" FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "�ο���", AVG(SALARY) AS "���"
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID ;

--��ȸ��� ��µǴ� ���� ������ �ο��� ��������
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2."�ο���", d2."���" FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "�ο���", AVG(SALARY) AS "���"
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
ORDER BY d2."�ο���" DESC; -- ������������ ������ ���� ������ Ű���尡 �ʿ��ϴ� (desc)


--��� �޿� ��������
--�ڸ��� ���� �Լ� : ���� trunc, �ø� ceil, �ݿø� round �� ����Ͽ� �Ҽ��� ���� �ڸ��� ����
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2."�ο���", d2."���" FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "�ο���", ROUND(AVG(SALARY),0) AS "���"
		FROM EMPLOYEES e 
		GROUP BY DEPARTMENT_ID) d2 
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
ORDER BY d2."���";

--SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2.COUNT(*), d2.AVG(SALARY) FROM DEPARTMENTS d,
--	(SELECT DEPARTMENT_ID, COUNT(*), AVG(SALARY)
--		FROM EMPLOYEES e 
--		GROUP BY DEPARTMENT_ID) d2 
--WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
--ORDER BY d2.AVG(SALARY);

--���� ��� �޿� �ݾ��� 8,000 �̻��� �μ��� ��ȸ�Ѵ�.
SELECT DEPARTMENT_ID, COUNT(*) AS "�ο���", ROUND(AVG(SALARY),0) AS "���"
	FROM EMPLOYEES e 
--	WHERE e."���">=8000		����: �����Լ� ��������� WHERE ����� �� �� ����.
	GROUP BY DEPARTMENT_ID
	HAVING AVG(SALARY) >=8000 --HAVING : �����Լ� ��������� ���ǽ��� ���� ����� �����ϴ�.
	ORDER BY "���";

-- ��ɹ�(Ű����)�� ���� : FROM - > WHERE -> GROUP BY -> HAVING -> ORDER BY	

--ALL Ű���� : JOB_ID�� ST_CLERT�� ��� �������� �޿����� ���� �޴� ������ ��ȸ
SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK';

SELECT LAST_NAME, SALARY, JOB_ID FROM EMPLOYEES e 
WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK');
--���� ����� max ������ ū ���� ã�´�.
SELECT LAST_NAME, SALARY, JOB_ID FROM EMPLOYEES e 
WHERE SALARY > (SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID='ST_CLERK');
--ORDER BY SALARY ; (EMPLOYEES ���̺� �Էµ� ������ ���� MAX������ ū �͸� ����� ��ȸ�Ѵ�.)






