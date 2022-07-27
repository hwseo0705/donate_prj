
CREATE SEQUENCE seq_donate_board;
DROP SEQUENCE seq_donate_board;

SELECT * FROM donate_board;
DROP TABLE donate_board;
CREATE TABLE donate_board(
    board_no NUMBER(10) PRIMARY KEY
    , title VARCHAR2(100) NOT NULL
    , writer VARCHAR2(40) NOT NULL
    , thumbnail VARCHAR2(100) NOT NULL
    , content CLOB
    , target_money NUMBER(10) NOT NULL
    , current_money NUMBER(10) DEFAULT 0 NOT NULL
    , start_date VARCHAR2(9) NOT NULL
    , end_date VARCHAR2(9) NOT NULL
    , like_cnt NUMBER(3) DEFAULT 0
);

-- 내가 기부한 리스트
SELECT * FROM donate_info;
DROP TABLE donate_info;
CREATE TABLE donate_info (
    board_no NUMBER(10) NOT NULL
    , title VARCHAR2(100) NOT NULL
    , user_id VARCHAR2(50) NOT NULL
    , donate_money NUMBER(10) NOT NULL
    , FOREIGN KEY (board_no) REFERENCES donate_board(board_no)
    , FOREIGN KEY (user_id) REFERENCES donate_user(user_id) ON DELETE CASCADE
);

-- 내가 쓴 글 리스트

SELECT * FROM donate_user;
DROP TABLE doante_user;
CREATE TABLE donate_user (
    user_id VARCHAR2(50) PRIMARY KEY
    , password VARCHAR2(100) NOT NULL
    , name VARCHAR2(50) NOT NULL
    , email VARCHAR2(50) NOT NULL
    , money NUMBER(10) DEFAULT 0 NOT NULL
    --, donate_board_no NUMBER(10) NOT NULL
    --, FOREIGN KEY (donate_board_no) REFERENCES donate_board(board_no)
);

SELECT * FROM like_check;
DROP TABLE like_check;
CREATE TABLE like_check (
    user_id VARCHAR2(50) NOT NULL
    , like_board_no NUMBER (10) NOT NULL
    , FOREIGN KEY (user_id) REFERENCES donate_user (user_id) ON DELETE CASCADE
    , FOREIGN KEY (like_board_no) REFERENCES donate_board (board_no) ON DELETE CASCADE
);

CREATE SEQUENCE qNum;
DROP SEQUENCE qnum;

SELECT * FROM QnA_table;
DROP TABLE QnA_table ;
CREATE TABLE QnA_table (
    QnA_no NUMBER(10) PRIMARY KEY
    , user_id VARCHAR2(50) NOT NULL
    , qcontent CLOB
    , qdate DATE DEFAULT SYSDATE
    , FOREIGN KEY (user_id) REFERENCES donate_user (user_id) ON DELETE CASCADE
);

insert into QnA_table values (qNum.nextval , 'a1',' 더 기부하고싶어요 월급 받으면 또 올게요' , SYSDATE  );
insert into QnA_table values (qNum.nextval , 'a2',' 기부는 좋은 것이에요 ' , SYSDATE );
insert into QnA_table values (qNum.nextval , 'a3',' 기부는 ㅎㅎ 저에게 해주세요 ' , SYSDATE  );
insert into QnA_table values (qNum.nextval , 'a1',' 더 기부하고싶어요 월급 받으면 또 올게요1' , SYSDATE  );
insert into QnA_table values (qNum.nextval , 'a2',' 기부는 좋은 것이에요1 ' , SYSDATE );
insert into QnA_table values (qNum.nextval , 'a3',' 기부는 ㅎㅎ 저에게 해주세요1 ' , SYSDATE  );
insert into QnA_table values (qNum.nextval , 'a1',' 더 기부하고싶어요 월급 받으면 또 올게요2' , SYSDATE  );
insert into QnA_table values (qNum.nextval , 'a2',' 기부는 좋은 것이에요2 ' , SYSDATE );
insert into QnA_table values (qNum.nextval , 'a3',' 기부는 ㅎㅎ 저에게 해주세요 2' , SYSDATE  );

commit;