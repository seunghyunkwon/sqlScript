--������
-- �ɱ׷�
INSERT INTO G_GROUP (ENT_CODE , TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (01, '�̾�����', 4, 'Bad Girl Good Girl', '2010-07-01', 'Say A', null);
INSERT INTO G_GROUP (ENT_CODE , TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (03, 'f(x)', 4, 'LA chA TA', '2009-09-05', '����', '���丮��');
   
-- ����(�̾�����)
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI01', '����', '1987-04-27', '�߱�', '�̾�����', '����', 'https://instagram.com/ff0427/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI02', '����', '1989-02-03', '�߱�', '�̾�����', '����, ����, ��', 'https://www.instagram.com/MJBABY0203/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI03', '��', '1991-06-21', '�ѱ�', '�̾�����', '����, ��', 'http://instagram.com/therealminnn');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI04', '����', '1994-10-10', '�ѱ�', '�̾�����', '����', 'http://www.instagram.com/skuukzky/');

-- ����(f(x))
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX01', '���丮��', '1987-02-02', '�߱�', 'f(x)', '���꺸��, ���δ�', 'http://instagram.com/victoria02_02/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX02', '����', '1992-09-18', '�̱�', 'f(x)', '���η���, ���꺸��', 'http://instagram.com/amberliu/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX03', '�糪', '1993-08-12', '�ѱ�', 'f(x)', '���κ���, �����', 'http://www.instagram.com/hermosavidaluna/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX04', 'ũ����Ż', '1994-10-24', '�ѱ�,�̱�', 'f(x)', '����, ���庸��', 'http://www.instagram.com/vousmevoyez/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX05', '����', '1994-03-29', '�ѱ�', 'f(x)', null, 'http://instagram.com/jelly_jilli/');

-- �ٹ�(�̾�����)
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('JM01', '�̾�����', 'A Class', 13, 'Good-bye Baby', '2011-07-18');
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('JM02', '�̾�����', 'Hush', 13, 'Hush', '2013-11-06');

-- �ٹ�(f(x))
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF01', 'f(x)', '�ǳ�Ű��', 10, '�ǳ�Ű��', '2011-04-18');
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF02', 'f(x)', 'Pink Tape', 12, 'ù �����', '2013-07-29');
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF03', 'f(x)', 'Red Light', 11, 'Red Light', '2014-07-07');
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF04', 'f(x)', '4 Walls', 10, '4 Walls', '2015-10-27');