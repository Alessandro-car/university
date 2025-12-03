/* Cancellazione database */

DROP DATABASE IF EXISTS testateGiornalistiche_carella;

/* Creazione database */

CREATE DATABASE IF NOT EXISTS testateGiornalistiche_carella;

/* Selezione del database creato */
USE testateGiornalistiche_carella;

CREATE TABLE IF NOT EXISTS redazioni(
	idRedazione CHAR(4) NOT NULL,
	nomeComitato VARCHAR(10),
	citta VARCHAR(8),
	indirzzoWeb VARCHAR(50),
	CONSTRAINT PRIMARY KEY (idRedazione)
);

CREATE TABLE IF NOT EXISTS testate (
	idTestata CHAR(4) NOT NULL,
	nome VARCHAR(20),
	redazione CHAR(4),
	CONSTRAINT PRIMARY KEY(idTestata),
	CONSTRAINT FOREIGN KEY (redazione) REFERENCES redazioni(idRedazione)
);

CREATE TABLE IF NOT EXISTS redattori (
	idRedattori CHAR(3) NOT NULL,
	cognome VARCHAR(10),
	nome VARCHAR(10),
	via VARCHAR(10),
	citta VARCHAR(10),
	provincia CHAR(2),
	CAP CHAR(5),
	email VARCHAR(50),
	CONSTRAINT PRIMARY KEY(idRedattori)
);

CREATE TABLE IF NOT EXISTS redazRedat (
	idRedazione CHAR(4) NOT NULL,
	idRedattori CHAR(4) NOT NULL,
	CONSTRAINT PRIMARY KEY(idRedazione, idRedattori),
	CONSTRAINT FOREIGN KEY (idRedazione) REFERENCES redazioni(idRedazione),
	CONSTRAINT FOREIGN KEY (idRedattori) REFERENCES redattori(idRedattori)
);

CREATE TABLE IF NOT EXISTS categorie (
	nomeCategoria VARCHAR(10) NOT NULL,
	categoriaPadre VARCHAR(10),
	CONSTRAINT PRIMARY KEY(nomeCategoria),
	CONSTRAINT FOREIGN KEY (categoriaPadre) REFERENCES categorie(nomeCategoria)
);

CREATE TABLE IF NOT EXISTS inserzioni (
	codice CHAR(6) NOT NULL,
	testo VARCHAR(100),
	categoria VARCHAR(10),
	CONSTRAINT PRIMARY KEY(codice),
	CONSTRAINT FOREIGN KEY (categoria) REFERENCES categorie(nomeCategoria)
);

CREATE TABLE IF NOT EXISTS instest (
	idInserzione CHAR(6) NOT NULL,
	idTestata CHAR(4) NOT NULL,
	CONSTRAINT PRIMARY KEY(idInserzione, idTestata),
	CONSTRAINT FOREIGN KEY (idInserzione) REFERENCES inserzioni(codice),
	CONSTRAINT FOREIGN KEY (idTestata) REFERENCES testate(idTestata)
);

CREATE TABLE IF NOT EXISTS aziende (
	idAzienda CHAR(6) NOT NULL,
	nomeAzienda VARCHAR(40),
	referente VARCHAR(40),
	telefono CHAR(11),
	citta VARCHAR(15),
	provincia CHAR(2),
	CAP CHAR(5),
	CapitaleSociale INTEGER,
	CONSTRAINT PRIMARY KEY(idAzienda)
);

CREATE TABLE IF NOT EXISTS insaz (
	idAzienda CHAR(6) NOT NULL,
	idInserzione CHAR(6) NOT NULL,
	CONSTRAINT PRIMARY KEY(idAzienda, idInserzione),
	CONSTRAINT FOREIGN KEY (idAzienda) REFERENCES aziende(idAzienda),
	CONSTRAINT FOREIGN KEY (idInserzione) REFERENCES inserzioni(codice)
);

CREATE TABLE IF NOT EXISTS privati (
	idPrivato CHAR(3) NOT NULL,
	cognome VARCHAR(10),
	nome VARCHAR(8),
	via VARCHAR(15),
	citta VARCHAR(15),
	provincia CHAR(2),
	CAP CHAR(5),
	email VARCHAR(50),
	CONSTRAINT PRIMARY KEY(idPrivato)
);


/* Ho modificato idPrivato da testo di 6 caratteri a 3, in quanto la chiave primaria di privati ha un idPrivato che è un testo di 3 caratteri */
CREATE TABLE IF NOT EXISTS inspriv (
	idPrivato CHAR(3) NOT NULL,
	idInserzione CHAR(6) NOT NULL,
	CONSTRAINT PRIMARY KEY(idPrivato, idInserzione),
	CONSTRAINT FOREIGN KEY (idPrivato) REFERENCES privati(idPrivato),
	CONSTRAINT FOREIGN KEY (idInserzione) REFERENCES inserzioni(codice)
);

/* CORREZIONE NOME ATTRIBUTO DI redazioni da indirzzoWeb in indirizzoWeb*/

ALTER TABLE redazioni RENAME COLUMN indirzzoWeb TO indirizzoWeb;

CREATE TABLE IF NOT EXISTS citta (
	CAP CHAR(5) NOT NULL,
	provincia CHAR(2),
	citta VARCHAR(30),
	CONSTRAINT PRIMARY KEY(CAP)
);

ALTER TABLE redattori DROP COLUMN citta;
ALTER TABLE redattori DROP COLUMN provincia;
ALTER TABLE redattori ADD CONSTRAINT FOREIGN KEY(CAP) REFERENCES citta(CAP);

ALTER TABLE redazioni CHANGE citta CAP CHAR(5);
ALTER TABLE redazioni ADD CONSTRAINT FOREIGN KEY(CAP) REFERENCES citta(CAP);

ALTER TABLE aziende DROP COLUMN citta;
ALTER TABLE aziende DROP COLUMN provincia;
ALTER TABLE aziende ADD CONSTRAINT FOREIGN KEY(CAP) REFERENCES citta(CAP);

ALTER TABLE privati DROP COLUMN citta;
ALTER TABLE privati DROP COLUMN provincia;
ALTER TABLE privati ADD CONSTRAINT FOREIGN KEY(CAP) REFERENCES citta(CAP);

INSERT INTO citta (CAP, provincia, citta) VALUES ('20100', 'MI', 'Milano');
INSERT INTO citta (CAP, provincia, citta) VALUES ('00100', 'RM', 'Roma');
INSERT INTO citta (CAP, provincia, citta) VALUES ('80100', 'NA', 'Napoli');
INSERT INTO citta (CAP, provincia, citta) VALUES ('50100', 'FI', 'Firenze');
INSERT INTO citta (CAP, provincia, citta) VALUES ('10100', 'TO', 'Torino');
INSERT INTO citta (CAP, provincia, citta) VALUES ('40100', 'BO', 'Bologna');
INSERT INTO citta (CAP, provincia, citta) VALUES ('90100', 'PA', 'Palermo');
INSERT INTO citta (CAP, provincia, citta) VALUES ('16100', 'GE', 'Genova');
INSERT INTO citta (CAP, provincia, citta) VALUES ('70100', 'BA', 'Bari');
INSERT INTO citta (CAP, provincia, citta) VALUES ('37100', 'VR', 'Verona');
INSERT INTO citta (CAP, provincia, citta) VALUES ('43100', 'PR', 'Parma');
INSERT INTO citta (CAP, provincia, citta) VALUES ('76125', 'BT', 'Trani');
INSERT INTO citta (CAP, provincia, citta) VALUES ('76123', 'BT', 'Andria');
INSERT INTO citta (CAP, provincia, citta) VALUES ('34100', 'TS', 'Trieste');

SELECT * FROM citta;

INSERT INTO redazioni (idRedazione, nomeComitato, CAP, indirizzoWeb) VALUES ('RCRR', 'RedCorr', '20100', 'www.corriere.it');
INSERT INTO redazioni (idRedazione, nomeComitato, CAP, indirizzoWeb) VALUES ('RREP', 'RedRepubbl', '00100', 'www.repubblica.it');
INSERT INTO redazioni (idRedazione, nomeComitato, CAP, indirizzoWeb) VALUES ('RSTM', 'RedStampa', '10100', 'www.lastampa.it');

SELECT * FROM redazioni;

INSERT INTO testate (idTestata, nome, redazione) VALUES ('T001', 'Corriere della Sera', 'RCRR');
INSERT INTO testate (idTestata, nome, redazione) VALUES ('T002', 'La Repubblica', 'RREP');
INSERT INTO testate (idTestata, nome, redazione) VALUES ('T003', 'La Stampa', 'RSTM');

SELECT * FROM testate;

ALTER TABLE privati MODIFY COLUMN nome VARCHAR(30);
ALTER TABLE privati MODIFY COLUMN cognome VARCHAR(30);


