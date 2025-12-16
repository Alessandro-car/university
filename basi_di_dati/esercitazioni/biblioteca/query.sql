DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE IF NOT EXISTS biblioteca;

USE biblioteca;

CREATE TABLE IF NOT EXISTS Categoria(
	CodiceCat VARCHAR(5) NOT NULL,
	Nome VARCHAR(15),
	CONSTRAINT PRIMARY KEY(CodiceCat)
);

CREATE TABLE IF NOT EXISTS Libro(
	ISBN CHAR(13) NOT NULL,
	Titolo VARCHAR(25),
	AnnoPub YEAR,
	NumCopie INTEGER,
	CONSTRAINT PRIMARY KEY(ISBN)
);

CREATE TABLE IF NOT EXISTS LibroCategoria(
	CodiceLibro CHAR(13) NOT NULL,
	CodiceCategoria VARCHAR(5) NOT NULL,
	CONSTRAINT PRIMARY KEY(CodiceLibro, CodiceCategoria),
	CONSTRAINT fk_librocat_libro FOREIGN KEY (CodiceLibro) REFERENCES Libro(ISBN),
	CONSTRAINT fk_librocat_cat FOREIGN KEY (CodiceCategoria) REFERENCES Categoria(CodiceCat)
);

CREATE TABLE IF NOT EXISTS Autore(
	CodiceAutore CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	Nazionalita VARCHAR(15),
	CONSTRAINT PRIMARY KEY(CodiceAutore)
);

CREATE TABLE IF NOT EXISTS Ideazione(
	CodiceAutore CHAR(5) NOT NULL,
	CodiceLibro CHAR(13) NOT NULL,
	CONSTRAINT PRIMARY KEY(CodiceAutore, CodiceLibro),
	CONSTRAINT fk_ideazione_autore FOREIGN KEY (CodiceAutore) REFERENCES Autore(CodiceAutore),
	CONSTRAINT fk_ideazione_libro FOREIGN KEY (CodiceLibro) REFERENCES Libro(ISBN)
);

CREATE TABLE IF NOT EXISTS Utente(
	CodiceUtente CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	Email VARCHAR(254),
	Tipo CHAR(1) NOT NULL,
	CONSTRAINT PRIMARY KEY(CodiceUtente)
);

CREATE TABLE IF NOT EXISTS Prestito(
	CodicePrestito CHAR(5) NOT NULL,
	DataInizio DATE NOT NULL,
	DataScadenza DATE NOT NULL,
	DataRestituzione DATE,
	CodiceLibro CHAR(13),
	CodiceUtente CHAR(5),
	CONSTRAINT PRIMARY KEY(CodicePrestito),
	CONSTRAINT fk_prestito_libro FOREIGN KEY (CodiceLibro) REFERENCES Libro(ISBN),
	CONSTRAINT fk_prestito_utente FOREIGN KEY (CodiceUtente) REFERENCES Utente(CodiceUtente)
);

-- INSERT per CATEGORIA
INSERT INTO Categoria VALUES ('INF', 'Informatica');
INSERT INTO Categoria VALUES ('STO', 'Storia');
INSERT INTO Categoria VALUES ('LET', 'Letteratura');
INSERT INTO Categoria VALUES ('SCIFI', 'Fantascienza');
INSERT INTO Categoria VALUES ('MAT', 'Matematica');
INSERT INTO Categoria VALUES ('FIL', 'Filosofia');
INSERT INTO Categoria VALUES ('BIO', 'Biologia');
INSERT INTO Categoria VALUES ('FIS', 'Fisica');

SELECT * FROM Categoria;

-- INSERT per AUTORE
INSERT INTO Autore VALUES ('A0001', 'Isaac', 'Asimov', 'Russa');
INSERT INTO Autore VALUES ('A0002', 'Alessandro', 'Manzoni', 'Italiana');
INSERT INTO Autore VALUES ('A0003', 'Dante', 'Alighieri', 'Italiana');
INSERT INTO Autore VALUES ('A0004', 'Stephen', 'King', 'Americana');
INSERT INTO Autore VALUES ('A0005', 'Umberto', 'Eco', 'Italiana');
INSERT INTO Autore VALUES ('A0006', 'Brian', 'Kernighan', 'Canadese');
INSERT INTO Autore VALUES ('A0007', 'Dennis', 'Ritchie', 'Americana');
INSERT INTO Autore VALUES ('A0008', 'Albert', 'Einstein', 'Tedesca');
INSERT INTO Autore VALUES ('A0009', 'Carlo', 'Rovelli', 'Italiana');
INSERT INTO Autore VALUES ('A0010', 'Yuval', 'Harari', 'Israeliana');
INSERT INTO Autore VALUES ('A0011', 'George', 'Orwell', 'Britannica');
INSERT INTO Autore VALUES ('A0012', 'Jane', 'Austen', 'Britannica');
INSERT INTO Autore VALUES ('A0013', 'Primo', 'Levi', 'Italiana');
INSERT INTO Autore VALUES ('A0014', 'Victor', 'Hugo', 'Francese');
INSERT INTO Autore VALUES ('A0015', 'Ray', 'Bradbury', 'Americana');

SELECT * FROM Autore;

-- INSERT per LIBRO (solo con anni >= 1901, limite del tipo YEAR)
INSERT INTO Libro VALUES ('9780553293357', 'Fondazione', 1951, 5);
INSERT INTO Libro VALUES ('9788868365684', 'It', 1986, 3);
INSERT INTO Libro VALUES ('9788845292613', 'Il Nome della Rosa', 1980, 6);
INSERT INTO Libro VALUES ('9780131103627', 'Il Linguaggio C', 1978, 4);
INSERT INTO Libro VALUES ('9788845931390', 'Sette brevi lezioni', 2014, 7);
INSERT INTO Libro VALUES ('9788845292910', 'Sapiens', 2011, 9);
INSERT INTO Libro VALUES ('9780451524935', '1984', 1949, 6);
INSERT INTO Libro VALUES ('9780553803716', 'Io Robot', 1950, 4);
INSERT INTO Libro VALUES ('9788804668275', 'Relativita', 1916, 3);
INSERT INTO Libro VALUES ('9788845280146', 'Il Pendolo Foucault', 1988, 4);
INSERT INTO Libro VALUES ('9780062316097', 'Homo Deus', 2015, 5);
INSERT INTO Libro VALUES ('9788830102361', 'Il Sistema Periodico', 1975, 6);
INSERT INTO Libro VALUES ('9788807901111', 'I Promessi Sposi', 1950, 8);
INSERT INTO Libro VALUES ('9788811363333', 'La Divina Commedia', 1950, 10);
INSERT INTO Libro VALUES ('9780141439999', 'Orgoglio Pregiudizio', 1950, 5);
INSERT INTO Libro VALUES ('9782070368228', 'I Miserabili', 1950, 4);
INSERT INTO Libro VALUES ('9780345342966', 'Fahrenheit 451', 1953, 7);

SELECT * FROM Libro;

-- INSERT per UTENTE
INSERT INTO Utente VALUES ('U0001', 'Mario', 'Rossi', 'mario.rossi@uniba.it', 'S');
INSERT INTO Utente VALUES ('U0002', 'Laura', 'Bianchi', 'laura.bianchi@uniba.it', 'S');
INSERT INTO Utente VALUES ('U0003', 'Giuseppe', 'Verdi', 'giuseppe.verdi@uniba.it', 'D');
INSERT INTO Utente VALUES ('U0004', 'Anna', 'Roselli', 'anna.roselli@uniba.it', 'S');
INSERT INTO Utente VALUES ('U0005', 'Francesco', 'Romano', 'francesco.romano@uniba.it', 'D');
INSERT INTO Utente VALUES ('U0006', 'Chiara', 'Greco', 'chiara.greco@uniba.it', 'S');
INSERT INTO Utente VALUES ('U0007', 'Marco', 'Ferrara', 'marco.ferrara@uniba.it', 'D');
INSERT INTO Utente VALUES ('U0008', 'Elena', 'Costa', 'elena.costa@uniba.it', 'S');
INSERT INTO Utente VALUES ('U0009', 'Paolo', 'Rossetti', 'paolo.rossetti@uniba.it', 'S');
INSERT INTO Utente VALUES ('U0010', 'Silvia', 'Marino', 'silvia.marino@uniba.it', 'D');

SELECT * FROM Utente;

-- INSERT per LIBROCATEGORIA
INSERT INTO LibroCategoria VALUES ('9780553293357', 'SCIFI');
INSERT INTO LibroCategoria VALUES ('9780553293357', 'LET');
INSERT INTO LibroCategoria VALUES ('9788807901111', 'LET');
INSERT INTO LibroCategoria VALUES ('9788807901111', 'STO');
INSERT INTO LibroCategoria VALUES ('9788811363333', 'LET');
INSERT INTO LibroCategoria VALUES ('9788868365684', 'LET');
INSERT INTO LibroCategoria VALUES ('9788845292613', 'LET');
INSERT INTO LibroCategoria VALUES ('9788845292613', 'STO');
INSERT INTO LibroCategoria VALUES ('9780131103627', 'INF');
INSERT INTO LibroCategoria VALUES ('9788845931390', 'FIS');
INSERT INTO LibroCategoria VALUES ('9788845292910', 'STO');
INSERT INTO LibroCategoria VALUES ('9788845292910', 'FIL');
INSERT INTO LibroCategoria VALUES ('9780451524935', 'LET');
INSERT INTO LibroCategoria VALUES ('9780451524935', 'SCIFI');
INSERT INTO LibroCategoria VALUES ('9780141439999', 'LET');
INSERT INTO LibroCategoria VALUES ('9780553803716', 'SCIFI');
INSERT INTO LibroCategoria VALUES ('9788804668275', 'FIS');
INSERT INTO LibroCategoria VALUES ('9788845280146', 'LET');
INSERT INTO LibroCategoria VALUES ('9780062316097', 'FIL');
INSERT INTO LibroCategoria VALUES ('9780062316097', 'STO');
INSERT INTO LibroCategoria VALUES ('9788830102361', 'BIO');
INSERT INTO LibroCategoria VALUES ('9788830102361', 'LET');
INSERT INTO LibroCategoria VALUES ('9782070368228', 'LET');
INSERT INTO LibroCategoria VALUES ('9782070368228', 'STO');
INSERT INTO LibroCategoria VALUES ('9780345342966', 'SCIFI');
INSERT INTO LibroCategoria VALUES ('9780345342966', 'LET');

SELECT * FROM LibroCategoria;

-- INSERT per IDEAZIONE
INSERT INTO Ideazione VALUES ('A0001', '9780553293357');
INSERT INTO Ideazione VALUES ('A0002', '9788807901111');
INSERT INTO Ideazione VALUES ('A0003', '9788811363333');
INSERT INTO Ideazione VALUES ('A0004', '9788868365684');
INSERT INTO Ideazione VALUES ('A0005', '9788845292613');
INSERT INTO Ideazione VALUES ('A0006', '9780131103627');
INSERT INTO Ideazione VALUES ('A0007', '9780131103627');
INSERT INTO Ideazione VALUES ('A0009', '9788845931390');
INSERT INTO Ideazione VALUES ('A0010', '9788845292910');
INSERT INTO Ideazione VALUES ('A0011', '9780451524935');
INSERT INTO Ideazione VALUES ('A0012', '9780141439999');
INSERT INTO Ideazione VALUES ('A0001', '9780553803716');
INSERT INTO Ideazione VALUES ('A0008', '9788804668275');
INSERT INTO Ideazione VALUES ('A0005', '9788845280146');
INSERT INTO Ideazione VALUES ('A0010', '9780062316097');
INSERT INTO Ideazione VALUES ('A0013', '9788830102361');
INSERT INTO Ideazione VALUES ('A0014', '9782070368228');
INSERT INTO Ideazione VALUES ('A0015', '9780345342966');

SELECT * FROM Ideazione;

-- INSERT per PRESTITO
-- Prestiti attivi (non ancora restituiti)
INSERT INTO Prestito VALUES ('P0001', '2024-11-20', '2024-12-20', NULL, '9788845292910', 'U0001');
INSERT INTO Prestito VALUES ('P0002', '2024-10-15', '2024-12-14', NULL, '9780131103627', 'U0003');
INSERT INTO Prestito VALUES ('P0003', '2024-12-01', '2024-12-31', NULL, '9788845931390', 'U0006');
INSERT INTO Prestito VALUES ('P0004', '2024-12-10', '2025-01-09', NULL, '9780451524935', 'U0008');

-- Prestiti restituiti
INSERT INTO Prestito VALUES ('P0005', '2024-09-15', '2024-10-15', '2024-10-10', '9788807901111', 'U0001');
INSERT INTO Prestito VALUES ('P0006', '2024-08-20', '2024-09-19', '2024-09-18', '9788811363333', 'U0002');
INSERT INTO Prestito VALUES ('P0007', '2024-07-10', '2024-09-08', '2024-09-05', '9788845292613', 'U0003');
INSERT INTO Prestito VALUES ('P0008', '2024-10-01', '2024-10-31', '2024-10-28', '9780553293357', 'U0004');
INSERT INTO Prestito VALUES ('P0009', '2024-11-05', '2024-12-05', '2024-12-03', '9780141439999', 'U0002');
INSERT INTO Prestito VALUES ('P0010', '2024-09-10', '2024-10-10', '2024-10-08', '9788868365684', 'U0006');
INSERT INTO Prestito VALUES ('P0011', '2024-08-01', '2024-09-30', '2024-09-15', '9788804668275', 'U0005');
INSERT INTO Prestito VALUES ('P0012', '2024-10-20', '2024-11-19', '2024-11-18', '9780553803716', 'U0009');
INSERT INTO Prestito VALUES ('P0013', '2024-09-25', '2024-10-25', '2024-10-22', '9782070368228', 'U0007');
INSERT INTO Prestito VALUES ('P0014', '2024-11-15', '2024-12-15', '2024-12-12', '9780345342966', 'U0008');

-- Prestiti scaduti non restituiti
INSERT INTO Prestito VALUES ('P0015', '2024-10-15', '2024-11-14', NULL, '9788845280146', 'U0004');
INSERT INTO Prestito VALUES ('P0016', '2024-09-20', '2024-11-19', NULL, '9780062316097', 'U0007');
INSERT INTO Prestito VALUES ('P0017', '2024-10-01', '2024-10-31', NULL, '9788830102361', 'U0009');

INSERT INTO Prestito VALUES ('P0018', '2024-08-05', '2024-09-04', '2024-09-02', '9780131103627', 'U0002');
INSERT INTO Prestito VALUES ('P0019', '2024-07-15', '2024-08-14', '2024-08-10', '9788845931390', 'U0002');
INSERT INTO Prestito VALUES ('P0020', '2024-06-20', '2024-07-20', '2024-07-18', '9788845292910', 'U0002');
INSERT INTO Prestito VALUES ('P0021', '2024-05-10', '2024-06-09', '2024-06-05', '9780553293357', 'U0002');
INSERT INTO Prestito VALUES ('P0022', '2024-04-15', '2024-05-15', '2024-05-12', '9788830102361', 'U0002');

SELECT * FROM Prestito;

-- Elencare tutti i libri pubblicati dopo il 2015, mostrando ISBN, titolo e anno di pubblicazione
SELECT
	ISBN,
	Titolo,
	AnnoPub
FROM
	Libro
WHERE
	AnnoPub > 2000;

-- Trovare gli utenti il cui cognome inizia con "Ros"
SELECT  * FROM Utente WHERE Cognome LIKE 'ROS%';

-- Mostrare tutti i prestiti non ancora restituiti con il nome completo dell'utente e il titolo del libro
SELECT
	Utente.Nome,
	Utente.Cognome,
	Libro.Titolo
FROM
	Prestito JOIN Libro ON Prestito.CodiceLibro = Libro.ISBN
JOIN
	Utente ON Prestito.CodiceUtente = Utente.CodiceUtente
WHERE
	DataRestituzione IS NULL;

-- Per ogni categoria, mostrare il nome della categoria e quanti libri vi appartengono
SELECT
	Categoria.Nome,
	COUNT(LibroCategoria.CodiceLibro) AS num_libri
FROM
	LibroCategoria JOIN Categoria ON LibroCategoria.CodiceCategoria = Categoria.CodiceCat
GROUP BY Categoria.Nome;

-- Trovare i titoli dei libri scritti da autori da nazionalità italiana
SELECT
	Libro.Titolo
FROM
	Ideazione JOIN Libro ON Ideazione.CodiceLibro = Libro.ISBN
JOIN
	Autore ON Ideazione.CodiceAutore = Autore.CodiceAutore
WHERE Autore.Nazionalita LIKE 'Italiana';

-- Elencare tutti i prestiti dell'anno 2024, mostrando: nome e cognome dell'utente, titolo del libro, nome e cognome di tutti gli autori del libro, data di inzio prestito
SELECT
	CONCAT(Utente.Nome, ' ',  Utente.Cognome) as NomeUtente,
	Libro.Titolo,
	CONCAT(Autore.Nome, ' ', Autore.Cognome) as NomeAutore,
	Prestito.DataInizio
FROM
	Prestito JOIN Utente ON Prestito.CodiceUtente = Utente.CodiceUtente
JOIN
	Libro ON Prestito.CodiceLibro = Libro.ISBN
JOIN
	Ideazione ON Ideazione.CodiceLibro = Libro.ISBN
JOIN
	Autore ON Ideazione.CodiceAutore = Autore.CodiceAutore
WHERE YEAR(Prestito.DataInizio) = 2024;

-- Trovare le categorie che contengono almeno 10 libri
SELECT
	Categoria.Nome,
	COUNT(LibroCategoria.CodiceLibro) AS num_libri
FROM
	LibroCategoria JOIN Categoria ON LibroCategoria.CodiceCategoria = Categoria.CodiceCat
GROUP BY Categoria.Nome
HAVING num_libri >= 10;

-- Trovare tutti i prestiti la cui data di scadenza è passata ma il libro non è ancora stato restituito



SELECT
	Utente.Nome,
	Utente.Cognome,
	Libro.Titolo,
	Periodo.DataScadenza
FROM
	Prestito JOIN Utente ON

-- Elencare gli utenti che non hanno mai effettuato alcun prestito
SELECT
	Utente.Nome,
	Utente.Cognome
FROM
	Utente LEFT JOIN Prestito ON Utente.CodiceUtente = Prestito.CodiceUtente
WHERE
	Prestito.CodiceUtente IS NULL;

-- Contare quanti libri sono presenti in totale nella biblioteca
SELECT SUM(Libro.NumCopie) as NumeroLibriTotali FROM Libro;

-- ELencare tutti gli autori ordinati alfabeticamente per cognome e poi per nome
SELECT Autore.Cognome, Autore.Nome FROM Autore ORDER BY Autore.Cognome, Autore.Nome;

-- Mostrare tutti gli anni di pubblicazione presenti nel catalogo, senza ripetizione, in ordine descrescente
SELECT DISTINCT Libro.AnnoPub FROM Libro ORDER BY Libro.AnnoPub DESC;

-- Per ogni utente di tipo 'Studente', mostrare Nome, Cognome e il numero totale di prestiti effettuati
SELECT
	COUNT(Prestito.CodicePrestito) as NumPrestiti,
	CONCAT(Utente.Nome, ' ', Utente.Cognome) as NomeUtente
FROM
	Prestito JOIN Utente ON Prestito.CodiceUtente = Utente.CodiceUtente
WHERE
	Utente.Tipo LIKE 'S'
GROUP BY (NomeUtente);

-- Trovare l'anno di pubblicazione del libro più recente e quello del libro più vecchio presente in biblioteca
SELECT
	MAX(l1.AnnoPub) as recente,
	MIN(l1.AnnoPub) as vecchio
FROM
	Libro l1;

-- Elencare i titoli dei libri che non sono mai stati in Prestito
SELECT
	*
FROM
	Libro LEFT JOIN Prestito ON Libro.ISBN = Prestito.CodiceLibro
WHERE Prestito.CodiceLibro IS NULL;

-- Trovare gli autori che hanno scritto più di 3 libri presenti nella biblioteca
SELECT
	CONCAT(Autore.Nome ,' ', Autore.Cognome) as NomeAutore,
	COUNT(Ideazione.CodiceLibro) NumLibriScritti
FROM
	Ideazione JOIN Autore ON Ideazione.CodiceAutore = Autore.CodiceAutore
GROUP BY NomeAutore
HAVING NumLibriScritti > 1;

-- Mostrare il titolo e il numero totale di prestiti ricevuti per ogni libri, ordinati dal più prestato al meno prestato
SELECT
	Libro.Titolo,
	COUNT(Prestito.CodicePrestito) as NumPrestiti
FROM
	Prestito JOIN Libro ON Prestito.CodiceLibro = Libro.ISBN
GROUP BY Libro.Titolo
ORDER BY NumPrestiti DESC;

-- Trovare le coppie di autori che hanno scritto insieme almeno un libro
SELECT
	CONCAT(a1.Nome, " ", a1.Cognome) as PrimoAutore,
	CONCAT(a2.Nome, " ", a2.Cognome) as SecondoAutore,
	Libro.Titolo
FROM
	Ideazione i1 JOIN Ideazione i2 ON i1.CodiceLibro = i2.CodiceLibro AND i1.CodiceAutore < i2.CodiceAutore
JOIN
	Autore a1 ON i1.CodiceAutore = a1.CodiceAutore
JOIN
	Autore a2 ON i2.CodiceAutore = a2.CodiceAutore
JOIN
	Libro ON Libro.ISBN = i1.CodiceLibro;

-- Calcolare la durata media, in giorni, dei prestiti già restituiti per ogni categoria di libro
SELECT
	AVG(DATEDIFF(Prestito.DataRestituzione, Prestito.DataInizio)) as DurataMediaPrestito,
	Categoria.Nome
FROM
	Prestito JOIN LibroCategoria ON LibroCategoria.CodiceLibro = Prestito.CodiceLibro
JOIN
	Categoria ON Categoria.CodiceCat = LibroCategoria.CodiceCategoria
WHERE
	Prestito.DataRestituzione IS NOT NULL
GROUP BY Categoria.Nome;

-- Trovare gli utenti che hanno preso in prestito libri di tutte le categorie presenti in biblioteca
SELECT
	CONCAT(Utente.Nome, " ",  Utente.Cognome) as NomeUtente
FROM (SELECT DISTINCT
				Utente.CodiceUtente,
				LibroCategoria.CodiceCategoria
			FROM
				LibroCategoria JOIN Prestito ON LibroCategoria.CodiceLibro = Prestito.CodiceLibro
			JOIN
				Utente ON Prestito.CodiceUtente = Utente.CodiceUtente
) as prestiti_utente
JOIN Utente ON Utente.CodiceUtente = prestiti_utente.CodiceUtente
GROUP BY NomeUtente
HAVING COUNT(*) = (SELECT COUNT(*) FROM (SELECT DISTINCT LibroCategoria.CodiceCategoria FROM LibroCategoria) as num_categorie);

