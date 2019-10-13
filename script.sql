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
DROP SCHEMA IF EXISTS `wheels` ;

-- -----------------------------------------------------
-- Schema wheels
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wheels` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `wheels` ;

-- -----------------------------------------------------
-- CatalogRetriever `wheels`.`ad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`ad` (
  `ad_id` INT(11) NOT NULL AUTO_INCREMENT,
  `price` INT(11) NOT NULL,
  `user` INT(11) NOT NULL,
  `city` INT(11) NOT NULL,
  `body` INT(11) NOT NULL,
  `engine` VARCHAR(45) NOT NULL,
  `mileage` INT(11) NOT NULL,
  `transmission` INT(11) NOT NULL,
  `color` INT(11) NOT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ad_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `ad_id_UNIQUE` ON `wheels`.`ad` (`ad_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- CatalogRetriever `wheels`.`body`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`body` (
  `body_id` INT(11) NOT NULL AUTO_INCREMENT,
  `body_name_ru` VARCHAR(45) NOT NULL,
  `body_name_en` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`body_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `body_name_ru_UNIQUE` ON `wheels`.`body` (`body_name_ru` ASC) VISIBLE;

CREATE UNIQUE INDEX `body_name_en_UNIQUE` ON `wheels`.`body` (`body_name_en` ASC) VISIBLE;


-- -----------------------------------------------------
-- CatalogRetriever `wheels`.`color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`color` (
  `color_id` INT(11) NOT NULL AUTO_INCREMENT,
  `color_name_ru` VARCHAR(45) NOT NULL,
  `color_name_en` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`color_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- CatalogRetriever `wheels`.`make`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`make` (
  `make_id` INT(11) NOT NULL AUTO_INCREMENT,
  `make_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`make_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `idmake_UNIQUE` ON `wheels`.`make` (`make_id` ASC) VISIBLE;

CREATE UNIQUE INDEX `make_name_UNIQUE` ON `wheels`.`make` (`make_name` ASC) VISIBLE;


-- -----------------------------------------------------
-- CatalogRetriever `wheels`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wheels`.`model` (
  `model_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `make_id` INT(11) NOT NULL,
  PRIMARY KEY (`model_id`),
  CONSTRAINT `make`
    FOREIGN KEY (`make_id`)
    REFERENCES `wheels`.`make` (`make_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `make_idx` ON `wheels`.`model` (`make_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- CatalogRetriever `wheels`.`user`
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
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `user_id_UNIQUE` ON `wheels`.`user` (`user_id` ASC) VISIBLE;

CREATE UNIQUE INDEX `login_UNIQUE` ON `wheels`.`user` (`login` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
