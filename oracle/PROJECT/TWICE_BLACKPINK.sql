--������
-- �ٹ�
INSERT INTO ALB
(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES('JT01', 'TWICE', 'Twicetagram',13,'LIKEY','2017-10-30');

INSERT INTO TEAM_A.ALB
(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES('JT02', 'TWICE', 'Eyes wide open',13,'I CANT STOP', '2020-10-26');

INSERT INTO TEAM_A.ALB
(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES('JT03', 'TWICE', 'Formula of Love', 17, 'SCIENTIST', '2021-11-12');

INSERT INTO TEAM_A.ALB
(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES('YB01', 'BLACKPINK', 'The Album', 8, 'Lovesick Girls', '2020-10-02');

-- �ɱ׷�
INSERT INTO G_GROUP
(ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES(01, 'TWICE', 9, 'OOH-AHH�ϰ�', '2015.10.20', 'Twinkle', '��ȿ');

INSERT INTO G_GROUP
(ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES(03, 'BLACKPINK', 4, '���Ķ�', '2016.08.08','Blink',NULL);

-- ���� : TWICE 
INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW01', '��ȿ', '1997-02-01', '�ѱ�', 'TWICE', '����,���κ���', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW02', '�糪', '1996-12-29', '�Ϻ�', 'TWICE', '���꺸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW03', '����', '1995-09-22', '�ѱ�', 'TWICE', '���庸��,�����', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW04', '���', '1996-11-09', '�Ϻ�', 'TWICE', '���꺸��,���귡��,���δ�', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW05', '����', '1996-11-01', '�ѱ�', 'TWICE', '���庸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW06', '����', '1998-05-28', '�ѱ�', 'TWICE', '���巡��,���꺸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW07', 'ä��', '1999-04-23', '�ѱ�', 'TWICE', '���η���,���꺸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW08', '�̳�', '1997-03-24', '�Ϻ�', 'TWICE', '���δ�,���꺸��', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW09', '����', '1999-06-14', '�븸', 'TWICE', '���꺸��,�����', 'https://www.instagram.com/twicetagram/');

-- ���� : BLACKPINK 
INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL01', '����', '1996-01-16', '�ѱ�', 'BLACKPINK', '���η���,���庸��', 'https://www.instagram.com/jennierubyjane/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL02', '����', '1995-01-03', '�ѱ�', 'BLACKPINK', '���庸��', 'https://www.instagram.com/sooyaaa__/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL03', '����', '1997-02-11', '�ѱ�,��������', 'BLACKPINK', '���κ���,�����', 'https://www.instagram.com/roses_are_rosie/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL04', '����', '1997-03-27', '�±�', 'BLACKPINK', '���δ�,���巡��,���꺸��', 'https://www.instagram.com/lalalalisa_m/');