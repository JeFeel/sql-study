select EMP_NM
from TB_EMP;
select *
from TB_EMP;

--테이블
-- 성적정보 저장 테이블
create table tbl_score
(
    name    VARCHAR2(4) not null,
    kor     number(3)   not null check (kor > 0 and kor <= 100),
    eng     number(3)   not null check (eng > 0 and eng <= 100),
    math    number(3)   not null check (math > 0 and math <= 100),
    total   number(3)   null,
    average number(5, 2),
    grade   char(1),
    stu_num number(6),
    --Pk 거는범
    constraint pk_stu_num
        primary key (stu_num)
);
--테이블 생성 후 pk 적용
alter table tbl_score
    add constraint pk_stu_num
        primary key (stu_num);

-- 컬럼 추가하기
alter table tbl_score
    add (sci number(3) not null);

alter table tbl_score
    drop column sci;

-- 테이블 복사 ( tb_emp)
-- ctas
create table tb_emp_copy
as
select *
from TB_EMP;

--복사 테이블 조회
select *
from tb_emp_copy;
select *
from tb_emp;

-- drop table
-- 완전 삭제 (롤백 안 됨)
drop table tb_emp_copy;

-- truncate table
-- 구조는 냅두고 내부 데이터만 전체 삭제 (롤백 안 됨)
truncate table tb_emp_copy;

--예시테이블
create table goods
(
    id       NUMBER(6) PRIMARY KEY ,
    g_name   VARCHAR2(10) NOT NULL ,
    price    NUMBER(10) DEFAULT 1000,
    reg_date DATE
);

-- 행을 삭제  DELETE
DELETE FROM goods
WHERE id = 3;

-- 모든 행 삭제
DELETE FROM goods;

select * from goods;

--수정 update
UPDATE goods
SET g_name = '냉장고'
WHERE id  = 3;

UPDATE goods
SET g_name = '콜라', price = 3000
WHERE id  = 2;

UPDATE goods
SET price = 9999;

--insert
insert into goods(id, g_name, price, reg_date)
values (1, '선풍기', '120000', sysdate);

insert into goods(id, g_name, reg_date)
values (2, '달고나', sysdate);

insert into goods(id, g_name, price)
values (3, '후리', '500');

--컬럼명 생략시 모든 칼럼에 대해 순서대로 넣어야 함 (실무에서 쓰지 말것!!)
insert into goods
values (4, '세탁기', 10000, sysdate);

-- insert into goods (G_NAME, ID, PRICE)
-- values
--     ('후리1', 5, 500),
--     ('후리2', 6, 1500),
--     ('후리3', 7, 5300);


--select 조회 (ALL 기본값: 중복제거 안 되어있음)
SELECT CERTI_CD, CERTI_NM, ISSUE_INSTI_NM from tb_certi;

SELECT ISSUE_INSTI_NM, CERTI_NM from tb_certi;

--중복 제거 키워드 distinct
SELECT DISTINCT ISSUE_INSTI_NM FROM tb_certi;

-- 모든 컬럼 조회 (실무 사용 x)
SELECT *
FROM tb_certi;

-- 열 별칭 부여 (alias), AS 생략 가능
SELECT te.EMP_NM  사원명, te.ADDR  사원_거주지 FROM tb_emp te;

--문자열 연결하기
SELECT
    certi_nm || '(' || issue_insti_nm || ')' AS "자격증 정보"
FROM tb_certi;