DROP DATABASE IF EXISTS gestione_cinema;
CREATE DATABASE IF NOT EXISTS gestione_cinema;
USE gestione_cinema;

CREATE TABLE IF NOT EXISTS Attore(
	CodAttore CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	AnnoNascita YEAR,
	Nazionalita VARCHAR(15),
	CONSTRAINT PRIMARY KEY(CodAttore)
);

CREATE TABLE IF NOT EXISTS Regista(
	CodRegista CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	AnnoNascita YEAR,
	Nazionalita VARCHAR(15),
	CONSTRAINT PRIMARY KEY(CodRegista)
);

CREATE TABLE IF NOT EXISTS Film(
	CodFilm CHAR(5) NOT NULL,
	Titolo VARCHAR(20),
	AnnoProduzione YEAR,
	Nazionalita VARCHAR(15),
	Budget INTEGER,
	Incasso INTEGER,
	CodRegista CHAR(5),
	Genere VARCHAR(15),
	Durata TIME,
	LinguaOriginale VARCHAR(15),
	CONSTRAINT PRIMARY KEY(CodFilm),
	CONSTRAINT fk_film_regista FOREIGN KEY (CodRegista) REFERENCES Regista(CodRegista)
);

CREATE TABLE IF NOT EXISTS Recita(
	CodAttore CHAR(5) NOT NULL,
	CodFilm CHAR(5) NOT NULL,
	Ruolo VARCHAR(15),
	Compenso INTEGER,
	PercentualeSchermo DECIMAL(3),
	CONSTRAINT check_percentuale CHECK (PercentualeSchermo BETWEEN 0 AND 100),
	CONSTRAINT PRIMARY KEY(CodAttore, CodFilm),
	CONSTRAINT fk_recita_attore FOREIGN KEY(CodAttore) REFERENCES Attore(CodAttore),
	CONSTRAINT fk_recita_film FOREIGN KEY(CodFilm) REFERENCES Film(CodFilm)
);

CREATE TABLE IF NOT EXISTS Cinema(
	CodCinema CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Citta VARCHAR(15),
	Regione VARCHAR(15),
	AnnoApertura YEAR,
	Catena VARCHAR(15),
	CONSTRAINT PRIMARY KEY(CodCinema)
);

CREATE TABLE IF NOT EXISTS Sala(
	CodSala CHAR(5) NOT NULL,
	NomeSala VARCHAR(15),
	CodCinema CHAR(5),
	NumPosti INTEGER,
	Tecnologia VARCHAR(15),
	CONSTRAINT PRIMARY KEY(CodSala),
	CONSTRAINT fk_sala_cinema FOREIGN KEY(CodCinema) REFERENCES Cinema(CodCinema)
);

CREATE TABLE IF NOT EXISTS Proiezione(
	CodProiezione CHAR(5) NOT NULL,
	CodFilm CHAR(5),
	CodSala CHAR(5),
	DataOra DATETIME,
	Prezzo DECIMAL(5, 2),
	PostiVenduti INTEGER,
	CONSTRAINT PRIMARY KEY(CodProiezione),
	CONSTRAINT fk_proiezioni_film FOREIGN KEY(CodFilm) REFERENCES Film(CodFilm),
	CONSTRAINT fk_proiezioni_sala FOREIGN KEY(CodSala) REFERENCES Sala(CodSala)
);

CREATE TABLE IF NOT EXISTS Premio(
	CodPremio CHAR(5) NOT NULL,
	NomePremio VARCHAR(15),
	CodFilm CHAR(5),
	CodAttore CHAR(5),
	Anno YEAR,
	Categoria VARCHAR(15),
	CONSTRAINT PRIMARY KEY(CodPremio),
	CONSTRAINT fk_premio_film FOREIGN KEY(CodFilm) REFERENCES Film(CodFilm),
	CONSTRAINT fk_premio_attore FOREIGN KEY(CodAttore) REFERENCES Attore(CodAttore)
);

CREATE TABLE IF NOT EXISTS Distribuzione(
	CodDistribuzione CHAR(5) NOT NULL,
	CodFilm CHAR(5),
	Paese VARCHAR(15),
	DataUscita DATE,
	IncassoPaese INTEGER,
	CONSTRAINT PRIMARY KEY(CodDistribuzione),
	CONSTRAINT fk_distribuzione_film FOREIGN KEY(CodFilm) REFERENCES Film(CodFilm)
);

-- INSERT ATTORI
-- INSERT ATTORI
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0001', 'Leonardo', 'DiCaprio', 1974, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0002', 'Meryl', 'Streep', 1949, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0003', 'Tom', 'Hanks', 1956, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0004', 'Scarlett', 'Johansson', 1984, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0005', 'Javier', 'Bardem', 1969, 'Spagna');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0006', 'Penelope', 'Cruz', 1974, 'Spagna');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0007', 'Brad', 'Pitt', 1963, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0008', 'Cate', 'Blanchett', 1969, 'Australia');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0009', 'Denzel', 'Washington', 1954, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0010', 'Marion', 'Cotillard', 1975, 'Francia');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0011', 'Matthew', 'McConaughey', 1969, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0012', 'Anne', 'Hathaway', 1982, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0013', 'Robert', 'De Niro', 1943, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0014', 'Al', 'Pacino', 1940, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0015', 'Daniel', 'Day-Lewis', 1957, 'UK');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0016', 'Kate', 'Winslet', 1975, 'UK');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0017', 'Christian', 'Bale', 1974, 'UK');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0018', 'Emma', 'Stone', 1988, 'USA');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0019', 'Ryan', 'Gosling', 1980, 'Canada');
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('A0020', 'Natalie', 'Portman', 1981, 'Israele');

-- INSERT REGISTI
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0001', 'Christopher', 'Nolan', 1970, 'UK');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0002', 'Martin', 'Scorsese', 1942, 'USA');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0003', 'Steven', 'Spielberg', 1946, 'USA');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0004', 'Quentin', 'Tarantino', 1963, 'USA');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0005', 'Ridley', 'Scott', 1937, 'UK');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0006', 'Denis', 'Villeneuve', 1967, 'Canada');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0007', 'Damien', 'Chazelle', 1985, 'USA');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0008', 'Alfonso', 'Cuaron', 1961, 'Messico');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0009', 'Alejandro', 'Inarritu', 1963, 'Messico');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0010', 'Pedro', 'Almodovar', 1949, 'Spagna');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0011', 'David', 'Fincher', 1962, 'USA');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0012', 'James', 'Cameron', 1954, 'Canada');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0013', 'Guillermo', 'del Toro', 1964, 'Messico');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0014', 'Paul Thomas', 'Anderson', 1970, 'USA');
INSERT INTO Regista (CodRegista, Nome, Cognome, AnnoNascita, Nazionalita) VALUES ('R0015', 'Wes', 'Anderson', 1969, 'USA');

-- INSERT FILM (con incassi corretti per INTEGER)
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0001', 'Inception', 2010, 'USA', 160000000, 836800000, 'R0001', 'Fantascienza', '02:28:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0002', 'Interstellar', 2014, 'USA', 165000000, 677471339, 'R0001', 'Fantascienza', '02:49:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0003', 'The Dark Knight', 2008, 'USA', 185000000, 1004558444, 'R0001', 'Azione', '02:32:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0004', 'Dunkirk', 2017, 'UK', 100000000, 527371165, 'R0001', 'Guerra', '01:46:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0005', 'Wolf Wall Street', 2013, 'USA', 100000000, 392000694, 'R0002', 'Biografico', '03:00:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0006', 'The Departed', 2006, 'USA', 90000000, 291465034, 'R0002', 'Thriller', '02:31:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0007', 'Shutter Island', 2010, 'USA', 80000000, 294804195, 'R0002', 'Thriller', '02:18:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0008', 'Saving Pvt Ryan', 1998, 'USA', 70000000, 482349603, 'R0003', 'Guerra', '02:49:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0009', 'Catch Me If U Can', 2002, 'USA', 52000000, 352114312, 'R0003', 'Biografico', '02:21:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0010', 'Pulp Fiction', 1994, 'USA', 8000000, 213928762, 'R0004', 'Crime', '02:34:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0011', 'Django Unchained', 2012, 'USA', 100000000, 449334608, 'R0004', 'Western', '02:45:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0012', 'Blade Runner 2049', 2017, 'USA', 150000000, 267710827, 'R0006', 'Fantascienza', '02:44:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0013', 'Arrival', 2016, 'USA', 47000000, 203388186, 'R0006', 'Fantascienza', '01:56:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0014', 'Dune', 2021, 'USA', 165000000, 402100000, 'R0006', 'Fantascienza', '02:35:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0015', 'La La Land', 2016, 'USA', 30000000, 448801849, 'R0007', 'Musical', '02:08:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0016', 'Whiplash', 2014, 'USA', 3300000, 48988663, 'R0007', 'Drammatico', '01:46:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0017', 'Gravity', 2013, 'USA', 100000000, 723192705, 'R0008', 'Fantascienza', '01:31:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0018', 'The Revenant', 2015, 'USA', 135000000, 532950503, 'R0009', 'Avventura', '02:36:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0019', 'Birdman', 2014, 'USA', 18000000, 103215094, 'R0009', 'Drammatico', '01:59:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0020', 'Volver', 2006, 'Spagna', 11000000, 85851926, 'R0010', 'Drammatico', '02:01:00', 'Spagnolo');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0021', 'Fight Club', 1999, 'USA', 63000000, 101209702, 'R0011', 'Drammatico', '02:19:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0022', 'Gone Girl', 2014, 'USA', 61000000, 369330363, 'R0011', 'Thriller', '02:29:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0023', 'Avatar', 2009, 'USA', 237000000, 2147483647, 'R0012', 'Fantascienza', '02:42:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0024', 'Titanic', 1997, 'USA', 200000000, 2147483647, 'R0012', 'Romantico', '03:14:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0025', 'Shape of Water', 2017, 'USA', 19500000, 195243464, 'R0013', 'Fantasy', '02:03:00', 'Inglese');

-- INSERT RECITA
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0001', 'F0001', 'Protagonista', 15000000, 65);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0010', 'F0001', 'Co-protag', 8000000, 35);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0011', 'F0002', 'Protagonista', 20000000, 70);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0012', 'F0002', 'Co-protag', 10000000, 30);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0017', 'F0003', 'Protagonista', 10000000, 55);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0001', 'F0007', 'Protagonista', 12000000, 60);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0003', 'F0008', 'Protagonista', 10000000, 75);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0003', 'F0009', 'Protagonista', 8000000, 70);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0001', 'F0009', 'Secondario', 5000000, 25);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0001', 'F0011', 'Co-protag', 9000000, 45);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0005', 'F0011', 'Secondario', 3000000, 15);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0019', 'F0012', 'Protagonista', 5000000, 65);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0012', 'F0013', 'Protagonista', 6000000, 80);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0012', 'F0014', 'Co-protag', 8000000, 35);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0019', 'F0015', 'Protagonista', 4000000, 50);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0018', 'F0015', 'Protagonista', 4000000, 50);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0007', 'F0007', 'Secondario', 7000000, 20);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0008', 'F0017', 'Secondario', 2000000, 15);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0001', 'F0018', 'Protagonista', 25000000, 85);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0003', 'F0024', 'Secondario', 5000000, 15);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0016', 'F0024', 'Protagonista', 2000000, 45);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0001', 'F0024', 'Protagonista', 2500000, 45);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0007', 'F0021', 'Protagonista', 6000000, 60);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0002', 'F0006', 'Secondario', 4000000, 20);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0006', 'F0020', 'Protagonista', 1000000, 70);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0014', 'F0006', 'Secondario', 5000000, 25);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0013', 'F0006', 'Protagonista', 8000000, 40);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0011', 'F0019', 'Protagonista', 7000000, 75);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0002', 'F0005', 'Secondario', 3000000, 15);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0004', 'F0013', 'Secondario', 2000000, 18);

-- INSERT CINEMA
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0001', 'Multisala Roma', 'Roma', 'Lazio', 2005, 'UCI Cinemas');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0002', 'Cinema Impero', 'Roma', 'Lazio', 1998, 'Indipendente');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0003', 'Multiplex MI', 'Milano', 'Lombardia', 2010, 'The Space');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0004', 'Cinema Odeon', 'Milano', 'Lombardia', 1995, 'Indipendente');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0005', 'Cinema Apollo', 'Napoli', 'Campania', 2008, 'UCI Cinemas');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0006', 'Megaplex NA', 'Napoli', 'Campania', 2012, 'The Space');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0007', 'Cinema Teatro', 'Torino', 'Piemonte', 2000, 'Indipendente');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0008', 'Multiplex TO', 'Torino', 'Piemonte', 2015, 'UCI Cinemas');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0009', 'Cinema Massimo', 'Firenze', 'Toscana', 2003, 'Indipendente');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0010', 'Multiplex FI', 'Firenze', 'Toscana', 2018, 'The Space');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0011', 'Cinema Bologna', 'Bologna', 'Emilia-Romagna', 2007, 'UCI Cinemas');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0012', 'Multiplex GE', 'Genova', 'Liguria', 2011, 'The Space');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0013', 'Cinema Verona', 'Verona', 'Veneto', 2009, 'Indipendente');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0014', 'Multiplex VE', 'Venezia', 'Veneto', 2016, 'UCI Cinemas');
INSERT INTO Cinema (CodCinema, Nome, Citta, Regione, AnnoApertura, Catena) VALUES ('C0015', 'Cinema Palermo', 'Palermo', 'Sicilia', 2004, 'The Space');

-- INSERT SALE
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0001', 'Sala 1', 'C0001', 250, 'IMAX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0002', 'Sala 2', 'C0001', 180, 'Dolby Atmos');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0003', 'Sala 3', 'C0001', 120, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0004', 'Sala Rossa', 'C0002', 90, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0005', 'Sala Blu', 'C0002', 75, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0006', 'Sala 1', 'C0003', 300, 'IMAX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0007', 'Sala 2', 'C0003', 220, 'Dolby Atmos');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0008', 'Sala 3', 'C0003', 150, '4DX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0009', 'Sala 4', 'C0003', 100, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0010', 'Sala Unica', 'C0004', 85, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0011', 'Sala A', 'C0005', 280, 'IMAX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0012', 'Sala B', 'C0005', 190, 'Dolby Atmos');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0013', 'Sala C', 'C0005', 130, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0014', 'Sala 1', 'C0006', 320, 'IMAX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0015', 'Sala 2', 'C0006', 200, '4DX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0016', 'Sala Grande', 'C0007', 110, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0017', 'Sala Piccola', 'C0007', 60, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0018', 'Sala 1', 'C0008', 270, 'IMAX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0019', 'Sala 2', 'C0008', 180, 'Dolby Atmos');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0020', 'Sala Princ', 'C0009', 95, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0021', 'Sala 1', 'C0010', 290, 'IMAX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0022', 'Sala 2', 'C0010', 160, '4DX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0023', 'Sala A', 'C0011', 240, 'Dolby Atmos');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0024', 'Sala B', 'C0011', 170, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0025', 'Sala 1', 'C0012', 260, 'IMAX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0026', 'Sala Verde', 'C0013', 105, 'Standard');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0027', 'Sala 1', 'C0014', 310, 'IMAX');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0028', 'Sala 2', 'C0014', 195, 'Dolby Atmos');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0029', 'Sala Gold', 'C0015', 230, 'Dolby Atmos');
INSERT INTO Sala (CodSala, NomeSala, CodCinema, NumPosti, Tecnologia) VALUES ('S0030', 'Sala Silver', 'C0015', 140, 'Standard');

-- INSERT PROIEZIONI
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0001', 'F0001', 'S0001', '2023-01-15 20:30:00', 12.50, 220);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0002', 'F0001', 'S0006', '2023-01-15 21:00:00', 13.00, 280);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0003', 'F0002', 'S0011', '2023-02-10 19:00:00', 12.00, 250);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0004', 'F0002', 'S0014', '2023-02-10 20:00:00', 13.50, 300);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0005', 'F0003', 'S0001', '2023-03-20 21:30:00', 11.50, 240);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0006', 'F0014', 'S0006', '2023-04-05 20:00:00', 14.00, 295);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0007', 'F0014', 'S0011', '2023-04-05 19:30:00', 13.50, 270);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0008', 'F0014', 'S0014', '2023-04-05 21:00:00', 14.50, 310);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0009', 'F0015', 'S0002', '2023-05-12 18:00:00', 9.50, 160);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0010', 'F0015', 'S0007', '2023-05-12 18:30:00', 10.00, 200);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0011', 'F0017', 'S0001', '2023-06-18 22:00:00', 12.00, 230);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0012', 'F0001', 'S0021', '2023-07-22 20:00:00', 15.00, 245);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0013', 'F0002', 'S0027', '2023-07-22 20:30:00', 15.50, 298);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0014', 'F0003', 'S0018', '2023-07-22 19:00:00', 15.00, 265);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0015', 'F0024', 'S0001', '2023-08-14 21:00:00', 11.00, 210);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0016', 'F0024', 'S0018', '2023-08-14 20:30:00', 11.50, 255);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0017', 'F0012', 'S0006', '2023-09-09 19:30:00', 13.00, 180);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0018', 'F0013', 'S0002', '2023-10-11 20:00:00', 10.50, 155);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0019', 'F0005', 'S0003', '2023-11-03 22:00:00', 9.00, 105);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0020', 'F0006', 'S0004', '2023-11-15 21:30:00', 8.50, 75);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0021', 'F0010', 'S0010', '2023-12-01 23:00:00', 8.00, 80);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0022', 'F0021', 'S0004', '2023-12-20 22:30:00', 8.50, 85);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0023', 'F0001', 'S0021', '2024-01-08 20:00:00', 12.50, 270);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0024', 'F0002', 'S0027', '2024-01-10 19:30:00', 13.00, 290);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0025', 'F0014', 'S0025', '2024-02-14 21:00:00', 14.00, 250);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0026', 'F0004', 'S0018', '2024-03-22 19:00:00', 11.00, 220);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0027', 'F0018', 'S0011', '2024-04-11 20:30:00', 11.50, 265);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0028', 'F0019', 'S0007', '2024-04-25 21:00:00', 10.00, 185);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0029', 'F0008', 'S0001', '2024-05-09 18:00:00', 9.50, 195);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0030', 'F0022', 'S0009', '2024-06-12 22:00:00', 9.00, 90);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0031', 'F0011', 'S0023', '2024-08-15 21:30:00', 10.50, 210);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0032', 'F0015', 'S0029', '2024-09-20 19:00:00', 10.00, 215);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0033', 'F0003', 'S0027', '2024-10-05 20:30:00', 12.00, 295);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0034', 'F0001', 'S0014', '2024-12-15 20:00:00', 12.50, 305);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0035', 'F0002', 'S0025', '2024-12-20 19:00:00', 13.00, 255);

-- INSERT PREMI
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR001', 'Oscar', 'F0003', 'A0017', 2009, 'Miglior Attore');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR002', 'Oscar', 'F0006', NULL, 2007, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR003', 'Oscar', 'F0008', NULL, 1999, 'Miglior Reg');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR004', 'Oscar', 'F0008', 'A0003', 1999, 'Miglior Attore');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR005', 'Oscar', 'F0018', 'A0001', 2016, 'Miglior Attore');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR006', 'Oscar', 'F0019', NULL, 2015, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR007', 'Oscar', 'F0015', NULL, 2017, 'Miglior Reg');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR008', 'Oscar', 'F0015', 'A0018', 2017, 'Miglior Attrice');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR009', 'Oscar', 'F0017', NULL, 2014, 'Miglior Reg');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR010', 'Oscar', 'F0024', NULL, 1998, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR011', 'Oscar', 'F0024', 'A0016', 1998, 'Miglior Attrice');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR012', 'Oscar', 'F0025', NULL, 2018, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR013', 'Golden Globe', 'F0001', NULL, 2011, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR014', 'Golden Globe', 'F0005', 'A0001', 2014, 'Miglior Attore');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR015', 'Golden Globe', 'F0015', 'A0019', 2017, 'Miglior Attore');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR016', 'Golden Globe', 'F0015', 'A0018', 2017, 'Miglior Attrice');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR017', 'BAFTA', 'F0001', NULL, 2011, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR018', 'BAFTA', 'F0003', NULL, 2009, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR019', 'BAFTA', 'F0017', NULL, 2014, 'Miglior Reg');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR020', 'BAFTA', 'F0012', 'A0019', 2018, 'Miglior Attore');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR021', 'Palma Oro', 'F0010', NULL, 1994, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR022', 'Leone Oro', 'F0025', NULL, 2017, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR023', 'Oscar', NULL, 'A0002', 2012, 'Miglior Attrice');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR024', 'Oscar', NULL, 'A0015', 2013, 'Miglior Attore');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR025', 'Oscar', NULL, 'A0009', 2002, 'Miglior Attore');

-- INSERT DISTRIBUZIONE
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0001', 'F0001', 'USA', '2010-07-16', 292568851);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0002', 'F0001', 'Francia', '2010-07-21', 47358054);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0003', 'F0001', 'Italia', '2010-07-23', 31885067);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0004', 'F0001', 'UK', '2010-07-16', 56364536);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0005', 'F0001', 'Germania', '2010-07-29', 53628882);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0006', 'F0002', 'USA', '2014-11-05', 188020017);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0007', 'F0002', 'UK', '2014-11-07', 42156944);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0008', 'F0002', 'Italia', '2014-11-06', 19845663);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0009', 'F0002', 'Cina', '2014-11-12', 122000000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0010', 'F0003', 'USA', '2008-07-18', 534858444);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0011', 'F0003', 'Italia', '2008-08-29', 20326422);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0012', 'F0003', 'UK', '2008-07-25', 76500000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0013', 'F0024', 'USA', '1997-12-19', 659363944);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0014', 'F0024', 'Italia', '1998-01-16', 68000000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0015', 'F0024', 'UK', '1998-01-23', 80000000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0016', 'F0024', 'Francia', '1998-01-07', 148000000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0017', 'F0014', 'USA', '2021-10-22', 108327830);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0018', 'F0014', 'Italia', '2021-09-16', 9850000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0019', 'F0014', 'Francia', '2021-09-15', 32500000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0020', 'F0015', 'USA', '2016-12-09', 151101803);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0021', 'F0015', 'Italia', '2017-01-26', 8543251);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0022', 'F0015', 'Francia', '2017-01-25', 21850000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0023', 'F0010', 'USA', '1994-10-14', 107900000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0024', 'F0010', 'Italia', '1994-11-25', 8500000);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0025', 'F0011', 'USA', '2012-12-25', 162805434);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0026', 'F0011', 'Italia', '2013-01-17', 7854329);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0027', 'F0018', 'USA', '2015-12-25', 183637894);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0028', 'F0018', 'Italia', '2016-01-14', 8653421);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0029', 'F0017', 'USA', '2013-10-04', 274092705);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0030', 'F0017', 'Italia', '2013-10-03', 15234567);

-- Aggiungiamo più proiezioni per rendere la query 7 significativa
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0036', 'F0001', 'S0004', '2023-01-16 20:00:00', 8.50, 85);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0037', 'F0001', 'S0010', '2023-01-17 21:00:00', 8.00, 80);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0038', 'F0001', 'S0016', '2023-01-18 19:30:00', 9.00, 105);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0039', 'F0001', 'S0020', '2023-01-19 20:30:00', 8.50, 90);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0040', 'F0001', 'S0023', '2023-01-20 21:00:00', 10.00, 220);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0041', 'F0001', 'S0025', '2023-01-21 19:00:00', 13.00, 240);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0042', 'F0001', 'S0026', '2023-01-22 20:00:00', 8.50, 100);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0043', 'F0001', 'S0029', '2023-01-23 21:30:00', 10.00, 215);

-- Più proiezioni per altri film popolari
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0044', 'F0015', 'S0004', '2023-05-13 19:00:00', 8.00, 80);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0045', 'F0015', 'S0010', '2023-05-14 20:00:00', 8.00, 75);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0046', 'F0015', 'S0011', '2023-05-15 18:30:00', 13.00, 260);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0047', 'F0015', 'S0016', '2023-05-16 19:30:00', 9.00, 100);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0048', 'F0015', 'S0020', '2023-05-17 20:00:00', 8.50, 90);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0049', 'F0015', 'S0023', '2023-05-18 21:00:00', 10.00, 230);
INSERT INTO Proiezione (CodProiezione, CodFilm, CodSala, DataOra, Prezzo, PostiVenduti) VALUES ('P0050', 'F0015', 'S0025', '2023-05-19 19:00:00', 12.00, 245);

-- Aggiungiamo un film con Tom Hanks e Meryl Streep per la query 5
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0026', 'The Post', 2017, 'USA', 50000000, 179769242, 'R0003', 'Drammatico', '01:56:00', 'Inglese');
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0003', 'F0026', 'Protagonista', 8000000, 50);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0002', 'F0026', 'Protagonista', 8000000, 50);

-- Aggiungiamo più film a registi per la query 6
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0027', 'The Prestige', 2006, 'USA', 40000000, 109676311, 'R0001', 'Thriller', '02:10:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0028', 'Memento', 2000, 'USA', 9000000, 39723096, 'R0001', 'Thriller', '01:53:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0029', 'Goodfellas', 1990, 'USA', 25000000, 46836394, 'R0002', 'Crime', '02:26:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0030', 'Casino', 1995, 'USA', 52000000, 116112375, 'R0002', 'Crime', '02:58:00', 'Inglese');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso, CodRegista, Genere, Durata, LinguaOriginale) VALUES ('F0031', 'Taxi Driver', 1976, 'USA', 1300000, 28262574, 'R0002', 'Crime', '01:54:00', 'Inglese');

-- Più attori per alcuni film per la query 8
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0009', 'F0003', 'Secondario', 4000000, 10);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0015', 'F0006', 'Secondario', 3000000, 15);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0020', 'F0010', 'Secondario', 1000000, 12);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0007', 'F0010', 'Secondario', 1500000, 10);

-- Leonardo DiCaprio in più film di generi diversi per la query 9
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0001', 'F0006', 'Protagonista', 10000000, 35);
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo) VALUES ('A0001', 'F0008', 'Secondario', 6000000, 20);

-- Premi aggiuntivi
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR026', 'Oscar', 'F0026', NULL, 2018, 'Miglior Film');
INSERT INTO Premio (CodPremio, NomePremio, CodFilm, CodAttore, Anno, Categoria) VALUES ('PR027', 'Oscar', 'F0010', NULL, 1995, 'Miglior Script');

-- Distribuzione per nuovi film
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0031', 'F0026', 'USA', '2017-12-22', 81903458);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0032', 'F0026', 'Italia', '2018-01-18', 3245678);
INSERT INTO Distribuzione (CodDistribuzione, CodFilm, Paese, DataUscita, IncassoPaese) VALUES ('D0033', 'F0026', 'UK', '2018-01-19', 8500000);
-- Il titolo e l'incasso di tutti i film prodotti in America dopo il 2010

SELECT
	Film.Titolo,
	Film.Incasso
FROM
	Film
WHERE Film.Nazionalita LIKE 'USA' AND Film.AnnoProduzione > 2010;

-- Nome e cognome degli attori che hanno vinto almeno un Oscar (premio con NomePremio = 'Oscar')
SELECT
	Attore.Nome,
	Attore.Cognome
FROM
	Attore JOIN Premio ON Attore.CodAttore = Premio.CodAttore
WHERE
	Premio.NomePremio LIKE 'Oscar';

-- Il titolo dei film di fantascienza diretti da registi canadesi con budget superiore a 1 milione
SELECT
	Film.Titolo,
	Regista.Nome,
	Regista.Cognome,
	Film.Budget
FROM
	Regista JOIN Film ON Regista.CodRegista = Film.CodRegista
WHERE
 	Film.Genere LIKE 'Fantascienza' AND Film.Budget > 1000000 AND Regista.Nazionalita LIKE 'Canada';

-- Il nome delle sale di Roma che hanno più di 200 posti e tecnologia IMAX
SELECT
	Sala.NomeSala,
	Sala.NumPosti,
	Sala.Tecnologia
FROM
	Sala JOIN Cinema ON Sala.CodCinema = Cinema.CodCinema
WHERE Cinema.Citta LIKE 'Roma' AND Sala.NumPosti >= 200 AND Sala.Tecnologia LIKE 'IMAX';

-- Il titolo e l'anno di produzione dei film in cui recita sia Leonardo DiCaprio che Marion Cotillard
SELECT
	Film.Titolo,
	Film.AnnoProduzione
FROM
	Recita R1 JOIN Recita R2 ON R1.CodFilm = R2.CodFilm AND R1.CodAttore < R2.CodAttore
JOIN
	Attore A1 ON R1.CodAttore = A1.CodAttore
JOIN
	Attore A2 ON R2.CodAttore = A2.CodAttore
JOIN
	Film ON Film.CodFilm = R2.CodFilm
WHERE
	A1.Nome LIKE 'Leonardo' AND A1.Cognome LIKE 'DiCaprio' AND A2.Nome LIKE 'Marion' AND A2.Cognome LIKE 'Cotillard';

-- Per ogni regista che ha diretto almeno 3 film, il nome, cognome e il numero totale di film diretti
SELECT
	Regista.Nome,
	Regista.Cognome,
	COUNT(Film.CodRegista) as NumFilmDiretti
FROM
	Regista JOIN Film ON Film.CodRegista = Regista.CodRegista
GROUP BY Regista.CodRegista
HAVING NumFilmDiretti >= 3;

-- Il titolo dei film che hanno incassato più del doppio del loro budget e sono stati proiettati in almeno 10 cinema diversi
SELECT
	Film.Titolo,
	COUNT(DISTINCT Sala.CodCinema) as NumProiezioni
FROM
	Film JOIN Proiezione ON Film.CodFilm = Proiezione.CodFilm
JOIN
	Sala ON Proiezione.CodSala = Sala.CodSala
WHERE
	Film.Incasso > 2 * Film.Budget
GROUP BY Film.CodFilm
HAVING NumProiezioni >= 10;

-- Per ogni genere, il numero medio di attori che recitano nei film di quel genere
SELECT
	Film.Genere,
	AVG(
		(SELECT
			COUNT(Recita.CodAttore)
		FROM
			Recita
		WHERE Recita.CodFilm = Film.CodFilm
		)
	) as NumMedioAttori
FROM
	Film
GROUP BY Film.Genere
ORDER BY NumMedioAttori;


-- Il nome e cognome degli attori che hanno recitato in film di almeno 4 generi diversi
SELECT
	Attore.Nome,
	Attore.Cognome
FROM
	Attore JOIN Recita ON Attore.CodAttore = Recita.CodAttore
JOIN
	Film ON Recita.CodFilm = Film.CodFilm
GROUP BY Attore.CodAttore
HAVING COUNT(DISTINCT Film.Genere) >= 4;

-- Il titolo dei film che non sono mai stati proiettati in sale con meno di 100 posti
SELECT
	 Film.Titolo
FROM
	Film
WHERE NOT EXISTS (
	SELECT 1
	FROM
		Proiezione JOIN Sala ON Sala.CodSala = Proiezione.CodSala
		WHERE Proiezione.CodFilm = Film.CodFilm AND Sala.NumPosti < 100
);

-- Per ogni città con almeno 3 cinema, il numero totale di proiezioni effettuate nel 2023 e l'incasso totale generato
SELECT
	Cinema.Citta,
	COUNT(Proiezione.CodProiezione) as NumeroProiezioni,
	SUM(Proiezione.Prezzo * Proiezione.PostiVenduti) as IncassoTotale
FROM
	Proiezione JOIN Sala ON Sala.CodSala = Proiezione.CodSala
JOIN
	Cinema ON Cinema.CodCinema = Sala.CodCinema
WHERE YEAR(Proiezione.DataOra) = 2023
GROUP BY Cinema.Citta
HAVING COUNT(DISTINCT Cinema.CodCinema) >= 3;


-- Il titolo dei film che hanno avuto almeno una proiezione in tutte le città capoluogo di regione italiane

-- Per ogni regista, l'incasso più alto e la differenza percentuale rispetto al suo incasso medio
SELECT
	CONCAT(Regista.Nome, " ", Regista.Cognome) as NomeRegista,
	MAX(Film.Incasso) as IncassoPiuAlto
FROM
	Film JOIN Regista ON Film.CodRegista = Regista.CodRegista
GROUP BY Regista.CodRegista;


-- Gli attori che hanno recitato esclusivamente in film dello stesso regista e hanno fatto almeno 3 film insieme
INSERT INTO Attore (CodAttore, Nome, Cognome, AnnoNascita, Nazionalita)
VALUES ('A0100', 'Michael', 'Caine', 1933, 'UK');
INSERT INTO Film (CodFilm, Titolo, AnnoProduzione, Nazionalita, Budget, Incasso,
                  CodRegista, Genere, Durata, LinguaOriginale)
VALUES
('F0101', 'Batman Begins', 2005, 'USA', 150000000, 373661946, 'R0001', 'Azione', '02:20:00', 'Inglese'),
('F0102', 'Dark Knight', 2012, 'USA', 250000000, 1081041287, 'R0001', 'Azione', '02:44:00', 'Inglese'),
('F0103', 'Tenet', 2020, 'USA', 205000000, 365304105, 'R0001', 'Fantascienza', '02:30:00', 'Inglese');
INSERT INTO Recita (CodAttore, CodFilm, Ruolo, Compenso, PercentualeSchermo)
VALUES
('A0100', 'F0101', 'Secondario', 3000000, 20),
('A0100', 'F0102', 'Secondario', 3500000, 22),
('A0100', 'F0103', 'Secondario', 4000000, 25);

SELECT DISTINCT
	Attore.Nome,
	Attore.Cognome
FROM
	Attore JOIN Recita ON Recita.CodAttore = Attore.CodAttore
JOIN
	Film ON Recita.CodFilm = Film.CodFilm
WHERE NOT EXISTS (
	SELECT 1 FROM Film f2 JOIN Recita r2 ON f2.CodFilm = r2.CodFilm AND r2.CodAttore = Attore.CodAttore
	WHERE f2.CodRegista != Film.CodRegista
	) AND NOT EXISTS (
		SELECT
			COUNT(F3.CodFilm) as NumFilm
		FROM
			Film F3 JOIN Recita R3 ON F3.CodFilm = R3.CodFilm AND R3.CodAttore = Attore.CodAttore
		WHERE F3.CodRegista = Film.CodRegista
		GROUP BY Attore.CodAttore
		HAVING NumFilm < 3
);

-- Il titolo dei film in cui tutti gli attori protagonisti (PercentualeSchermo > 30) hanno vinto almeno un Oscar
SELECT
	Film.Titolo
FROM
	Film JOIN Recita ON Film.CodFilm = Recita.CodFilm
JOIN
	Attore ON Attore.CodAttore = Recita.CodAttore
JOIN
	Premio ON Attore.CodAttore = Premio.CodAttore AND Film.CodFilm = Premio.CodFilm AND Premio.NomePremio LIKE 'Oscar'
WHERE Recita.PercentualeSchermo > 30
GROUP BY Film.CodFilm, Film.Titolo
HAVING COUNT(DISTINCT Attore.CodAttore) = COUNT(DISTINCT Premio.CodPremio);

-- Per ogni coppia di attori che hanno recitato insieme in almeno 3 film, i loro nomi e il titolo dei film in comune
SELECT
	CONCAT(A1.Nome, " ", A1.Cognome) as PrimoAttore,
	CONCAT(A2.Nome, " ", A2.Cognome) as SecondoAttore,
	GROUP_CONCAT(Film.Titolo SEPARATOR ', ') as FilmInComune
FROM
	Recita R1 JOIN Recita R2 ON R1.CodAttore < R2.CodAttore AND R1.CodFilm = R2.CodFilm
JOIN
	Attore A1 ON A1.CodAttore = R1.CodAttore
JOIN
	Attore A2 ON A2.CodAttore = R2.CodAttore
JOIN
	Film ON Film.CodFilm = R2.CodFilm
GROUP BY A1.Nome, A1.Cognome, A1.CodAttore, A2.Nome, A2.Cognome, A2.CodAttore, Film.Titolo
HAVING COUNT(DISTINCT Film.CodFilm) >= 3;

-- Il nome dei cinema che hanno proiettato tutti i film vincitori di premi nella categoria "Miglior Film" degli ultimi 5 anni
SELECT
	Cinema.Nome
FROM
	Cinema JOIN Sala ON Cinema.CodCinema = Sala.CodCinema
JOIN
	Proiezione ON Sala.CodSala = Proiezione.CodSala
JOIN
	Premio ON Premio.CodFilm  = Proiezione.CodFilm AND Premio.Categoria LIKE 'Miglior Film'
GROUP BY Cinema.Nome, Cinema.CodCinema
HAVING COUNT(DISTINCT Proiezione.CodProiezione) = (SELECT COUNT(P2.CodPremio) FROM Premio P2 WHERE P2.Categoria LIKE 'Miglior Film');

-- Per ogni film prodotto dopo il 2015, calcolare la differenza tra l'incasso totale mondiale (somma degli incassi per paese) e l'incasso dichiarato nella tabella FILM


-- Trovare le triadi di attori (A, B, C) tali che A ha recitato con B, B ha recitato con C, ma A non ha mai recitato con C, limitando ai casi in cui tutti e tre hanno almeno 10 film ciascuno
-- Per ogni regista, calcolare il "coefficiente di successo" definito come: (incasso medio dei suoi film / budget medio) * (percentuale di film con incasso > budget), mostrando solo i registi con almeno 5 film e coefficiente > 2
-- Identificare i "film cult": film con incasso inferiore al budget ma che hanno avuto proiezioni continue (almeno una proiezione al mese) per più di 24 mesi consecutivi dalla data di uscita
-- Per ogni decennio dal 1980, trovare la "evoluzione stilistica" dei registi: mostrare i registi che hanno cambiato genere principale (il genere in cui hanno fatto più film) tra un decennio e il successivo
-- Trovare gli attori "ponte": attori che hanno recitato in film di due nazioni diverse e dove la somma degli incassi dei loro film nella prima nazione è almeno il doppio della somma nella seconda nazione, considerando solo attori con almeno 5 film per nazione
-- Per ogni sala cinematografica, calcolare il "tasso di occupazione medio ponderato" come: Σ(PostiVenduti * Durata) / Σ(NumPosti * Durata) per tutte le proiezioni del 2023, mostrando solo le sale con tasso > 0.6
-- Identificare i "cluster di successo": gruppi di almeno 4 attori dove ogni coppia di attori nel gruppo ha recitato insieme in almeno un film, e la media degli incassi dei film in cui hanno recitato tutti insieme è superiore a 500 milioni, ordinati per dimensione del cluster decrescente
