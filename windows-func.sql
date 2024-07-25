CREATE DATABASE student_db;

USE student_db;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    score INT
);

INSERT INTO students (name, score) VALUES
('Alice', 95),
('Bob', 90),
('Charlie', 90),
('David', 85);

# RANK() / ROW_NUMBER() / DENSE_RANK() 차이점 알기
# RANK()
SELECT 
    name,
    score,
    RANK() OVER (ORDER BY score DESC) AS rnk
FROM
    students;
    
# DENSE_RANK()
SELECT 
    name,
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS dense_rnk
FROM
    students;
    
# ROW_NUMBER()
SELECT 
    name,
    score,
    ROW_NUMBER() OVER (ORDER BY score DESC) AS row_num
FROM
    students;
