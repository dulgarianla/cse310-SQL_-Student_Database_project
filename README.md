# Overview

{Important! Do not say in this section that this is college assignment. Talk about what you are trying to accomplish as a software engineer to further your learning.}

{Provide a description of the software that you wrote and how it integrates with a SQL Relational Database. Describe how to use your program.}

{Describe your purpose for writing this software.}

{Provide a link to your YouTube demonstration. It should be a 4-5 minute demo of the software running, a walkthrough of the code, and a view of how created the Relational Database.}

[Software Demo Video](http://youtube.link.goes.here)

# Relational Database
Here are the relational database that I used in my `Univerity Database`:

1. **college Table:**
   - **Columns:** `college_id` (INT), `college_name` (VARCHAR)
   - **Description:** This table stores information about various colleges within the university. Each college has a unique ID and a name.

2. **department Table:**
   - **Columns:** `department_id` (INT), `department_name` (VARCHAR), `department_code` (VARCHAR), `college_id` (INT)
   - **Description:** This table holds details about academic departments within the university. Each department has a unique ID, a name, a department code, and is associated with a specific college.

3. **course Table:**
   - **Columns:** `course_id` (INT), `course_number` (VARCHAR), `course_name` (VARCHAR), `credits` (INT), `course_code` (VARCHAR), `department_id` (INT)
   - **Description:** This table represents the courses offered by the university. It includes information such as course ID, course number, course name, credits, and the department to which it belongs.

4. **faculty Table:**
   - **Columns:** `faculty_id` (INT), `fname` (VARCHAR), `lname` (VARCHAR)
   - **Description:** This table stores data about faculty members at the university, including faculty ID, first name, and last name.

5. **department_has_course Table:**
   - **Columns:** `department_id` (INT), `course_id` (INT)
   - **Description:** This table represents the relationship between departments and courses, allowing multiple departments to offer multiple courses.

6. **semester Table:**
   - **Columns:** `semester_id` (INT), `term` (VARCHAR), `year` (INT)
   - **Description:** This table manages semesters, recording their unique IDs, terms (e.g., Fall, Winter), and years.

7. **section Table:**
   - **Columns:** `section_id` (INT), `section_number` (INT), `capacity` (INT), `course_id` (INT), `faculty_id` (INT), `semester_id` (INT)
   - **Description:** This table defines course sections, including section ID, section number, capacity, the course it's associated with, the faculty teaching it, and the semester in which it's offered.

8. **student Table:**
   - **Columns:** `student_id` (INT), `fname` (VARCHAR), `lname` (VARCHAR), `gender` (ENUM), `city` (VARCHAR), `state` (VARCHAR), `dob` (DATE)
   - **Description:** This table stores student information, including student ID, first name, last name, gender, city, state, and date of birth.

9. **enrollment Table:**
   - **Columns:** `section_id` (INT), `student_id` (INT)
   - **Description:** This table manages the enrollment of students in course sections, recording which students are enrolled in which sections.

This database structure is designed to manage academic information for a university, including colleges, departments, courses, faculty, semesters, course sections, and student enrollment. It allows for relationships and associations between these entities, which is crucial for effective university management.

# Development Environment

{Describe the tools that you used to develop the software}

{Describe the programming language that you used and any libraries.}

# Useful Websites

{Make a list of websites that you found helpful in this project}

- [w3school (SQL Intro)](https://www.w3schools.com/sql/sql_intro.asp)
- [geeksforgeeks (SQL Tutorial)](https://www.geeksforgeeks.org/sql-tutorial/)

# Future Work

{Make a list of things that you need to fix, improve, and add in the future.}

- Item 1
- Item 2
- Item 3
