CREATE DATABASE IF NOT EXISTS `e-cologicos`;

USE `e-cologicos`;

-- SET character_set_client = utf8;
-- SET character_set_connection = utf8;
-- SET character_set_results = utf8;
-- SET collation_connection = utf8_general_ci;

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


INSERT INTO Usuario (id, nome, idade) VALUES (1, 'Jorge',26);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (1,1,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (1,0,0,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (1,'Bicicleta',20,'0',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (1,30,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (1,0.1,0,1,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (1,0,10,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (2, 'Jorge ',26);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (2,2,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (2,0,1,1,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (2,'carro',5,'Alcool',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (2,200,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (2,0.2,0,1,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (2,0,10,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (3, 'Edson ',29);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (3,3,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (3,1,1,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (3,'0',0,'0',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (3,200,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (3,0.5,0,0,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (3,0,5,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (4, 'Edson',29);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (4,4,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (4,0,0,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (4,'0',0,'0',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (4,300,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (4,2,0,0,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (4,0,10,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (5, 'Luiza',25);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (5,5,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (5,1,1,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (5,'Carro',40,'Gasolina',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (5,200,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (5,0.3,0,1,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (5,0,20,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (6, 'João',19);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (6,6,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (6,0,0,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (6,'Van',160,'Gasolina',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (6,300,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (6,0.5,0,0,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (6,0,150,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (7, 'Matheus ',28);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (7,7,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (7,1,1,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (7,'Carro',30,'Gasolina',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (7,200,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (7,1,0,0,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (7,0,25,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (8, 'Artur ',19);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (8,8,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (8,0,0,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (8,'Bicicleta',30,'0',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (8,200,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (8,0.5,0,1,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (8,0,4,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (9, 'Luno',14);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (9,9,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (9,0,0,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (9,'Carro e Skate',15,'Alcool',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (9,300,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (9,0,1,1,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (9,0,10,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (10, 'Lucas',18);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (10,10,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (10,0,1,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (10,'ônibus',30,'Gasolina',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (10,5,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (10,0.3,0,0,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (10,0,10,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (11, 'João ',19);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (11,11,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (11,0,0,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (11,'Carro',30,'Gasolina',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (11,300,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (11,1,0,0,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (11,30,15,1,0);
INSERT INTO Usuario (id, nome, idade) VALUES (12, 'João',22);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (12,12,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (12,1,1,1,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (12,'Bicicleta ',20,'0',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (12,200,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (12,0,1,1,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (12,40,15,1,0);
INSERT INTO Usuario (id, nome, idade) VALUES (13, 'Gabriel',24);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (13,13,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (13,0,1,1,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (13,'Metrô, trem, ônibus ',60,'Diesel',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (13,50,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (13,0,1,1,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (13,0,20,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (14, 'Gabriel ',26);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (14,14,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (14,1,1,1,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (14,'Metrô, trem, ônibus ',90,'Diesel',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (14,100,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (14,0,1,1,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (14,20,20,1,0);
INSERT INTO Usuario (id, nome, idade) VALUES (15, 'Giovani ',19);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (15,15,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (15,1,1,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (15,'Ônibus',10,'Biocombustível',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (15,60,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (15,0,1,1,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (15,0,3,0,0);
INSERT INTO Usuario (id, nome, idade) VALUES (16, 'Gabriel',22);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (16,16,0);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (16,0,0,0,0);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (16,'Carro',10,'Gasolina',0);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (16,127,'Hidrelétrica',0);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (16,0.1,0,0,0);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (16,0,2,0,0);
