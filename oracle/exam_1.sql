-- ����) ȸ�� ���̺� ����

CREATE TABLE HQ(
Department VARCHAR2(20)
);

-- ���̺� �߰� ����
ALTER TABLE HQ ADD DECODE NUMBER(3);

ALTER TABLE HQ ADD F_DATE date;

-- �÷� ���� �� �� �Է�
INSERT INTO HQ (Department, DECODE)
VALUES ('�����',001);

INSERT INTO HQ (Department, DECODE)
VALUES ('������',002);

INSERT INTO HQ (Department, DECODE)
VALUES ('������',003);

INSERT INTO HQ (Department, DECODE)
VALUES ('�ҹ��',004);

INSERT INTO HQ (Department, DECODE)
VALUES ('�����',005);

-- �÷� ���� �� �� �Է�
UPDATE HQ SET F_DATE = SYSDATE WHERE DECODE = 001;

