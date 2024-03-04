-- 1번 문제
SELECT STUDENT_NO 학번, STUDENT_NAME 이름, TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') AS 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE;


-- 2번 문제
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';


-- 3번 문제
SELECT PROFESSOR_NAME "교수이름",  
FLOOR(MONTHS_BETWEEN(SYSDATE, 
TO_DATE('19' || SUBSTR(PROFESSOR_SSN, 1, 6), 'YYYYMMDD')) / 12)  나이
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
ORDER BY 나이;


-- 4번 문제
SELECT SUBSTR(PROFESSOR_NAME, 2) "이름"
FROM TB_PROFESSOR;


-- 5번 문제
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) -- 입학년도(2002)
- EXTRACT(YEAR FROM TO_DATE('19'||SUBSTR(STUDENT_SSN, 1, 6), 'YYYYMMDD')) > 19; -- 학생출생년도(1988)
-- 입학년도에서 출생년도 빼면 입학한 나이가 나옴. 얘가 19보다 크다면 재수생
-- WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - ((SUBSTR(STUDENT_SSN, 1, 2)) + 1900) > 19;



-- 6번 문제
/*
 * 'DAY' : 월요일 'DY' : 월 'D' : 2
 * 1 : 일요일
 * 2 : 월요일
 * 3 : 화요일
 * 4 : 수요일
 * 5 : 목요일
 * 6 : 금요일
 * 7 : 토요일
 * */
SELECT TO_CHAR(TO_DATE('2020-12-25'), 'DAY') "2020년 크리스마스"
--SELECT TO_CHAR('2020-12-25', 'DY')
FROM DUAL;


-- 7번 문제
SELECT TO_CHAR(TO_DATE('99/10/11', 'YY/MM/DD'), 'YYYY'), 
TO_CHAR(TO_DATE('49/10/11', 'YY/MM/DD'), 'YYYY'),
TO_CHAR(TO_DATE('99/10/11', 'RR/MM/DD'), 'YYYY'), 
TO_CHAR(TO_DATE('49/10/11', 'RR/MM/DD'), 'YYYY')
FROM DUAL;


-- 8번 문제
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';
--WHERE SUBSTR(STUDENT_NO, 1, 1) <> 'A';


-- 9번 문제
SELECT ROUND(AVG(POINT), 1) AS 평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';


-- 10번 문제
SELECT DEPARTMENT_NO "학과번호", COUNT(*) "학생수(명)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;


-- 11번 문제
--SELECT COUNT(*) - COUNT(COACH_PROFESSOR_NO) "COUNT(*)"
--FROM TB_STUDENT;
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;


-- 12번 문제
SELECT SUBSTR(TERM_NO, 1, 4) 년도, ROUND(AVG(POINT), 1) AS "년도 별 평점" 
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4) -- 2001, 2002, 2003, 2004
ORDER BY 년도;


-- 13번 문제
SELECT DEPARTMENT_NO "학과코드명",
SUM(DECODE(ABSENCE_YN, 'Y', 1, 0)) "휴학생 수"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;


-- 14번 문제
SELECT STUDENT_NAME 동일이름, COUNT(*) "동명인 수"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY 1;


-- 15번 문제
SELECT NVL(SUBSTR(TERM_NO, 1, 4), ' ') 년도,
NVL(SUBSTR(TERM_NO, 5, 2), ' ') 학기,
ROUND(AVG(POINT), 1) 평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO, 1, 4), SUBSTR(TERM_NO, 5, 2));
-- NVL : NULL 함수






