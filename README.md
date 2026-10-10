# MainFlow Technologies: SQL Internship Tasks

Eight hands-on MySQL tasks completed during my SQL internship at **MainFlow Technologies** (June to August 2025).

Each `.sql` file is a self-contained script. It creates a database and tables, inserts sample data, and then runs the queries for that task. All data is made-up sample data (students, courses, employees).

## Tasks at a glance

| # | File | SQL concepts practised | What the script does |
|---|------|------------------------|----------------------|
| 1 | `task1mainflow.sql` | `CREATE TABLE`, `INSERT`, `AVG`, `GROUP BY`, `ORDER BY ... LIMIT`, `WHERE`, `UPDATE` | Builds a `Students` table. Finds average score per subject, the top scorer by total marks, the count of students per grade, averages by gender, students with maths above 80, and updates one student's grade. |
| 2 | `task2mainflow.sql` | `ALTER TABLE`, `CONCAT`, primary and foreign keys, `INNER JOIN`, `LEFT JOIN`, `HAVING` | Adds an email column, creates `courses` and `enrolments` tables, then lists students with their courses, counts students per course, finds students in more than one course, and finds courses with no students. |
| 3 | `task3mainflow.sql` | Schema design, joins, aggregation, anti-join (`LEFT JOIN ... IS NULL`) | Rebuilds the student, course and enrolment schema, lists the top 5 students by total score, and repeats the four join queries on the new schema. |
| 4 | `task4mainflow.sql` | Window functions: `RANK() OVER`, `SUM() OVER` | Ranks students by total score and computes a running total of maths scores. |
| 5 | `task5mainflow.sql` | `CASE WHEN` | Assigns letter grades from total score and a pass/fail status for maths and science (pass mark 40). |
| 6 | `task6mainflow.sql` | `ALTER TABLE`, `DEFAULT` values, `UPDATE`, `DELETE`, safe-update mode | Adds `LastUpdated` and `Status` columns to an `Employees` table, marks records inactive, previews them, and deletes old inactive records. |
| 7 | `task7mainflow.sql` | Views, subquery with `NOT IN`, `AVG`, `GROUP BY` | Creates three views: all student scores, students who passed every subject (no score below 40), and average score per student. |
| 8 | `task8mainflow.sql` | Triggers, stored procedures, `CASE`, audit table | Creates an `AFTER UPDATE` trigger that logs old and new grades into `student_audit`, and a stored procedure `update_grades()` that sets grades from a performance score. |

## Skills demonstrated

- Database and table design with primary and foreign keys
- Inner and left joins across three tables
- Aggregation with `GROUP BY` and `HAVING`
- Subqueries and views
- Window functions (`RANK`, running totals)
- Conditional logic with `CASE`
- Data changes with `ALTER`, `UPDATE`, `DELETE`
- Triggers and stored procedures

## How to run

These scripts use **MySQL syntax**. Window functions need **MySQL 8.0 or later**.

```bash
# Command line
mysql -u root -p < task1mainflow.sql

# Or open the file in MySQL Workbench and run it
```

> **Warning:** several scripts run `DROP DATABASE` or `DROP TABLE` before recreating their data. Run them only on a practice database, never on data you care about.

## Repository layout

```
mainflowtasks/
├── README.md
├── task1mainflow.sql
├── task2mainflow.sql
├── ...
└── task8mainflow.sql
```

## Author

Madapa Mithra
