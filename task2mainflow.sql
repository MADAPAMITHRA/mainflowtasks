drop database if exists studentmanagement;
create database StudentManagement;
use StudentManagement;
create table Students(
student_id int auto_increment primary key,
name varchar(100),
gender varchar(2),
age int,
grade varchar(3),
mathscore int,
sciencescore int,
englishscore int);
insert into Students(name,gender, age, grade,mathscore, sciencescore, englishscore)
values('Arjun','M', 20, 'A', 98, 99, 92 ),
('Aadhya','F', 19, 'A', 98, 90, 95 ),
('Raju','M', 21, 'B', 78, 80, 82 ),
('Rani','F', 20, 'C', 91, 88, 77 ),
('Sid','M', 23, 'A', 99, 99, 99 ),
('Mahesh','M', 20, 'B', 78, 79, 72 ),
('Qwer','F', 20, 'C', 66, 69, 63 ),
('Bunny','F', 19, 'B', 86, 85, 71 ),
('Asdf','M', 21, 'A', 99, 99, 99),
('Sita','F', 21, 'A', 93, 93, 92 );

alter table Students add email varchar(50);

set sql_safe_updates=0;
update Students set email=concat(lower(name),'@gmail.com');
set sql_safe_updates=1;

select * from Students;

create table courses(
course_id int primary key,
course_name varchar(100),
course_description text);

insert into courses values
(601,'CD','Introduction to compiler'),
(602,'IR','Introduction to queries'),
(603,'CN','Networks');

create table enrolments(
enrolment_id int auto_increment primary key,
student_id int,
course_id int,
enrolment_date date,
foreign key (student_id) references Students(student_id),
foreign key (course_id) references courses(course_id));

insert into enrolments(student_id,course_id,enrolment_date)values
(1,602,'2025-06-22'),
(2,601,'2025-06-22'),
(2,603,'2025-06-25'),
(3,602,'2025-06-23'),
(5,601,'2025-06-25'),
(5,602,'2025-06-22'),
(2,601,'2025-06-24'),
(6,602,'2025-06-25'),
(7,603,'2025-06-23'),
(10,601,'2025-06-24');

-- Task 1:list all students and the courses they are enrolled in
Select s.name, s.email, c.course_name
from Students s
inner join enrolments e on s.student_id = e.student_id
inner join courses c on e.course_id = c.course_id;

-- Task 2: Find the number of students enrolled in each course
Select c.course_name, count(e.student_id) as total_students
from courses c
left join enrolments e on c.course_id = e.course_id
group by c.course_id, c.course_name;

-- Task 3: List students who have enrolled in more than one course
Select s.name, s.email, count(distinct e.course_id) as course_count
from students s
join enrolments e on s.student_id = e.student_id
group by s.student_id, s.name, s.email
having count(e.course_id) > 1;

-- Task 4: Find courses with no enrolled students
select c.course_name
from Courses c
left join Enrolments e on c.course_id = e.course_id
where e.enrolment_id is null;

