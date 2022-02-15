--DML 연습

-- 전체 데이터 조회하기
SELECT COUNT(*) FROM "TBL_CAMPAREA" tc  ;

--강원도 데이터 개수 조회하기
SELECT COUNT(*) FROM "TBL_CAMPAREA" tca 
	WHERE ADDRESS LIKE '강원%';

SELECT DISTINCT substr(address,1,instr(ADDRESS,' ')) FROM TBL_CAMPAREA tc ;	--SUBSTR(문자열,시작위치,길이) 



--강원도의 자동차야영장 야영장 이름과 부대시설 조회하기
SELECT CAMP_NAME, ETC1, ETC2 FROM "TBL_CAMPAREA" tca 
	WHERE ADDRESS LIKE '강원%' AND CAMP_TYPE like '%자동차%';

--자동차 야영장 갯수가 50개 이상인 곳 야영장 이름, 주소 조회하기
SELECT CAMP_NAME, ADDRESS FROM "TBL_CAMPAREA" tca
	WHERE CAR_CNT >=50 AND CAMP_TYPE like '%자동차%';

--카라반 있는 야영장 이름, 주소, 카라반 갯수 조회하기
SELECT CAMP_NAME, ADDRESS, CARA_CNT FROM "TBL_CAMPAREA" tca 
WHERE CARA_CNT NOT IN 0 ORDER BY ADDRESS ;
