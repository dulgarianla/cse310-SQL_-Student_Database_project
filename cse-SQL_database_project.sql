-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `University` ;

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `University` DEFAULT CHARACTER SET utf8 ;
USE `University` ;

-- -----------------------------------------------------
-- Table `University`.`college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`college` ;

CREATE TABLE IF NOT EXISTS `University`.`college` (
  `college_id` INT NOT NULL,
  `college_name` VARCHAR(150) NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`student` ;

CREATE TABLE IF NOT EXISTS `University`.`student` (
  `student_id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`department` ;

CREATE TABLE IF NOT EXISTS `University`.`department` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(150) NULL,
  `department_code` VARCHAR(45) NULL,
  `college_id` INT NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `fk_department_college1_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `fk_department_college1`
    FOREIGN KEY (`college_id`)
    REFERENCES `University`.`college` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`course` ;

CREATE TABLE IF NOT EXISTS `University`.`course` (
  `course_id` INT NOT NULL,
  `course_number` VARCHAR(100) NULL,
  `course_name` VARCHAR(100) NULL,
  `credits` INT NULL,
  `course_code` VARCHAR(45) NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `University`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`faculty` ;

CREATE TABLE IF NOT EXISTS `University`.`faculty` (
  `faculty_id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`department_has_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`department_has_course` ;

CREATE TABLE IF NOT EXISTS `University`.`department_has_course` (
  `department_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`department_id`, `course_id`),
  INDEX `fk_department_has_course_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_department_has_course_department_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_department_has_course_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `University`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_department_has_course_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `University`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`semester`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`semester` ;

CREATE TABLE IF NOT EXISTS `University`.`semester` (
  `semester_id` INT NOT NULL,
  `term` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`semester_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`section` ;

CREATE TABLE IF NOT EXISTS `University`.`section` (
  `section_id` INT NOT NULL,
  `section_number` INT NOT NULL,
  `capactity` INT NOT NULL,
  `course_id` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  `semester_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  INDEX `fk_section_semester1_idx` (`semester_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `University`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `University`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_semester1`
    FOREIGN KEY (`semester_id`)
    REFERENCES `University`.`semester` (`semester_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `University`.`enrollment` (
  `section_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`section_id`, `student_id`),
  INDEX `fk_enrollment_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollment_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `University`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `University`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE university;
INSERT INTO college
(college_id, college_name) 
VALUES 
(1, 'College of Physical Science and Engineering'),
(2, 'College of Business and Communication'),
(3, 'College of Language and Letters');

USE university;
INSERT INTO department
(department_id, department_name, department_code, college_id) 
VALUES 
(1, 'Computer Information Technology', 'CIT', 1),
(2, 'Economics', 'ECON', 2),
(3, 'Humanities and Philosophy', 'HUM', 3);

USE university;
INSERT INTO course
(course_id, course_number, course_name, credits, course_code, department_id) 
VALUES 
(1, '111', 'Intro to Databases', '3', 'CIT 111', 1),
(2, '388', 'Econometrics', '4', 'ECON 388', 2),
(3, '150', 'Micro Econometrics', '3', 'ECON 150', 2),
(4, '376', 'Classoca; Hertage', '2', 'HUM 376', 3); 

USE university;
INSERT INTO faculty
(faculty_id, fname, lname)
VALUES 
(1, 'Marty', 'Morring'),
(2, 'Nate', 'Nathan'),
(3, 'Ben', 'Barrus'),
(4, 'John', 'Jensen'),
(5, 'Bill', 'Barney');

USE university;
INSERT INTO semester
(semester_id, term, year) 
VALUES
(1, 'Fall', '2019'),
(2, 'Winter', '2018');

USE university;
INSERT INTO section
(section_id, section_number, capactity, course_id, faculty_id, semester_id) 
VALUES
(1, '1', '30', 1, 1, 1),
(2, '1', '50', 3, 2, 1),
(3, '2', '50', 3, 2, 1),
(4, '1', '35', 2, 3, 1),
(5, '1', '30', 4, 4, 1),
(6, '2', '30', 1, 1, 2),
(7, '3', '35', 1, 5, 2),
(8, '1', '50', 3, 2, 2),
(9, '2', '50', 3, 2, 2),
(10, '1', '30', 4, 4, 2);

USE university;
INSERT INTO student
(student_id, fname, lname, gender, city, state, dob) 
VALUES 
(1, 'Paul', 'Miller', 'M', 'Dallas', 'TX', '1996-02-22'),
(2, 'Katie', 'Smith', 'F', 'Provo', 'UT', '1995-07-22'),
(3, 'Kelly', 'Jones', 'F', 'Provo', 'UT', '1998-06-22'),
(4, 'Devon', 'Merrill', 'M', 'Mesa', 'AZ', '2000-07-22'),
(5, 'Mandy', 'Murdock', 'F', 'Topeka', 'KS', '1996-11-22'),
(6, 'Alece', 'Adams', 'F', 'Rigby', 'ID', '1997-05-22'),
(7, 'Bryce', 'Carlson', 'M', 'Bozeman', 'MT', '1997-11-22'),
(8, 'Preston', 'Larsen', 'M', 'Decatur', 'TN', '1996-09-22'),
(9, 'Julia', 'Madsen', 'F', 'Rexburg', 'ID', '1998-09-22'),
(10, 'Susan', 'Sorensen', 'F', 'Mesa', 'AZ', '1998-08-09');

USE university;
INSERT INTO enrollment 
(section_id, student_id) 
VALUES 
(7,6),
(6,7),
(8,7),
(10,7),
(5,4),
(9,9),
(4,2),
(4,3),
(4,5),
(5,5),
(1,1),
(3,1),
(9,8),
(6,10);