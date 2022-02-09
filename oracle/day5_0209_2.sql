--commit, rollback 테스트
--	ㄴ디비버 auto commit 설정을 변경해야한다.
--	ㄴ1) 현재 편집기에 대해서만 변경(데이터베이스 메뉴 - 트랜잭션 모드 - manual commit)
--	ㄴ2) db연결 유형을 auto commit 을 해제(윈도우 메뉴 - 설정 - 연결 -연결 유형 auto commit 체크)

--실행순서 1번
SELECT * FROM tbl#; --현재 상태 확인
DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM tbl#;	--확인
ROLLBACK;	--DELETE 명령을 원래로 되돌리기(최소)
SELECT * FROM tbl#;	--확인

--실행순서 2번
DELETE FROM tbl# WHERE acol='momo';
SELECT * FROM tbl#; --확인
COMMIT;
SELECT * FROM tbl#; --확인
ROLLBACK;	--위에서 commit 을 했으므로 delete를 취소할 수 없다.
SELECT * FROM tbl#; --확인

--실행순서 3번
INSERT INTO tbl# (acol,age) VALUES ('nana',33);
SELECT * FROM tbl#; --확인
ROLLBACK;
SELECT * FROM tbl#; --확인



--실행순서 4번
INSERT INTO tbl# (acol,age) VALUES ('nana22',33);
INSERT INTO tbl# (acol,age) VALUES ('쯔위',29);
COMMIT;
SELECT * FROM tbl#; --확인

UPDATE tbl# SET bcol ='test' WHERE  acol='nana22';
DELETE FROM tbl# WHERE acol = 'main22';
ROLLBACK;
SELECT * FROM tbl#; --확인