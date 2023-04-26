CREATE DATABASE spring;
USE spring;

-- auto increment: mysql, mariadb의 방언
-- 오라클 시퀀스 기능 자동으로 첫번째 insert data 1
-- 순차적으로 1씩 증가하는 데이터를 자동으로 삽입
CREATE TABLE person (
  id INT(10) AUTO_INCREMENT,
  person_name VARCHAR(50) NOT NULL,
  person_age INT(3),
  CONSTRAINT pk_person_id PRIMARY KEY(id)
);

SELECT * FROM person;

-- id 초기화
ALTER TABLE person AUTO_INCREMENT = 1;
SET @COUNT =0;
UPDATE person SET id = @COUNT:=@COUNT+1;
