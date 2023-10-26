# Overview
Welcome to the overview of today's code and what the purpose of it.

The software I wrote is a database management system for a fictional university. It is designed to store and manage data related to various aspects of the university, including information about colleges, students, departments, courses, faculty, semesters, sections, and student enrollments. This system acts as a central repository for organizing and accessing data relevant to the university's operations and academic programs.

[Demo Video: "SQL University Database"](https://youtu.be/B9lYbL9GgYQ)

# Relational Database
Here are the relational database that I used in my `University Database`:

1. **College Table:**
   - **Columns:** `college_id` (INT), `college_name` (VARCHAR)

   - **Description:** This table stores information about various colleges within the university. Each college has a unique ID and a name.

2. **Department Table:**
   - **Columns:** `department_id` (INT), `department_name` (VARCHAR), `department_code` (VARCHAR), `college_id` (INT)

   - **Description:** This table holds details about academic departments within the university. Each department has a unique ID, a name, a department code, and is associated with a specific college.

3. **Course Table:**
   - **Columns:** `course_id` (INT), `course_number` (VARCHAR), `course_name` (VARCHAR), `credits` (INT), `course_code` (VARCHAR), `department_id` (INT)

   - **Description:** This table represents the courses offered by the university. It includes information such as course ID, course number, course name, credits, and the department to which it belongs.

4. **Faculty Table:**
   - **Columns:** `faculty_id` (INT), `fname` (VARCHAR), `lname` (VARCHAR)

   - **Description:** This table stores data about faculty members at the university, including faculty ID, first name, and last name.

5. **Department_has_course Table:**
   - **Columns:** `department_id` (INT), `course_id` (INT)

   - **Description:** This table represents the relationship between departments and courses, allowing multiple departments to offer multiple courses.

6. **Semester Table:**
   - **Columns:** `semester_id` (INT), `term` (VARCHAR), `year` (INT)

   - **Description:** This table manages semesters, recording their unique IDs, terms (e.g., Fall, Winter), and years.

7. **Section Table:**
   - **Columns:** `section_id` (INT), `section_number` (INT), `capacity` (INT), `course_id` (INT), `faculty_id` (INT), `semester_id` (INT)

   - **Description:** This table defines course sections, including section ID, section number, capacity, the course it's associated with, the faculty teaching it, and the semester in which it's offered.

8. **Student Table:**
   - **Columns:** `student_id` (INT), `fname` (VARCHAR), `lname` (VARCHAR), `gender` (ENUM), `city` (VARCHAR), `state` (VARCHAR), `dob` (DATE)

   - **Description:** This table stores student information, including student ID, first name, last name, gender, city, state, and date of birth.

9. **Enrollment Table:**
   - **Columns:** `section_id` (INT), `student_id` (INT)

   - **Description:** This table manages the enrollment of students in course sections, recording which students are enrolled in which sections.

This database structure is designed to manage academic information for a university, including colleges, departments, courses, faculty, semesters, course sections, and student enrollment. It allows for relationships and associations between these entities, which is crucial for the effective university data.

# Development Environment

Here are the tools that was use for my software and what each of them are and how they work.

### GitHub
>GitHub is a place where programmers store, share, and collaborate on their code, making it easier to work on big projects together and keep track of all the changes. It's like a big, organized playground for building digital stuff.

- Why I used it: to share my code and save it which helped keep track of my changes and show me when I did each change. It also allows me to share it so others like you can look at it. I also used it as the main way to add my code and markdown.  

[Download: GitHub Desktop](https://desktop.github.com/)

### MySQL Workbench  
> MySQL Workbench is a versatile integrated development environment for MySQL databases. It offers features for database design, SQL development, administration, data modeling, migration, and performance tuning. You can also use it for backup, version control, and automation tasks. It simplifies various aspects of MySQL database management, making it a valuable tool for professionals.

- Why I used it: I used this to create my software and to create the visual diagram of each tables and show the relationships between them. 

[Download: MySQL](https://dev.mysql.com/downloads/workbench/)

### Visual Code Studio 
>Visual Studio Code is friendly, free, and smart computer program that makes writing and working with code easier, whether you're building websites, apps, games, or anything else that uses computer languages. It's like having a helpful assistant by your side as you explore the world of coding.

- Why I used it: to edit my markdown file.

*Note: I didn't use this tool when actually writing the software since MySQL doesn't run on VSC (it can but you need to download other things to make it work)*

[Download: Visual Studio Code](https://code.visualstudio.com/download)

# Useful Websites
Down below are websites that I used to help learn and better my understanding of SQL and it might help you if you want to learn the language too

- [w3school (SQL Intro)](https://www.w3schools.com/sql/sql_intro.asp)
- [geeksforgeeks (SQL Tutorial)](https://www.geeksforgeeks.org/sql-tutorial/)

*Note: Youtube is also an amazing place to learn a programming language! I was able to find so many tutorials/crash course! I will provide links below*

- [SQL Basics For Beginners](https://youtu.be/DvNHkJAR0BM?si=aAcq3U2s7flIGqF9)

- [MySQL Tutorial for Beginners (Full Course)](https://youtu.be/7S_tz1z_5bA?si=_fIU4YS66GIM_hqr)

# Future Work
Here is some things that I could have added or even improve to make the software more advance

- **Additional Tables**: I could have added additional tables to handle more complex relationships or additional data.

- **Security**: Ensure that you have proper security measures in place, like user access controls, to protect the data.

- **Backup and Restore Procedures**: Develop and document a strategy for backing up and restoring the database.
