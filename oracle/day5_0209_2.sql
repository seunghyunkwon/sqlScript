--commit, rollback �׽�Ʈ
--	������ auto commit ������ �����ؾ��Ѵ�.
--	��1) ���� �����⿡ ���ؼ��� ����(�����ͺ��̽� �޴� - Ʈ����� ��� - manual commit)
--	��2) db���� ������ auto commit �� ����(������ �޴� - ���� - ���� -���� ���� auto commit üũ)

--������� 1��
SELECT * FROM tbl#; --���� ���� Ȯ��
DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM tbl#;	--Ȯ��
ROLLBACK;	--DELETE ����� ������ �ǵ�����(�ּ�)
SELECT * FROM tbl#;	--Ȯ��

--������� 2��
DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM tbl#; --Ȯ��
COMMIT;
SELECT * FROM tbl#; --Ȯ��
ROLLBACK;	--������ commit �� �����Ƿ� delete�� ����� �� ����.
SELECT * FROM tbl#; --Ȯ��

--������� 3��
INSERT INTO tbl# (acol,age) VALUES ('nana',33);
SELECT * FROM tbl#; --Ȯ��
ROLLBACK;
SELECT * FROM tbl#; --Ȯ��



--������� 4��
INSERT INTO tbl# (acol,age) VALUES ('nana22',33);
INSERT INTO tbl# (acol,age) VALUES ('����',29);
COMMIT;
SELECT * FROM tbl#; --Ȯ��

UPDATE tbl# SET bcol ='test' WHERE  acol='nana22';
DELETE FROM tbl# WHERE acol = 'main22';
ROLLBACK;
SELECT * FROM tbl#; --Ȯ��