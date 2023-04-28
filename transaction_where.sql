CREATE TABLE employees
(
    id     NUMBER PRIMARY KEY,
    name   VARCHAR2(50),
    salary NUMBER(8, 2)
);

INSERT INTO employees
VALUES (1, 'Alice', 5000);
INSERT INTO employees
VALUES (2, 'Bob', 6000);
INSERT INTO employees
VALUES (3, 'Charlie', 7000);

-- 급여 총합 조회
SELECT SUM(salary)
FROM employees;

-- COMMIT; -- 변경사항 완전히 db에 저장

--트랜잭션 시작
BEGIN
    --모든 사원들의 급여를 1000씩 올려준다
    UPDATE employees SET salary = salary + 1000;

    SELECT SUM(salary)
    FROM employees;

    ROLLBACK;

    SELECT SUM(salary)
    FROM employees;
END;

-- 내 돈이 빠짐
-- UPDATE account
-- SET  balance = balance - 1000
-- WHERE user_name = '김철수';
--
-- UPDATE account
-- SET  balance = balance + 1000
-- WHERE user_name = '박영희';
--
-- ROLLBACK;

-- where 조건절
SELECT emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd = 2;

--wwhere 절로 pk 동등조건을 걸면 무조건 단일행이 강조 됨
SELECT emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE emp_no = 1000000003;

--비교 연산자 (90년대생만 조회)
SELECT emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231';
-- WHERE birth_de>='19900101'
-- AND birth_de <='19991231';

-- or 연산
SELECT emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd = '100004'
   OR dept_cd = '100006';

-- not in 연산
SELECT emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd NOT IN ('100004', '100006');

-- LIKE 연산자
-- 검색에서 주로 사용
-- 와일드 카드 매핑 (%: 0글자 이상, _: 딱 1글자)
SELECT emp_no, emp_nm
FROM tb_emp
WHERE emp_nm = '심%'; --이름이 심 뒤로 글자 있는 사람 전부

SELECT emp_no, emp_nm
FROM tb_emp
WHERE emp_nm = '이_'; --이름이 성씨 포함 두 글자

SELECT emp_no, emp_nm
FROM tb_emp
WHERE emp_nm = '이__'; --이름이 성씨 포함 세 글자

SELECT emp_no, emp_nm, addr
FROM tb_emp
WHERE addr LIKE '%용인%';

-- 성씨가 김씨이면서, 부서가 100003, 100004, 100006번 중에 하나이면서,
-- 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회
SELECT emp_no, emp_nm, birth_de, dept_cd
FROM tb_emp
WHERE emp_nm LIKE '김%'
  AND dept_cd IN ('100003', '100004', '100006')
  AND birth_de BETWEEN '19900101' AND '19991231'
;

--부정 일치 비교 연산자
SELECT emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd != 2
;
--위와 동일
SELECT emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd ^= 2
;
SELECT emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd <> 2 --가장 많이 쓰는 방식
;
SELECT emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE NOT sex_cd = 2
;

-- 성별코드가 1이 아니면서 성씨가 이씨가 아닌 사람들의
-- 사번, 이름, 성별코드를 조회하세요.
SELECT emp_no, emp_nm, sex_cd
FROM tb_emp
WHERE 1 = 1 --조건절 관리 차원
  AND sex_cd <> 1
  AND emp_nm NOT LIKE '이%';

-- null값 조회
-- 반드시 IS NULL 연산자로 조회해야함
SELECT emp_no,
       emp_nm,
       direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL
;

SELECT emp_no,
       emp_nm,
       direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL
;

--연산자 우선순위
-- NOT > AND > OR
SELECT emp_no,
       emp_nm,
       addr
FROM tb_emp
WHERE 1 = 1
    AND emp_nm LIKE '김%'
    AND addr LIKE '%수원%'
    OR addr LIKE '%일산%'
; --앞에 두 조건이 and로 묶여서 먼저 실행 -> 그 다음에 or 조건 실행

SELECT emp_no,
       emp_nm,
       addr
FROM tb_emp
WHERE 1 = 1
    AND emp_nm LIKE '김%'
    AND (addr LIKE '%수원%'
    OR addr LIKE '%일산%')
;