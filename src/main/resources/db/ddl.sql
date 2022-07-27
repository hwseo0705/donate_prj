
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

commit;