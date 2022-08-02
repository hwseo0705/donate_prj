-- 어떤 게시물에 어떤 파일이 등록되었는지 기록할 테이블
CREATE TABLE donate_file_upload (
    file_name VARCHAR2(150) PRIMARY KEY,
    reg_date DATE DEFAULT SYSDATE,
    bno NUMBER(10) NOT NULL,
    FOREIGN KEY (bno) REFERENCES donate_board (board_no) ON DELETE CASCADE
);