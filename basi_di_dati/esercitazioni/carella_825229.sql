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
	CONSTRAINT fk_testate_redazione FOREIGN KEY (redazione) REFERENCES redazioni(idRedazione)
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
	CONSTRAINT fk_redazRedat_redazione FOREIGN KEY (idRedazione) REFERENCES redazioni(idRedazione),
	CONSTRAINT fk_redazRedat_redattore FOREIGN KEY (idRedattori) REFERENCES redattori(idRedattori)
);

CREATE TABLE IF NOT EXISTS categorie (
	nomeCategoria VARCHAR(10) NOT NULL,
	categoriaPadre VARCHAR(10),
	CONSTRAINT PRIMARY KEY(nomeCategoria),
	CONSTRAINT fk_categoria_categoria FOREIGN KEY (categoriaPadre) REFERENCES categorie(nomeCategoria)
);

CREATE TABLE IF NOT EXISTS inserzioni (
	codice CHAR(6) NOT NULL,
	testo VARCHAR(100),
	categoria VARCHAR(10),
	CONSTRAINT PRIMARY KEY(codice),
	CONSTRAINT fk_inserzioni_categoria FOREIGN KEY (categoria) REFERENCES categorie(nomeCategoria)
);

CREATE TABLE IF NOT EXISTS instest (
	idInserzione CHAR(6) NOT NULL,
	idTestata CHAR(4) NOT NULL,
	CONSTRAINT PRIMARY KEY(idInserzione, idTestata),
	CONSTRAINT fk_instest_inserzioni FOREIGN KEY (idInserzione) REFERENCES inserzioni(codice),
	CONSTRAINT fk_instest_testate FOREIGN KEY (idTestata) REFERENCES testate(idTestata)
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
	CONSTRAINT fk_insaz_aziende FOREIGN KEY (idAzienda) REFERENCES aziende(idAzienda),
	CONSTRAINT fk_insaz_inserzioni FOREIGN KEY (idInserzione) REFERENCES inserzioni(codice)
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
	CONSTRAINT fk_inspriv_privati FOREIGN KEY (idPrivato) REFERENCES privati(idPrivato),
	CONSTRAINT fk_inspriv_inserzioni FOREIGN KEY (idInserzione) REFERENCES inserzioni(codice)
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
ALTER TABLE redattori ADD CONSTRAINT fk_redattori_citta FOREIGN KEY(CAP) REFERENCES citta(CAP);

ALTER TABLE redazioni CHANGE citta CAP CHAR(5);
ALTER TABLE redazioni ADD CONSTRAINT fk_redazioni_citta FOREIGN KEY(CAP) REFERENCES citta(CAP);

ALTER TABLE aziende DROP COLUMN citta;
ALTER TABLE aziende DROP COLUMN provincia;
ALTER TABLE aziende ADD CONSTRAINT fk_aziende_citta FOREIGN KEY(CAP) REFERENCES citta(CAP);

ALTER TABLE privati DROP COLUMN citta;
ALTER TABLE privati DROP COLUMN provincia;
ALTER TABLE privati ADD CONSTRAINT fk_privati_citta FOREIGN KEY(CAP) REFERENCES citta(CAP);

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

INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('001', 'Rossi', 'Luca', 'Via A 5', '20100', 'l.rossi@gmail.com');
INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('002', 'Bianchi', 'Marco', 'Via B 9', '00100', 'm.bianchi@gmail.com');
INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('003', 'Verdi', 'Anna', 'Via C 45', '80100', 'a.verdi@gmail.com');
INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('004', 'Carella', 'Alessandro', 'Via D 13', '76125', 'a.carella@gmail.com');
INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('005', 'Carella', 'Davide', 'Via E 14', '76125', 'd.carella@gmail.com');
INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('006', 'Gesulado', 'Pasquale', 'Via F 51', '70100', 'p.gesualdo@gmail.com');
INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('007', 'Andrisani', 'Francesco', 'Via G 7', '70100', 'f.andrisani@gmail.com');
INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('008', 'Fiore', 'Fabrizio', 'Via H 10', '76123', 'f.fiore@gmail.com');
INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('009', 'Loparco', 'Pietro', 'Via I 32', '70100', 'p.loparco@gmail.com');
INSERT INTO redattori (idRedattori, cognome, nome, via, CAP, email) VALUES ('010', 'Pasquale', 'Barletta', 'Via J 12', '34100', 'p.barletta@gmail.com');

SELECT * FROM redattori;

INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RCRR', '001');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RREP', '002');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RSTM', '003');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RCRR', '004');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RCRR', '005');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RREP', '006');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RSTM', '007');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RSTM', '008');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RREP', '009');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RCRR', '010');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RCRR', '003');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RSTM', '002');
INSERT INTO redazRedat (idRedazione, idRedattori) VALUES ('RREP', '007');

SELECT * FROM redazRedat;

ALTER TABLE categorie RENAME COLUMN nomeCategoria TO idCategoria;

INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Cronaca', NULL);
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Nera', 'Cronaca');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Locale', 'Cronaca');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Sport', NULL);
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Calcio', 'Sport');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Tennis', 'Sport');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Nuoto', 'Sport');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Politica', NULL);
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Governo', 'Politica');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Elezioni', 'Politica');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Esteri', NULL);
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Europa', 'Esteri');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Asia', 'Esteri');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('USA', 'Esteri');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Cultura', NULL);
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Libri', 'Cultura');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Arte', 'Cultura');
INSERT INTO categorie (idCategoria, categoriaPadre) VALUES ('Musica', 'Cultura');

SELECT * FROM categorie;

INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN001', 'Analisi sulle ultime decisioni sul governo in materia fiscale.', 'Governo');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN002', 'Omicidio nella città di Bari', 'Nera');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN003', "Pallone d'oro a messi", 'Calcio');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN004', 'Vittoria di Sinner vittoria ATP', 'Tennis');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN005', 'Elezioni di Trump', 'USA');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN006', 'Omicidio nella città di Bari', 'Libri');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN007', 'Furto al Louvre', 'Cronaca');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN008', "Mostra d'arte contemporanea al museo centrale", 'Arte');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN009', 'Tensioni diplomatiche tra i paesi euroepi per il nuovo trattato', 'Europa');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN010', 'Annunciate le guest del festival di Sanremo', 'Musica');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN011', 'Incidente sulla tangenziale di Roma', 'Locale');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN012', "L'inter vince la Champions", 'Calcio');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN013', 'Il tennis continua a crescere di popolarità', 'Tennis');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN014', 'Nel nuoto emergono nuovi talenti mondiali', 'Nuoto');
INSERT INTO inserzioni (codice, testo, categoria) VALUES ('IN015', 'Tensioni e sviluppi politici nei paesi asiatici', 'Asia');

SELECT * FROM inserzioni;

INSERT INTO instest (idInserzione, idTestata) VALUES ('IN001', 'T001');
INSERT INTO instest (idInserzione, idTestata) VALUES ('IN002', 'T002');
INSERT INTO instest (idInserzione, idTestata) VALUES ('IN003', 'T002');
INSERT INTO instest (idInserzione, idTestata) VALUES ('IN004', 'T002');
INSERT INTO instest (idInserzione, idTestata) VALUES ('IN005', 'T003');
INSERT INTO instest (idInserzione, idTestata) VALUES ('IN006', 'T001');
INSERT INTO instest (idInserzione, idTestata) VALUES ('IN007', 'T003');

SELECT * FROM instest;

INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0001', 'MediaPress', 'Luca Bianchi', '35167910110', '20100', 500000);
INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0002', 'Editori Roma', 'Luigi Baldi', '32357910110', '00100', 320000);
INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0003', 'Editori Napoli', 'Giovanni Esposito', '39867910990', '80100', 150000);
INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0004', 'Editori Trani', 'Francesco di Bari', '35567910910', '76125', 210000);
INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0005', 'Editori Bari', 'Andrea Gesulado', '31167220110', '70100', 275000);
INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0006', 'Editori Andria', 'Sara Conti', '35227210110', '76123', 180000);
INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0007', 'Editori Trieste', 'Marco Ferrero', '34337910110', '34100', 230000);
INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0008', 'Editori Milano', 'Stefano Riva', '39235910110', '20100', 600000);
INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0009', 'Palermo News', 'Marta de Luca', '37167910120', '90100', 750000);
INSERT INTO aziende (idAzienda, nomeAzienda, referente, telefono, CAP, CapitaleSociale) VALUES ('A0010', 'Stampa Verona', 'Felice Romero', '38193920210', '37100', 220000);

SELECT * FROM aziende;

INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0001', 'IN008');
INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0002', 'IN009');
INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0003', 'IN010');
INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0004', 'IN011');
INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0005', 'IN012');
INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0006', 'IN013');
INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0007', 'IN014');
INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0008', 'IN015');
INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0009', 'IN001');
INSERT INTO insaz (idAzienda, idInserzione) VALUES ('A0010', 'IN002');

SELECT * FROM insaz;

INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('001', 'Serra', 'Giorgio', 'Via Garibaldi', '16100', 'g.serra@gmail.com');
INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('002', 'Greco', 'Paolo', 'Via Sparano', '70100', 'p.greco@gmail.com');
INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('003', 'Rinaldi', 'Chiara', 'Via Dante', '20100', 'c.rinaldi@gmail.com');
INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('004', 'Fontana', 'Elisa', 'Via Toledo', '80100', 'e.fontana@gmail.com');
INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('005', 'Verdi', 'Anna', 'Via Roma', '50100', 'a.verdi@gmail.com');
INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('006', 'Esposito', 'Giulia', 'Via Po', '10100', 'g.esposito@gmail.com');
INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('007', 'Bianchi', 'Marco', 'Via Mazzini', '37100', 'm.bianchi@gmail.com');
INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('008', 'Ferrero', 'Stefano', 'Via Maqueda', '90100', 's.ferrero@gmail.com');
INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('009', 'Conti', 'Marta', 'Via Sparano', '70100', 'm.conti@gmail.com');
INSERT INTO privati (idPrivato, cognome, nome, via, CAP, email) VALUES ('010', 'Rossi', 'Luca', 'Via Austria', '76125', 'l.rossi@gmail.com');

SELECT * FROM privati;

INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('001', 'IN003');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('002', 'IN004');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('003', 'IN005');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('004', 'IN006');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('005', 'IN007');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('006', 'IN008');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('007', 'IN009');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('008', 'IN010');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('009', 'IN011');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('010', 'IN012');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('001', 'IN013');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('002', 'IN014');
INSERT INTO inspriv (idPrivato, idInserzione) VALUES ('003', 'IN015');

SELECT * FROM inspriv;

/* Aggiungo il nome ai vincoli di chiave esterna perchè mi servono per modificare le tabelle */
/* Il vecchio nome dei vincoli è stato preso con il comando show create table nome_tabella; */

ALTER TABLE testate DROP FOREIGN KEY fk_testate_redazione;
ALTER TABLE testate ADD CONSTRAINT fk_testate_redazione FOREIGN KEY (redazione) REFERENCES redazioni(idRedazione) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE categorie DROP FOREIGN KEY fk_categoria_categoria;
ALTER TABLE categorie ADD CONSTRAINT fk_categoria_categoria FOREIGN KEY (categoriaPadre) REFERENCES categorie(idCategoria);

ALTER TABLE inserzioni DROP FOREIGN KEY fk_inserzioni_categoria;
ALTER TABLE inserzioni ADD CONSTRAINT fk_inserzioni_categoria FOREIGN KEY (categoria) REFERENCES categorie(idCategoria);

ALTER TABLE instest DROP FOREIGN KEY fk_instest_inserzioni;
ALTER TABLE instest ADD CONSTRAINT fk_instest_inserzioni FOREIGN KEY (idInserzione) REFERENCES inserzioni(codice);
ALTER TABLE instest DROP FOREIGN KEY fk_instest_testate;
ALTER TABLE instest ADD CONSTRAINT fk_instest_testate FOREIGN KEY (idTestata) REFERENCES testate(idTestata);

ALTER TABLE insaz DROP FOREIGN KEY fk_insaz_aziende;
ALTER TABLE insaz ADD CONSTRAINT fk_insaz_aziende FOREIGN KEY (idAzienda) REFERENCES aziende(idAzienda);
ALTER TABLE insaz DROP FOREIGN KEY fk_insaz_inserzioni;
ALTER TABLE insaz ADD CONSTRAINT fk_insaz_inserzioni FOREIGN KEY (idInserzione) REFERENCES inserzioni(codice);

/* Rimuovo la chiave primaria dai due attributi e aggiungo un indice unico, tramite UNIQUE INDEX, così da mantenere l'unicità dei valori */
ALTER TABLE inspriv DROP FOREIGN KEY fk_inspriv_privati;
ALTER TABLE inspriv DROP FOREIGN KEY fk_inspriv_inserzioni;
ALTER TABLE inspriv DROP PRIMARY KEY;
ALTER TABLE inspriv MODIFY COLUMN idPrivato CHAR(3);
ALTER TABLE inspriv MODIFY COLUMN idInserzione CHAR(6);
ALTER TABLE inspriv ADD UNIQUE INDEX unique_priv_inserzione (idPrivato, idInserzione);
ALTER TABLE inspriv ADD CONSTRAINT fk_inspriv_privati FOREIGN KEY (idPrivato) REFERENCES privati(idPrivato);
ALTER TABLE inspriv ADD CONSTRAINT fk_inspriv_inserzioni FOREIGN KEY (idInserzione) REFERENCES inserzioni(codice) ON UPDATE SET NULL ON DELETE SET NULL;

/* Query n. 6*/
SELECT nome FROM testate;

/* Query n. 7*/
SELECT * FROM redattori;

/* Query n. 8*/
SELECT nome, cognome FROM redattori;

/* Query n. 9*/
SELECT nome, cognome, email FROM redattori;

/* Query n. 10*/
SELECT * FROM redattori WHERE email LIKE "a%";

/* Query n. 11*/
SELECT * FROM redattori WHERE email LIKE "%@%";

/* Query n. 12*/
SELECT * FROM redattori WHERE email NOT LIKE "%@%";

/* Query n. 13*/
SELECT nomeComitato, indirizzoWeb FROM redazioni WHERE indirizzoWeb IS NOT NULL;

/* Query n. 14*/
SELECT testo, codice FROM inserzioni WHERE categoria = 'Tennis';

/* Query n. 15*/
SELECT testo, codice FROM inserzioni WHERE testo REGEXP '\\bpaesi\\b';

/* Query n. 16*/
SELECT testo, codice FROM inserzioni WHERE testo REGEXP '\\btennis\\b' AND testo LIKE '%pop%';

/* Query n. 17*/
SELECT testo, codice FROM inserzioni WHERE testo LIKE '%cidi%';

/* Query n. 18*/
SELECT * FROM privati;

/* Query n. 19*/
SELECT * FROM privati WHERE CAP = '76125' OR CAP = '70100';

/* Query n. 20*/
SELECT * FROM aziende WHERE telefono LIKE '%556%';


/* Esercitazione n.3 */

ALTER TABLE privati ADD COLUMN eta INTEGER;
ALTER TABLE privati ADD COLUMN numero_civico INTEGER;

UPDATE privati SET eta = 23, numero_civico = 3 WHERE idPrivato = '001';
UPDATE privati SET eta = 33, numero_civico = 5 WHERE idPrivato = '002';
UPDATE privati SET eta = 43, numero_civico = 21 WHERE idPrivato = '003';
UPDATE privati SET eta = 24, numero_civico = 7 WHERE idPrivato = '004';
UPDATE privati SET eta = 34, numero_civico = 11 WHERE idPrivato = '005';
UPDATE privati SET eta = 44, numero_civico = 10 WHERE idPrivato = '006';
UPDATE privati SET eta = 25, numero_civico = 45 WHERE idPrivato = '007';
UPDATE privati SET eta = 35, numero_civico = 57 WHERE idPrivato = '008';
UPDATE privati SET eta = 45, numero_civico = 100 WHERE idPrivato = '009';
UPDATE privati SET eta = 55, numero_civico = 98 WHERE idPrivato = '010';

ALTER TABLE aziende ADD COLUMN numero_civico INTEGER;
ALTER TABLE aziende ADD COLUMN anno_fondazione YEAR;

UPDATE aziende set numero_civico = 5, anno_fondazione = 1980 WHERE idAzienda = 'A0001';
UPDATE aziende set numero_civico = 1, anno_fondazione = 1990 WHERE idAzienda = 'A0002';
UPDATE aziende set numero_civico = 24, anno_fondazione = 1998 WHERE idAzienda = 'A0003';
UPDATE aziende set numero_civico = 7, anno_fondazione = 2000 WHERE idAzienda = 'A0004';
UPDATE aziende set numero_civico = 46, anno_fondazione = 1999 WHERE idAzienda = 'A0005';
UPDATE aziende set numero_civico = 91, anno_fondazione = 2012 WHERE idAzienda = 'A0006';
UPDATE aziende set numero_civico = 76, anno_fondazione = 1965 WHERE idAzienda = 'A0007';
UPDATE aziende set numero_civico = 42, anno_fondazione = 2020 WHERE idAzienda = 'A0008';
UPDATE aziende set numero_civico = 11, anno_fondazione = 1973 WHERE idAzienda = 'A0009';
UPDATE aziende set numero_civico = 10, anno_fondazione = 2025 WHERE idAzienda = 'A0010';

/* Query n. 21 */
SELECT nomeAzienda FROM aziende;

/* Query n. 22 */
SELECT nomeAzienda FROM aziende WHERE anno_fondazione < 1980;

/* Query n. 23 */
SELECT nomeAzienda FROM aziende WHERE anno_fondazione > 1998;

/* Query n. 24 */
SELECT nomeAzienda FROM aziende WHERE anno_fondazione BETWEEN 1980 AND 1998;

/* Query n. 25 */
SELECT idPrivato, cognome, nome, via, CAP, email, eta, numero_civico FROM privati;

/* Query n. 26 */
SELECT cognome, nome, numero_civico FROM privati WHERE numero_civico > 20;

/* Query n. 27 */
SELECT cognome, nome, numero_civico FROM privati WHERE numero_civico = 10 OR numero_civico = 15;

/* Query n. 28 */
SELECT nome, cognome, via, numero_civico, CAP as Codice_Avviamento_Postale FROM privati WHERE numero_civico BETWEEN 15 AND 30;

/* Query n. 29 */
SELECT nomeAzienda, CapitaleSociale, (CapitaleSociale / 2) as Plafond_max_disponibile FROM aziende;


/* Query n. 30 */
SELECT nome, eta FROM privati WHERE eta < 30;

/* Query n. 31 */
/* Ho modificato m t in m a cosi da ottenere un risultato */
SELECT nomeComitato FROM redazioni WHERE nomeComitato LIKE '%m_a%';

/* Query n. 32 */
CREATE TABLE privatiGiovani LIKE privati;

/* Query n. 33 */
INSERT INTO privatiGiovani (idPrivato, cognome, nome, via, CAP, email, eta, numero_civico) SELECT idPrivato, cognome, nome, via, CAP, email, eta, numero_civico FROM privati WHERE eta < 30;

SELECT * FROM privatiGiovani;

/* Query n. 34 */
/* Ho modificato la lettera con S in modo che la query produca dei risultati */
UPDATE privatiGiovani SET cognome = 'Rossi' WHERE cognome LIKE 'S%';

/* Query n. 35 */
/* Ho modificato la sottostringa da aur a arc in modo che la query produca dei risultati */
UPDATE privatiGiovani SET nome = 'Arnold' WHERE nome LIKE '%arc%';

SELECT * FROM privatiGiovani;

/* Query n. 36 */
/* Ho modificato il nome da Arnold a Girogio in modo che la query produca dei risultati */
SELECT cognome, nome as Nick, eta FROM privati WHERE nome = 'Giorgio';

/* Query n. 37 */
SELECT CONCAT(cognome, nome) as Pilota, eta FROM privati WHERE cognome = 'Rossi';

/* Query n. 38 */
/* Ho sostituito 080 con 392 in modo che la query produca dei risultati */
SELECT * FROM aziende WHERE telefono LIKE '392%';


/* Parte 4 */
/* Metto il numero civico di alcune aziende a null in modo che la query n.39 produca dei risultati */
UPDATE aziende set numero_civico = NULL where idAzienda = 'A0004';
UPDATE aziende set numero_civico = NULL where idAzienda = 'A0002';
UPDATE aziende set numero_civico = NULL where idAzienda = 'A0007';

/* Query n. 39 */
SELECT nomeAzienda, numero_civico FROM aziende WHERE numero_civico > 15 OR numero_civico IS NULL;

/* Query n.40 */
/* Metto l'anno di fondazione di alcune aziende a NULL in modo che la query n.40 produca dei risultati */
UPDATE aziende set anno_fondazione = NULL where idAzienda = 'A0004';
UPDATE aziende set anno_fondazione = NULL where idAzienda = 'A0005';

SELECT nomeAzienda, anno_fondazione FROM aziende WHERE anno_fondazione < 1980 OR anno_fondazione IS NULL;

/* Query n.41 */
SELECT nomeAzienda, anno_fondazione FROM aziende WHERE (anno_fondazione BETWEEN 1980 AND 1998) OR anno_fondazione IS NULL;

/* Query n.42 */
SELECT codice, testo, categoria FROM inserzioni;

/* Query n.43 */
SELECT idAzienda, idInserzione FROM insaz;

/* Query n.44 */
SELECT insaz.idInserzione, aziende.nomeAzienda, aziende.referente, aziende.telefono FROM insaz CROSS JOIN aziende;

/* Query n.45 */
SELECT
	insaz.idInserzione,
	inserzioni.testo, inserzioni.categoria,
	insaz.idAzienda,
	aziende.referente, aziende.telefono
FROM
	insaz CROSS JOIN inserzioni CROSS JOIN aziende;

/* Query n.46 */
SELECT
	IA.idInserzione,
	pubblicazioni.testo, pubblicazioni.categoria,
	IA.idAzienda,
	elenco_aziende.referente, elenco_aziende.telefono
FROM
	insaz as IA CROSS JOIN inserzioni as pubblicazioni CROSS JOIN aziende as elenco_aziende;

/* Query n.47 */
SELECT
	IA.idInserzione as codice_articolo,
	pubblicazioni.testo as descrizione, pubblicazioni.categoria,
	IA.idAzienda,
	elenco_aziende.referente, elenco_aziende.telefono
FROM
	insaz as IA CROSS JOIN inserzioni as pubblicazioni CROSS JOIN aziende as elenco_aziende;

/* Query n.48 */
/* Ho modificato il capitale sociale da 18000000 a 180000 in modo che la query produca dei risultati*/
SELECT
	IA.idInserzione as codice_articolo,
	pubblicazioni.testo as descrizione, pubblicazioni.categoria,
	IA.idAzienda,
	elenco_aziende.referente, elenco_aziende.telefono, elenco_aziende.CapitaleSociale
FROM
	insaz as IA CROSS JOIN inserzioni as pubblicazioni CROSS JOIN aziende as elenco_aziende
WHERE
	elenco_aziende.CapitaleSociale > 180000;

/* Query n.49 */
SELECT nome FROM privati;

/* Query n.50 */
/* Ho modificato il nome di un privato in modo che la query produca dei risultati */
UPDATE privati SET nome = 'Giorgio' WHERE idPrivato = '008';
SELECT DISTINCT nome FROM privati;

/* Query n.51 */
SELECT
	insaz.idInserzione,
	inserzioni.testo,
	inserzioni.categoria,
	insaz.idAzienda,
	aziende.referente,
	aziende.telefono
FROM
	insaz NATURAL JOIN (
		SELECT
			inserzioni.codice as idInserzione,
			inserzioni.testo,
			inserzioni.categoria
		FROM
			inserzioni
	) as inserzioni
	NATURAL JOIN
		aziende;

SELECT
	IA.idInserzione,
	pubblicazioni.testo,
	pubblicazioni.categoria,
	IA.idAzienda,
	elenco_aziende.referente,
	elenco_aziende.telefono
FROM
	insaz as IA NATURAL JOIN (
		SELECT
			inserzioni.codice as idInserzione,
			inserzioni.testo,
			inserzioni.categoria
		FROM
			inserzioni
	) as pubblicazioni
	NATURAL JOIN
		aziende as elenco_aziende;

SELECT
	IA.idInserzione as codice_articolo,
	pubblicazioni.testo as descrizione,
	pubblicazioni.categoria,
	IA.idAzienda,
	elenco_aziende.referente,
	elenco_aziende.telefono
FROM
	insaz as IA NATURAL JOIN (
		SELECT
			inserzioni.codice as idInserzione,
			inserzioni.testo,
			inserzioni.categoria
		FROM
			inserzioni
	)	as pubblicazioni
	NATURAL JOIN
		aziende as elenco_aziende;

SELECT
	IA.idInserzione as codice_articolo,
	pubblicazioni.testo as descrizione,
	pubblicazioni.categoria,
	IA.idAzienda,
	elenco_aziende.referente,
	elenco_aziende.telefono,
	elenco_aziende.CapitaleSociale
FROM
	insaz as IA
	NATURAL JOIN (
			SELECT
				inserzioni.codice as idInserzione,
				inserzioni.testo,
				inserzioni.categoria
			FROM
				inserzioni
		) as pubblicazioni
	NATURAL JOIN
		aziende as elenco_aziende
WHERE
	elenco_aziende.CapitaleSociale > 180000;

/* Query n.52 */
SELECT
	insaz.idInserzione,
	inserzioni.testo,
	inserzioni.categoria,
	insaz.idAzienda,
	aziende.referente,
	aziende.telefono
FROM
	insaz JOIN
		inserzioni ON insaz.idInserzione = inserzioni.codice
	JOIN
		aziende ON insaz.idAzienda = aziende.idAzienda;

SELECT
	IA.idInserzione,
	pubblicazioni.testo,
	pubblicazioni.categoria,
	IA.idAzienda,
	elenco_aziende.referente,
	elenco_aziende.telefono
FROM
	insaz as IA JOIN
		inserzioni as pubblicazioni ON IA.idInserzione = pubblicazioni.codice
	JOIN
		aziende as elenco_aziende ON IA.idAzienda = elenco_aziende.idAzienda;

erno del tSELECT
	IA.idInserzione as codice_articolo,
	pubblicazioni.testo as descrizione,
	pubblicazioni.categoria,
	IA.idAzienda,
	elenco_aziende.referente,
	elenco_aziende.telefono
FROM
	insaz as IA JOIN
		inserzioni as pubblicazioni ON IA.idInserzione = pubblicazioni.codice
	JOIN
		aziende as elenco_aziende ON IA.idAzienda = elenco_aziende.idAzienda;

SELECT
	IA.idInserzione as codice_articolo,
	pubblicazioni.testo as descrizione,
	pubblicazioni.categoria,
	IA.idAzienda,
	elenco_aziende.referente,
	elenco_aziende.telefono,
	elenco_aziende.CapitaleSociale
FROM
	insaz as IA JOIN
		inserzioni as pubblicazioni ON IA.idInserzione = pubblicazioni.codice
	JOIN
		aziende as elenco_aziende ON IA.idAzienda = elenco_aziende.idAzienda
WHERE
	elenco_aziende.CapitaleSociale > 180000;

/* Query n.53 */
SELECT
	insaz.idInserzione,
	inserzioni.testo,
	inserzioni.categoria,
	insaz.idAzienda,
	aziende.referente,
	aziende.telefono
FROM
	insaz CROSS JOIN
		inserzioni
	CROSS JOIN
		aziende
ORDER BY telefono;

/* Query n. 54 */
SELECT
	insaz.idInserzione,
	inserzioni.testo,
	inserzioni.categoria,
	insaz.idAzienda,
	aziende.referente,
	aziende.telefono
FROM
	insaz CROSS JOIN
		inserzioni
	CROSS JOIN
		aziende
ORDER BY telefono DESC;

/* Query n. 55 */
SELECT
	aziende.nomeAzienda,
	aziende.CAP
FROM
	aziende;

/* Query n.56 */
SELECT
	aziende.nomeAzienda,
	aziende.CAP,
	citta.provincia,
	citta.citta
FROM
	aziende JOIN citta ON aziende.CAP = citta.CAP;

/* Query n.57 */
SELECT
	privati.cognome,
	privati.nome,
	privati.CAP
FROM
	privati;

/* Query n.58 */
SELECT
	privati.cognome,
	privati.nome,
	privati.CAP,
	citta.provincia,
	citta.citta
FROM
	privati JOIN citta ON privati.CAP = citta.CAP;

/* Query n.59 */
SELECT DISTINCT
	citta.CAP,
	citta.provincia,
	citta.citta,
	aziende.nomeAzienda,
	privati.nome,
	privati.cognome
FROM
	citta JOIN
		aziende ON citta.CAP = aziende.CAP
	JOIN
		privati ON citta.CAP = privati.CAP;

/* Query n.60 */
/* Ho modificato il cognome che inizia con R o F in modo che la query produca dei risultati */
SELECT
	privati.cognome,
	privati.nome,
	inspriv.idInserzione
FROM
	privati JOIN inspriv ON privati.idPrivato = inspriv.idPrivato
WHERE
	cognome LIKE 'R%' OR cognome LIKE 'F%';

/* Query n. 61 */
SELECT
	privati.cognome,
	privati.nome,
	inspriv.idInserzione,
	inserzioni.categoria
FROM
	inspriv JOIN
		privati ON inspriv.idPrivato = privati.idPrivato
	JOIN
		inserzioni ON inspriv.idInserzione = inserzioni.codice
WHERE
	cognome LIKE 'R%' OR cognome LIKE 'F%';

/* Query n. 62 */
SELECT
	privati.cognome,
	privati.nome,
	inspriv.idInserzione,
	inserzioni.categoria,
	inserzioni.testo
FROM
	inspriv JOIN
		privati ON inspriv.idPrivato = privati.idPrivato
	JOIN
		inserzioni ON inspriv.idInserzione = inserzioni.codice
WHERE
	cognome LIKE 'R%' OR cognome LIKE 'F%';

/* Query n. 63 */
SELECT
	privati.nome as nome_privato,
	testate.nome as nome_testata
FROM
	inspriv JOIN
		privati ON inspriv.idPrivato = privati.idPrivato
	JOIN
		instest ON inspriv.idInserzione = instest.idInserzione
	JOIN
		testate ON instest.idTestata = testate.idTestata;

/* Query n. 64 */
SELECT
	privati.nome as nome_privato,
	testate.nome as nome_testata,
	redazioni.nomeComitato
FROM
	inspriv JOIN
		privati ON inspriv.idPrivato = privati.idPrivato
	JOIN
		instest ON inspriv.idInserzione = instest.idInserzione
	JOIN
		testate ON instest.idTestata = testate.idTestata
	JOIN
		redazioni ON testate.redazione = redazioni.idRedazione;

/* Query n. 65 */
SELECT
	privati.nome as nome_privato,
	testate.nome as nome_testata,
	redazioni.nomeComitato,
	redattori.nome as nome_redattore
FROM
	inspriv JOIN
		privati ON inspriv.idPrivato = privati.idPrivato
	JOIN
		instest ON inspriv.idInserzione = instest.idInserzione
	JOIN
		testate ON instest.idTestata = testate.idTestata
	JOIN
		redazioni ON testate.redazione = redazioni.idRedazione
	JOIN
		redazRedat ON redazioni.idRedazione = redazRedat.idRedazione
	JOIN
		redattori ON redazRedat.idRedattori = redattori.idRedattori;

/* Query n. 66 */
/* Ho modificato il cognome che inizia con la lettera R o F in modo che la query produca dei risultati */
SELECT
	privati.nome as nome_privato,
	privati.cognome as cognome_privato,
	testate.nome as nome_testata,
	redazioni.nomeComitato,
	redattori.nome as nome_redattore
FROM
	inspriv JOIN
		privati ON inspriv.idPrivato = privati.idPrivato
	JOIN
		instest ON inspriv.idInserzione = instest.idInserzione
	JOIN
		testate ON instest.idTestata = testate.idTestata
	JOIN
		redazioni ON testate.redazione = redazioni.idRedazione
	JOIN
		redazRedat ON redazioni.idRedazione = redazRedat.idRedazione
	JOIN
		redattori ON redazRedat.idRedattori = redattori.idRedattori
WHERE
	privati.cognome LIKE 'R%' OR privati.cognome LIKE 'F%';

/* Query n. 67 */
SELECT
	inserzioni.testo,
	inserzioni.categoria
FROM
	inserzioni JOIN categorie ON inserzioni.categoria = categorie.idCategoria
WHERE
	categorie.categoriaPadre IS NULL;

/* Query n. 68 */
SELECT
	COUNT(inserzioni.testo) as num_inserzioni
FROM
	inserzioni JOIN categorie ON inserzioni.categoria = categorie.idCategoria
WHERE
	categorie.categoriaPadre IS NULL;

/* Query n. 69 */
ALTER TABLE insaz ADD COLUMN costo INTEGER;

/* Query n. 70 */
UPDATE insaz SET costo = 30 WHERE idAzienda = 'A0001' AND idInserzione = 'IN008';
UPDATE insaz SET costo = 35 WHERE idAzienda = 'A0002' AND idInserzione = 'IN009';
UPDATE insaz SET costo = 33 WHERE idAzienda = 'A0003' AND idInserzione = 'IN010';
UPDATE insaz SET costo = 41 WHERE idAzienda = 'A0004' AND idInserzione = 'IN011';
UPDATE insaz SET costo = 42 WHERE idAzienda = 'A0005' AND idInserzione = 'IN012';
UPDATE insaz SET costo = 50 WHERE idAzienda = 'A0006' AND idInserzione = 'IN013';
UPDATE insaz SET costo = 47 WHERE idAzienda = 'A0007' AND idInserzione = 'IN014';
UPDATE insaz SET costo = 37 WHERE idAzienda = 'A0008' AND idInserzione = 'IN015';
UPDATE insaz SET costo = 43 WHERE idAzienda = 'A0009' AND idInserzione = 'IN001';
UPDATE insaz SET costo = 43 WHERE idAzienda = 'A0010' AND idInserzione = 'IN002';



/* Query n. 71 */
/* Ho inserito altri valori in insaz cosi che la query produca maggiori risultati */
INSERT INTO insaz (idAzienda, idInserzione, costo) VALUES ('A0001', 'IN003', 44);
INSERT INTO insaz (idAzienda, idInserzione, costo) VALUES ('A0001', 'IN004', 50);

/* Ho modificato il codice dell'aziende con  */
SELECT
	insaz.idAzienda,
	SUM(insaz.costo) as costo_inserzioni
FROM
	insaz
WHERE
	insaz.idAzienda = 'A0001';

/* Query n. 72 */
SELECT * FROM inserzioni;

/* Query n. 73 */
SELECT COUNT(*) as num_inserzioni FROM inserzioni;

/* Query n. 74 */
/* Ho modificato la stringa da affa a atta in modo che la query produca dei risultati */
SELECT * FROM inserzioni WHERE inserzioni.testo LIKE '%atta%';

/* Query n. 75 */
SELECT COUNT(*) as num_inserzioni FROM inserzioni WHERE inserzioni.testo LIKE '%atta%';

/* Query n. 76 */
SELECT
	insaz.costo,
	insaz.idInserzione as inserzione_az
FROM
	insaz
UNION SELECT
	inspriv.idPrivato,
	inspriv.idInserzione
FROM
	inspriv;


/* Query n. 77 */
SELECT SUM(num_ins) as num_ins FROM (
	SELECT
		COUNT(insaz.idInserzione) as num_ins
	FROM insaz
	UNION SELECT
		COUNT(inspriv.idInserzione) as num_ins
	FROM
		inspriv
) as count_ins;

/* Query n. 78 */
SELECT
		COUNT(insaz.idInserzione) as num_ins
	FROM insaz
	UNION SELECT
		COUNT(inspriv.idInserzione) as num_ins
	FROM
		inspriv;


/* Query n. 79 */
SELECT
	COUNT(inserzioni.codice) as num_ins,
	inserzioni.categoria
FROM inserzioni
GROUP BY categoria;

/* Query n. 80 */
SELECT
	inserzioni.codice,
	inserzioni.testo,
	inserzioni.categoria,
	categorie.categoriaPadre
FROM
	inserzioni JOIN categorie ON inserzioni.categoria = categorie.idCategoria
WHERE
	categorie.categoriaPadre IS NOT NULL;

/* Query n. 81 */
SELECT
	COUNT(inserzioni.codice) as num_ins,
	inserzioni.categoria
FROM inserzioni
GROUP BY categoria;

/* Query n. 82 */
SELECT
	COUNT(instest.idInserzione) as num_ins,
	instest.idTestata
FROM instest
GROUP BY instest.idTestata;

/* Query n. 83 */
SELECT
	COUNT(instest.idTestata) as num_testate,
	instest.idInserzione
FROM instest
GROUP BY instest.idInserzione;


/* Query n. 84 */
SELECT
	insaz.idAzienda,
	insaz.costo,
	insaz.idInserzione,
	inserzioni.testo
FROM
	insaz JOIN inserzioni ON insaz.idInserzione = inserzioni.codice
WHERE insaz.costo < 35;

/* Query n. 85 */
SELECT
	COUNT(insaz.idInserzione) as num_ins
FROM insaz
WHERE insaz.costo < 35;

/* Query n. 86 */
SELECT
	COUNT(privati.idPrivato) as num_priv,
	citta.citta
FROM
	privati JOIN citta ON privati.CAP = citta.CAP
WHERE citta.citta NOT LIKE 'Putignano'
GROUP BY citta.citta;

/* Query n. 87 */
SELECT
	privati.nome,
	privati.cognome,
	citta.citta
FROM
	privati JOIN citta ON privati.CAP = citta.CAP
WHERE citta.citta LIKE 'Bari'
ORDER BY privati.nome;

/* Query n. 88 */
SELECT
	privati.nome,
	AVG(privati.eta) as eta_media
FROM
	privati
GROUP BY privati.nome;

/* Query n. 89 */
SELECT
	privati.nome,
	privati.eta
FROM
	privati
ORDER BY privati.eta DESC
LIMIT 1;

/* Query n. 90 */
SELECT
	insaz.idInserzione,
	insaz.costo
FROM insaz
ORDER BY
	insaz.costo,
	insaz.idInserzione DESC;

/* Query n. 91 */
SELECT
	insaz.idInserzione,
	insaz.costo
FROM insaz
ORDER BY
	insaz.costo DESC,
	insaz.idInserzione DESC;

/* Query n. 92 */
SELECT
	inserzioni.codice,
	inserzioni.testo
FROM inserzioni;

/* Query n. 93 */
SELECT
	insaz.idAzienda,
	inserzioni.codice,
	inserzioni.testo
FROM insaz JOIN inserzioni ON insaz.idInserzione = inserzioni.codice;

/* Query n. 94 */
SELECT
	insaz.idAzienda,
	aziende.referente,
	inserzioni.codice,
	inserzioni.testo
FROM
	insaz JOIN
		inserzioni ON insaz.idInserzione = inserzioni.codice
	JOIN
		aziende ON insaz.idAzienda = aziende.idAzienda;

/* Query n. 95 */
SELECT
	insaz.idAzienda,
	aziende.referente,
	aziende.telefono as referente_tel,
	citta.citta,
	inserzioni.codice,
	inserzioni.testo
FROM
	insaz JOIN
		inserzioni ON insaz.idInserzione = inserzioni.codice
	JOIN
		aziende ON insaz.idAzienda = aziende.idAzienda
	JOIN
		citta ON aziende.CAP = citta.CAP;

/* Query n. 96 */
SELECT
	inspriv.idPrivato,
	inserzioni.codice,
	inserzioni.testo
FROM inspriv JOIN inserzioni ON inspriv.idInserzione = inserzioni.codice;

/* Query n. 97 */
SELECT
	inspriv.idPrivato,
	privati.nome,
	inserzioni.codice,
	inserzioni.testo
FROM
	inspriv JOIN
		inserzioni ON inspriv.idInserzione = inserzioni.codice
	JOIN
		privati ON inspriv.idPrivato = privati.idPrivato;

/* Query n. 98 */
SELECT
	COUNT(insaz.idInserzione) as num_ins_azienda,
	testate.nome as nome_testata
FROM
	insaz JOIN
		instest ON insaz.idInserzione = instest.idInserzione
	JOIN
		testate ON instest.idTestata = testate.idTestata
GROUP BY testate.nome
ORDER BY COUNT(instest.idInserzione) DESC
LIMIT 1;
