DROP DATABASE IF EXISTS esercitazione_esame;
CREATE DATABASE IF NOT EXISTS esercitazione_esame;
USE esercitazione_esame;

CREATE TABLE IF NOT EXISTS Utente(
	CodUtente CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	DataNascita DATE,
	DataIscrizione DATE,
	CONSTRAINT PRIMARY KEY(CodUtente)
);

CREATE TABLE IF NOT EXISTS Libro(
	CodLibro CHAR(5) NOT NULL,
	Titolo VARCHAR(30),
	Autore VARCHAR(30),
	AnnoPubblicazione YEAR,
	CONSTRAINT PRIMARY KEY(CodLibro)
);

CREATE TABLE IF NOT EXISTS Prestito(
	CodUtente CHAR(5) NOT NULL,
	CodLibro CHAR(5) NOT NULL,
	DataPrestito DATE,
	DataRestituzione DATE,
	CONSTRAINT PRIMARY KEY(CodUtente, CodLibro),
	CONSTRAINT fk_prestito_utente FOREIGN KEY(CodUtente) REFERENCES Utente(CodUtente),
	CONSTRAINT fk_prestito_libro FOREIGN KEY(CodLibro) REFERENCES Libro(CodLibro)
);

CREATE TABLE IF NOT EXISTS Biblioteca(
	CodBiblioteca CHAR(5) NOT NULL,
	Nome VARCHAR(30),
	Citta VARCHAR(10),
	CONSTRAINT PRIMARY KEY(CodBiblioteca)
);

CREATE TABLE IF NOT EXISTS Catalogo(
	CodBiblioteca CHAR(5) NOT NULL,
	CodLibro CHAR(5) NOT NULL,
	NumeroCopie INTEGER,
	CONSTRAINT PRIMARY KEY(CodBiblioteca, CodLibro),
	CONSTRAINT fk_catalogo_biblioteca FOREIGN KEY(CodBiblioteca) REFERENCES Biblioteca(CodBiblioteca),
	CONSTRAINT fk_catalogo_libro FOREIGN KEY(CodLibro) REFERENCES Libro(CodLibro)
);

INSERT INTO Utente (CodUtente, Nome, Cognome, DataNascita, DataIscrizione) VALUES ('U0001', 'Alessandro', 'Carella',  '2006-01-14', '2025-02-01');
INSERT INTO Utente (CodUtente, Nome, Cognome, DataNascita, DataIscrizione) VALUES ('U0002', 'Pasquale', 'Gesualdo',  '2004-02-12', '2024-02-01');
INSERT INTO Utente (CodUtente, Nome, Cognome, DataNascita, DataIscrizione) VALUES ('U0003', 'Vincenzo', 'Festa',  '2005-10-11', '2023-02-01');
INSERT INTO Utente (CodUtente, Nome, Cognome, DataNascita, DataIscrizione) VALUES ('U0004', 'Mario', 'Rossi',  '2004-02-20', '2025-05-30');
INSERT INTO Utente (CodUtente, Nome, Cognome, DataNascita, DataIscrizione) VALUES ('U0005', 'Francesco', 'Andrisani',  '2002-01-14', '2025-01-10');
INSERT INTO Utente (CodUtente, Nome, Cognome, DataNascita, DataIscrizione) VALUES ('U0006', 'Mario', 'Bianchi',  '1964-02-16', '1998-02-11');



INSERT INTO Libro (CodLibro, Titolo, Autore, AnnoPubblicazione) VALUES ('L0001', '1984', 'George Orwell', 1950);
INSERT INTO Libro (CodLibro, Titolo, Autore, AnnoPubblicazione) VALUES ('L0002', 'Il Processo', 'Franz Kafka', 1960);
INSERT INTO Libro (CodLibro, Titolo, Autore, AnnoPubblicazione) VALUES ('L0003', 'Rompicapo in quattro giorni', 'Isaac Asimov', 1955);
INSERT INTO Libro (CodLibro, Titolo, Autore, AnnoPubblicazione) VALUES ('L0004', 'Io, Robot', 'Isaac Asimov', 1953);
INSERT INTO Libro (CodLibro, Titolo, Autore, AnnoPubblicazione) VALUES ('L0005', 'Wohpe', 'Salvatore Sanfilippo', 2020);
INSERT INTO Libro (CodLibro, Titolo, Autore, AnnoPubblicazione) VALUES ('L0006', 'Basi di Dati', 'Paolo Azteni', 2008);

INSERT INTO Prestito (CodUtente, CodLibro, DataPrestito, DataRestituzione) VALUES ('U0001', 'L0005', '2025-02-02', '2025-03-02');
INSERT INTO Prestito (CodUtente, CodLibro, DataPrestito, DataRestituzione) VALUES ('U0002', 'L0004', '2025-12-02', NULL);
INSERT INTO Prestito (CodUtente, CodLibro, DataPrestito, DataRestituzione) VALUES ('U0001', 'L0001', '2025-02-02', '2025-04-02');
INSERT INTO Prestito (CodUtente, CodLibro, DataPrestito, DataRestituzione) VALUES ('U0003', 'L0005', '2024-02-02', '2024-04-02');
INSERT INTO Prestito (CodUtente, CodLibro, DataPrestito, DataRestituzione) VALUES ('U0004', 'L0002', '2025-06-02', '2025-06-30');
INSERT INTO Prestito (CodUtente, CodLibro, DataPrestito, DataRestituzione) VALUES ('U0006', 'L0003', '1990-11-10', '1990-12-11');

INSERT INTO Biblioteca (CodBiblioteca, Nome, Citta) VALUES ('B0001', 'Trani Biblioteca', 'Trani');
INSERT INTO Biblioteca (CodBiblioteca, Nome, Citta) VALUES ('B0002', 'Biblioteca X', 'Trani');
INSERT INTO Biblioteca (CodBiblioteca, Nome, Citta) VALUES ('B0003', 'Bari Biblioteca', 'Bari');
INSERT INTO Biblioteca (CodBiblioteca, Nome, Citta) VALUES ('B0004', 'Firenze Biblioteca', 'Firenze');
INSERT INTO Biblioteca (CodBiblioteca, Nome, Citta) VALUES ('B0005', 'Torino Biblioteca', 'Torino');

INSERT INTO Catalogo (CodBiblioteca, CodLibro, NumeroCopie) VALUES ('B0001', 'L0001', 10);
INSERT INTO Catalogo (CodBiblioteca, CodLibro, NumeroCopie) VALUES ('B0001', 'L0005', 20);
INSERT INTO Catalogo (CodBiblioteca, CodLibro, NumeroCopie) VALUES ('B0002', 'L0001', 15);
INSERT INTO Catalogo (CodBiblioteca, CodLibro, NumeroCopie) VALUES ('B0003', 'L0002', 20);
INSERT INTO Catalogo (CodBiblioteca, CodLibro, NumeroCopie) VALUES ('B0004', 'L0003', 5);
INSERT INTO Catalogo (CodBiblioteca, CodLibro, NumeroCopie) VALUES ('B0005', 'L0004', 17);

-- Mostrare titolo e anno di pubblicazione di tutti i libri pubblicati tra l'anno 1950 e 1970 (Inclusi)
SELECT
	Libro.Titolo,
	Libro.AnnoPubblicazione
FROM Libro
WHERE Libro.AnnoPubblicazione BETWEEN 1950 AND 1970;

-- Mostrare nome e cognome degli utenti che hanno preso in prestito il libro dal titolo '1984'
SELECT
	Utente.Nome,
	Utente.Cognome
FROM
	Utente JOIN Prestito ON Utente.CodUtente = Prestito.CodUtente
JOIN
	Libro ON Libro.CodLibro = Prestito.CodLibro
WHERE Libro.Titolo LIKE '1984';

-- Per ogni prestito effettuato da un utente di cognome 'Carella', mostrare titolo del libroo, data del prestit, data di restituzine
SELECT
	Libro.Titolo,
	Prestito.DataPrestito,
	Prestito.DataRestituzione
FROM
	Libro JOIN Prestito ON Prestito.CodLibro = Libro.CodLibro
JOIN
	Utente ON Utente.CodUtente = Prestito.CodUtente
WHERE Utente.Cognome LIKE 'Carella';

-- Per ogni biblioteca e per ogni libro presente nel suo catalogo mostrare nome della biblioteca, titolo del libro e numero di copie
SELECT
	Biblioteca.Nome,
	Libro.Titolo,
	SUM(Catalogo.NumeroCopie) as NumeroCopie
FROM
	Biblioteca JOIN Catalogo ON Biblioteca.CodBiblioteca = Catalogo.CodBiblioteca
JOIN
	Libro ON Libro.CodLibro = Catalogo.CodLibro
ORDER BY Biblioteca.Nome, Libro.Titolo;

-- Mostrare l'insieme di tutti i cognomi degli utenti e tutti i titoli dei libri come un'unica colonna chiamata stringa in ordine alfabetico inverso

SELECT
	CONCAT(Utente.Cognome, ", ", Libro.Titolo) as stringa
FROM
	Utente JOIN Prestito ON Prestito.CodUtente = Utente.CodUtente
JOIN
	Libro ON Prestito.CodLibro = Libro.CodLibro;

-- Mostrare anno_evento e descrizione_evento relativi agli eventi accaduti tra il 1995 e il 2010 inclusi dove:
-- un evento può essere l'iscrizione di un utente oppure la pubblicazione di un libro
-- anno_evento corrisponde all'anno dell'evento
-- descrizione_evento corrisponde al cognome dell'tente o al titolo del libro
SELECT
	Utente.Cognome as descrizione_evento,
	YEAR(Utente.DataIscrizione) as anno_evento
FROM
	Utente
WHERE YEAR(Utente.DataIscrizione) BETWEEN 1995 AND 2010
UNION SELECT
	Libro.Titolo as descrizione_evento,
	Libro.AnnoPubblicazione as anno_evento
FROM
	Libro
WHERE
	Libro.AnnoPubblicazione BETWEEN 1995 AND 2010;

-- Mostrare titolo e anno di pubblicazione di ogni libro che sia stato preso in prestito da almeno un utente nato prima del 1970
SELECT
	Libro.Titolo,
	Libro.AnnoPubblicazione
FROM
	Libro JOIN Prestito ON Prestito.CodLibro = Libro.CodLibro
JOIN
	Utente ON Utente.CodUtente = Prestito.CodUtente
WHERE YEAR(Utente.DataNascita) < 1970;

-- Mostrare gli utenti che hanno preso in prestito tutti i libri presenti in biblioteca
SELECT
	Utente.Nome,
	Utente.Cognome
FROM
	Utente JOIN Prestito ON Utente.CodUtente = Prestito.CodUtente
GROUP BY Utente.CodUtente
HAVING COUNT(Prestito.CodLibro) = (
	SELECT COUNT(*)
	FROM Libro
);

-- Mostrare i libri che non sono mai stati prestati
SELECT
	Libro.Titolo
FROM Libro
WHERE NOT EXISTS (
	SELECT 1
	FROM Prestito
	WHERE Prestito.CodLibro = Libro.CodLibro
);

-- Mostrare gli utenti che hanno effettuato almeno 3 prestiti
SELECT
	Utente.Nome,
	Utente.Cognome,
	COUNT(Prestito.CodUtente) as NumPrestiti
FROM
	Utente JOIN Prestito ON Prestito.CodUtente = Utente.CodUtente
GROUP BY Utente.Nome, Utente.Cognome
HAVING NumPrestiti >= 3;

-- Per ogni biblioteca mostrare nome della biblioteca e numero totale di copie di libri presenti
SELECT
	Biblioteca.Nome,
	SUM(Catalogo.NumeroCopie) as NumeroTotaleCopie
FROM
	Biblioteca JOIN Catalogo ON Biblioteca.CodBiblioteca = Catalogo.CodBiblioteca
GROUP BY Biblioteca.Nome;

-- Mostrare per ogni biblioteca il libro con maggior numero di copie
SELECT
	Biblioteca.Nome,
	Libro.Titolo,
	Catalogo.NumeroCopie
FROM
	Biblioteca JOIN Catalogo ON Biblioteca.CodBiblioteca = Catalogo.CodBiblioteca
JOIN
	Libro ON Libro.CodLibro = Catalogo.CodLibro
WHERE Catalogo.NumeroCopie = (SELECT MAX(C2.NumeroCopie) FROM Catalogo C2 WHERE C2.CodBiblioteca = Catalogo.CodBiblioteca);

-- Mostrare gli Utenti che avevano più di 20 anni al momento del prestito
SELECT
	Utente.Nome,
	Utente.Cognome
FROM
	Utente JOIN Prestito ON Utente.CodUtente = Prestito.CodUtente
WHERE (YEAR(Prestito.DataPrestito) - YEAR(Utente.DataNascita)) >= 20;

-- Mostrare i libri prestati solo da utenti nati dopo il 1980
SELECT DISTINCT
	Libro.Titolo
FROM
	Libro
WHERE EXISTS  (
	SELECT 1
	FROM Prestito WHERE Prestito.CodLibro = Libro.CodLibro
)
AND NOT EXISTS (
	SELECT 1
	FROM Prestito JOIN Utente ON Prestito.CodUtente = Utente.CodUtente
	WHERE Prestito.CodLibro = Libro.CodLibro AND YEAR(Utente.DataNascita) <= 1980
);

-- Mostrare l'utente che ha effettuato il maggior numero di prestiti
SELECT
	Utente.Nome,
	Utente.Cognome
FROM
	Utente JOIN Prestito ON Utente.CodUtente = Prestito.CodUtente
GROUP BY Utente.Nome, Utente.Cognome, Utente.CodUtente
HAVING COUNT(Prestito.CodUtente) = (
	SELECT MAX(num_prestiti) FROM (
		SELECT COUNT(P2.CodUtente) as num_prestiti
		FROM Prestito P2
		GROUP BY P2.CodUtente
	) as prestiti_utente
);

-- Mostrare per ogni anno il numero di prestiti effettuati
SELECT
	YEAR(Prestito.DataPrestito) as AnnoPrestito,
	COUNT(*) as NumeroPrestitiTotale
FROM
	Prestito
GROUP BY AnnoPrestito;

-- Mostrare i libri che sono stati prestati più della media dei prestiti per libro
SELECT
	Libro.Titolo
FROM
	Libro JOIN Prestito ON Libro.CodLibro = Prestito.CodLibro
GROUP BY Libro.Titolo
HAVING COUNT(Prestito.CodLibro) > (
	SELECT AVG(num_prestiti) FROM (
		SELECT COUNT(*) as num_prestiti FROM Prestito P2 GROUP BY P2.CodLibro
	) prestiti_libro
);

-- Mostrare gli utenti che hanno sempre restituito i libri in tempo
SELECT
	Utente.Nome,
	Utente.Cognome
FROM Utente
WHERE NOT EXISTS (
	SELECT 1
	FROM Prestito
	WHERE Prestito.CodUtente = Utente.CodUtente AND Prestito.DataRestituzione IS NULL
);

-- Mostrare gli utenti che hanno preso in prestito almeno n libro pubblicato prima del 1960 e almeno uno dopo il 2000
SELECT DISTINCT
	Utente.Nome,
	Utente.Cognome
FROM
	Prestito P1 JOIN Prestito P2 ON P1.CodUtente = P2.CodUtente AND P1.CodLibro != P2.CodLibro
JOIN
	Libro L1 ON L1.CodLibro = P1.CodLibro
JOIN
	Libro L2 ON L2.CodLibro = P2.CodLibro
JOIN
	Utente ON Utente.CodUtente = P2.CodUtente
WHERE L1.AnnoPubblicazione < 1960 AND L2.AnnoPubblicazione > 2000;
