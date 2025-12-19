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
			GROUP BY Scrittura.IdAutore
	) as subquery
	WHERE subquery.Genere = L.Genere
)
ORDER BY COUNT(Scrittura.ISBN);



