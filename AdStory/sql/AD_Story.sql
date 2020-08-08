--======================================
-- 일단 관리자계정으로 접속하세요
--======================================
--ADSTORY계정 생성 
CREATE USER ADSTORY 
IDENTIFIED BY ADSTORY 
DEFAULT TABLESPACE USERS;

--권한부여
GRANT CONNECT, RESOURCE TO ADSTORY;

--======================================
-- ADSTORY 계정 에서 테이블 생성하세요
--======================================
-- 테이블 생성

CREATE TABLE "MEMBER" (
	"KEY"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(15)		NOT NULL,
	"PASSWORD"	VARCHAR2(300)		NOT NULL,
	"MEMBER_ROLE"	CHAR(1)	DEFAULT 'U'	NOT NULL,
	"POINT"	NUMBER	DEFAULT 0	NOT NULL,
	"PHONE_NUM"	CHAR(11)		NOT NULL,
	"ACCOUNT_NUM"	CHAR(30)		NOT NULL,
	"BUSINESS_NUM"	CHAR(10)		NULL,
	"NAME"	VARCHAR2(30)		NOT NULL,
	"EMAIL"	VARCHAR2(100)		NULL,
	"ADDRESS"	VARCHAR2(300)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE "AD_POST_CATEG" (
	"KEY"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	VARCHAR2(30)		NOT NULL
);

CREATE TABLE "AD_POST" (
	"KEY"	NUMBER		NOT NULL,
	"CATEGORY_KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(50)		NOT NULL,
	"CONTENT"	VARCHAR2(2000)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'F'	NOT NULL,
	"CLICK_PRICE"	NUMBER		NOT NULL,
	"POINT"	NUMBER		NOT NULL,
	"URL"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "PNT_EX_LOG" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"WITHDRAW"	NUMBER		NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'F'	NOT NULL,
	"APPLY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REQUIREMENTS"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "PNT_POST_LOG" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"KEY2"	NUMBER		NOT NULL,
	"LOG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"POINT_CHANGE_AMOUNT"	NUMBER		NOT NULL,
	"REMAIN_POINT"	NUMBER		NOT NULL
);

CREATE TABLE "WISH_LIST" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"ARTICLE_KEY"	NUMBER		NOT NULL
);

CREATE TABLE "REPORT" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(50)		NULL,
	"REPORT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CONTENT"	VARCHAR2(2000)		NOT NULL,
	"ANSWER"	VARCHAR2(2000)		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'F'	NOT NULL
);

CREATE TABLE "M_POST" (
	"KEY"	NUMBER		NOT NULL,
	"CATEGORY_KEY"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(50)		NULL,
	"CONTENT"	VARCHAR2(2000)		NULL,
	"DATE"	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE "M_POST_CATEG" (
	"KEY"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	CHAR(1)		NOT NULL
);

CREATE TABLE "FIXED_URL" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"ARTICLE_KEY"	NUMBER		NOT NULL,
	"FIXED_URL"	VARCHAR2(100)		NULL
);

CREATE TABLE "IP_LOG" (
	"KEY"	NUMBER		NOT NULL,
	"URL_KEY"	NUMBER		NOT NULL,
	"IP"	VARCHAR(255)		NOT NULL
);

CREATE TABLE "PNT_LOG" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"LOG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"POINT"	NUMBER		NOT NULL,
	"REAMIN_POINT"	NUMBER		NOT NULL
);

CREATE TABLE "AD_POST_COMM" (
	"KEY"	NUMBER		NOT NULL,
	"ARTICLE_KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"CONTENT"	VARCHAR2(2000)		NOT NULL,
	"DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"LEVEL"	NUMBER	DEFAULT 1	NOT NULL,
	"COMMENT_REF"	NUMBER		NULL
);



ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "AD_POST_CATEG" ADD CONSTRAINT "PK_AD_POST_CATEG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "AD_POST" ADD CONSTRAINT "PK_AD_POST" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "PNT_EX_LOG" ADD CONSTRAINT "PK_PNT_EX_LOG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "PNT_POST_LOG" ADD CONSTRAINT "PK_PNT_POST_LOG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "WISH_LIST" ADD CONSTRAINT "PK_WISH_LIST" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "M_POST" ADD CONSTRAINT "PK_M_POST" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "M_POST_CATEG" ADD CONSTRAINT "PK_M_POST_CATEG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "FIXED_URL" ADD CONSTRAINT "PK_FIXED_URL" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "IP_LOG" ADD CONSTRAINT "PK_IP_LOG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "PNT_LOG" ADD CONSTRAINT "PK_PNT_LOG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "AD_POST_COMM" ADD CONSTRAINT "PK_AD_POST_COMM" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "AD_POST" ADD CONSTRAINT "FK_AD_POST_CATEG_TO_AD_POST_1" FOREIGN KEY (
	"CATEGORY_KEY"
)
REFERENCES "AD_POST_CATEG" (
	"KEY"
);

ALTER TABLE "AD_POST" ADD CONSTRAINT "FK_MEMBER_TO_AD_POST_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "PNT_EX_LOG" ADD CONSTRAINT "FK_MEMBER_TO_PNT_EX_LOG_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "PNT_POST_LOG" ADD CONSTRAINT "FK_MEMBER_TO_PNT_POST_LOG_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "PNT_POST_LOG" ADD CONSTRAINT "FK_AD_POST_TO_PNT_POST_LOG_1" FOREIGN KEY (
	"KEY2"
)
REFERENCES "AD_POST" (
	"KEY"
);

ALTER TABLE "WISH_LIST" ADD CONSTRAINT "FK_MEMBER_TO_WISH_LIST_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "WISH_LIST" ADD CONSTRAINT "FK_AD_POST_TO_WISH_LIST_1" FOREIGN KEY (
	"ARTICLE_KEY"
)
REFERENCES "AD_POST" (
	"KEY"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "M_POST" ADD CONSTRAINT "FK_M_POST_CATEG_TO_M_POST_1" FOREIGN KEY (
	"CATEGORY_KEY"
)
REFERENCES "M_POST_CATEG" (
	"KEY"
);

ALTER TABLE "FIXED_URL" ADD CONSTRAINT "FK_MEMBER_TO_FIXED_URL_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "FIXED_URL" ADD CONSTRAINT "FK_AD_POST_TO_FIXED_URL_1" FOREIGN KEY (
	"ARTICLE_KEY"
)
REFERENCES "AD_POST" (
	"KEY"
);

ALTER TABLE "IP_LOG" ADD CONSTRAINT "FK_FIXED_URL_TO_IP_LOG_1" FOREIGN KEY (
	"URL_KEY"
)
REFERENCES "FIXED_URL" (
	"KEY"
);

ALTER TABLE "PNT_LOG" ADD CONSTRAINT "FK_MEMBER_TO_PNT_LOG_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "AD_POST_COMM" ADD CONSTRAINT "FK_AD_POST_TO_AD_POST_COMM_1" FOREIGN KEY (
	"ARTICLE_KEY"
)
REFERENCES "AD_POST" (
	"KEY"
);

ALTER TABLE "AD_POST_COMM" ADD CONSTRAINT "FK_MEMBER_TO_AD_POST_COMM_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "CK_MEMBER_ROLE" CHECK (MEMBER_ROLE IN ('A', 'U', 'C'));


--====================================
-- SEQUENCE
--====================================
-- 모든 테이블의 기본키 SEQUENCE 
-- SEQUENCE, SEQ_테이블명 으로 통일한 것으로 사용

CREATE SEQUENCE SEQ_AD_POST_CATEG;
CREATE SEQUENCE SEQ_AD_POST;
CREATE SEQUENCE SEQ_MEMBER;
CREATE SEQUENCE SEQ_PNT_EX_LOG;
CREATE SEQUENCE SEQ_PNT_POST_LOG;
CREATE SEQUENCE SEQ_WISH_LIST;
CREATE SEQUENCE SEQ_REPORT;
CREATE SEQUENCE SEQ_M_POST;
CREATE SEQUENCE SEQ_M_POST_CATEG;
CREATE SEQUENCE SEQ_FIXED_URL;
CREATE SEQUENCE SEQ_IP_LOG;
CREATE SEQUENCE SEQ_PNT_LOG;
CREATE SEQUENCE SEQ_AD_POST_COMM;





-- ======================================
-- 관리자 회원 추가
-- ======================================
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'kimdh','1234','A',DEFAULT,'01000000000','110-392-442372',NULL,'김관리자','kimdh@naver.com','서울시 강남',DEFAULT );

SELECT*FROM MEMBER;




















--========================= 
-- 필요한 애들
--=========================

--테이블 싹다 초기화 (결과 긁어서 실행)
SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
  FROM    user_objects
WHERE   object_type = 'TABLE';

--테이블 조회
SELECT * FROM ALL_OBJECTS WHERE OBJECT_TYPE = 'TABLE';
SELECT * FROM tabs;

