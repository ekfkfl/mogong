SELECT * FROM TAB;
 
Begin -- 모든 테이블 삭제
for c in (select table_name from user_tables) loop
  execute immediate 'drop table '||c.table_name||' cascade constraints';
end loop;
End;
 
Begin -- 모든 시퀀스 삭제
for c in (SELECT * FROM all_sequences WHERE SEQUENCE_OWNER='DBUSER') loop
  execute immediate 'drop SEQUENCE '||c.sequence_name;
end loop;
End;

CREATE TABLE USER_TB(
  ID VARCHAR2(30) PRIMARY KEY, -- 회원아이디 
  PASSWORD VARCHAR2(30) NOT NULL, -- 비밀번호
  NAME VARCHAR2(20) NOT NULL, -- 이름
  PATH VARCHAR2(500) NOT NULL, -- 사진 경로
  GENDER NUMBER NOT NULL, -- 성별
  BIRTH VARCHAR2(50) NOT NULL, -- 생년월일
  ADDR VARCHAR2(300) NOT NULL, -- 주소
  PHONE VARCHAR2(30) NOT NULL, -- 전화번호
  EMAIL VARCHAR2(40) NOT NULL, -- 이메일
  INTRO VARCHAR2(500) NOT NULL -- 자기소개
  LOGIN_STATUS VARCHAR2(10) -- 로그인상태
)

insert into user_tb values('gwang12', '1234', '광준', 'asdasf', 0, '19920302', '강원도', '010-2002-3333', 'gwa@nana.com', '감자묵어봣나?', null);
insert into user_tb values('jun12', '1234', '광준', 'asdasf', 0, '19920302', '강원도', '010-2002-3333', 'gwa@nana.com', '감자묵어봣나?', null);
 
select * from USER_TB

CREATE TABLE COMM_CODE(
  COMM_CODE VARCHAR2(10) PRIMARY KEY, -- 공통코드번호
  CODE_NAME VARCHAR2(40) NOT NULL, -- 코드이름
  CODE_DESC VARCHAR2(100),  --코드설명
  PARENT_CODE VARCHAR2(6), --부모코드
  REG_DATE DATE NOT NULL, --등록일
  UPDATE_DATE DATE, --수정일
  CODE_USED VARCHAR2(1) DEFAULT 'Y', --공통코드 사용유무
  CODE_ORDER NUMBER(3) --코드 순서 
);

select* from COMM_CODE;

select * from study;


CREATE TABLE STUDY(
  STUDY_CODE NUMBER PRIMARY KEY, -- 스터디 코드
  ID VARCHAR2(30) REFERENCES USER_TB(ID), -- 회원 아이디
  CATEGORY_CODE VARCHAR2(30) REFERENCES COMM_CODE(COMM_CODE), -- 카테고리 코드(공통코드에서 가져옴)
  CITY_CODE VARCHAR2(30) REFERENCES COMM_CODE(COMM_CODE), -- 도시 코드(공통코드에서 가져옴)
  NAME VARCHAR2(100) NOT NULL, -- 스터디 이름
  WRITE_DATE DATE NOT NULL, -- 등록일
  START_DATE DATE NOT NULL, -- 시작일
  END_DATE DATE NOT NULL, -- 종료일
  DAY VARCHAR2(30) NOT NULL, -- 요일
  START_TIME VARCHAR2(30) NOT NULL, -- 시작시간
  END_TIME VARCHAR2(30) NOT NULL, -- 종료시간
  PEOPLE NUMBER NOT NULL, -- 인원
  AREA VARCHAR2(50) NOT NULL, -- 지역
  DESCRIPTION VARCHAR2(500) NOT NULL, -- 스터디 설명
  READ NUMBER DEFAULT 1, -- 조회수
  STUDY_STATUS VARCHAR2(10) REFERENCES COMM_CODE(COMM_CODE) -- 스터디 상태(모집중,진행중..)
)
select * from study;
insert into study values(study_seq.nextval,'crw12','0001','0002','스터디이름',sysdate,sysdate,sysdate,'월수금','08:00','12:00',1,'강남독서실','스터디설명',1,'0004')

insert into study values(study_seq.nextval,'gwang12','0001','0002','기효니',sysdate,sysdate,sysdate,'월수금','08:00','12:00',1,'강남독서실','스터디설명',1, '0044')
insert into study values(study_seq.nextval,'jun12','0001','0002', '성후니',sysdate,sysdate,sysdate,'월수금','08:00','12:00',1,'강남독서실','스터디설명',1, '0044')

insert into study values(study_seq.nextval,'jun12','0001','0002', '즐거운영어교실',sysdate,sysdate,sysdate,'월수금','08:00','12:00',1,'강남독서실','스터디설명',1, '0043')
insert into study values(study_seq.nextval,'jun12','0001','0002', '자바잡자자바',sysdate,sysdate,sysdate,'월수금','08:00','12:00',1,'강남독서실','스터디설명',1, '0043')

select study.STUDY_CODE, study.ID, CATEGORY_CODE, CITY_CODE, NAME, WRITE_DATE,
START_DATE, END_DATE, DAY, START_TIME, END_TIME, PEOPLE, AREA, DESCRIPTION, STUDY_STATUS,
JOIN_STATUS, member.id from study, member 
where study.STUDY_CODE = member.STUDY_CODE
and study.STUDY_STATUS='0044' and member.id='jun12' --진행중 쿼리

select STUDY_CODE, ID, CATEGORY_CODE, CITY_CODE, NAME, WRITE_DATE,
START_DATE, END_DATE, DAY, START_TIME, END_TIME, PEOPLE, AREA, DESCRIPTION, STUDY_STATUS
from study 
where STUDY_STATUS='0043' and id='jun12' --모집중 쿼리

select * from study where id='crw12'

CREATE SEQUENCE STUDY_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
 
 
CREATE TABLE MEMBER(
  MEMBER_CODE NUMBER PRIMARY KEY,
  STUDY_CODE NUMBER REFERENCES STUDY(STUDY_CODE),
  ID VARCHAR2(30) REFERENCES USER_TB(ID),
  JOIN_STATUS VARCHAR2(10) REFERENCES COMM_CODE(COMM_CODE), -- 가입상태
  GRADE VARCHAR2(10) REFERENCES COMM_CODE(COMM_CODE) -- 등급
)

insert into member values(MEMBER_SEQ.nextval, 6,'gwang12','0002', null)
insert into member values(MEMBER_SEQ.nextval, 7,'gwang12','0002', null)
insert into member values(MEMBER_SEQ.nextval, 10,'jun12','0002', null)
insert into member values(MEMBER_SEQ.nextval, 13,'crw12','0002', null)
insert into member values(MEMBER_SEQ.nextval, 12,'crw12','0002', null)

insert into member values(MEMBER_SEQ.nextval, 6,'crw12','0004', null)
insert into member values(MEMBER_SEQ.nextval, 7,'crw12','0004', null)
insert into member values(MEMBER_SEQ.nextval, 11,'crw12','0004', null)
insert into member values(MEMBER_SEQ.nextval, 12,'gwang12','0004', null)
insert into member values(MEMBER_SEQ.nextval, 10,'crw12','0004', null)
insert into member values(MEMBER_SEQ.nextval, 13,'jun12','0004', null)
insert into member values(MEMBER_SEQ.nextval, 14,'crw12','0004', null)

select * from MEMBER;

select
study.STUDY_CODE, study.ID, CATEGORY_CODE, CITY_CODE, NAME, WRITE_DATE,
START_DATE, END_DATE, DAY, START_TIME, END_TIME, PEOPLE, AREA, DESCRIPTION, STUDY_STATUS,
JOIN_STATUS, member.id, CODE_NAME
from STUDY, member, COMM_CODE
where study.STUDY_CODE = member.STUDY_CODE 
and member.JOIN_STATUS= comm_code.COMM_CODE
and comm_code.COMM_CODE = '0002'
and member.id='gwang12' -- 신청중

select SEND_MESSAGE_CODE, ID, title, content, RECV_ID, write_date
	from SEND_MESSAGE 
	where ID='gwang12' and title||content||id like '%1%'
	order by SEND_MESSAGE_CODE desc --sendMail 검색 쿼리
 
CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
 
CREATE TABLE TASK(
  TASK_CODE NUMBER PRIMARY KEY,
  STUDY_CODE NUMBER REFERENCES STUDY(STUDY_CODE),
  TITLE VARCHAR2(100) NOT NULL, -- 태스크 제목
  CONTENT VARCHAR2(300), -- 태스크 내용
  PROGRESS_STATUS VARCHAR2(10) REFERENCES COMM_CODE(COMM_CODE), -- 진행상태
  START_DATE DATE, -- 시작일
  END_DATE DATE, -- 종료일
  SUCCESS_DATE DATE -- 완료일
) 

select * from task;

CREATE SEQUENCE TASK_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
 
CREATE TABLE TASK_FILE(
  TASK_FILE_CODE NUMBER PRIMARY KEY,
  MEMBER_CODE NUMBER REFERENCES MEMBER(MEMBER_CODE),
  TASK_CODE NUMBER REFERENCES TASK(TASK_CODE),
  NAME VARCHAR2(50) NOT NULL, -- 태스크 파일명
  PATH VARCHAR2(500) NOT NULL, -- 태스크 파일경로
  FILESIZE NUMBER NOT NULL, -- 태스크 파일크기
  WRITE_DATE DATE NOT NULL -- 태스크 파일 등록일
)
 
CREATE SEQUENCE TASK_FILE_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
 
CREATE TABLE TASK_COMMENT(
  TASK_COMMENT_CODE NUMBER PRIMARY KEY, 
  TASK_CODE NUMBER REFERENCES TASK(TASK_CODE),
  ID VARCHAR2(30) REFERENCES USER_TB(ID), -- 아이디
  NAME VARCHAR2(20), -- 이름
  PATH VARCHAR2(500), -- 사진 경로
  CONTENT VARCHAR2(300) NOT NULL, -- 태스크 코멘트 내용
  WRITE_DATE DATE NOT NULL -- 태스크 코멘트 등록일
)
 
CREATE SEQUENCE TASK_COMMENT_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
 
CREATE TABLE TASK_MEMBER( -- 태스크를 할당받은 멤버 테이블
  TASK_CODE NUMBER REFERENCES TASK(TASK_CODE), 
  MEMBER_CODE NUMBER REFERENCES MEMBER(MEMBER_CODE),
  CONSTRAINT TASK_MEMBER_PK PRIMARY KEY(TASK_CODE,MEMBER_CODE)   
)
select * from task; 
 commit
CREATE TABLE SEND_MESSAGE(
  SEND_MESSAGE_CODE NUMBER PRIMARY KEY,
  ID VARCHAR2(30) REFERENCES USER_TB(ID), -- 보낸 회원 ID
  TITLE VARCHAR2(50) NOT NULL, -- 제목
  CONTENT VARCHAR2(500) NOT NULL,  -- 내용
  RECV_ID VARCHAR2(30) NOT NULL, -- 받는 회원 ID
  WRITE_DATE DATE NOT NULL -- 작성일
)

select SEND_MESSAGE_CODE, id, title, content, recv_id, write_date
from SEND_MESSAGE 
where id='crw12' 
order by SEND_MESSAGE_CODE desc

insert into send_message values()
 
CREATE SEQUENCE SEND_MESSAGE_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
 
CREATE TABLE RECV_MESSAGE(
  RECV_MESSAGE_CODE NUMBER PRIMARY KEY,
  ID VARCHAR2(30) REFERENCES USER_TB(ID), -- 받는 회원 ID
  TITLE VARCHAR2(50) NOT NULL,
  CONTENT VARCHAR2(500) NOT NULL,
  SEND_ID VARCHAR2(30) NOT NULL, -- 보낸 회원 ID
  WRITE_DATE DATE NOT NULL,
  CONFIRM VARCHAR2(10) REFERENCES COMM_CODE(COMM_CODE) -- 받은 쪽지 확인 유무
)

insert into recv_message values()

select RECV_MESSAGE_CODE, id, title, content, SEND_ID, write_date, CONFIRM
from RECV_MESSAGE 
where ID='gwang12'
order by RECV_MESSAGE_CODE desc

select RECV_MESSAGE_CODE, id, title, content, SEND_ID, write_date, CONFIRM
from RECV_MESSAGE 
where RECV_MESSAGE_CODE=1
 
CREATE SEQUENCE RECV_MESSAGE_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
 
 
CREATE TABLE BOARD(
  BOARD_CODE NUMBER PRIMARY KEY,
  STUDY_CODE NUMBER REFERENCES STUDY(STUDY_CODE),
  MEMBER_CODE NUMBER REFERENCES MEMBER(MEMBER_CODE),
  TITLE VARCHAR2(30) NOT NULL,
  CONTENT VARCHAR2(500) NOT NULL,
  WRITE_DATE DATE NOT NULL
)
 
CREATE SEQUENCE BOARD_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
 
CREATE TABLE CHAT(
  CHAT_CODE NUMBER PRIMARY KEY,
  STUDY_CODE NUMBER REFERENCES STUDY(STUDY_CODE),
  MEMBER_CODE NUMBER REFERENCES MEMBER(MEMBER_CODE),
  CONTENT VARCHAR2(500) NOT NULL,
  WRITE_DATE DATE NOT NULL
)
 
CREATE SEQUENCE CHAT_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE

COMMIT