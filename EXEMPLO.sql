-- MySQL Script generated by MySQL Workbench
-- Thu Dec  5 09:21:02 2024
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
-- Table `mydb`.`ALUNOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALUNOS` (
  `idALUNOS` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(60) NOT NULL,
  `CPF` VARCHAR(15) NOT NULL,
  `Data de nascimento` DATE NOT NULL,
  `Matrícula` VARCHAR(45) NOT NULL,
  `Ano` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`idALUNOS`),
  UNIQUE INDEX `idALUNOS_UNIQUE` (`idALUNOS` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROFESSOR` (
  `idPROFESSOR` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `CPF` VARCHAR(15) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPROFESSOR`),
  UNIQUE INDEX `idPROFESSOR_UNIQUE` (`idPROFESSOR` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ALUNOS_has_PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALUNOS_has_PROFESSOR` (
  `ALUNOS_idALUNOS` INT NOT NULL,
  `PROFESSOR_idPROFESSOR` INT NOT NULL,
  PRIMARY KEY (`ALUNOS_idALUNOS`, `PROFESSOR_idPROFESSOR`),
  INDEX `fk_ALUNOS_has_PROFESSOR_PROFESSOR1_idx` (`PROFESSOR_idPROFESSOR` ASC) VISIBLE,
  INDEX `fk_ALUNOS_has_PROFESSOR_ALUNOS_idx` (`ALUNOS_idALUNOS` ASC) VISIBLE,
  CONSTRAINT `fk_ALUNOS_has_PROFESSOR_ALUNOS`
    FOREIGN KEY (`ALUNOS_idALUNOS`)
    REFERENCES `mydb`.`ALUNOS` (`idALUNOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ALUNOS_has_PROFESSOR_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_idPROFESSOR`)
    REFERENCES `mydb`.`PROFESSOR` (`idPROFESSOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TURMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TURMA` (
  `idTURMA` INT NOT NULL AUTO_INCREMENT,
  `Quantidade de Alunos` VARCHAR(3) NOT NULL,
  `Sala` VARCHAR(2) NOT NULL,
  `Prof.Conselheiro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTURMA`),
  UNIQUE INDEX `idTURMA_UNIQUE` (`idTURMA` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROFESSOR_has_TURMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROFESSOR_has_TURMA` (
  `PROFESSOR_idPROFESSOR` INT NOT NULL,
  `TURMA_idTURMA` INT NOT NULL,
  PRIMARY KEY (`PROFESSOR_idPROFESSOR`, `TURMA_idTURMA`),
  INDEX `fk_PROFESSOR_has_TURMA_TURMA1_idx` (`TURMA_idTURMA` ASC) VISIBLE,
  INDEX `fk_PROFESSOR_has_TURMA_PROFESSOR1_idx` (`PROFESSOR_idPROFESSOR` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_has_TURMA_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_idPROFESSOR`)
    REFERENCES `mydb`.`PROFESSOR` (`idPROFESSOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROFESSOR_has_TURMA_TURMA1`
    FOREIGN KEY (`TURMA_idTURMA`)
    REFERENCES `mydb`.`TURMA` (`idTURMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DISCIPLINA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DISCIPLINA` (
  `idDISCIPLINA` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Carga Horária` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDISCIPLINA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROFESSOR_has_DISCIPLINA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROFESSOR_has_DISCIPLINA` (
  `PROFESSOR_idPROFESSOR` INT NOT NULL,
  `DISCIPLINA_idDISCIPLINA` INT NOT NULL,
  PRIMARY KEY (`PROFESSOR_idPROFESSOR`, `DISCIPLINA_idDISCIPLINA`),
  INDEX `fk_PROFESSOR_has_DISCIPLINA_DISCIPLINA1_idx` (`DISCIPLINA_idDISCIPLINA` ASC) VISIBLE,
  INDEX `fk_PROFESSOR_has_DISCIPLINA_PROFESSOR1_idx` (`PROFESSOR_idPROFESSOR` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_has_DISCIPLINA_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_idPROFESSOR`)
    REFERENCES `mydb`.`PROFESSOR` (`idPROFESSOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROFESSOR_has_DISCIPLINA_DISCIPLINA1`
    FOREIGN KEY (`DISCIPLINA_idDISCIPLINA`)
    REFERENCES `mydb`.`DISCIPLINA` (`idDISCIPLINA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
