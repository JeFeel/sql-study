-- 학생 성적 관리 테이블
CREATE TABLE tbl_score(
                          name VARCHAR(30) NOT NULL,
                          kor INT(3) NOT NULL,
                          eng INT(3) NOT NULL,
                          math INT(3) NOT NULL,
                          stu_num INT(10) AUTO_INCREMENT,
                          total INT(3),
                          avg FLOAT(5,2), -- 5자리 중에 소숫점이 2자리
                          grade CHAR(1) NOT NULL, -- 한 글자니까
                          CONSTRAINT pk_stu_num PRIMARY KEY(stu_num)
);

SELECT *
FROM tbl_score;
use spring;
-- stu_num 초기화
ALTER TABLE tbl_score AUTO_INCREMENT = 1;
SET @COUNT =0;
UPDATE tbl_score SET stu_num = @COUNT:=@COUNT+1;

DROP TABLE tbl_score;

CREATE TABLE tbl_board (
                           board_no INT(10) AUTO_INCREMENT PRIMARY KEY ,
                           title VARCHAR(80) not null,
                           content VARCHAR(2000),
                           view_count int(10) DEFAULT  0,
                           reg_date_time DATETIME DEFAULT  current_timestamp
);

SELECT *FROM tbl_board;
USE spring;

UPDATE tbl_board
SET view_count = view_count + 1
WHERE board_no = 1;

SELECT *
FROM tbl_board
ORDER BY board_no DESC
LIMIT 20,6
;

SELECT *
FROM tbl_board
WHERE title LIKE concat('%', '40', '%')
ORDER BY board_no DESC
LIMIT 0,6;



create table tbl_reply (
                           reply_no INT(10) auto_increment,
                           reply_text VARCHAR(1000) not null,
                           reply_writer VARCHAR(100) not null,
                           reply_date DATETIME default current_timestamp,
                           board_no INT(10),
                           constraint pk_reply primary key (reply_no),
                           constraint fk_reply
                               foreign key (board_no)
                                   references tbl_board (board_no)
                                   on delete cascade
);

SELECT *
FROM tbl_reply;

DROP table tbl_reply;

TRUNCATE table tbl_board;

SELECT *
FROM tbl_board;
SELECT *
FROM tbl_reply
WHERE  reply_no = 999;

SELECT *
FROM tbl_reply
WHERE  board_no = 298;