
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Accessories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Accessories` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Accessories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  `Statistics` VARCHAR(100) NOT NULL,
  `Definition` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Unique` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pendants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pendants` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pendants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Rarity` VARCHAR(45) NOT NULL,
  `Definition` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `Unique` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Skins`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Skins` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Skins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NULL,
  `Rarity` VARCHAR(45) NOT NULL,
  `pattern` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Unique` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Weapons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Weapons` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Weapons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `Damage` INT NOT NULL,
  `Recoil` VARCHAR(45) NOT NULL,
  `Rates of fire` INT NOT NULL,
  `Capacity` INT NOT NULL,
  `Pendants_id` INT NOT NULL,
  `Skins_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Unique` (`Name` ASC) VISIBLE,
  INDEX `fk_Weapons_Pendants_idx` (`Pendants_id` ASC) VISIBLE,
  INDEX `fk_Weapons_Skins1_idx` (`Skins_id` ASC) VISIBLE,
  CONSTRAINT `fk_Weapons_Pendants`
    FOREIGN KEY (`Pendants_id`)
    REFERENCES `mydb`.`Pendants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Weapons_Skins1`
    FOREIGN KEY (`Skins_id`)
    REFERENCES `mydb`.`Skins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Modes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Modes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Duration` INT NOT NULL,
  `Special` TINYINT NOT NULL,
  `Definition` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Unique` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Statistics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Statistics` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Statistics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Defense` VARCHAR(45) NOT NULL,
  `Speed` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Unique` (`Defense` ASC, `Speed` ASC) INVISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Characters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Characters` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Characters` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Part` VARCHAR(7) NOT NULL,
  `Ability name` VARCHAR(20) NOT NULL,
  `Ability definition` VARCHAR(200) NOT NULL,
  `Passive ability` VARCHAR(20) NULL,
  `Passif definition` VARCHAR(200) NULL,
  `Gender` VARCHAR(10) NULL,
  `Country` VARCHAR(45) NULL,
  `Special force` VARCHAR(80) NULL,
  `Maps_id` INT NOT NULL,
  `Statistics_id` INT NOT NULL,
  `Skins_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Unique` (`Name` ASC) VISIBLE,
  INDEX `fk_Characters_Statistics1_idx` (`Statistics_id` ASC) VISIBLE,
  INDEX `fk_Characters_Skins1_idx` (`Skins_id` ASC) VISIBLE,
  CONSTRAINT `fk_Characters_Statistics1`
    FOREIGN KEY (`Statistics_id`)
    REFERENCES `mydb`.`Statistics` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Characters_Skins1`
    FOREIGN KEY (`Skins_id`)
    REFERENCES `mydb`.`Skins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Maps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Maps` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Maps` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Size` INT NOT NULL,
  `Nb spawns` VARCHAR(45) NOT NULL,
  `Nb floors` VARCHAR(45) NOT NULL,
  `Characters_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Unique` (`Name` ASC) VISIBLE,
  INDEX `fk_Maps_Characters1_idx` (`Characters_id` ASC) VISIBLE,
  CONSTRAINT `fk_Maps_Characters1`
    FOREIGN KEY (`Characters_id`)
    REFERENCES `mydb`.`Characters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rewards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Rewards` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Rewards` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Unique` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gadgets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Gadgets` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Gadgets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Definition` VARCHAR(200) NOT NULL,
  `Part` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Unique` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Characters_carry_Gadgets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Characters_carry_Gadgets` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Characters_carry_Gadgets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Characters_id` INT NOT NULL,
  `Gadgets_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Characters_has_Gadgets_Gadgets1_idx` (`Gadgets_id` ASC) VISIBLE,
  INDEX `fk_Characters_has_Gadgets_Characters1_idx` (`Characters_id` ASC) VISIBLE,
  CONSTRAINT `fk_Characters_has_Gadgets_Characters1`
    FOREIGN KEY (`Characters_id`)
    REFERENCES `mydb`.`Characters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Characters_has_Gadgets_Gadgets1`
    FOREIGN KEY (`Gadgets_id`)
    REFERENCES `mydb`.`Gadgets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Weapons_Equip_Accessories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Weapons_Equip_Accessories` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Weapons_Equip_Accessories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Weapons_id` INT NOT NULL,
  `Accessories_id` INT NOT NULL,
  INDEX `fk_Weapons_has_Accessories_Accessories1_idx` (`Accessories_id` ASC) VISIBLE,
  INDEX `fk_Weapons_has_Accessories_Weapons1_idx` (`Weapons_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Weapons_has_Accessories_Weapons1`
    FOREIGN KEY (`Weapons_id`)
    REFERENCES `mydb`.`Weapons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Weapons_has_Accessories_Accessories1`
    FOREIGN KEY (`Accessories_id`)
    REFERENCES `mydb`.`Accessories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Characters_Use_Weapons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Characters_Use_Weapons` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Characters_Use_Weapons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Characters_id` INT NOT NULL,
  `Weapons_id` INT NOT NULL,
  INDEX `fk_Characters_has_Weapons_Weapons1_idx` (`Weapons_id` ASC) VISIBLE,
  INDEX `fk_Characters_has_Weapons_Characters1_idx` (`Characters_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Characters_has_Weapons_Characters1`
    FOREIGN KEY (`Characters_id`)
    REFERENCES `mydb`.`Characters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Characters_has_Weapons_Weapons1`
    FOREIGN KEY (`Weapons_id`)
    REFERENCES `mydb`.`Weapons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Maps_offer_Modes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Maps_offer_Modes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Maps_offer_Modes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Maps_id` INT NOT NULL,
  `Modes_id` INT NOT NULL,
  INDEX `fk_Maps_has_Modes_Modes1_idx` (`Modes_id` ASC) VISIBLE,
  INDEX `fk_Maps_has_Modes_Maps1_idx` (`Maps_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Maps_has_Modes_Maps1`
    FOREIGN KEY (`Maps_id`)
    REFERENCES `mydb`.`Maps` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Maps_has_Modes_Modes1`
    FOREIGN KEY (`Modes_id`)
    REFERENCES `mydb`.`Modes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Characters_win_Rewards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Characters_win_Rewards` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Characters_win_Rewards` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Characters_id` INT NOT NULL,
  `Rewards_id` INT NOT NULL,
  INDEX `fk_Characters_has_Rewards_Rewards1_idx` (`Rewards_id` ASC) VISIBLE,
  INDEX `fk_Characters_has_Rewards_Characters1_idx` (`Characters_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Characters_has_Rewards_Characters1`
    FOREIGN KEY (`Characters_id`)
    REFERENCES `mydb`.`Characters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Characters_has_Rewards_Rewards1`
    FOREIGN KEY (`Rewards_id`)
    REFERENCES `mydb`.`Rewards` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
`r6 db``r6 db`