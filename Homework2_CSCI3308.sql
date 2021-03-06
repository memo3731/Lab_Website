-- MySQL Script generated by MySQL Workbench
-- Sat Feb  8 18:01:07 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Owner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Owner` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Owner` (
  `Owner_ID` INT NOT NULL AUTO_INCREMENT,
  `Owner_Name` VARCHAR(45) NOT NULL,
  `Owner_Phone_Number` INT NOT NULL,
  PRIMARY KEY (`Owner_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pet` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pet` (
  `Pet_ID` INT NOT NULL AUTO_INCREMENT,
  `Pet_Name` VARCHAR(45) NOT NULL,
  `Pet_Breed` VARCHAR(45) NOT NULL,
  `Pet_Color` VARCHAR(45) NOT NULL,
  `Pet_Birthday` DATETIME NOT NULL,
  `Pet_Gender` VARCHAR(45) NOT NULL,
  `Pet_Neutered_Or_Sprayed` VARCHAR(45) NOT NULL,
  `Pet_Heartworm_Prevention` VARCHAR(45) NOT NULL,
  `Pet_Heartworm_Prevention_Kind` VARCHAR(45) NOT NULL,
  `Pet_Percentage_Time_Outside` INT NOT NULL,
  `Pet_Diet` VARCHAR(200) NOT NULL,
  `Pet_Date_Of_Signature` DATETIME NOT NULL,
  `Owner_Owner_ID` INT NOT NULL,
  PRIMARY KEY (`Pet_ID`),
  INDEX `fk_Pet_Owner_idx` (`Owner_Owner_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Pet_Owner`
    FOREIGN KEY (`Owner_Owner_ID`)
    REFERENCES `mydb`.`Owner` (`Owner_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Visit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Visit` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Visit` (
  `Visit_ID` INT NOT NULL AUTO_INCREMENT,
  `Visit_Date` DATETIME NOT NULL,
  `Visit_Weight` VARCHAR(45) NULL,
  `Visit_Temp` DECIMAL(3,2) NULL,
  `Visit_Blood_Pressure` INT NULL,
  `Visit_Pulse` INT NULL,
  `Visit_Respiration` INT NULL,
  `Visit_Pain` INT NULL,
  `Visit_Vetinary_Initials` VARCHAR(45) NOT NULL,
  `Pet_Pet_ID` INT NOT NULL,
  PRIMARY KEY (`Visit_ID`),
  INDEX `fk_Visit_Pet1_idx` (`Pet_Pet_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Visit_Pet1`
    FOREIGN KEY (`Pet_Pet_ID`)
    REFERENCES `mydb`.`Pet` (`Pet_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vaccine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Vaccine` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vaccine` (
  `Vaccine_ID` INT NOT NULL AUTO_INCREMENT,
  `Vaccine_Date` DATETIME NOT NULL,
  `Vaccine_Type` VARCHAR(45) NOT NULL,
  `Vaccine_Next_Due` DATETIME NOT NULL,
  `Vaccine_Details` VARCHAR(300) NULL,
  `Pet_Pet_ID` INT NOT NULL,
  PRIMARY KEY (`Vaccine_ID`),
  INDEX `fk_Vaccine_Pet1_idx` (`Pet_Pet_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vaccine_Pet1`
    FOREIGN KEY (`Pet_Pet_ID`)
    REFERENCES `mydb`.`Pet` (`Pet_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Allergy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Allergy` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Allergy` (
  `Allergy_ID` INT NOT NULL AUTO_INCREMENT,
  `Allergy_Name` VARCHAR(45) NOT NULL,
  `Allergy_Details` VARCHAR(300) NULL,
  `Pet_Pet_ID` INT NOT NULL,
  PRIMARY KEY (`Allergy_ID`),
  INDEX `fk_Allergy_Pet1_idx` (`Pet_Pet_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Allergy_Pet1`
    FOREIGN KEY (`Pet_Pet_ID`)
    REFERENCES `mydb`.`Pet` (`Pet_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Surgery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Surgery` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Surgery` (
  `Surgery_ID` INT NOT NULL AUTO_INCREMENT,
  `Surgery_Date` DATETIME NOT NULL,
  `Surgery_Procedure` VARCHAR(45) NOT NULL,
  `Surgery_Details` VARCHAR(300) NULL,
  `Pet_Pet_ID` INT NOT NULL,
  PRIMARY KEY (`Surgery_ID`),
  INDEX `fk_Surgery_Pet1_idx` (`Pet_Pet_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Surgery_Pet1`
    FOREIGN KEY (`Pet_Pet_ID`)
    REFERENCES `mydb`.`Pet` (`Pet_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
