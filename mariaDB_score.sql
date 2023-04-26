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

-- stu_num 초기화
ALTER TABLE tbl_score AUTO_INCREMENT = 1;
SET @COUNT =0;
UPDATE tbl_score SET stu_num = @COUNT:=@COUNT+1;

DROP TABLE tbl_score;