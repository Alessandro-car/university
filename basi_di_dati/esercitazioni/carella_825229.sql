/* Cancellazione database */

DROP TABLE IF EXISTS testateGiornalistiche_carella;

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





