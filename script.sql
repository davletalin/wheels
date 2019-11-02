-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema wheels
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wheels
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wheels` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `wheels` ;

-- -----------------------------------------------------
-- Table `wheels`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(30) NOT NULL,
  `phone` INT(11) NULL DEFAULT NULL,
  `role_id` INT(11) NOT NULL,
  `reg_date` TIMESTAMP(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wheels`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`country` (
  `country_code` CHAR(3) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `name_en` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`country_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wheels`.`vechicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`vechicle` (
  `vechicle_id` INT(11) NOT NULL AUTO_INCREMENT,
  `make` INT(11) NOT NULL,
  `model` INT(11) NOT NULL,
  `country` CHAR(3) NULL DEFAULT NULL,
  `body` INT(11) NOT NULL,
  `color` INT(11) NOT NULL,
  `engine` VARCHAR(45) NULL DEFAULT NULL,
  `transmission` VARCHAR(45) NULL DEFAULT NULL,
  `mileage` INT(11) NULL DEFAULT NULL,
  `wheel_drive` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`vechicle_id`),
  INDEX `country_idx` (`country` ASC) VISIBLE,
  INDEX `body_idx` (`body` ASC) VISIBLE,
  CONSTRAINT `country`
    FOREIGN KEY (`country`)
    REFERENCES `wheels`.`country` (`country_code`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wheels`.`ad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`ad` (
  `ad_id` INT(11) NOT NULL AUTO_INCREMENT,
  `vechile` INT(11) NULL DEFAULT NULL,
  `price` INT(11) NOT NULL,
  `user` INT(11) NOT NULL,
  `city` INT(11) NOT NULL,
  `engine` VARCHAR(45) NOT NULL,
  `mileage` INT(11) NOT NULL,
  `transmission` INT(11) NOT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ad_id`),
  UNIQUE INDEX `ad_id_UNIQUE` (`ad_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user` ASC) VISIBLE,
  INDEX `vechicle_idx` (`vechile` ASC) VISIBLE,
  CONSTRAINT `user`
    FOREIGN KEY (`user`)
    REFERENCES `wheels`.`user` (`user_id`),
  CONSTRAINT `vechicle`
    FOREIGN KEY (`vechile`)
    REFERENCES `wheels`.`vechicle` (`vechicle_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wheels`.`body`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`body` (
  `body_id` INT(11) NOT NULL AUTO_INCREMENT,
  `body_name_ru` VARCHAR(45) NOT NULL,
  `body_name_en` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`body_id`),
  UNIQUE INDEX `body_name_ru_UNIQUE` (`body_name_ru` ASC) VISIBLE,
  UNIQUE INDEX `body_name_en_UNIQUE` (`body_name_en` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wheels`.`color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`color` (
  `color_id` INT(11) NOT NULL AUTO_INCREMENT,
  `color_name_ru` VARCHAR(45) NOT NULL,
  `color_name_en` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`color_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wheels`.`make`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`make` (
  `make_id` INT(11) NOT NULL AUTO_INCREMENT,
  `make_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`make_id`),
  UNIQUE INDEX `idmake_UNIQUE` (`make_id` ASC) VISIBLE,
  UNIQUE INDEX `make_name_UNIQUE` (`make_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wheels`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`model` (
  `model_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `make_id` INT(11) NOT NULL,
  PRIMARY KEY (`model_id`),
  INDEX `make_idx` (`make_id` ASC) VISIBLE,
  CONSTRAINT `make`
    FOREIGN KEY (`make_id`)
    REFERENCES `wheels`.`make` (`make_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
