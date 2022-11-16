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
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (1,1,4.473188504669295);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (1,0,0,0,3.7660093393221468);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (1,'Bicicleta',20,'0',4.05832453749282);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (1,30,'Hidrelétrica',5.815752179723251);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (1,0.1,0,1,7.626462384664936);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (1,0,10,0,10.403760104478176);
INSERT INTO Usuario (id, nome, idade) VALUES (2, 'Jorge ',26);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (2,2,0.7930820123549072);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (2,0,1,1,7.6007886608783);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (2,'carro',5,'Alcool',1.488913832740304);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (2,200,'Hidrelétrica',1.8965575729317377);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (2,0.2,0,1,9.84359851284557);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (2,0,10,0,5.106796982540648);
INSERT INTO Usuario (id, nome, idade) VALUES (3, 'Edson ',29);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (3,3,4.141863069456242);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (3,1,1,0,8.443462537300361);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (3,'0',0,'0',1.3114574441359415);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (3,200,'Hidrelétrica',3.4350173474429533);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (3,0.5,0,0,0.061082814552486875);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (3,0,5,0,10.755338301806859);
INSERT INTO Usuario (id, nome, idade) VALUES (4, 'Edson',29);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (4,4,8.88920715650563);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (4,0,0,0,7.931607121506658);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (4,'0',0,'0',3.458367522658283);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (4,300,'Hidrelétrica',5.653960327914892);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (4,2,0,0,8.476087416373895);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (4,0,10,0,8.078699069094485);
INSERT INTO Usuario (id, nome, idade) VALUES (5, 'Luiza',25);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (5,5,10.914853458871713);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (5,1,1,0,10.924234149592147);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (5,'Carro',40,'Gasolina',3.2684166928083727);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (5,200,'Hidrelétrica',8.500346652863437);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (5,0.3,0,1,10.002619985901909);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (5,0,20,0,2.4979295629891243);
INSERT INTO Usuario (id, nome, idade) VALUES (6, 'João',19);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (6,6,10.654555789060439);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (6,0,0,0,6.88323712257632);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (6,'Van',160,'Gasolina',3.7200259436603047);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (6,300,'Hidrelétrica',8.758261356593916);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (6,0.5,0,0,10.67589764806726);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (6,0,150,0,8.05158168500229);
INSERT INTO Usuario (id, nome, idade) VALUES (7, 'Matheus ',28);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (7,7,4.403454059109392);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (7,1,1,0,5.464701256872249);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (7,'Carro',30,'Gasolina',7.033275851447337);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (7,200,'Hidrelétrica',4.2073712537229895);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (7,1,0,0,7.100510256042622);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (7,0,25,0,2.3677997688932697);
INSERT INTO Usuario (id, nome, idade) VALUES (8, 'Artur ',19);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (8,8,7.045597068627982);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (8,0,0,0,4.284499256689458);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (8,'Bicicleta',30,'0',8.510022807995943);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (8,200,'Hidrelétrica',8.890439282405747);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (8,0.5,0,1,8.22362284526154);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (8,0,4,0,6.326848752794012);
INSERT INTO Usuario (id, nome, idade) VALUES (9, 'Luno',14);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (9,9,10.244518283631239);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (9,0,0,0,7.525552292312781);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (9,'Carro e Skate',15,'Alcool',10.126662214024195);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (9,300,'Hidrelétrica',9.19046212099187);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (9,0,1,1,10.456708521939577);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (9,0,10,0,0.18981856140345998);
INSERT INTO Usuario (id, nome, idade) VALUES (10, 'Lucas',18);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (10,10,2.4308411412529174);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (10,0,1,0,8.084145761811834);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (10,'ônibus',30,'Gasolina',10.232835880456097);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (10,5,'Hidrelétrica',7.877029009263232);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (10,0.3,0,0,8.330575949450338);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (10,0,10,0,8.241746712914935);
INSERT INTO Usuario (id, nome, idade) VALUES (11, 'João ',19);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (11,11,10.887682993225837);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (11,0,0,0,3.5859755107145577);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (11,'Carro',30,'Gasolina',3.1372945378785);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (11,300,'Hidrelétrica',10.806999567969955);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (11,1,0,0,9.246013699042054);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (11,30,15,1,5.851875859373847);
INSERT INTO Usuario (id, nome, idade) VALUES (12, 'João',22);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (12,12,0.7197939548740915);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (12,1,1,1,5.126888507470176);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (12,'Bicicleta ',20,'0',3.7792510784953044);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (12,200,'Hidrelétrica',8.237720818273262);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (12,0,1,1,7.437023939553846);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (12,40,15,1,6.888523123633629);
INSERT INTO Usuario (id, nome, idade) VALUES (13, 'Gabriel',24);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (13,13,5.076814784345214);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (13,0,1,1,1.4213523887955808);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (13,'Metrô, trem, ônibus ',60,'Diesel',2.345775399069935);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (13,50,'Hidrelétrica',5.163798742925122);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (13,0,1,1,7.235625466011043);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (13,0,20,0,8.356554934683073);
INSERT INTO Usuario (id, nome, idade) VALUES (14, 'Gabriel ',26);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (14,14,9.114552520475407);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (14,1,1,1,3.496922318635429);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (14,'Metrô, trem, ônibus ',90,'Diesel',0.35905376156060576);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (14,100,'Hidrelétrica',3.109060682061034);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (14,0,1,1,8.47232806516184);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (14,20,20,1,5.546551078588971);
INSERT INTO Usuario (id, nome, idade) VALUES (15, 'Giovani ',19);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (15,15,4.313669463526479);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (15,1,1,0,10.377319331693975);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (15,'Ônibus',10,'Biocombustível',5.983673921468952);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (15,60,'Hidrelétrica',10.04707198568033);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (15,0,1,1,6.625392277635419);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (15,0,3,0,7.984744937858527);
INSERT INTO Usuario (id, nome, idade) VALUES (16, 'Gabriel',22);
INSERT INTO Historico (idHistorico, idUsuario, pontuacaoGeral) VALUES (16,16,1.4574563000662915);
INSERT INTO Reciclagem (idHistorico, fazReciclagem, separaLixoOrganicoNaoOrganico, separaLixoPorTipo, valorIndice) VALUES (16,0,0,0,10.740271823295183);
INSERT INTO Transporte (idHistorico, meioTransporte, tempoLocomocao, tipoCombustivel, valorIndice) VALUES (16,'Carro',10,'Gasolina',2.716832291037936);
INSERT INTO Energia (idHistorico, consumoEnergia, tipoEnergia, valorIndice) VALUES (16,127,'Hidrelétrica',6.177623048045198);
INSERT INTO Alimentacao (idHistorico, qtoCarneVermelha, vegetarianoVegano, ConsomeDeEmpresasEcoFriendly, valorIndice) VALUES (16,0.1,0,0,9.517076972233854);
INSERT INTO Agua (idHistorico, coletaAguaDaChuva, consumoDeAgua, fazReusoDeAgua, valorIndice) VALUES (16,0,2,0,8.986308557705827);
