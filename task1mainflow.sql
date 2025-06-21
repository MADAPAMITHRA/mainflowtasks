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

select * from Students;

select avg(mathscore) as  avgmath,
avg(sciencescore) as  avgscience,
avg(englishscore) as  avgenglish
from Students;

select *,
(mathscore + sciencescore + englishscore) as totalscore
from Students
order by totalscore desc
limit 1;

select grade, count(*) as countingrade
from Students
group by grade;

select gender,
avg(mathscore) as avgmath,
avg(sciencescore) as  avgscience,
avg(englishscore) as  avgenglish
from Students
group by gender;

select * from Students
where mathscore>80;


update Students
set grade='C'
where student_id=6;


select * from Students where student_id=6;