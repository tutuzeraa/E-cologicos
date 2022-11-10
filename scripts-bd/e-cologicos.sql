-- Active: 1667943619892@@127.0.0.1@3306@e-cologicos
CREATE DATABASE IF NOT EXISTS `e-cologicos`;

USE `e-cologicos`;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `Historico` (
  `idHistorico` INT NOT NULL AUTO_INCREMENT,
  `pontuacaoGeral` FLOAT NOT NULL,
  `dataColeta` DATETIME NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idHistorico`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Usuario` (`id`));

CREATE TABLE IF NOT EXISTS `Agua` (
  `idAgua` INT NOT NULL AUTO_INCREMENT,
  `idHistorico` INT NOT NULL,
  `valorIndice` INT NOT NULL,
  `consumoDeAgua` INT NOT NULL,
  `coletaAguaDaChuva` FLOAT NOT NULL,
  `fazReusoDeAgua` TINYINT NOT NULL,
  PRIMARY KEY (`idAgua`),
  INDEX `idHistorico_idx` (`idHistorico` ASC) VISIBLE,
  CONSTRAINT `idHistoricoAgua`
    FOREIGN KEY (`idHistorico`)
    REFERENCES `Historico` (`idHistorico`));

CREATE TABLE IF NOT EXISTS `Alimentacao` (
  `idAlimentacao` INT NOT NULL AUTO_INCREMENT,
  `idHistorico` INT NOT NULL,
  `ConsomeDeEmpresasEcoFriendly` TINYINT NOT NULL,
  `qtoCarneVermelha` FLOAT NOT NULL,
  `valorIndice` INT NOT NULL,
  `vegetarianoVegano` TINYINT NOT NULL,
  PRIMARY KEY (`idAlimentacao`),
  INDEX `idHistorico` (`idHistorico` ASC) VISIBLE,
  CONSTRAINT `idHistoricoAlimentacao`
    FOREIGN KEY (`idHistorico`)
    REFERENCES `Historico` (`idHistorico`));

CREATE TABLE IF NOT EXISTS `Energia` (
  `idEnergia` INT NOT NULL AUTO_INCREMENT,
  `idHistorico` INT NOT NULL,
  `valorIndice` INT NOT NULL,
  `consumoEnergia` FLOAT NOT NULL,
  `tipoEnergia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEnergia`),
  INDEX `idHistorico` (`idHistorico` ASC) VISIBLE,
  CONSTRAINT `idHistoricoEnergia`
    FOREIGN KEY (`idHistorico`)
    REFERENCES `Historico` (`idHistorico`));

CREATE TABLE IF NOT EXISTS `Reciclagem` (
  `idReciclagem` INT NOT NULL AUTO_INCREMENT,
  `idHistorico` INT NOT NULL,
  `separaLixoOrganicoNaoOrganico` TINYINT NOT NULL,
  `separaLixoPorTipo` TINYINT NOT NULL,
  `fazReciclagem` TINYINT NOT NULL,
  `valorIndice` INT NOT NULL,
  PRIMARY KEY (`idReciclagem`),
  INDEX `idHistorico` (`idHistorico` ASC) VISIBLE,
  CONSTRAINT `idHistoricoReciclagem`
    FOREIGN KEY (`idHistorico`)
    REFERENCES `Historico` (`idHistorico`));
    
CREATE TABLE IF NOT EXISTS `Transporte` (
  `idTransporte` INT NOT NULL AUTO_INCREMENT,
  `idHistorico` INT NOT NULL,
  `meioTransporte` VARCHAR(45) NOT NULL,
  `tempoLocomocao` INT NOT NULL,
  `tipoCombustivel` VARCHAR(45) NOT NULL,
  `valorIndice` FLOAT NOT NULL,
  PRIMARY KEY (`idTransporte`),
  INDEX `idHistorico` (`idHistorico` ASC) VISIBLE,
  CONSTRAINT `idHistoricoTransporte`
    FOREIGN KEY (`idHistorico`)
    REFERENCES `Historico` (`idHistorico`));
