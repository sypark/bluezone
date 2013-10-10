## 회원정보
#------------------------
-- DROP TABLE CST_CUST_MST;
CREATE TABLE CST_CUST_MST(
	CUST_NO INT(10) NOT NULL AUTO_INCREMENT AUTO_INCREMENT PRIMARY KEY,
	REG_DTM DATETIME NOT NULL COMMENT '등록일시',
	REGR_ID VARCHAR(30) NOT NULL COMMENT '등록자',
	UPD_DTM DATETIME NOT NULL COMMENT '수정일시',
	UPDR_ID VARCHAR(30) NOT NULL COMMENT '수정자',
	USE_YN VARCHAR(1) NOT NULL COMMENT '사용여부',
	CUST_NM VARCHAR(30) NOT NULL COMMENT '고객명',
	EMAIL VARCHAR(100) NOT NULL COMMENT '이메일',
	PASSWD VARCHAR(100) NOT NULL COMMENT '비밀번호',
	NICK_NAME VARCHAR(50) NOT NULL COMMENT '닉네임',
	CUST_LEVEL INT(1) NOT NULL COMMENT '고객등급',
	CUST_SEX VARCHAR(1) NOT NULL COMMENT '성별',
	WITHDRAW_DATE VARCHAR(8)  COMMENT '탈퇴일자'
)  DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI ;


## 회원기록기본
#------------------------
-- DROP TABLE CST_CUST_RECORD_MST;
CREATE TABLE CST_CUST_RECORD_MST(
	CUST_NO INT(10) NOT NULL PRIMARY KEY,
	REG_DTM DATETIME NOT NULL COMMENT '등록일시',
	REGR_ID VARCHAR(30) NOT NULL COMMENT '등록자',
	UPD_DTM DATETIME NOT NULL COMMENT '수정일시',
	UPDR_ID VARCHAR(30) NOT NULL COMMENT '수정자',
	SCORE INT(3) NOT NULL COMMENT '수지',
	SCORE_AVG FLOAT(10) COMMENT '수지평균',
	AVG FLOAT(10) COMMENT '에버리지',
	HIGH_RUN INT(2) COMMENT '하이런',
	WIN_CNT INT(5) COMMENT '승리경기수',
	LOSE_CNT INT(5)  COMMENT '패전경기수',
	DRAW_CNT INT(5)  COMMENT '무승부경기수',
	INDEX IX_CST_CUST_RECORD_MST_01 (CUST_NO)
)  DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI ;

## 대회기본
#------------------------
-- DROP TABLE MATCH_MST;
CREATE TABLE MATCH_MST(
	MATCH_NO INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	REG_DTM DATETIME NOT NULL COMMENT '등록일시',
	REGR_ID VARCHAR(30) NOT NULL COMMENT '등록자',
	UPD_DTM DATETIME NOT NULL COMMENT '수정일시',
	UPDR_ID VARCHAR(30) NOT NULL COMMENT '수정자',
	MATCH_NM VARCHAR(100) NOT NULL COMMENT '대회명',
	USE_YN VARCHAR(1) NOT NULL COMMENT '사용여부',
	YYYYMM VARCHAR(6) COMMENT '년월',
	WEEK VARCHAR(1) COMMENT '주',
	STD_DT VARCHAR(8) COMMENT '시작일자',
	END_DT VARCHAR(8) COMMENT '종료일자',
	MATCH_TYPE VARCHAR(2) COMMENT '대회유형'
)  DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI ;

## 게임기본
#------------------------
-- DROP TABLE GAME_MST;
CREATE TABLE GAME_MST(
	GAME_NO INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	REG_DTM DATETIME NOT NULL COMMENT '등록일시',
	REGR_ID VARCHAR(30) NOT NULL COMMENT '등록자',
	UPD_DTM DATETIME NOT NULL COMMENT '수정일시',
	UPDR_ID VARCHAR(30) NOT NULL COMMENT '수정자',
	MATCH_NO INT(10) NOT NULL COMMENT '대회번호',
	GAME_NM VARCHAR(100) COMMENT '게임명',
	STATUS VARCHAR(1) NOT NULL COMMENT '상태',
	GAME_DT VARCHAR(8) COMMENT '게임일자',
	MEM_CNT INT(2) NOT NULL COMMENT '참여인원',
	INNING_CNT INT(3) COMMENT '이닝수',
	FOREIGN KEY (MATCH_NO) 
        REFERENCES MATCH_MST(MATCH_NO)
        ON DELETE CASCADE

)  DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI ;

CREATE INDEX IX_GAME_MST_01 ON GAME_MST ( MATCH_NO );

## 게임기록
#------------------------
-- DROP TABLE GAME_RECORD;
CREATE TABLE GAME_RECORD(
	GAME_REC_NO INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	REG_DTM DATETIME NOT NULL COMMENT '등록일시',
	REGR_ID VARCHAR(30) NOT NULL COMMENT '등록자',
	UPD_DTM DATETIME NOT NULL COMMENT '수정일시',
	UPDR_ID VARCHAR(30) NOT NULL COMMENT '수정자',
	GAME_NO INT(10) NOT NULL COMMENT '게임번호',
	CUST_NO INT(10) NOT NULL COMMENT '고객번호',
	SCORE INT(3) NOT NULL COMMENT '수지',
	INNING INT(3) COMMENT '이닝',
	EARN_SCORE INT(3) default 0 COMMENT '득점',
	AVG FLOAT(10) COMMENT '에버리지',
	HIGH_RUN INT(2) default 0 COMMENT '하이런',
	WIN_CNT INT(1) default 0  COMMENT '승',
	LOSE_CNT INT(1) default 0  COMMENT '패',
	DRAW_CNT INT(1) default 0  COMMENT '무'
)  DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI ;

CREATE INDEX IX_GAME_RECORD_01 ON GAME_RECORD ( GAME_NO );


## 게임이닝기록
#------------------------
-- DROP TABLE GAME_RECORD_INNING;
CREATE TABLE GAME_RECORD_INNING(
	GAME_REC_NO INT(10) NOT NULL COMMENT '게임상세번호',
	REG_DTM DATETIME NOT NULL COMMENT '등록일시',
	REGR_ID VARCHAR(30) NOT NULL COMMENT '등록자',
	UPD_DTM DATETIME NOT NULL COMMENT '수정일시',
	UPDR_ID VARCHAR(30) NOT NULL COMMENT '수정자',
	INNING_NUM INT(3) NOT NULL COMMENT '이닝번호',
	EARN_SCORE INT(3) NOT NULL default 0 COMMENT '득점'
)  DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI ;

CREATE UNIQUE INDEX IX_GAME_RECORD_INNING_01 ON GAME_RECORD_INNING ( GAME_REC_NO, INNING_NUM);


## [Sample Data]
insert into match_mst (Reg_DTM, REGR_ID, UPD_DTM, UPDR_ID, MATCH_NM, std_dt, end_dt, YYYYMM, WEEK, MATCH_TYPE,use_yn)
values(sysdate(),'system',sysdate(),'system','15회정기대회','20130930','20131001','201309','5', '1','Y');

insert into match_mst (Reg_DTM, REGR_ID, UPD_DTM, UPDR_ID, MATCH_NM, std_dt, end_dt, YYYYMM, WEEK, MATCH_TYPE,use_yn)
values(sysdate(),'system',sysdate(),'system','상시대회','20130930','20131001','201309','5', '2','Y');

insert into game_mst (Reg_DTM, REGR_ID, UPD_DTM, UPDR_ID, MATCH_no, game_nm, use_yn, game_dt, mem_cnt, inning_cnt)
values(sysdate(),'system',sysdate(),'system', 1, 'test game', 'Y', '20130929', 2, 40);

select MATCH_NO, REG_DTM, REGR_ID, UPD_DTM, UPDR_ID, MATCH_NM, USE_YN, MATCH_DT, YYYYMM, WEEK, MATCH_TYPE 
from match_mst 
WHERE ( MATCH_DT >= '20130929' ) ;

select GAME_NO, REG_DTM, REGR_ID, UPD_DTM, UPDR_ID, MATCH_NO, GAME_NM, USE_YN, GAME_DT, MEM_CNT, INNING_CNT 
from game_mst 
WHERE ( MATCH_NO = 1 and USE_YN = 'Y' ) ;



insert into game_record_inning values(46, sysdate(), 'system', sysdate(), 'system', 17, 10);

-- GameRecordMapper.selectGameWithCustInfo
SELECT A.*,
        B.CUST_NM,
        B.EMAIL,
        B.NICK_NAME,
        C.SCORE AS CUST_SCORE,
        C.SCORE_AVG AS CUST_SCORE_AVG,
        C.AVG AS CUST_AVG,
        C.HIGH_RUN AS CUST_HIGH_RUN,
        C.WIN_CNT AS CUST_WIN_CNT,
        C.LOSE_CNT AS CUST_LOSE_CNT,
        C.DRAW_CNT AS CUST_DRAW_CNT
FROM  GAME_RECORD A,
	   CST_CUST_MST B
LEFT JOIN CST_CUST_RECORD_MST C ON B.CUST_NO=C.CUST_NO 
WHERE A.GAME_NO = 1
  AND A.CUST_NO = B.CUST_NO
  AND B.USE_YN = 'Y';
  
-- analysisCstCustRecord  
SELECT A.CUST_NO AS CUST_NO,
        COUNT(*) AS GAME_CNT,
        ifnull(AVG(A.AVG),0) AS GAME_AVG,
        ifnull(SUM(EARN_SCORE),0) AS SUM_EARN_SCORE,
        ifnull(MAX(HIGH_RUN),0) AS MAX_HIGH_RUN,
		ifnull(SUM(A.WIN_CNT),0) AS SUM_WIN_CNT,
        ifnull(SUM(A.LOSE_CNT),0) AS SUM_WIN_CNT,
        ifnull(SUM(A.DRAW_CNT),0) AS SUM_DRAW_CNT
FROM   GAME_RECORD A
WHERE  CUST_NO = 2
GROUP BY CUST_NO;

-- 상대전적 리스트
select aa.*,
        ccm.nick_name,
        ccrm.score
from
	(select b.cust_no, 
			count(*) game_cnt,
			ifnull(sum(b.win_cnt),0) sum_win_cnt,
			ifnull(sum(b.lose_cnt),0) sum_lose_cnt,
			ifnull(sum(b.draw_cnt),0) sum_draw_cnt
	from
		(select gr.game_no
		from   game_record gr
		where  gr.cust_no = 1) a,
		game_record b
	where a.game_no = b.game_no
	  and b.cust_no <> 1
	group by b.cust_no) aa,
    cst_cust_mst ccm,
    cst_cust_record_mst ccrm
where aa.cust_no = ccm.cust_no
  and aa.cust_no = ccrm.cust_no
order by ccm.nick_name