--정수씨
-- 앨범
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

-- 걸그룹
INSERT INTO G_GROUP
(ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES(01, 'TWICE', 9, 'OOH-AHH하게', '2015.10.20', 'Twinkle', '지효');

INSERT INTO G_GROUP
(ENT_CODE, TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES(03, 'BLACKPINK', 4, '휘파람', '2016.08.08','Blink',NULL);

-- 가수 : TWICE 
INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW01', '지효', '1997-02-01', '한국', 'TWICE', '리더,메인보컬', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW02', '사나', '1996-12-29', '일본', 'TWICE', '서브보컬', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW03', '나연', '1995-09-22', '한국', 'TWICE', '리드보컬,리드댄서', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW04', '모모', '1996-11-09', '일본', 'TWICE', '서브보컬,서브래퍼,메인댄서', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW05', '정연', '1996-11-01', '한국', 'TWICE', '리드보컬', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW06', '다현', '1998-05-28', '한국', 'TWICE', '리드래퍼,서브보컬', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW07', '채영', '1999-04-23', '한국', 'TWICE', '메인래퍼,서브보컬', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW08', '미나', '1997-03-24', '일본', 'TWICE', '메인댄서,서브보컬', 'https://www.instagram.com/twicetagram/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('TW09', '쯔위', '1999-06-14', '대만', 'TWICE', '서브보컬,리드댄서', 'https://www.instagram.com/twicetagram/');

-- 가수 : BLACKPINK 
INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL01', '제니', '1996-01-16', '한국', 'BLACKPINK', '메인래퍼,리드보컬', 'https://www.instagram.com/jennierubyjane/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL02', '지수', '1995-01-03', '한국', 'BLACKPINK', '리드보컬', 'https://www.instagram.com/sooyaaa__/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL03', '로제', '1997-02-11', '한국,뉴질랜드', 'BLACKPINK', '메인보컬,리드댄서', 'https://www.instagram.com/roses_are_rosie/');

INSERT INTO TEAM_A.SINGER
(NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES('BL04', '리사', '1997-03-27', '태국', 'BLACKPINK', '메인댄서,리드래퍼,서브보컬', 'https://www.instagram.com/lalalalisa_m/');