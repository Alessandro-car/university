DROP DATABASE IF EXISTS gestione_biblioteca;

CREATE DATABASE IF NOT EXISTS gestione_biblioteca;

USE gestione_biblioteca;

CREATE TABLE IF NOT EXISTS Autore (
	IdAutore CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	Nazionalita VARCHAR(15),
	AnnoNascita DATE,
	CONSTRAINT PRIMARY KEY(IdAutore)
);

CREATE TABLE IF NOT EXISTS Libro(
	ISBN CHAR(13) NOT NULL,
	Titolo VARCHAR(15),
	AnnoPubblicazione DATE,
	Genere VARCHAR(15),
	NumeroCopie INTEGER,
	CONSTRAINT PRIMARY KEY(ISBN)
);

CREATE TABLE IF NOT EXISTS Scrittura(
	IdAutore CHAR(5) NOT NULL,
	ISBN CHAR(13) NOT NULL,
	CONSTRAINT PRIMARY KEY(IdAutore, ISBN),
	CONSTRAINT fk_scrittura_autore FOREIGN KEY(IdAutore) REFERENCES Autore(IdAutore),
	CONSTRAINT fk_scrittura_libro FOREIGN KEY(ISBN) REFERENCES Libro(ISBN)
);

CREATE TABLE IF NOT EXISTS Utente(
	IdUtente CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	Email VARCHAR(255),
	DataIscrizione DATE,
	TipoAbbonamento ENUM('Base', 'Premium', 'Gold'),
	CONSTRAINT PRIMARY KEY(IdUtente)
);

CREATE TABLE IF NOT EXISTS Prestito(
	IdPrestito CHAR(5) NOT NULL,
	IdUtente CHAR(5),
	ISBN CHAR(13),
	DataPrestito DATE,
	DataRestituzionePrevista DATE,
	DataRestituzioneEffettiva DATE,
	Multa DECIMAL(5, 2),
	CONSTRAINT PRIMARY KEY(IdPrestito),
	CONSTRAINT fk_prestito_utente FOREIGN KEY(IdUtente) REFERENCES Utente(IdUtente),
	CONSTRAINT fk_prestito_libro FOREIGN KEY(ISBN) REFERENCES Libro(ISBN)
);
-- INSERT per la tabella Autore
INSERT INTO Autore (IdAutore, Nome, Cognome, Nazionalita, AnnoNascita) VALUES
('A0001', 'Umberto', 'Eco', 'Italiana', '1932-01-05'),
('A0002', 'Alessandro', 'Manzoni', 'Italiana', '1785-03-07'),
('A0003', 'George', 'Orwell', 'Britannica', '1903-06-25'),
('A0004', 'Jane', 'Austen', 'Britannica', '1775-12-16'),
('A0005', 'Gabriel', 'Garcia Marquez', 'Colombiana', '1927-03-06'),
('A0006', 'Italo', 'Calvino', 'Italiana', '1923-10-15'),
('A0007', 'Virginia', 'Woolf', 'Britannica', '1882-01-25'),
('A0008', 'Ernest', 'Hemingway', 'Americana', '1899-07-21'),
('A0009', 'Dante', 'Alighieri', 'Italiana', '1265-05-14'),
('A0010', 'Stephen', 'King', 'Americana', '1947-09-21');

-- INSERT per la tabella Libro (titoli accorciati per rispettare il limite di 15 caratteri)
INSERT INTO Libro (ISBN, Titolo, AnnoPubblicazione, Genere, NumeroCopie) VALUES
('9780156007524', 'Nome rosa', '1980-01-01', 'Giallo', 5),
('9788807881923', 'Promessi sposi', '1827-01-01', 'Storico', 8),
('9780451524935', '1984', '1949-06-08', 'Distopia', 6),
('9780141439518', 'Orgoglio', '1813-01-28', 'Romanzo', 4),
('9780060883287', 'Cent anni', '1967-05-30', 'Realismo', 3),
('9788804668527', 'Barone rampante', '1957-01-01', 'Fantastico', 7),
('9780156907392', 'Gita al faro', '1927-05-05', 'Modernismo', 2),
('9780684801223', 'Vecchio mare', '1952-09-01', 'Avventura', 5),
('9788811362210', 'Divina Commedia', '1321-01-01', 'Poesia', 10),
('9781501142970', 'It', '1986-09-15', 'Horror', 4),
('9780486284736', 'Persuasione', '1817-12-20', 'Romanzo', 3),
('9788806219864', 'Citta invisib', '1972-11-01', 'Fantastico', 6);

-- INSERT per la tabella Scrittura
INSERT INTO Scrittura (IdAutore, ISBN) VALUES
('A0001', '9780156007524'),
('A0002', '9788807881923'),
('A0003', '9780451524935'),
('A0004', '9780141439518'),
('A0004', '9780486284736'),
('A0005', '9780060883287'),
('A0006', '9788804668527'),
('A0006', '9788806219864'),
('A0007', '9780156907392'),
('A0008', '9780684801223'),
('A0009', '9788811362210'),
('A0010', '9781501142970');

-- INSERT per la tabella Utente
INSERT INTO Utente (IdUtente, Nome, Cognome, Email, DataIscrizione, TipoAbbonamento) VALUES
('U0001', 'Marco', 'Rossi', 'marco.rossi@email.it', '2023-01-15', 'Premium'),
('U0002', 'Laura', 'Bianchi', 'laura.bianchi@email.it', '2023-03-22', 'Base'),
('U0003', 'Giuseppe', 'Verdi', 'giuseppe.verdi@email.it', '2022-11-10', 'Gold'),
('U0004', 'Anna', 'Neri', 'anna.neri@email.it', '2024-01-05', 'Base'),
('U0005', 'Luca', 'Ferrari', 'luca.ferrari@email.it', '2023-07-18', 'Premium'),
('U0006', 'Giulia', 'Romano', 'giulia.romano@email.it', '2024-02-14', 'Gold'),
('U0007', 'Paolo', 'Colombo', 'paolo.colombo@email.it', '2023-05-30', 'Base'),
('U0008', 'Sofia', 'Ricci', 'sofia.ricci@email.it', '2022-09-03', 'Premium'),
('U0009', 'Andrea', 'Marino', 'andrea.marino@email.it', '2024-03-20', 'Base'),
('U0010', 'Elena', 'Greco', 'elena.greco@email.it', '2023-12-12', 'Gold');

-- INSERT per la tabella Prestito
INSERT INTO Prestito (IdPrestito, IdUtente, ISBN, DataPrestito, DataRestituzionePrevista, DataRestituzioneEffettiva, Multa) VALUES
('P0001', 'U0001', '9780156007524', '2024-01-10', '2024-01-24', '2024-01-23', 0.00),
('P0002', 'U0001', '9780451524935', '2024-02-05', '2024-02-19', '2024-02-25', 15.00),
('P0003', 'U0002', '9788807881923', '2024-01-15', '2024-01-29', '2024-01-28', 0.00),
('P0004', 'U0003', '9780141439518', '2024-03-01', '2024-03-15', '2024-03-14', 0.00),
('P0005', 'U0003', '9780060883287', '2024-03-20', '2024-04-03', '2024-04-10', 17.50),
('P0006', 'U0004', '9788804668527', '2024-04-10', '2024-04-24', NULL, NULL),
('P0007', 'U0005', '9780156007524', '2024-02-28', '2024-03-13', '2024-03-12', 0.00),
('P0008', 'U0005', '9788806219864', '2024-05-05', '2024-05-19', '2024-05-18', 0.00),
('P0009', 'U0006', '9780684801223', '2024-06-01', '2024-06-15', NULL, NULL),
('P0010', 'U0007', '9788811362210', '2024-03-15', '2024-03-29', '2024-04-05', 20.00),
('P0011', 'U0008', '9781501142970', '2024-04-20', '2024-05-04', '2024-05-03', 0.00),
('P0012', 'U0008', '9780141439518', '2024-06-10', '2024-06-24', '2024-07-01', 22.50),
('P0013', 'U0009', '9780156907392', '2024-05-15', '2024-05-29', '2024-05-27', 0.00),
('P0014', 'U0010', '9780060883287', '2024-07-01', '2024-07-15', NULL, NULL),
('P0015', 'U0001', '9788806219864', '2024-07-10', '2024-07-24', '2024-07-30', 18.00),
('P0016', 'U0003', '9780156007524', '2024-08-01', '2024-08-15', '2024-08-14', 0.00),
('P0017', 'U0005', '9780451524935', '2024-08-20', '2024-09-03', NULL, NULL),
('P0018', 'U0002', '9788804668527', '2024-06-20', '2024-07-04', '2024-07-03', 0.00),
('P0019', 'U0008', '9780486284736', '2024-09-01', '2024-09-15', '2024-09-14', 0.00),
('P0020', 'U0010', '9781501142970', '2024-09-10', '2024-09-24', '2024-10-05', 30.00);


SELECT
	Libro.Titolo,
	YEAR(Libro.AnnoPubblicazione) as AnnoPubblicazione
FROM
	Libro JOIN Scrittura ON Libro.ISBN = Scrittura.ISBN
JOIN
	Autore ON Autore.IdAutore = Scrittura.IdAutore
WHERE Autore.Nazionalita LIKE 'Italiana';

SELECT DISTINCT
	Utente.Nome,
	Utente.Cognome
FROM
	Utente JOIN Prestito ON Prestito.IdUtente = Utente.IdUtente
WHERE YEAR(DataPrestito) = 2024;

SELECT
	COUNT(*) as NumLibri,
	Libro.Genere
FROM Libro
GROUP BY Libro.Genere;

SELECT DISTINCT
	Utente.Nome,
	Utente.Cognome
FROM
	Utente JOIN Prestito ON Utente.IdUtente = Prestito.IdUtente
WHERE Prestito.DataRestituzioneEffettiva IS NULL;

SELECT
	Libro.Titolo
FROM Libro
WHERE Libro.NumeroCopie > 5;

SELECT
	Autore.Nome,
	Autore.Cognome,
	COUNT(Libro.Genere) as NumGeneri
FROM
	Autore JOIN Scrittura ON Scrittura.IdAutore = Autore.IdAutore
JOIN
	Libro ON Libro.ISBN = Scrittura.ISBN
GROUP BY Autore.IdAutore
HAVING NumGeneri >= 2;

SELECT
	Utente.Nome,
	Utente.Cognome,
	Utente.TipoAbbonamento,
	COUNT(Prestito.IdUtente) as NumPrestiti
FROM
	Prestito JOIN Utente ON Utente.IdUtente = Prestito.IdUtente
WHERE Utente.TipoAbbonamento LIKE 'Premium' OR Utente.TipoAbbonamento LIKE 'Gold'
GROUP BY Utente.IdUtente;

SELECT
	Libro.Titolo
FROM
	Libro LEFT JOIN Prestito ON Libro.ISBN = Prestito.ISBN
WHERE Prestito.IdPrestito IS NULL;

SELECT
	Utente.Nome,
	Utente.Cognome,
	SUM(Prestito.Multa) as TotaleMulta
FROM
	Prestito JOIN Utente ON Prestito.IdUtente = Utente.IdUtente
GROUP BY Utente.IdUtente
HAVING TotaleMulta > 50;

SELECT
	Libro.Titolo,
	COUNT(Prestito.ISBN) as NumPrestiti
FROM
	Prestito JOIN Libro ON Libro.ISBN = Prestito.ISBN
GROUP BY Libro.ISBN
ORDER BY NumPrestiti DESC
LIMIT 3;


SELECT
	L.Genere,
	CONCAT(Autore.Nome, " ", Autore.Cognome) AS NomeAutore,
	COUNT(Scrittura.ISBN) as NumeroLibri
FROM
	Libro L JOIN Scrittura ON Scrittura.ISBN = L.ISBN
JOIN
	Autore ON Autore.IdAutore = Scrittura.IdAutore
GROUP BY L.Genere, Autore.IdAutore
HAVING NumeroLibri = (
	SELECT MAX(NumLibriScritti) FROM (
		SELECT COUNT(Scrittura.ISBN) as NumLibriScritti, l1.Genere
			FROM Scrittura JOIN Libro l1 ON l1.ISBN = Scrittura.ISBN
			GROUP BY Scrittura.IdAutore, l1.Genere
	) as subquery
	WHERE subquery.Genere = L.Genere
)
ORDER BY COUNT(Scrittura.ISBN);


-- Test per la query 12
INSERT INTO Scrittura VALUES ('A0001', '9788804668527');  -- Eco co-autore di "Barone rampante"
INSERT INTO Scrittura VALUES ('A0001', '9788806219864');  -- Eco co-autore di "Citta invisib"

-- George Orwell e Ernest Hemingway collaborano su 2 libri
INSERT INTO Scrittura VALUES ('A0003', '9780684801223');  -- Orwell co-autore di "Vecchio mare"
INSERT INTO Scrittura VALUES ('A0008', '9780451524935');  -- Hemingway co-autore di "1984"

-- Jane Austen e Virginia Woolf collaborano su 3 libri
INSERT INTO Scrittura VALUES ('A0007', '9780141439518');  -- Woolf co-autore di "Orgoglio"
INSERT INTO Scrittura VALUES ('A0007', '9780486284736');  -- Woolf co-autore di "Persuasione"
INSERT INTO Scrittura VALUES ('A0004', '9780156907392');  -- Austen co-autore di "Gita al faro"

-- Stephen King e Gabriel Garcia Marquez collaborano su 2 libri
INSERT INTO Scrittura VALUES ('A0010', '9780060883287');  -- King co-autore di "Cent anni"
INSERT INTO Scrittura VALUES ('A0005', '9781501142970');

SELECT
	CONCAT(A1.Nome, " ", A1.Cognome) as PrimoAutore,
	CONCAT(A2.Nome, " ", A2.Cognome) as SecondoAutore,
	COUNT(*) as NumLibriScritti
FROM
	Scrittura S1 JOIN Scrittura S2 ON S1.IdAutore < S2.IdAutore AND S1.ISBN = S2.ISBN
JOIN
	Autore A1 ON A1.IdAutore = S1.IdAutore
JOIN
	Autore A2 ON A2.IdAutore = S2.IdAutore
GROUP BY PrimoAutore, SecondoAutore
HAVING NumLibriScritti >= 2
ORDER BY NumLibriScritti DESC;

SELECT
	YEAR(Prestito.DataRestituzioneEffettiva) as Anno,
	MONTH(Prestito.DataRestituzioneEffettiva) as Mese,
	AVG(DATEDIFF(Prestito.DataRestituzioneEffettiva, Prestito.DataPrestito)) as MediaGiorniPrestito
FROM
	Prestito
WHERE Prestito.DataRestituzioneEffettiva IS NOT NULL AND YEAR(Prestito.DataRestituzioneEffettiva) = 2024
GROUP BY Anno, Mese;

SELECT
	Utente.Nome, Utente.Cognome
FROM
	Prestito JOIN Utente ON Prestito.IdUtente = Utente.IdUtente
JOIN
	Libro ON Prestito.ISBN = Libro.ISBN
JOIN
	Scrittura ON Libro.ISBN = Scrittura.ISBN
JOIN
	Autore ON Scrittura.IdAutore = Autore.IdAutore
WHERE Autore.Nazionalita = 'Italiana'
GROUP BY Prestito.IdUtente, Autore.IdAutore
HAVING COUNT(Prestito.ISBN) = (
	SELECT COUNT(Libro.ISBN) as NumLibriScritti
	FROM Libro JOIN Scrittura ON Libro.ISBN = Scrittura.ISBN
	JOIN Autore A2 ON A2.IdAutore = Scrittura.IdAutore
	WHERE A2.IdAutore = Autore.IdAutore
	GROUP BY A2.IdAutore
);

SELECT
	Libro.Titolo,
	IFNULL(((
		SELECT COUNT(P2.IdPrestito)
		FROM Prestito P2
		WHERE P2.ISBN = Prestito.ISBN AND P2.Multa > 0
		GROUP BY P2.ISBN
	) / COUNT(Prestito.IdPrestito) * 100), 0) as PercentualePrestitiMulta
FROM
	Prestito JOIN Libro ON Prestito.ISBN = Libro.ISBN
WHERE Prestito.DataRestituzioneEffettiva IS NOT NULL
GROUP BY Prestito.ISBN;

SELECT
	Autore.Nome,
	Autore.Cognome,
	AVG(DATEDIFF(Prestito.DataRestituzioneEffettiva, Prestito.DataPrestito)) as TempoMedioPrestito
FROM
	Prestito JOIN Libro ON Prestito.ISBN = Libro.ISBN
JOIN
	Scrittura ON Scrittura.ISBN = Libro.ISBN
JOIN
	Autore ON Scrittura.IdAutore = Autore.IdAutore
WHERE
	Prestito.DataRestituzioneEffettiva IS NOT NULL
GROUP BY Autore.IdAutore
HAVING TempoMedioPrestito > (SELECT
	AVG(DATEDIFF(P2.DataRestituzioneEffettiva, P2.DataPrestito))
	FROM Prestito P2
	WHERE P2.DataRestituzioneEffettiva IS NOT NULL
);


INSERT INTO Prestito VALUES
('P0021', 'U0002', '9780156007524', '2024-01-26', '2024-02-09', '2024-02-08', 0.00);

-- U0004 prende in prestito 5 giorni dopo U0002
INSERT INTO Prestito VALUES
('P0022', 'U0004', '9780156007524', '2024-02-13', '2024-02-27', '2024-02-26', 0.00);

SELECT
	CONCAT(U1.Nome, " ", U1.Cognome) as PrimoUtente,
	CONCAT(U2.Nome, " ", U2.Cognome) as SecondoUtente,
	CONCAT(U3.Nome, " ", U3.Cognome) as TerzoUtente,
	Libro.Titolo
FROM
	Prestito P1 JOIN Prestito P2 ON P1.IdUtente < P2.IdUtente AND P1.ISBN = P2.ISBN
JOIN
	Prestito P3 ON P2.IdUtente < P3.IdUtente AND P3.ISBN = P2.ISBN
JOIN
	Utente U1 ON U1.IdUtente = P1.IdUtente
JOIN
	Utente U2 ON U2.IdUtente = P2.IdUtente
JOIN
	Utente U3 ON U3.IdUtente = P3.IdUtente
JOIN
	Libro ON Libro.ISBN = P3.ISBN
WHERE P1.DataRestituzioneEffettiva IS NOT NULL AND
			P2.DataRestituzioneEffettiva IS NOT NULL AND
			DATEDIFF(P2.DataPrestito, P1.DataRestituzioneEffettiva) BETWEEN 0 AND 7 AND
			DATEDIFF(P3.DataPrestito, P2.DataRestituzioneEffettiva) BETWEEN 0 AND 7;

INSERT INTO Prestito VALUES
('P0043', 'U0001', '9780451524935', '2024-01-05', '2024-01-19', '2024-01-18', 0.00);

-- U0002 lo prende 5 giorni dopo
INSERT INTO Prestito VALUES
('P0044', 'U0002', '9780451524935', '2024-01-23', '2024-02-06', '2024-02-05', 0.00);

-- U0003 lo prende 12 giorni dopo U0001
INSERT INTO Prestito VALUES
('P0045', 'U0003', '9780451524935', '2024-01-30', '2024-02-13', '2024-02-12', 0.00);

-- U0004 lo prende 20 giorni dopo U0001
INSERT INTO Prestito VALUES
('P0046', 'U0004', '9780451524935', '2024-02-07', '2024-02-21', '2024-02-20', 0.00);

-- Secondo libro: "Orgoglio" - stesso pattern
INSERT INTO Prestito VALUES
('P0047', 'U0001', '9780141439518', '2024-02-01', '2024-02-15', '2024-02-14', 0.00);

INSERT INTO Prestito VALUES
('P0048', 'U0002', '9780141439518', '2024-02-18', '2024-03-03', '2024-03-02', 0.00);

INSERT INTO Prestito VALUES
('P0049', 'U0003', '9780141439518', '2024-02-25', '2024-03-10', '2024-03-09', 0.00);

INSERT INTO Prestito VALUES
('P0050', 'U0005', '9780141439518', '2024-03-05', '2024-03-19', '2024-03-18', 0.00);

-- Terzo libro: "Nome rosa"
INSERT INTO Prestito VALUES
('P0051', 'U0001', '9780156007524', '2024-03-01', '2024-03-15', '2024-03-14', 0.00);

INSERT INTO Prestito VALUES
('P0052', 'U0002', '9780156007524', '2024-03-18', '2024-04-01', '2024-03-31', 0.00);

INSERT INTO Prestito VALUES
('P0053', 'U0004', '9780156007524', '2024-03-22', '2024-04-05', '2024-04-04', 0.00);

INSERT INTO Prestito VALUES
('P0054', 'U0006', '9780156007524', '2024-03-28', '2024-04-11', '2024-04-10', 0.00);

-- Quarto libro: "Persuasione"
INSERT INTO Prestito VALUES
('P0055', 'U0001', '9780486284736', '2024-04-01', '2024-04-15', '2024-04-14', 0.00);

INSERT INTO Prestito VALUES
('P0056', 'U0003', '9780486284736', '2024-04-17', '2024-05-01', '2024-04-30', 0.00);

INSERT INTO Prestito VALUES
('P0057', 'U0005', '9780486284736', '2024-04-24', '2024-05-08', '2024-05-07', 0.00);

INSERT INTO Prestito VALUES
('P0058', 'U0007', '9780486284736', '2024-04-28', '2024-05-12', '2024-05-11', 0.00);

-- Quinto libro: "Divina Commedia"
INSERT INTO Prestito VALUES
('P0059', 'U0001', '9788811362210', '2024-05-01', '2024-05-15', '2024-05-14', 0.00);

INSERT INTO Prestito VALUES
('P0060', 'U0004', '9788811362210', '2024-05-18', '2024-06-01', '2024-05-31', 0.00);

INSERT INTO Prestito VALUES
('P0061', 'U0006', '9788811362210', '2024-05-25', '2024-06-08', '2024-06-07', 0.00);

INSERT INTO Prestito VALUES
('P0062', 'U0008', '9788811362210', '2024-05-30', '2024-06-13', '2024-06-12', 0.00);
INSERT INTO Prestito VALUES
('P0063', 'U0002', '9788804668527', '2024-01-10', '2024-01-24', '2024-01-23', 0.00);

INSERT INTO Prestito VALUES
('P0064', 'U0003', '9788804668527', '2024-01-26', '2024-02-09', '2024-02-08', 0.00);

INSERT INTO Prestito VALUES
('P0065', 'U0005', '9788804668527', '2024-02-01', '2024-02-15', '2024-02-14', 0.00);

INSERT INTO Prestito VALUES
('P0066', 'U0007', '9788804668527', '2024-02-10', '2024-02-24', '2024-02-23', 0.00);

-- Libro 2: "Citta invisib"
INSERT INTO Prestito VALUES
('P0067', 'U0002', '9788806219864', '2024-02-15', '2024-02-29', '2024-02-28', 0.00);

INSERT INTO Prestito VALUES
('P0068', 'U0004', '9788806219864', '2024-03-02', '2024-03-16', '2024-03-15', 0.00);

INSERT INTO Prestito VALUES
('P0069', 'U0006', '9788806219864', '2024-03-08', '2024-03-22', '2024-03-21', 0.00);

INSERT INTO Prestito VALUES
('P0070', 'U0008', '9788806219864', '2024-03-15', '2024-03-29', '2024-03-28', 0.00);

-- Libro 3: "Vecchio mare"
INSERT INTO Prestito VALUES
('P0071', 'U0002', '9780684801223', '2024-03-20', '2024-04-03', '2024-04-02', 0.00);

INSERT INTO Prestito VALUES
('P0072', 'U0003', '9780684801223', '2024-04-05', '2024-04-19', '2024-04-18', 0.00);

INSERT INTO Prestito VALUES
('P0073', 'U0005', '9780684801223', '2024-04-12', '2024-04-26', '2024-04-25', 0.00);

INSERT INTO Prestito VALUES
('P0074', 'U0009', '9780684801223', '2024-04-18', '2024-05-02', '2024-05-01', 0.00);

-- Libro 4: "It"
INSERT INTO Prestito VALUES
('P0075', 'U0002', '9781501142970', '2024-05-05', '2024-05-19', '2024-05-18', 0.00);

INSERT INTO Prestito VALUES
('P0076', 'U0004', '9781501142970', '2024-05-22', '2024-06-05', '2024-06-04', 0.00);

INSERT INTO Prestito VALUES
('P0077', 'U0006', '9781501142970', '2024-05-28', '2024-06-11', '2024-06-10', 0.00);

INSERT INTO Prestito VALUES
('P0078', 'U0010', '9781501142970', '2024-06-03', '2024-06-17', '2024-06-16', 0.00);

-- Libro 5: "Cent anni"
INSERT INTO Prestito VALUES
('P0079', 'U0002', '9780060883287', '2024-06-10', '2024-06-24', '2024-06-23', 0.00);

INSERT INTO Prestito VALUES
('P0080', 'U0003', '9780060883287', '2024-06-26', '2024-07-10', '2024-07-09', 0.00);

INSERT INTO Prestito VALUES
('P0081', 'U0007', '9780060883287', '2024-07-02', '2024-07-16', '2024-07-15', 0.00);

INSERT INTO Prestito VALUES
('P0082', 'U0009', '9780060883287', '2024-07-08', '2024-07-22', '2024-07-21', 0.00);


-- Giuseppe Verdi (U0003) come utente influente

-- Libro 1: "Gita al faro"
INSERT INTO Prestito VALUES
('P0083', 'U0003', '9780156907392', '2024-01-15', '2024-01-29', '2024-01-28', 0.00);

INSERT INTO Prestito VALUES
('P0084', 'U0004', '9780156907392', '2024-01-31', '2024-02-14', '2024-02-13', 0.00);

INSERT INTO Prestito VALUES
('P0085', 'U0005', '9780156907392', '2024-02-06', '2024-02-20', '2024-02-19', 0.00);

INSERT INTO Prestito VALUES
('P0086', 'U0006', '9780156907392', '2024-02-12', '2024-02-26', '2024-02-25', 0.00);

-- Libro 2: "Promessi sposi"
INSERT INTO Prestito VALUES
('P0087', 'U0003', '9788807881923', '2024-03-05', '2024-03-19', '2024-03-18', 0.00);

INSERT INTO Prestito VALUES
('P0088', 'U0005', '9788807881923', '2024-03-21', '2024-04-04', '2024-04-03', 0.00);

INSERT INTO Prestito VALUES
('P0089', 'U0007', '9788807881923', '2024-03-28', '2024-04-11', '2024-04-10', 0.00);

INSERT INTO Prestito VALUES
('P0090', 'U0008', '9788807881923', '2024-04-02', '2024-04-16', '2024-04-15', 0.00);

-- Libro 3: "1984"
INSERT INTO Prestito VALUES
('P0091', 'U0003', '9780451524935', '2024-05-01', '2024-05-15', '2024-05-14', 0.00);

INSERT INTO Prestito VALUES
('P0092', 'U0006', '9780451524935', '2024-05-18', '2024-06-01', '2024-05-31', 0.00);

INSERT INTO Prestito VALUES
('P0093', 'U0008', '9780451524935', '2024-05-24', '2024-06-07', '2024-06-06', 0.00);

INSERT INTO Prestito VALUES
('P0094', 'U0010', '9780451524935', '2024-05-29', '2024-06-12', '2024-06-11', 0.00);

-- Libro 4: "Nome rosa"
INSERT INTO Prestito VALUES
('P0095', 'U0003', '9780156007524', '2024-06-15', '2024-06-29', '2024-06-28', 0.00);

INSERT INTO Prestito VALUES
('P0096', 'U0005', '9780156007524', '2024-07-01', '2024-07-15', '2024-07-14', 0.00);

INSERT INTO Prestito VALUES
('P0097', 'U0007', '9780156007524', '2024-07-07', '2024-07-21', '2024-07-20', 0.00);

INSERT INTO Prestito VALUES
('P0098', 'U0009', '9780156007524', '2024-07-13', '2024-07-27', '2024-07-26', 0.00);

-- Libro 5: "Persuasione"
INSERT INTO Prestito VALUES
('P0099', 'U0003', '9780486284736', '2024-07-20', '2024-08-03', '2024-08-02', 0.00);

INSERT INTO Prestito VALUES
('P0100', 'U0004', '9780486284736', '2024-08-05', '2024-08-19', '2024-08-18', 0.00);

INSERT INTO Prestito VALUES
('P0101', 'U0006', '9780486284736', '2024-08-11', '2024-08-25', '2024-08-24', 0.00);

INSERT INTO Prestito VALUES
('P0102', 'U0008', '9780486284736', '2024-08-16', '2024-08-30', '2024-08-29', 0.00);

SELECT
	U1.Nome,
	U1.Cognome,
	COUNT(DISTINCT Libro.Titolo) as NumLibri
FROM
	Prestito P1 JOIN Prestito P2 ON P1.IdUtente < P2.IdUtente AND P1.ISBN = P2.ISBN AND P2.DataPrestito > P1.DataRestituzioneEffettiva
JOIN
	Prestito P3 ON P2.IdUtente < P3.IdUtente AND P2.ISBN = P3.ISBN AND P2.DataRestituzioneEffettiva > P3.DataPrestito
JOIN
	Prestito P4 ON P3.IdUtente < P4.IdUtente AND P3.ISBN = P4.ISBN AND P3.DataRestituzioneEffettiva > P4.DataPrestito
JOIN
	Utente U1 ON U1.IdUtente = P1.IdUtente
JOIN
	Utente U2 ON U2.IdUtente = P2.IdUtente
JOIN
	Utente U3 ON U3.IdUtente = P3.IdUtente
JOIN
	Utente U4 ON U4.IdUtente = P4.IdUtente
JOIN
	Libro ON Libro.ISBN = P4.ISBN
WHERE
	P1.DataRestituzioneEffettiva IS NOT NULL AND
	P2.DataRestituzioneEffettiva IS NOT NULL AND
	P3.DataRestituzioneEffettiva IS NOT NULL AND
	DATEDIFF(P2.DataPrestito, P1.DataRestituzioneEffettiva) BETWEEN 0 AND 30 AND
	DATEDIFF(P3.DataPrestito, P1.DataRestituzioneEffettiva) BETWEEN 0 AND 30 AND
	DATEDIFF(P4.DataPrestito, P1.DataRestituzioneEffettiva) BETWEEN 0 AND 30
GROUP BY U1.IdUtente
HAVING NumLibri >= 5;

SELECT
	Autore.Nome,
	Autore.Cognome,
	(
		(COUNT(Prestito.IdPrestito) * 0.4) +
		(COUNT(DISTINCT Prestito.IdUtente) * 0.3) +
		(
			(
				(
					SELECT COUNT(P2.IdPrestito)
					FROM Prestito P2 JOIN Libro L2 ON L2.ISBN = P2.ISBN
					JOIN Scrittura S2 ON S2.ISBN = L2.ISBN
					JOIN Autore A2 ON A2.IdAutore = S2.IdAutore
					WHERE P2.Multa = 0 AND S2.IdAutore = Autore.IdAutore
				) * 100 / COUNT(Prestito.IdPrestito)
			) * 0.3
		)
	) as Punteggio
FROM
	Prestito JOIN Libro ON Libro.ISBN = Prestito.ISBN
JOIN
	Scrittura ON Libro.ISBN = Scrittura.ISBN
JOIN
	Autore ON Autore.IdAutore = Scrittura.IdAutore
GROUP BY Autore.IdAutore
HAVING COUNT(Prestito.IdPrestito) >= 10
ORDER BY Punteggio DESC;
