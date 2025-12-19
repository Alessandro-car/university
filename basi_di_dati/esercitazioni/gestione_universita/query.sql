DROP DATABASE IF EXISTS gestione_universita;

CREATE DATABASE IF NOT EXISTS gestione_universita;

USE gestione_universita;

CREATE TABLE IF NOT EXISTS Studente (
	Matricola CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	Data_nascita DATE,
	Corso_laurea VARCHAR(20),
	CONSTRAINT PRIMARY KEY(Matricola)
);

CREATE TABLE IF NOT EXISTS Docente (
	IdDocente CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	Dipartimento VARCHAR(20),
	CONSTRAINT PRIMARY KEY(IdDocente)
);

CREATE TABLE IF NOT EXISTS Corso (
	CodiceCorso CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	CFU INT,
	IdDocente CHAR(5),
	CONSTRAINT PRIMARY KEY(CodiceCorso),
	CONSTRAINT fk_corso_docente FOREIGN KEY(IdDocente) REFERENCES Docente(IdDocente)
);

CREATE TABLE IF NOT EXISTS Esame (
	IdEsame CHAR(5) NOT NULL,
	DataEsame DATE,
	CodiceCorso CHAR(5),
	CONSTRAINT PRIMARY KEY(IdEsame),
	CONSTRAINT fk_esame_corso FOREIGN KEY(CodiceCorso) REFERENCES Corso(CodiceCorso)
);

CREATE TABLE IF NOT EXISTS Iscrizione (
	Matricola CHAR(5) NOT NULL,
	IdEsame CHAR(5) NOT NULL,
	Voto INT,
	Lode BOOLEAN,
	CONSTRAINT PRIMARY KEY(Matricola, IdEsame),
	CONSTRAINT fk_iscrizione_studente FOREIGN KEY(Matricola) REFERENCES Studente(Matricola),
	CONSTRAINT fk_iscrizione_esame FOREIGN KEY(IdEsame) REFERENCES Esame(IdEsame)
);

-- INSERT per la tabella Studente
INSERT INTO Studente (Matricola, Nome, Cognome, Data_nascita, Corso_laurea) VALUES
('S0001', 'Mario', 'Rossi', '2002-03-15', 'Informatica'),
('S0002', 'Laura', 'Bianchi', '2001-07-22', 'Informatica'),
('S0003', 'Giuseppe', 'Verdi', '2003-01-10', 'Matematica'),
('S0004', 'Anna', 'Neri', '2002-11-05', 'Fisica'),
('S0005', 'Luca', 'Ferrara', '2001-09-18', 'Informatica'),
('S0006', 'Giulia', 'Romano', '2002-05-30', 'Matematica'),
('S0007', 'Marco', 'Colombo', '2003-02-14', 'Fisica'),
('S0008', 'Sofia', 'Ricci', '2001-12-03', 'Informatica');

-- INSERT per la tabella Docente
INSERT INTO Docente (IdDocente, Nome, Cognome, Dipartimento) VALUES
('D0001', 'Carlo', 'Martini', 'Informatica'),
('D0002', 'Elena', 'Greco', 'Matematica'),
('D0003', 'Roberto', 'Fontana', 'Fisica'),
('D0004', 'Paola', 'Serra', 'Informatica'),
('D0005', 'Andrea', 'Mancini', 'Matematica');

-- INSERT per la tabella Corso
INSERT INTO Corso (CodiceCorso, Nome, CFU, IdDocente) VALUES
('C0001', 'Programmazione', 9, 'D0001'),
('C0002', 'Basi di Dati', 9, 'D0004'),
('C0003', 'Analisi I', 12, 'D0002'),
('C0004', 'Fisica I', 9, 'D0003'),
('C0005', 'Algoritmi', 12, 'D0001'),
('C0006', 'Algebra Lineare', 9, 'D0005'),
('C0007', 'Reti', 6, 'D0004');

-- INSERT per la tabella Esame
INSERT INTO Esame (IdEsame, DataEsame, CodiceCorso) VALUES
('E0001', '2024-01-15', 'C0001'),
('E0002', '2024-01-20', 'C0002'),
('E0003', '2024-02-10', 'C0003'),
('E0004', '2024-02-15', 'C0004'),
('E0005', '2024-06-10', 'C0001'),
('E0006', '2024-06-15', 'C0005'),
('E0007', '2024-07-05', 'C0002'),
('E0008', '2024-07-10', 'C0006'),
('E0009', '2024-09-05', 'C0007');

-- INSERT per la tabella Iscrizione
INSERT INTO Iscrizione (Matricola, IdEsame, Voto, Lode) VALUES
('S0001', 'E0001', 28, FALSE),
('S0001', 'E0002', 30, TRUE),
('S0001', 'E0006', 27, FALSE),
('S0002', 'E0001', 25, FALSE),
('S0002', 'E0002', 30, FALSE),
('S0002', 'E0007', 26, FALSE),
('S0003', 'E0003', 30, TRUE),
('S0003', 'E0008', 29, FALSE),
('S0004', 'E0004', 24, FALSE),
('S0005', 'E0001', 30, TRUE),
('S0005', 'E0005', 28, FALSE),
('S0005', 'E0006', 30, TRUE),
('S0006', 'E0003', 27, FALSE),
('S0006', 'E0008', 30, FALSE),
('S0007', 'E0004', 26, FALSE),
('S0008', 'E0002', 29, FALSE),
('S0008', 'E0007', 30, TRUE);

-- Elencare i corsi che hanno avuto più di un appello d'esame
SELECT
	Corso.Nome,
	COUNT(*) as NumEsami
FROM
	Esame JOIN Corso ON Esame.CodiceCorso = Corso.CodiceCorso
GROUP BY Corso.Nome
HAVING NUmEsami > 1;

-- Calcolare la media dei voti per ciascuno studente (considerando solo esami sostenuti)
SELECT
	CONCAT(Studente.Nome, " ", Studente.Cognome) as NomeStudente,
	AVG(Iscrizione.Voto) as MediaVoti
FROM
	Studente JOIN Iscrizione ON Iscrizione.Matricola = Studente.Matricola
JOIN
	Esame ON Iscrizione.IdEsame = Esame.IdEsame
GROUP BY Studente.Matricola
ORDER BY MediaVoti;


-- Elencare i docenti che hanno avuto almeno uno studente con lode in un loro corso.

SELECT
	CONCAT(Docente.Nome, " ", Docente.Cognome) as NomeDocente,
	COUNT(Iscrizione.Lode) as NumStudentiLodi
FROM
	Iscrizione JOIN Esame ON Iscrizione.IdEsame = Esame.IdEsame
JOIN
	Corso ON Corso.CodiceCorso = Esame.CodiceCorso
JOIN
	Docente ON Corso.IdDocente = Docente.IdDocente
WHERE Iscrizione.Lode = TRUE
GROUP BY (Docente.IdDocente)
HAVING NumStudentiLodi >= 1
ORDER BY NumStudentiLodi;

-- Trovare gli studenti che hanno sostenuto più esami della media degli studenti.
SELECT
	CONCAT(Studente.Nome, " ", Studente.Cognome) as NomeStudente,
	COUNT(Iscrizione.IdEsame) as NumEsamiSostenuto
FROM
	Studente JOIN Iscrizione ON Studente.Matricola = Iscrizione.Matricola
JOIN
	Esame ON Iscrizione.IdEsame = Esame.IdEsame
GROUP BY Studente.Matricola
HAVING NumEsamiSostenuto >  (
	SELECT AVG(NumEsami) FROM (
		SELECT COUNT(*) as NumEsami FROM Iscrizione GROUP BY Iscrizione.Matricola
	) as subquery
);

-- Elencare i corsi il cui voto medio è maggiore della media globale di tutti gli esami.
SELECT
	Corso.Nome,
	AVG(Iscrizione.Voto) as VotoMedio
FROM
	Iscrizione JOIN Esame ON Iscrizione.IdEsame = Esame.IdEsame
JOIN
	Corso ON Corso.CodiceCorso = Esame.CodiceCorso
GROUP BY Corso.CodiceCorso
HAVING VotoMedio > (
	SELECT AVG(Iscrizione.Voto) FROM Iscrizione
);

-- Trovare gli studenti che non hanno mai preso la lode in nessun esame.
SELECT
	CONCAT(s1.Nome, " ", s1.Cognome) as NomeStudente,
	COUNT(Iscrizione.Lode) as NumLodiFalse
FROM
	Iscrizione JOIN Studente s1 ON Iscrizione.Matricola = s1.Matricola
WHERE Iscrizione.Lode = False
GROUP BY s1.Matricola
HAVING NumLodiFalse = (
		SELECT COUNT(Iscrizione.IdEsame) as NumEsami
		FROM
			Iscrizione
		WHERE Iscrizione.Matricola = s1.Matricola
);

-- Elencare nome e cognome degli studenti che hanno sostenuto almeno un esame nel mese di luglio 2024.
SELECT
	Studente.Nome,
	Studente.Cognome,
	COUNT(Iscrizione.IdEsame) as NumEsami
FROM
	Iscrizione JOIN Esame ON Iscrizione.IdEsame = Esame.IdEsame
JOIN
	Studente ON Studente.Matricola = Iscrizione.Matricola
WHERE
	YEAR(Esame.DataEsame) = 2024 AND MONTH(Esame.DataEsame) = 7
GROUP BY Studente.Matricola
HAVING NumEsami >= 1;

-- Trovare gli studenti che hanno una media voti maggiore della media del proprio corso di laurea.
SELECT
	CONCAT(Studente.Nome, " ", Studente.Cognome) as NomeStudente,
	Studente.Corso_laurea as Corso,
	AVG(Iscrizione.Voto) as MediaVoti
FROM
	Iscrizione JOIN Studente ON Iscrizione.Matricola = Studente.Matricola
JOIN
	Esame ON Iscrizione.IdEsame = Esame.IdEsame
GROUP BY Studente.Matricola
HAVING MediaVoti > (
	SELECT AVG(Iscrizione.Voto) FROM Iscrizione JOIN Esame e1 ON Iscrizione.IdEsame = e1.IdEsame JOIN Studente ON Iscrizione.Matricola = Studente.Matricola WHERE Studente.Corso_laurea = Corso
)
ORDER BY MediaVoti;

-- Trovare gli studenti che hanno ottenuto il voto massimo in almeno un esame.
SELECT DISTINCT
	CONCAT(Studente.Nome, " ", Studente.Cognome) as NomeStudente
FROM
	Iscrizione JOIN Studente ON Iscrizione.Matricola = Studente.Matricola
WHERE Iscrizione.Voto = (SELECT MAX(i2.Voto) FROM Iscrizione i2 WHERE i2.IdEsame = Iscrizione.IdEsame);
