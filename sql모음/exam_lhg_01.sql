/* 연습문제 */
/* 계정 'exam_이니셜' 로 생성 후 해당 계정에서 진행.

테이블명 : MAJOR
1. MAJOR_NO (학과번호) : NUMBER - PK
2. MAJOR_NM (학과명) : VARCHAR2(100) - NOT NULL

테이블명 : STUDENT
1. STUDENT_ID (학번) : NUMBER - PK
2. STUDENT_NAME (이름) : VARCHAR2(20) - NOT NULL
3. GENDER (성별) : VARCHAR2(3) CHECK ('남' , '여')
4. BIRTH (생년월일 : 'YYYY-MM-DD '형식으로 작성) : DATE
5. MAJOR_NO (전공학과번호) : NUMBER - FK (부모키 삭제 시 자식키 NULL 로 변경)
*/

-- 각 테이블마다 INSERT 5개 이상 
-- MAJOR_NM 학과명 MAJOR_NAME으로 변경해보기


CREATE TABLE MAJOR(
		MAJOR_NO NUMBER CONSTRAINT MAJOR_NO_PK PRIMARY KEY,
		MAJOR_NM VARCHAR2(100) CONSTRAINT MAJOR_NM_NN NOT NULL
);

COMMENT ON COLUMN MAJOR.MAJOR_NO IS '학과번호';
COMMENT ON COLUMN MAJOR.MAJOR_NM IS '학과명';

DROP TABLE MAJOR;
SELECT * FROM MAJOR;

INSERT INTO MAJOR VALUES(1, '학과1');
INSERT INTO MAJOR VALUES(2, '학과2');
INSERT INTO MAJOR VALUES(3, '학과3');
INSERT INTO MAJOR VALUES(4, '학과4');
INSERT INTO MAJOR VALUES(5, '학과5');




CREATE TABLE STUDENT(
		STUDENT_ID NUMBER PRIMARY KEY,
		STUDENT_NAME VARCHAR2(20) NOT NULL,
		GENDER VARCHAR2(3) CHECK( GENDER IN('남', '여')),
		BIRTH DATE,
		MAJOR_NO NUMBER REFERENCES MAJOR ON DELETE SET NULL
);

COMMENT ON COLUMN STUDENT.STUDENT_ID IS '학번';
COMMENT ON COLUMN STUDENT.STUDENT_NAME IS '이름';
COMMENT ON COLUMN STUDENT.GENDER IS '성별';
COMMENT ON COLUMN STUDENT.BIRTH IS '생년월일';
COMMENT ON COLUMN STUDENT.MAJOR_NO IS '전공학과번호';

INSERT INTO STUDENT VALUES('001', '홍일동', '남', '880111', 1);
INSERT INTO STUDENT VALUES('002', '홍이동', '여', '880112', 2);
INSERT INTO STUDENT VALUES('003', '홍삼동', '남', '880113', 3);
INSERT INTO STUDENT VALUES('004', '홍사동', '여', '880114', 4);
INSERT INTO STUDENT VALUES('005', '홍호동', '남', '880115', 5);

SELECT * FROM STUDENT;

DROP TABLE STUDENT;

ALTER TABLE MAJOR RENAME COLUMN MAJOR_NM TO MAJOR_NAME;




