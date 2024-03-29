-- 1번 문제
SELECT DEPARTMENT_NAME AS "학과 명", CATEGORY "계열"
FROM TB_DEPARTMENT;

-- 2번 문제
SELECT DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || ' 명 입니다.' "학과별 정원"
FROM TB_DEPARTMENT;


-- 3번 문제
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '001'
	AND SUBSTR(STUDENT_SSN, 8, 1) = '2'
	AND ABSENCE_YN = 'Y';


-- 4번 문제
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC;


-- 5번 문제
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;


-- 6번 문제
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;


-- 7번 문제
SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO  IS NULL;
-- 조회 결과 없음 0행


-- 8번 문제
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;


-- 9번 문제
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY 1;
-- 한글 문자열 순으로 오름차순


-- 10번 문제
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN 
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) = 2002
	AND STUDENT_ADDRESS LIKE '전주%'
	AND ABSENCE_YN = 'N';













