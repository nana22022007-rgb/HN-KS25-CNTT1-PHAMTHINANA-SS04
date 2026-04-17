CREATE DATABASE mini_projectss4;
USE mini_projectss4;
CREATE TABLE STUDENT(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL,
    student_dob DATE NOT NULL,
    student_email VARCHAR(50) UNIQUE
);
CREATE TABLE TEACHER(
	teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(50) NOT NULL,
    teacher_email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE COURSE(
	course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    course_description VARCHAR(50),
    teacher_id INT, -- 1 Giảng viên thì có thể dạy nhiều khóa học
    course_lesson INT,
    FOREIGN KEY (teacher_id) REFERENCES TEACHER (teacher_id)
);
CREATE TABLE ENROLLMENT(
	student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    enrollment_day DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id),
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id)
);
CREATE TABLE SCORE(
	student_id INT,
    course_id INT,
    mid_term_score DECIMAL(3,1) CHECK(mid_term_score >= 0 and mid_term_score <=10),
    end_term_score DECIMAL(3,1) CHECK(end_term_score >= 0 and end_term_score <=10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id, course_id) REFERENCES ENROLLMENT (student_id, course_id)   
);
-- Thêm thông tin (nhập dữ liệu ban đầu)
INSERT INTO STUDENT(student_name, student_dob, student_email) VALUES
('Nguyen Van A', '2004-01-15', 'vanya@gmail.com'),
('Tran Thi B', '2004-05-20', 'thib@gmail.com'),
('Le Van C', '2003-11-02', 'vanc@gmail.com'),
('Pham Minh D', '2005-03-10', 'minhd@gmail.com'),
('Hoang Thi E', '2004-09-25', 'thie@gmail.com');
-- Na
INSERT INTO TEACHER (teacher_name, teacher_email) VALUES
('Thay Hoang', 'hoangteacher@gmail.com'),
('Co Linh', 'linhteacher@gmail.com'),
('Thay Nam', 'namteacher@gmail.com'),
('Co Ha', 'hateacher@gmail.com'),
('Thay Bach', 'bachteacher@gmail.com');

INSERT INTO COURSE (course_name, course_description, course_lesson, teacher_id) VALUES
('Lap trinh C++', 'Co ban den nang cao', 30, 1),
('Co so du lieu SQL', 'Truy van va thiet ke', 25, 2),
('Lap trinh Python', 'Phan tich du lieu', 40, 3),
('Phat trien Web', 'HTML, CSS, JS va PHP', 35, 4),
('Tri tue nhan tao', 'Machine Learning co ban', 45, 5);

INSERT INTO ENROLLMENT (student_id, course_id, enrollment_day) VALUES
(1, 1, '2026-01-05'),
(1, 2, '2026-01-05'),
(2, 2, '2026-01-06'),
(2, 3, '2026-01-06'),
(3, 3, '2026-01-07'),
(3, 4, '2026-01-07'),
(4, 4, '2026-01-08'),
(4, 5, '2026-01-08'),
(5, 5, '2026-01-09'),
(5, 1, '2026-01-09');
-- Minh
INSERT INTO SCORE (student_id, course_id, mid_term_score, end_term_score) VALUES
(1, 1, 8.5, 7.0),
(1, 2, 6.0, 8.0),
(2, 2, 7.5, 9.0),
(2, 3, 5.0, 6.5),
(3, 3, 9.0, 8.5),
(3, 4, 4.0, 5.5),
(4, 4, 8.0, 7.5),
(4, 5, 7.0, 8.0),
(5, 5, 6.5, 7.0),
(5, 1, 9.5, 10.0);

-- Cập nhật dữ liệu
UPDATE STUDENT
SET student_email = "thwng08092007@gmail.com"
WHERE student_id = 1;

UPDATE COURSE
SET course_description = "Khóa học này rất bổ ích, tôi đã trở nên giàu có"
WHERE course_id = 2;

UPDATE SCORE
SET end_term_score = 3.6
WHERE student_id = 3 AND course_id = 3;

-- Xóa dữ liệu
DELETE FROM SCORE
WHERE student_id = 2 AND course_id = 2;

DELETE FROM ENROLLMENT
WHERE student_id = 2 AND course_id = 2;
-- Truy vấn dữ liệu
SELECT * FROM STUDENT;
SELECT * FROM TEACHER;
SELECT * FROM COURSE;
SELECT * FROM ENROLLMENT;
SELECT * FROM SCORE;