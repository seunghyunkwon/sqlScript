--����

INSERT INTO ENT (ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS,F_DATE)
VALUES (01,'JYP�������̸�Ʈ','02-2225-8100','����','����� ������ ������� 205',1997);
INSERT INTO ENT (ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS,F_DATE)
VALUES (02,'SM�������̸�Ʈ','02-6240-9800','�̼���,Ź����','����� ������ �սʸ��� 83-21',1995);
INSERT INTO ENT (ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS,F_DATE)
VALUES (03,'YG�������̸�Ʈ','02-3142-1104','Ȳ����','����� ������ �������1�� 7',1996);

INSERT INTO G_GROUP (ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (02,'aespa',4,'black mamba','2020-11-17','MY','ī����');
INSERT INTO G_GROUP (ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (01,'ITZY',5,'�޶�޶�','2019-02-12','midzy','����');

INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE01','ī����','2000-04-11','�ѱ�','aespa','���δ�','https://www.instagram.com/aespa_official/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE02','����','2001-01-01','�ѱ�','aespa','���庸��','https://www.instagram.com/aespa_official/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE03','����','2000-10-30','�Ϻ�','aespa','���η���','https://www.instagram.com/aespa_official/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE04','�״�','2002-10-23','�߱�','aespa','���κ���','https://www.instagram.com/aespa_official/');

INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT01','����','2000-05-26','�ѱ�','ITZY','���δ�','');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT02','����','2001-04-17','�ѱ�','ITZY','���η���','');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT03','����','2003-12-09','�ѱ�','ITZY','���꺸��','');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT04','ä��','2001-06-05','�ѱ�','ITZY','���δ�','');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT05','����','2000-07-21','�ѱ�','ITZY','���κ���','');

INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('JI01','ITZY','CRAZY IN LOVE',16,'LOCO','2021-09-24');
