--세은씨
-- 걸그룹
INSERT INTO G_GROUP (ENT_CODE , TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (01, '미쓰에이', 4, 'Bad Girl Good Girl', '2010-07-01', 'Say A', null);
INSERT INTO G_GROUP (ENT_CODE , TEAM_NAME, MEMBER_CNT, D_SONG, D_DATE, F_NAME, LEADER)
VALUES (03, 'f(x)', 4, 'LA chA TA', '2009-09-05', '미유', '빅토리아');
   
-- 가수(미쓰에이)
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI01', '페이', '1987-04-27', '중국', '미쓰에이', '보컬', 'https://instagram.com/ff0427/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI02', '지아', '1989-02-03', '중국', '미쓰에이', '래퍼, 보컬, 댄서', 'https://www.instagram.com/MJBABY0203/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI03', '민', '1991-06-21', '한국', '미쓰에이', '보컬, 댄서', 'http://instagram.com/therealminnn');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('MI04', '수지', '1994-10-10', '한국', '미쓰에이', '보컬', 'http://www.instagram.com/skuukzky/');

-- 가수(f(x))
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX01', '빅토리아', '1987-02-02', '중국', 'f(x)', '서브보컬, 메인댄서', 'http://instagram.com/victoria02_02/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX02', '엠버', '1992-09-18', '미국', 'f(x)', '메인래퍼, 서브보컬', 'http://instagram.com/amberliu/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX03', '루나', '1993-08-12', '한국', 'f(x)', '메인보컬, 리드댄서', 'http://www.instagram.com/hermosavidaluna/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX04', '크리스탈', '1994-10-24', '한국,미국', 'f(x)', '센터, 리드보컬', 'http://www.instagram.com/vousmevoyez/');
INSERT INTO SINGER (NUM_SEQ, NAME, BIRTH, NAT, TEAM_NAME, PART, SNS)
VALUES ('FX05', '설리', '1994-03-29', '한국', 'f(x)', null, 'http://instagram.com/jelly_jilli/');

-- 앨범(미쓰에이)
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('JM01', '미쓰에이', 'A Class', 13, 'Good-bye Baby', '2011-07-18');
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('JM02', '미쓰에이', 'Hush', 13, 'Hush', '2013-11-06');

-- 앨범(f(x))
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF01', 'f(x)', '피노키오', 10, '피노키오', '2011-04-18');
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF02', 'f(x)', 'Pink Tape', 12, '첫 사랑니', '2013-07-29');
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF03', 'f(x)', 'Red Light', 11, 'Red Light', '2014-07-07');
INSERT INTO ALB(ALB_CODE, TEAM_NAME, ALB_NAME, SONG_CNT, T_SONG, S_DATE)
VALUES ('SF04', 'f(x)', '4 Walls', 10, '4 Walls', '2015-10-27');