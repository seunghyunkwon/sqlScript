--승현

INSERT INTO ENT (ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS,F_DATE)
VALUES (01,'JYP엔터테이먼트','02-2225-8100','정욱','서울시 강동구 강동대로 205',1997);
INSERT INTO ENT (ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS,F_DATE)
VALUES (02,'SM엔터테이먼트','02-6240-9800','이성수,탁영준','서울시 성동구 왕십리로 83-21',1995);
INSERT INTO ENT (ENT_CODE,ENT_NAME,TEL,CEO,ADDRESS,F_DATE)
VALUES (03,'YG엔터테이먼트','02-3142-1104','황보경','서울시 마포구 희우정로1길 7',1996);

INSERT INTO G_GROUP (ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (02,'aespa',4,'black mamba','2020-11-17','MY','카리나');
INSERT INTO G_GROUP (ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (01,'ITZY',5,'달라달라','2019-02-12','midzy','예지');

INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE01','카리나','2000-04-11','한국','aespa','메인댄서','https://www.instagram.com/aespa_official/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE02','윈터','2001-01-01','한국','aespa','리드보컬','https://www.instagram.com/aespa_official/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE03','지젤','2000-10-30','일본','aespa','메인래퍼','https://www.instagram.com/aespa_official/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('AE04','닝닝','2002-10-23','중국','aespa','메인보컬','https://www.instagram.com/aespa_official/');

INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT01','예지','2000-05-26','한국','ITZY','메인댄서','');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT02','류진','2001-04-17','한국','ITZY','메인래퍼','');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT03','유나','2003-12-09','한국','ITZY','서브보컬','');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT04','채령','2001-06-05','한국','ITZY','메인댄서','');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('IT05','리아','2000-07-21','한국','ITZY','메인보컬','');

INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('JI01','ITZY','CRAZY IN LOVE',16,'LOCO','2021-09-24');
