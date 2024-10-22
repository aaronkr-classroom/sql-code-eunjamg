-- 1. 테이블 생성하기 (4개)
-- 2. 조인문 사용하기 (3개)
-- 3. SELECT문을 사용하여 데이터 탐색하기 (3개)
-- 1. 테이블 생성하기 (4개)

-- 학생 테이블 생성
CREATE TABLE IF NOT EXISTS student (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    enrollment_date DATE
);

-- 강사 테이블 생성
CREATE TABLE IF NOT EXISTS teacher (
    teacher_id SERIAL PRIMARY KEY,
    teacher_name VARCHAR(100),
    hire_date DATE
);

-- 과정 테이블 생성
CREATE TABLE IF NOT EXISTS course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id) ON DELETE SET NULL
);

-- 학생-과정 연결 테이블 생성
CREATE TABLE IF NOT EXISTS student_course (
    student_course_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE
);

-- 2. 조인문 사용하기

-- 예제 1: 학생과 학생-과정 조인 (LEFT JOIN)
SELECT 
    s.student_name,
    sc.course_id
FROM 
    student s
LEFT JOIN 
    student_course sc ON s.student_id = sc.student_id;

-- 예제 2: 강사와 과정 조인 (INNER JOIN)
SELECT 
    t.teacher_name,
    c.course_name
FROM 
    teacher t
INNER JOIN 
    course c ON t.teacher_id = c.teacher_id;

-- 예제 3: 과정과 학생-과정 조인 (RIGHT JOIN)
SELECT 
    c.course_name,
    sc.student_id
FROM 
    course c
RIGHT JOIN 
    student_course sc ON c.course_id = sc.course_id;

-- 3. SELECT문을 사용하여 데이터 탐색하기 
-- 모든 학생 조회
SELECT * FROM student;

-- 모든 강사 조회
SELECT * FROM teacher;

-- 모든 과정 조회
SELECT * FROM course;

-- 모든 학생-과정 연결 조회
SELECT * FROM student_course;
-- 데이터베이스 설계 (Database Design)에 등록한 모든 학생의 이름을 표시합니다.
SELECT student_name
FROM student;

-- Taylah Brooker가 가르친 모든 과정을 표시합니다.
SELECT c.course_name
FROM course c
JOIN teacher t ON c.teacher_id = t.teacher_id
WHERE t.teacher_name = 'Taylah Brooker';

-- 성이 "B"로 시작하는 모든 학생과 교사를 표시합니다.
SELECT s.student_name AS Name, 'Student' AS Type
FROM student s
WHERE s.student_name LIKE 'B%'

UNION ALL

SELECT t.teacher_name AS Name, 'Teacher' AS Type
FROM teacher t
WHERE t.teacher_name LIKE 'B%';