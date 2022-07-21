
CREATE SEQUENCE seq_donate_board;

DROP TABLE donate_board;

CREATE TABLE donate_board(
    board_no NUMBER(10) PRIMARY KEY
    , title VARCHAR2(100) NOT NULL
    , writer VARCHAR2(40) NOT NULL
    , thumbnail VARCHAR2(100) NOT NULL
    , content CLOB
    , target_money NUMBER(10) NOT NULL
    , current_money NUMBER(10) DEFAULT 0 NOT NULL
    , start_date DATE DEFAULT SYSDATE
    , end_date DATE NOT NULL
    , like_cnt NUMBER(3) DEFAULT 0
);

SELECT * FROM donate_board;

INSERT INTO donate_board VALUES(SEQ_DONATE_BOARD.nextval, 'donation title 1', '서해원', '/img/example1.jpg', '기부 좀 해줘봐', 5000000, 0, SYSDATE, SYSDATE+5, 0);
INSERT INTO donate_board VALUES(SEQ_DONATE_BOARD.nextval, 'donation title 2', '김동진', '/img/example2.jpg', '기부 좀 해줘', 4000000, 0, SYSDATE, SYSDATE+3, 0);
INSERT INTO donate_board VALUES(SEQ_DONATE_BOARD.nextval, 'donation title 3', '남기원', '/img/example3.jpg', '기부 좀 해줘요', 3000000, 0, SYSDATE, SYSDATE+4, 0);

SELECT * FROM donate_info;

DROP TABLE donate_info;
CREATE TABLE donate_info (
    board_no NUMBER(10) NOT NULL
    , user_id VARCHAR2(50) NOT NULL
    , donate_money NUMBER(10) NOT NULL
    , FOREIGN KEY (board_no) REFERENCES donate_board(board_no)
    , FOREIGN KEY (user_id) REFERENCES donate_user(user_id)
);

INSERT INTO donate_info VALUES (1, 'a1', 500000);
INSERT INTO donate_info VALUES (1, 'a2', 300000);
INSERT INTO donate_info VALUES (1, 'a3', 700000);
INSERT INTO donate_info VALUES (2, 'a2', 500000);
INSERT INTO donate_info VALUES (2, 'a3', 300000);
commit;

CREATE TABLE donate_user (
    user_id VARCHAR2(50) PRIMARY KEY
    , password VARCHAR2(100) NOT NULL
    , name VARCHAR2(50) NOT NULL
    , email VARCHAR2(50) NOT NULL
    , money NUMBER(10) DEFAULT 0 NOT NULL
    --, donate_board_no NUMBER(10) NOT NULL
    --, FOREIGN KEY (donate_board_no) REFERENCES donate_board(board_no)
);

INSERT INTO donate_user VALUES('a1', 'b1', '서해원', 'email1@naver.com', 1000000);
INSERT INTO donate_user VALUES('a2', 'b2', '김동진', 'email2@naver.com', 2000000);
INSERT INTO donate_user VALUES('a3', 'b3', '남기원', 'email3@naver.com', 3000000);
commit;

SELECT * FROM donate_user;0