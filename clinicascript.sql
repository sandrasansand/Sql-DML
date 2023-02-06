-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico` (
  `codigo` INT ,
  `nombre` VARCHAR(250) NOT NULL,
  `especialidad` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente` (
  `codigo` INT ,
  `dni` VARCHAR(9) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `telefono` VARCHAR(15) NULL,
  `comentarios` VARCHAR(250) NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medicamento` (
  `codigo` INT ,
  `nombre` VARCHAR(100) NOT NULL,
  `precio` DECIMAL(9,2) NULL,
  `envase` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cita` (
  `codigomedico` INT ,
  `codigopaciente` INT ,
  `fecha` DATE ,
  PRIMARY KEY (`codigomedico`, `codigopaciente`, `fecha`),
  INDEX `codigopaciente_idx` (`codigopaciente` ASC),
  CONSTRAINT `FK_cita_medico`
    FOREIGN KEY (`codigomedico`)
    REFERENCES `mydb`.`medico` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_cita_paciente`
    FOREIGN KEY (`codigopaciente`)
    REFERENCES `mydb`.`paciente` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servicio` (
  `codigomedico` INT ,
  `codigopaciente` INT ,
  `fecha` DATE ,
  `tipo` ENUM('INICIAL', 'SEGUIMIENTO', 'FINALIZACION') NOT NULL,
  PRIMARY KEY (`codigomedico`, `codigopaciente`, `fecha`),
  INDEX `servivio_paciente_idx` (`codigopaciente` ASC),
  CONSTRAINT `FK_servicio_medico`
    FOREIGN KEY (`codigomedico`)
    REFERENCES `mydb`.`medico` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_servivio_paciente`
    FOREIGN KEY (`codigopaciente`)
    REFERENCES `mydb`.`paciente` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`venta` (
  `codigomedico` INT ,
  `codigopaciente` INT ,
  `codigomedicamento` INT ,
  `fecha` DATE ,
  `comision` INT NULL,
  PRIMARY KEY (`codigomedico`, `codigopaciente`, `codigomedicamento`, `fecha`),
  INDEX `FK_venta_paciente_idx` (`codigopaciente` ASC),
  INDEX `FK_venta_medicamento_idx` (`codigomedicamento` ASC),
  CONSTRAINT `FK_venta_medico`
    FOREIGN KEY (`codigomedico`)
    REFERENCES `mydb`.`medico` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_venta_paciente`
    FOREIGN KEY (`codigopaciente`)
    REFERENCES `mydb`.`paciente` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_venta_medicamento`
    FOREIGN KEY (`codigomedicamento`)
    REFERENCES `mydb`.`medicamento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
