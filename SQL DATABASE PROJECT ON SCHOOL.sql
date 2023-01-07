-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema School
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema School
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `School` DEFAULT CHARACTER SET utf8 ;
USE `School` ;

-- -----------------------------------------------------
-- Table `School`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Students` (
  `student_id` INT NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `date_registered` DATETIME NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Instructors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Instructors` (
  `instructor_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`instructor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Courses` (
  `course_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `instructor_id` SMALLINT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_Courses_Instructos1_idx` (`instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Courses_Instructos1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `School`.`Instructors` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Enrollments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Enrollments` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  INDEX `fk_Enrollments_Students_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_Enrollments_Courses1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Enrollments_Students`
    FOREIGN KEY (`student_id`)
    REFERENCES `School`.`Students` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollments_Courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `School`.`Courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Tags` (
  `tag_id` TINYINT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Course_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Course_tags` (
  `course_id` INT NOT NULL,
  `tag_id` TINYINT NOT NULL,
  INDEX `fk_Course_tags_Courses1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_Course_tags_Tags1_idx` (`tag_id` ASC) VISIBLE,
  PRIMARY KEY (`course_id`, `tag_id`),
  CONSTRAINT `fk_Course_tags_Courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `School`.`Courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_tags_Tags1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `School`.`Tags` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
