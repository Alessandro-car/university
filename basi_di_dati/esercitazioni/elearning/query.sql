DROP DATABASE IF EXISTS elearning;

CREATE DATABASE IF NOT EXISTS elearning;

USE elearning;

CREATE TABLE IF NOT EXISTS Docente(
	Codice CHAR(5) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	Email VARCHAR(255),
	Biografia TEXT,
	Specializzazione VARCHAR(20),
	AnniEsperienza INTEGER,
	CONSTRAINT PRIMARY KEY (Codice)
);

CREATE TABLE IF NOT EXISTS Categoria(
	IdCategoria VARCHAR(5) NOT NULL,
	Nome VARCHAR(15),
	CONSTRAINT PRIMARY KEY (IdCategoria)
);

CREATE TABLE IF NOT EXISTS Corso(
	Codice CHAR(5) NOT NULL,
	Titolo VARCHAR(15),
	Difficolta ENUM('Principiante', 'Intermedio', 'Avanzato'),
	Durata DECIMAL(5, 2),
	Prezzo INTEGER,
	DataPubblicazione DATE,
	CONSTRAINT PRIMARY KEY(Codice)
);

CREATE TABLE IF NOT EXISTS Tipologia(
	CodiceCorso CHAR(5) NOT NULL,
	CodiceCategoria VARCHAR(5) NOT NULL,
	CONSTRAINT PRIMARY KEY(CodiceCorso, CodiceCategoria),
	CONSTRAINT fk_tipologia_corso FOREIGN KEY(CodiceCorso) REFERENCES Corso(Codice),
	CONSTRAINT fk_tipologia_categorie FOREIGN KEY(CodiceCategoria) REFERENCES Categoria(IdCategoria)
);

CREATE TABLE IF NOT EXISTS Creazione(
	CodiceCorso CHAR(5) NOT NULL,
	CodiceDocente CHAR(5) NOT NULL,
	CONSTRAINT PRIMARY KEY(CodiceCorso, CodiceDocente),
	CONSTRAINT fk_creazione_corso FOREIGN KEY(CodiceCorso) REFERENCES Corso(Codice),
	CONSTRAINT fk_creazione_docente FOREIGN KEY(CodiceDocente) REFERENCES Docente(Codice)
);

CREATE TABLE IF NOT EXISTS Modulo(
	Numero INTEGER NOT NULL,
	Titolo VARCHAR(15),
	Descrizione TEXT,
	Durata DECIMAL(7, 2),
	CodiceCorso CHAR(5),
	CONSTRAINT PRIMARY KEY(Numero),
	CONSTRAINT fk_modulo_corso FOREIGN KEY(CodiceCorso) REFERENCES Corso(Codice)
);

CREATE TABLE IF NOT EXISTS Lezione(
	Numero INTEGER NOT NULL,
	Titolo VARCHAR(15),
	Tipo ENUM('Video', 'Test', 'Quiz'),
	Durata DECIMAL(5, 2),
	URL TEXT,
	NumeroModulo INTEGER,
	CONSTRAINT PRIMARY KEY(Numero),
	CONSTRAINT fk_lezione_modulo FOREIGN KEY(NumeroModulo) REFERENCES Modulo(Numero)
);

CREATE TABLE IF NOT EXISTS Studente(
	Username VARCHAR(10) NOT NULL,
	Nome VARCHAR(15),
	Cognome VARCHAR(15),
	Email VARCHAR(255),
	PaeseProvenienza VARCHAR(30),
	Crediti INTEGER,
	DataRegistrazione DATE,
	CONSTRAINT PRIMARY KEY(Username)
);

CREATE TABLE IF NOT EXISTS Visualizzazione(
	UsernameStudente VARCHAR(10) NOT NULL,
	NumeroLezione INTEGER NOT NULL,
	Data DATETIME,
	Completata BOOLEAN,
	CONSTRAINT PRIMARY KEY(UsernameStudente, NumeroLezione),
	CONSTRAINT fk_visualizzazione_studente FOREIGN KEY(UsernameStudente) REFERENCES Studente(Username),
	CONSTRAINT fk_visualizzazione_lezione FOREIGN KEY(NumeroLezione) REFERENCES Lezione(Numero)
);

CREATE TABLE IF NOT EXISTS CorsoAttivo(
	UsernameStudente VARCHAR(10) NOT NULL,
	CodiceCorso CHAR(5) NOT NULL,
	DataIscrizione DATE,
	Completamento INTEGER,
	CONSTRAINT check_completamento_corsoattivo CHECK (Completamento BETWEEN 0 AND 100),
	CONSTRAINT PRIMARY KEY(UsernameStudente, CodiceCorso),
	CONSTRAINT fk_corsoattivo_studente FOREIGN KEY(UsernameStudente) REFERENCES Studente(Username),
	CONSTRAINT fk_corsoattivo_corso FOREIGN KEY(CodiceCorso) REFERENCES Corso(Codice)
);

CREATE TABLE IF NOT EXISTS CorsoAbbandonato(
	UsernameStudente VARCHAR(10) NOT NULL,
	CodiceCorso CHAR(5) NOT NULL,
	DataIscrizione DATE,
	Completamento INTEGER,
	CONSTRAINT check_completamento_corsoabbandonato CHECK (Completamento BETWEEN 0 AND 100),
	CONSTRAINT PRIMARY KEY(UsernameStudente, CodiceCorso),
	CONSTRAINT fk_corsoabbandonato_studente FOREIGN KEY(UsernameStudente) REFERENCES Studente(Username),
	CONSTRAINT fk_corsoabbandonato_corso FOREIGN KEY(CodiceCorso) REFERENCES Corso(Codice)
);

CREATE TABLE IF NOT EXISTS CorsoCompletato(
	UsernameStudente VARCHAR(10) NOT NULL,
	CodiceCorso CHAR(5) NOT NULL,
	DataIscrizione DATE,
	Valutazione INTEGER,
	CONSTRAINT check_valutazione_corso CHECK (Valutazione BETWEEN 1 AND 5),
	CONSTRAINT PRIMARY KEY(UsernameStudente, CodiceCorso),
	CONSTRAINT fk_corsocompletato_studente FOREIGN KEY(UsernameStudente) REFERENCES Studente(Username),
	CONSTRAINT fk_corsocompletato_corso FOREIGN KEY(CodiceCorso) REFERENCES Corso(Codice)
);

CREATE TABLE IF NOT EXISTS Recensione(
	UsernameStudente VARCHAR(10) NOT NULL,
	CodiceCorsoCompletato CHAR(5) NOT NULL,
	Valutazione INTEGER,
	Commento TEXT,
	DataRecensione DATE,
	CONSTRAINT check_valutazione_recensione CHECK (Valutazione BETWEEN 1 AND 5),
	CONSTRAINT PRIMARY KEY(UsernameStudente, CodiceCorsoCompletato),
	CONSTRAINT fk_recensione_studente FOREIGN KEY(UsernameStudente) REFERENCES CorsoCompletato(UsernameStudente),
	CONSTRAINT fk_recensione_corso FOREIGN KEY(CodiceCorsoCompletato) REFERENCES CorsoCompletato(CodiceCorso)
);

CREATE TABLE IF NOT EXISTS Certificato(
	Codice CHAR(5) NOT NULL,
	DataEmissione DATE,
	URL TEXT,
	CorsoCompletato CHAR(5),
	UsernameStudente VARCHAR(10),
	CONSTRAINT PRIMARY KEY(Codice),
	CONSTRAINT fk_certificato_corsocompletato FOREIGN KEY(CorsoCompletato) REFERENCES CorsoCompletato(CodiceCorso),
	CONSTRAINT fk_certificato_studente FOREIGN KEY(UsernameStudente) REFERENCES CorsoCompletato(UsernameStudente)
);

-- ============================================
-- INSERT DATA - PIATTAFORMA E-LEARNING
-- ============================================

-- TABELLA DOCENTE
INSERT INTO Docente (Codice, Nome, Cognome, Email, Biografia, Specializzazione, AnniEsperienza) VALUES
('D001', 'Marco', 'Rossi', 'marco.rossi@email.com', 'Esperto di programmazione con 15 anni di esperienza nel settore IT', 'Programmazione', 15),
('D002', 'Laura', 'Bianchi', 'laura.bianchi@email.com', 'Designer UX/UI con focus su applicazioni moderne', 'Design', 8),
('D003', 'Giuseppe', 'Verdi', 'giuseppe.verdi@email.com', 'Specialista in database e data science', 'Database', 12),
('D004', 'Anna', 'Neri', 'anna.neri@email.com', 'Consulente business e management', 'Business', 10),
('D005', 'Paolo', 'Gialli', 'paolo.gialli@email.com', 'Matematico e ricercatore', 'Matematica', 20),
('D006', 'Silvia', 'Blu', 'silvia.blu@email.com', 'Esperta di intelligenza artificiale', 'AI', 7),
('D007', 'Roberto', 'Viola', 'roberto.viola@email.com', 'Web developer full-stack', 'Web Development', 9);

-- TABELLA CATEGORIA
INSERT INTO Categoria (IdCategoria, Nome) VALUES
('CAT01', 'Programmazione'),
('CAT02', 'Design'),
('CAT03', 'Database'),
('CAT04', 'Business'),
('CAT05', 'Matematica'),
('CAT06', 'AI'),
('CAT07', 'Web'),
('CAT08', 'Mobile'),
('CAT09', 'Cloud'),
('CAT10', 'Security');

-- TABELLA CORSO
INSERT INTO Corso (Codice, Titolo, Difficolta, Durata, Prezzo, DataPubblicazione) VALUES
('C001', 'Python Base', 'Principiante', 20.00, 39, '2023-01-15'),
('C002', 'Java Avanzato', 'Avanzato', 40.00, 89, '2023-02-20'),
('C003', 'UI/UX Design', 'Intermedio', 25.00, 59, '2023-03-10'),
('C004', 'SQL Completo', 'Intermedio', 30.00, 69, '2023-04-05'),
('C005', 'Business Plan', 'Principiante', 15.00, 29, '2023-05-12'),
('C006', 'Machine Learn', 'Avanzato', 50.00, 129, '2023-06-18'),
('C007', 'React JS', 'Intermedio', 35.00, 79, '2023-07-22'),
('C008', 'Mobile Dev', 'Intermedio', 45.00, 99, '2023-08-30'),
('C009', 'Docker Base', 'Principiante', 18.00, 49, '2024-01-10'),
('C010', 'Cybersecurity', 'Avanzato', 55.00, 139, '2024-02-14'),
('C011', 'JavaScript', 'Principiante', 22.00, 45, '2024-03-20'),
('C012', 'Data Science', 'Avanzato', 48.00, 119, '2024-04-15'),
('C013', 'CSS Advanced', 'Intermedio', 20.00, 55, '2024-05-10'),
('C014', 'Marketing Dig', 'Principiante', 16.00, 35, '2024-06-25'),
('C015', 'Blockchain', 'Avanzato', 42.00, 149, '2024-07-30');

-- TABELLA TIPOLOGIA (Corsi-Categorie)
INSERT INTO Tipologia (CodiceCorso, CodiceCategoria) VALUES
('C001', 'CAT01'), -- Python -> Programmazione
('C002', 'CAT01'), -- Java -> Programmazione
('C003', 'CAT02'), -- UI/UX -> Design
('C004', 'CAT03'), -- SQL -> Database
('C004', 'CAT01'), -- SQL -> Programmazione (doppia categoria)
('C005', 'CAT04'), -- Business Plan -> Business
('C006', 'CAT06'), -- Machine Learn -> AI
('C006', 'CAT05'), -- Machine Learn -> Matematica (doppia categoria)
('C006', 'CAT01'), -- Machine Learn -> Programmazione (tripla categoria)
('C007', 'CAT07'), -- React -> Web
('C007', 'CAT01'), -- React -> Programmazione
('C008', 'CAT08'), -- Mobile -> Mobile
('C008', 'CAT01'), -- Mobile -> Programmazione
('C009', 'CAT09'), -- Docker -> Cloud
('C010', 'CAT10'), -- Cybersecurity -> Security
('C011', 'CAT01'), -- JavaScript -> Programmazione
('C011', 'CAT07'), -- JavaScript -> Web
('C012', 'CAT03'), -- Data Science -> Database
('C012', 'CAT05'), -- Data Science -> Matematica
('C012', 'CAT06'), -- Data Science -> AI
('C013', 'CAT07'), -- CSS -> Web
('C013', 'CAT02'), -- CSS -> Design
('C014', 'CAT04'), -- Marketing -> Business
('C015', 'CAT01'); -- Blockchain -> Programmazione

-- TABELLA CREAZIONE (Docenti-Corsi)
INSERT INTO Creazione (CodiceCorso, CodiceDocente) VALUES
('C001', 'D001'), -- Python -> Marco Rossi
('C002', 'D001'), -- Java -> Marco Rossi
('C003', 'D002'), -- UI/UX -> Laura Bianchi
('C005', 'D004'), -- Business Plan -> Anna Neri
('C006', 'D006'), -- Machine Learn -> Silvia Blu
('C006', 'D005'), -- Machine Learn -> Paolo Gialli (co-teaching)
('C007', 'D007'), -- React -> Roberto Viola
('C007', 'D001'), -- React -> Marco Rossi (co-teaching)
('C008', 'D001'), -- Mobile -> Marco Rossi
('C009', 'D001'), -- Docker -> Marco Rossi
('C010', 'D001'), -- Cybersecurity -> Marco Rossi
('C011', 'D007'), -- JavaScript -> Roberto Viola
('C012', 'D006'), -- Data Science -> Silvia Blu (co-teaching)
('C013', 'D002'), -- CSS -> Laura Bianchi
('C013', 'D007'), -- CSS -> Roberto Viola (co-teaching)
('C014', 'D004'), -- Marketing -> Anna Neri
('C015', 'D001'); -- Blockchain -> Marco Rossi

-- TABELLA MODULO
INSERT INTO Modulo (Numero, Titolo, Descrizione, Durata, CodiceCorso) VALUES
-- Moduli per Python Base (C001)
(1, 'Intro Python', 'Introduzione al linguaggio Python', 180.00, 'C001'),
(2, 'Variabili', 'Variabili e tipi di dati', 240.00, 'C001'),
(3, 'Controllo', 'If, for, while', 300.00, 'C001'),
(4, 'Funzioni', 'Definizione e uso delle funzioni', 280.00, 'C001'),
-- Moduli per Java Avanzato (C002)
(5, 'OOP Java', 'Programmazione orientata agli oggetti', 420.00, 'C002'),
(6, 'Collections', 'Liste, Set, Map', 380.00, 'C002'),
(7, 'Stream API', 'Programmazione funzionale in Java', 450.00, 'C002'),
(8, 'Multithreading', 'Gestione dei thread', 390.00, 'C002'),
-- Moduli per UI/UX Design (C003)
(9, 'Principi UX', 'Fondamenti di User Experience', 320.00, 'C003'),
(10, 'Wireframing', 'Creazione di wireframe', 280.00, 'C003'),
(11, 'Prototyping', 'Prototipazione interattiva', 350.00, 'C003'),
(12, 'Testing UX', 'Test di usabilità', 300.00, 'C003'),
-- Moduli per SQL Completo (C004)
(13, 'SQL Base', 'SELECT, INSERT, UPDATE, DELETE', 360.00, 'C004'),
(14, 'JOIN Advanced', 'Join complessi e subquery', 420.00, 'C004'),
(15, 'Ottimizzazione', 'Indici e performance', 380.00, 'C004'),
(16, 'Transazioni', 'ACID e transazioni', 340.00, 'C004'),
-- Moduli per React JS (C007)
(17, 'React Intro', 'Componenti e JSX', 400.00, 'C007'),
(18, 'Hooks', 'useState, useEffect, custom hooks', 450.00, 'C007'),
(19, 'Routing', 'React Router', 380.00, 'C007'),
(20, 'State Mgmt', 'Redux e Context API', 470.00, 'C007'),
-- Moduli per Machine Learning (C006)
(21, 'ML Intro', 'Introduzione al Machine Learning', 500.00, 'C006'),
(22, 'Supervised', 'Apprendimento supervisionato', 600.00, 'C006'),
(23, 'Unsupervised', 'Apprendimento non supervisionato', 550.00, 'C006'),
(24, 'Deep Learning', 'Reti neurali profonde', 650.00, 'C006'),
-- Moduli per Business Plan (C005)
(25, 'Analisi Merc', 'Analisi di mercato', 220.00, 'C005'),
(26, 'Piano Finanzi', 'Piano finanziario', 280.00, 'C005'),
(27, 'Strategie', 'Strategie di business', 300.00, 'C005');

-- TABELLA LEZIONE
INSERT INTO Lezione (Numero, Titolo, Tipo, Durata, URL, NumeroModulo) VALUES
-- Lezioni per Modulo 1 (Intro Python)
(1, 'Cos è Python', 'Video', 20.00, 'https://video.com/py1', 1),
(2, 'Installazione', 'Video', 15.00, 'https://video.com/py2', 1),
(3, 'Hello World', 'Video', 25.00, 'https://video.com/py3', 1),
(4, 'Quiz Intro', 'Quiz', 10.00, 'https://quiz.com/py1', 1),
-- Lezioni per Modulo 2 (Variabili)
(5, 'Tipi di Dati', 'Video', 30.00, 'https://video.com/py4', 2),
(6, 'Numeri', 'Video', 25.00, 'https://video.com/py5', 2),
(7, 'Stringhe', 'Video', 35.00, 'https://video.com/py6', 2),
(8, 'Test Variabili', 'Test', 15.00, 'https://test.com/py1', 2),
-- Lezioni per Modulo 3 (Controllo Flusso)
(9, 'Condizioni If', 'Video', 40.00, 'https://video.com/py7', 3),
(10, 'Loop For', 'Video', 45.00, 'https://video.com/py8', 3),
(11, 'Loop While', 'Video', 35.00, 'https://video.com/py9', 3),
(12, 'Quiz Control', 'Quiz', 20.00, 'https://quiz.com/py2', 3),
-- Lezioni per Modulo 5 (OOP Java)
(13, 'Classi', 'Video', 50.00, 'https://video.com/java1', 5),
(14, 'Oggetti', 'Video', 45.00, 'https://video.com/java2', 5),
(15, 'Ereditarietà', 'Video', 55.00, 'https://video.com/java3', 5),
(16, 'Polimorfismo', 'Video', 50.00, 'https://video.com/java4', 5),
(17, 'Quiz OOP', 'Quiz', 20.00, 'https://quiz.com/java1', 5),
-- Lezioni per Modulo 9 (Principi UX)
(18, 'User Research', 'Video', 40.00, 'https://video.com/ux1', 9),
(19, 'Personas', 'Video', 35.00, 'https://video.com/ux2', 9),
(20, 'User Journey', 'Video', 45.00, 'https://video.com/ux3', 9),
-- Lezioni per Modulo 13 (SQL Base)
(21, 'SELECT Query', 'Video', 50.00, 'https://video.com/sql1', 13),
(22, 'INSERT Data', 'Video', 40.00, 'https://video.com/sql2', 13),
(23, 'UPDATE DELETE', 'Video', 45.00, 'https://video.com/sql3', 13),
(24, 'Quiz SQL Base', 'Quiz', 25.00, 'https://quiz.com/sql1', 13),
-- Lezioni per Modulo 4 (Funzioni Python)
(25, 'Def Function', 'Video', 35.00, 'https://video.com/py10', 4),
(26, 'Parameters', 'Video', 40.00, 'https://video.com/py11', 4),
(27, 'Return Values', 'Video', 30.00, 'https://video.com/py12', 4),
(28, 'Quiz Function', 'Quiz', 15.00, 'https://quiz.com/py3', 4),
-- Lezioni per Modulo 6 (Collections Java)
(29, 'List', 'Video', 45.00, 'https://video.com/java5', 6),
(30, 'Set', 'Video', 40.00, 'https://video.com/java6', 6),
(31, 'Map', 'Video', 50.00, 'https://video.com/java7', 6),
(32, 'Quiz Collect', 'Quiz', 20.00, 'https://quiz.com/java2', 6),
-- Lezioni per Modulo 7 (Stream API)
(33, 'Stream Intro', 'Video', 55.00, 'https://video.com/java8', 7),
(34, 'Filter Map', 'Video', 60.00, 'https://video.com/java9', 7),
(35, 'Reduce', 'Video', 50.00, 'https://video.com/java10', 7),
(36, 'Test Stream', 'Test', 25.00, 'https://test.com/java1', 7),
-- Lezioni per Modulo 10 (Wireframing)
(37, 'Tools', 'Video', 35.00, 'https://video.com/ux4', 10),
(38, 'Low Fidelity', 'Video', 40.00, 'https://video.com/ux5', 10),
(39, 'High Fidelity', 'Video', 45.00, 'https://video.com/ux6', 10),
-- Lezioni per Modulo 14 (JOIN Advanced)
(40, 'Inner Join', 'Video', 55.00, 'https://video.com/sql4', 14),
(41, 'Left Right', 'Video', 50.00, 'https://video.com/sql5', 14),
(42, 'Subqueries', 'Video', 60.00, 'https://video.com/sql6', 14),
(43, 'Quiz Join', 'Quiz', 30.00, 'https://quiz.com/sql2', 14),
-- Lezioni per Modulo 18 (Hooks React)
(44, 'useState', 'Video', 50.00, 'https://video.com/react4', 18),
(45, 'useEffect', 'Video', 55.00, 'https://video.com/react5', 18),
(46, 'Custom Hooks', 'Video', 60.00, 'https://video.com/react6', 18),
-- Lezioni per Modulo 21 (ML Intro)
(47, 'What is ML', 'Video', 60.00, 'https://video.com/ml1', 21),
(48, 'Types of ML', 'Video', 65.00, 'https://video.com/ml2', 21),
(49, 'Algorithms', 'Video', 70.00, 'https://video.com/ml3', 21),
(50, 'Quiz ML Intro', 'Quiz', 35.00, 'https://quiz.com/ml1', 21);

-- TABELLA STUDENTE
INSERT INTO Studente (Username, Nome, Cognome, Email, PaeseProvenienza, Crediti, DataRegistrazione) VALUES
('mario.r', 'Mario', 'Rossi', 'mario.rossi@stud.com', 'Italia', 200, '2023-01-10'),
('laura.b', 'Laura', 'Bianchi', 'laura.bianchi@stud.com', 'Italia', 150, '2023-02-15'),
('john.d', 'John', 'Doe', 'john.doe@stud.com', 'USA', 300, '2023-03-20'),
('anna.v', 'Anna', 'Verdi', 'anna.verdi@stud.com', 'Italia', 100, '2023-04-25'),
('luis.g', 'Luis', 'Garcia', 'luis.garcia@stud.com', 'Spagna', 250, '2023-05-30'),
('emma.s', 'Emma', 'Smith', 'emma.smith@stud.com', 'UK', 180, '2023-06-10'),
('paolo.n', 'Paolo', 'Neri', 'paolo.neri@stud.com', 'Italia', 220, '2023-07-15'),
('maria.l', 'Maria', 'Lopez', 'maria.lopez@stud.com', 'Messico', 90, '2023-08-20'),
('pierre.d', 'Pierre', 'Dubois', 'pierre.dubois@stud.com', 'Francia', 270, '2023-09-25'),
('sofia.m', 'Sofia', 'Müller', 'sofia.muller@stud.com', 'Germania', 160, '2023-10-30'),
('luca.f', 'Luca', 'Ferrari', 'luca.ferrari@stud.com', 'Italia', 130, '2024-01-05'),
('alice.w', 'Alice', 'Wang', 'alice.wang@stud.com', 'Cina', 200, '2024-02-10'),
('carlos.s', 'Carlos', 'Silva', 'carlos.silva@stud.com', 'Brasile', 110, '2024-03-15'),
('yuki.t', 'Yuki', 'Tanaka', 'yuki.tanaka@stud.com', 'Giappone', 240, '2024-04-20'),
('olga.p', 'Olga', 'Petrova', 'olga.petrova@stud.com', 'Russia', 190, '2024-05-25'),
('ahmed.k', 'Ahmed', 'Khan', 'ahmed.khan@stud.com', 'Pakistan', 80, '2024-06-30'),
('sara.c', 'Sara', 'Cohen', 'sara.cohen@stud.com', 'Israele', 210, '2024-07-05'),
('marco.g', 'Marco', 'Gialli', 'marco.gialli@stud.com', 'Italia', 170, '2024-08-10'),
('nina.b', 'Nina', 'Brown', 'nina.brown@stud.com', 'Australia', 140, '2024-09-15'),
('diego.m', 'Diego', 'Martinez', 'diego.martinez@stud.com', 'Argentina', 120, '2024-10-20');

-- TABELLA CORSOCOMPLETATO
INSERT INTO CorsoCompletato (UsernameStudente, CodiceCorso, DataIscrizione, Valutazione) VALUES
('mario.r', 'C001', '2023-02-01', 5),
('mario.r', 'C004', '2023-05-01', 4),
('mario.r', 'C007', '2023-08-01', 5),
('laura.b', 'C001', '2023-03-15', 4),
('laura.b', 'C003', '2023-06-20', 5),
('john.d', 'C002', '2023-04-10', 5),
('john.d', 'C006', '2023-09-15', 4),
('anna.v', 'C001', '2023-06-01', 3),
('anna.v', 'C005', '2023-08-10', 4),
('luis.g', 'C004', '2023-07-05', 5),
('luis.g', 'C007', '2023-10-12', 5),
('emma.s', 'C003', '2023-08-20', 4),
('paolo.n', 'C001', '2023-09-10', 5),
('paolo.n', 'C004', '2023-11-25', 4),
('paolo.n', 'C007', '2024-02-15', 5),
('maria.l', 'C001', '2023-10-05', 3),
('pierre.d', 'C002', '2023-11-10', 5),
('pierre.d', 'C006', '2024-03-20', 5),
('sofia.m', 'C003', '2023-12-15', 4),
('luca.f', 'C001', '2024-02-10', 4),
('alice.w', 'C004', '2024-04-15', 5),
('alice.w', 'C007', '2024-07-20', 4),
('carlos.s', 'C001', '2024-05-01', 3),
('yuki.t', 'C002', '2024-06-10', 5),
('yuki.t', 'C006', '2024-09-15', 4);

-- TABELLA CORSOATTIVO
INSERT INTO CorsoAttivo (UsernameStudente, CodiceCorso, DataIscrizione, Completamento) VALUES
('mario.r', 'C002', '2024-09-01', 45),
('mario.r', 'C006', '2024-10-15', 30),
('laura.b', 'C004', '2024-09-20', 60),
('laura.b', 'C007', '2024-11-01', 25),
('john.d', 'C007', '2024-08-15', 70),
('anna.v', 'C003', '2024-10-01', 40),
('luis.g', 'C002', '2024-09-10', 55),
('emma.s', 'C001', '2024-11-05', 20),
('emma.s', 'C004', '2024-10-20', 50),
('paolo.n', 'C006', '2024-11-10', 35),
('maria.l', 'C003', '2024-10-25', 15),
('pierre.d', 'C007', '2024-11-15', 80),
('sofia.m', 'C001', '2024-10-30', 65),
('luca.f', 'C004', '2024-11-01', 45),
('alice.w', 'C002', '2024-10-10', 38),
('olga.p', 'C001', '2024-11-20', 12),
('sara.c', 'C003', '2024-11-08', 28),
('marco.g', 'C005', '2024-10-15', 72),
('nina.b', 'C001', '2024-11-12', 33),
('diego.m', 'C004', '2024-11-18', 18);

-- TABELLA CORSOABBANDONATO
INSERT INTO CorsoAbbandonato (UsernameStudente, CodiceCorso, DataIscrizione, Completamento) VALUES
('mario.r', 'C005', '2023-03-10', 25),
('laura.b', 'C002', '2023-05-15', 15),
('john.d', 'C001', '2023-04-20', 30),
('anna.v', 'C007', '2023-09-05', 10),
('luis.g', 'C003', '2023-08-12', 20),
('emma.s', 'C002', '2023-09-18', 35),
('paolo.n', 'C005', '2023-10-22', 40),
('maria.l', 'C004', '2023-11-08', 18),
('pierre.d', 'C001', '2023-12-01', 22),
('sofia.m', 'C002', '2024-01-15', 28),
('luca.f', 'C003', '2024-03-20', 12),
('carlos.s', 'C002', '2024-06-10', 8),
('yuki.t', 'C001', '2024-07-15', 45),
('olga.p', 'C003', '2024-08-20', 33),
('ahmed.k', 'C001', '2024-09-05', 16);

-- TABELLA VISUALIZZAZIONE
INSERT INTO Visualizzazione (UsernameStudente, NumeroLezione, Data, Completata) VALUES
-- Mario visualizzazioni
('mario.r', 1, '2024-09-02 10:30:00', TRUE),
('mario.r', 2, '2024-09-02 11:00:00', TRUE),
('mario.r', 3, '2024-09-03 14:20:00', TRUE),
('mario.r', 13, '2024-09-05 09:15:00', TRUE),
('mario.r', 14, '2024-09-06 16:45:00', TRUE),
('mario.r', 15, '2024-09-08 11:30:00', FALSE),
-- Laura visualizzazioni
('laura.b', 21, '2024-09-21 10:00:00', TRUE),
('laura.b', 22, '2024-09-22 15:30:00', TRUE),
('laura.b', 23, '2024-09-23 11:15:00', TRUE),
('laura.b', 24, '2024-09-25 14:00:00', TRUE),
('laura.b', 25, '2024-11-02 10:30:00', TRUE),
('laura.b', 26, '2024-11-03 16:20:00', FALSE),
-- John visualizzazioni
('john.d', 25, '2024-08-16 09:45:00', TRUE),
('john.d', 26, '2024-08-17 14:30:00', TRUE),
('john.d', 27, '2024-08-18 10:15:00', TRUE),
('john.d', 28, '2024-08-20 16:00:00', TRUE),
-- Anna visualizzazioni
('anna.v', 18, '2024-10-02 11:30:00', TRUE),
('anna.v', 19, '2024-10-03 15:45:00', TRUE),
('anna.v', 20, '2024-10-05 10:00:00', FALSE),
-- Luis visualizzazioni
('luis.g', 13, '2024-09-11 09:20:00', TRUE),
('luis.g', 14, '2024-09-12 14:50:00', TRUE),
('luis.g', 15, '2024-09-13 11:10:00', TRUE),
('luis.g', 16, '2024-09-15 16:30:00', FALSE),
-- Emma visualizzazioni
('emma.s', 1, '2024-11-06 10:15:00', TRUE),
('emma.s', 2, '2024-11-06 11:30:00', TRUE),
('emma.s', 3, '2024-11-07 14:00:00', FALSE),
('emma.s', 21, '2024-10-21 09:40:00', TRUE),
('emma.s', 22, '2024-10-22 15:15:00', TRUE),
-- Paolo visualizzazioni
('paolo.n', 21, '2024-11-11 10:30:00', TRUE),
('paolo.n', 22, '2024-11-12 14:45:00', TRUE),
-- Pierre visualizzazioni
('pierre.d', 25, '2024-11-16 09:50:00', TRUE),
('pierre.d', 26, '2024-11-17 15:20:00', TRUE),
('pierre.d', 27, '2024-11-18 11:40:00', TRUE),
('pierre.d', 28, '2024-11-19 16:10:00', TRUE),
-- Sofia visualizzazioni
('sofia.m', 1, '2024-10-31 10:00:00', TRUE),
('sofia.m', 2, '2024-10-31 11:20:00', TRUE),
('sofia.m', 3, '2024-11-01 14:30:00', TRUE),
('sofia.m', 4, '2024-11-02 09:45:00', TRUE);

-- TABELLA RECENSIONE
INSERT INTO Recensione (UsernameStudente, CodiceCorsoCompletato, Valutazione, Commento, DataRecensione) VALUES
('mario.r', 'C001', 5, 'Corso eccellente per iniziare con Python!', '2023-03-15'),
('mario.r', 'C004', 4, 'Molto utile per comprendere SQL', '2023-07-20'),
('mario.r', 'C007', 5, 'React spiegato in modo chiaro e dettagliato', '2023-10-10'),
('laura.b', 'C001', 4, 'Buon corso base, ben strutturato', '2023-05-01'),
('laura.b', 'C003', 5, 'Fantastico per chi vuole imparare il design UX', '2023-08-15'),
('john.d', 'C002', 5, 'Approfondimento Java eccezionale', '2023-06-20'),
('john.d', 'C006', 4, 'ML spiegato bene ma molto impegnativo', '2023-12-01'),
('anna.v', 'C005', 4, 'Utile per capire come fare un business plan', '2023-09-25'),
('luis.g', 'C004', 5, 'Il miglior corso SQL che abbia seguito', '2023-09-10'),
('luis.g', 'C007', 5, 'React diventa facile con questo corso', '2023-12-20'),
('emma.s', 'C003', 4, 'Molto pratico e orientato al lavoro reale', '2023-10-30'),
('paolo.n', 'C001', 5, 'Perfetto per chi parte da zero', '2023-11-15'),
('paolo.n', 'C007', 5, 'Docente preparatissimo', '2024-04-01'),
('pierre.d', 'C002', 5, 'Java avanzato spiegato magistralmente', '2024-01-10'),
('pierre.d', 'C006', 5, 'ML corso completo e professionale', '2024-05-15'),
('alice.w', 'C004', 5, 'SQL finalmente chiaro!', '2024-06-20'),
('alice.w', 'C007', 4, 'Ottimo corso React', '2024-09-10'),
('yuki.t', 'C002', 5, 'Corso impegnativo ma ne vale la pena', '2024-08-15'),
('yuki.t', 'C006', 4, 'ML ben spiegato con esempi pratici', '2024-11-01');

-- TABELLA CERTIFICATO
INSERT INTO Certificato (Codice, DataEmissione, URL, CorsoCompletato, UsernameStudente) VALUES
('CRT01', '2023-03-16', 'https://cert.com/crt01.pdf', 'C001', 'mario.r'),
('CRT02', '2023-07-21', 'https://cert.com/crt02.pdf', 'C004', 'mario.r'),
('CRT03', '2023-10-11', 'https://cert.com/crt03.pdf', 'C007', 'mario.r'),
('CRT04', '2023-05-02', 'https://cert.com/crt04.pdf', 'C001', 'laura.b'),
('CRT05', '2023-08-16', 'https://cert.com/crt05.pdf', 'C003', 'laura.b'),
('CRT06', '2023-06-21', 'https://cert.com/crt06.pdf', 'C002', 'john.d'),
('CRT07', '2023-12-02', 'https://cert.com/crt07.pdf', 'C006', 'john.d'),
('CRT08', '2023-08-12', 'https://cert.com/crt08.pdf', 'C001', 'anna.v'),
('CRT09', '2023-09-26', 'https://cert.com/crt09.pdf', 'C005', 'anna.v'),
('CRT10', '2023-09-11', 'https://cert.com/crt10.pdf', 'C004', 'luis.g'),
('CRT11', '2023-12-21', 'https://cert.com/crt11.pdf', 'C007', 'luis.g'),
('CRT12', '2023-10-31', 'https://cert.com/crt12.pdf', 'C003', 'emma.s'),
('CRT13', '2023-11-16', 'https://cert.com/crt13.pdf', 'C001', 'paolo.n'),
('CRT14', '2024-01-05', 'https://cert.com/crt14.pdf', 'C004', 'paolo.n'),
('CRT15', '2024-04-02', 'https://cert.com/crt15.pdf', 'C007', 'paolo.n'),
('CRT16', '2023-11-10', 'https://cert.com/crt16.pdf', 'C001', 'maria.l'),
('CRT17', '2024-01-11', 'https://cert.com/crt17.pdf', 'C002', 'pierre.d'),
('CRT18', '2024-05-16', 'https://cert.com/crt18.pdf', 'C006', 'pierre.d'),
('CRT19', '2024-01-18', 'https://cert.com/crt19.pdf', 'C003', 'sofia.m'),
('CRT20', '2024-03-15', 'https://cert.com/crt20.pdf', 'C001', 'luca.f'),
('CRT21', '2024-06-21', 'https://cert.com/crt21.pdf', 'C004', 'alice.w'),
('CRT22', '2024-09-11', 'https://cert.com/crt22.pdf', 'C007', 'alice.w'),
('CRT23', '2024-06-05', 'https://cert.com/crt23.pdf', 'C001', 'carlos.s'),
('CRT24', '2024-08-16', 'https://cert.com/crt24.pdf', 'C002', 'yuki.t'),
('CRT25', '2024-11-02', 'https://cert.com/crt25.pdf', 'C006', 'yuki.t');

-- Elencare tutti i corsi di livello "Principiante" con prezzo inferiore a 50 euro, mostrando titolo e prezzo.
SELECT
	Corso.Titolo,
	Corso.Prezzo
FROM
	Corso
WHERE
	Corso.Difficolta LIKE 'Principiante';

-- Trovare il numero totale di studenti iscritti per ogni corso, mostrando il titolo del corso e il conteggio.
SELECT subquery.Titolo, SUM(subquery.num_iscrizioni) as num_iscrizioni FROM
(
	SELECT
		Corso.Titolo,
		COUNT(*) as num_iscrizioni
	FROM
		Corso
	JOIN
		CorsoCompletato ON CorsoCompletato.CodiceCorso = Corso.Codice
	JOIN
		Studente ON Studente.Username = CorsoCompletato.UsernameStudente
	GROUP BY Corso.Titolo
	UNION SELECT
		Corso.Titolo,
		COUNT(*) as num_iscrizioni
	FROM
		Corso
	JOIN
		CorsoAttivo ON CorsoAttivo.CodiceCorso = Corso.Codice
	JOIN
		Studente ON Studente.Username = CorsoAttivo.UsernameStudente
	GROUP BY Corso.Titolo
	UNION SELECT
		Corso.Titolo,
		Count(*) as num_iscrizioni
	FROM
		Corso
	JOIN
		CorsoAbbandonato ON CorsoAbbandonato.CodiceCorso = Corso.Codice
	JOIN
		Studente ON Studente.Username = CorsoAbbandonato.UsernameStudente
	GROUP BY Corso.Titolo
) as subquery
GROUP BY subquery.Titolo;

-- Elencare i docenti che non hanno ancora pubblicato nessun corso.
SELECT
	Docente.Nome,
	Docente.Cognome
FROM
	Docente LEFT JOIN Creazione ON Docente.Codice = Creazione.CodiceDocente
WHERE
	Creazione.CodiceDocente IS NULL;

-- Calcolare la valutazione media di ogni corso (dalla tabella Recensioni), mostrando solo i corsi con media superiore a 4 stelle.
SELECT
	Corso.Titolo,
	AVG(Recensione.Valutazione) as media_valutazione
FROM
	CorsoCompletato JOIN Recensione ON CorsoCompletato.CodiceCorso = Recensione.CodiceCorsoCompletato AND CorsoCompletato.UsernameStudente = Recensione.UsernameStudente
JOIN
	Corso ON CorsoCompletato.CodiceCorso = Corso.Codice
GROUP BY Corso.Titolo
HAVING media_valutazione > 4;

-- Trovare tutti gli studenti che hanno completato almeno 3 corsi.
SELECT
	Studente.Nome,
	Studente.Cognome,
	COUNT(CorsoCompletato.UsernameStudente) as num_corsi_completati
FROM
	CorsoCompletato JOIN Corso ON CorsoCompletato.CodiceCorso = Corso.Codice
JOIN
	Studente ON CorsoCompletato.UsernameStudente = Studente.Username
GROUP BY Studente.Username
HAVING num_corsi_completati >= 3;

-- Per ogni categoria, calcolare il numero di corsi disponibili e la durata totale in ore.
SELECT
	COUNT(*) as num_corsi,
	Categoria.Nome,
	(SUM(Corso.Durata) / 60) as durata_totale
FROM
	Corso JOIN Tipologia ON Corso.Codice = Tipologia.CodiceCorso
JOIN
	Categoria ON Categoria.IdCategoria = Tipologia.CodiceCategoria
GROUP BY Categoria.IdCategoria;

-- Elencare le lezioni di tipo "Quiz" del corso con codice 'PROG101', mostrando il titolo del modulo, il numero della lezione e il titolo della lezione.

-- Trovare i 10 corsi più popolari (con più iscrizioni) pubblicati nell'ultimo anno.
SELECT subquery.Titolo, SUM(subquery.num_iscrizioni) as num_iscrizioni FROM
(
	SELECT
		Corso.Titolo,
		COUNT(*) as num_iscrizioni
	FROM
		Corso
	JOIN
		CorsoCompletato ON CorsoCompletato.CodiceCorso = Corso.Codice
	JOIN
		Studente ON Studente.Username = CorsoCompletato.UsernameStudente
	WHERE YEAR(Corso.DataPubblicazione) = '2023'
	GROUP BY Corso.Titolo
	UNION SELECT
		Corso.Titolo,
		COUNT(*) as num_iscrizioni
	FROM
		Corso
	JOIN
		CorsoAttivo ON CorsoAttivo.CodiceCorso = Corso.Codice
	JOIN
		Studente ON Studente.Username = CorsoAttivo.UsernameStudente
	WHERE YEAR(Corso.DataPubblicazione) = '2023'
	GROUP BY Corso.Titolo
	UNION SELECT
		Corso.Titolo,
		Count(*) as num_iscrizioni
	FROM
		Corso
	JOIN
		CorsoAbbandonato ON CorsoAbbandonato.CodiceCorso = Corso.Codice
	JOIN
		Studente ON Studente.Username = CorsoAbbandonato.UsernameStudente
	WHERE YEAR(Corso.DataPubblicazione) = '2023'
	GROUP BY Corso.Titolo
) as subquery
GROUP BY subquery.Titolo
ORDER BY num_iscrizioni DESC;


-- Calcolare, per ogni studente, la percentuale media di completamento di tutti i suoi corsi attivi.
SELECT
	CONCAT(Studente.Nome, " ", Studente.Cognome) as nome_studente,
	AVG(CorsoAttivo.Completamento) as percentuale_media
FROM
	Corso
JOIN
	CorsoAttivo ON CorsoAttivo.CodiceCorso = Corso.Codice
JOIN
	Studente ON Studente.Username = CorsoAttivo.UsernameStudente
GROUP BY nome_studente;

-- Trovare le coppie di studenti che hanno seguito esattamente gli stessi corsi (stesso insieme di corsi).

-- Elencare i docenti con la media delle valutazioni dei loro corsi superiore a 4.5, mostrando nome, cognome e media delle valutazioni.
SELECT
	CONCAT(Docente.Nome, " ", Docente.Cognome) as nome_docente,
	AVG(Recensione.Valutazione) as media_valutazioni
FROM
	Docente JOIN Creazione ON Docente.Codice = Creazione.CodiceDocente
JOIN
	CorsoCompletato ON CorsoCompletato.CodiceCorso = Creazione.CodiceCorso
JOIN
	Recensione ON CorsoCompletato.CodiceCorso = Recensione.CodiceCorsoCompletato
GROUP BY nome_docente
HAVING media_valutazioni > 4.5;

-- Trovare i corsi che non hanno ricevuto nessuna recensione nonostante abbiano studenti che li hanno completati.
-- Per ogni mese dell'anno corrente, calcolare il numero di nuove iscrizioni e il fatturato totale (somma dei prezzi dei corsi).
-- Trovare gli studenti che hanno visualizzato tutte le lezioni di almeno un corso ma non hanno ancora completato quel corso (percentuale < 100%).
-- Creare una vista che mostri, per ogni corso, il numero totale di moduli, il numero totale di lezioni, la durata totale in minuti e il numero di studenti iscritti.
-- Trovare i corsi che appartengono a più di 2 categorie diverse.
SELECT
	Corso.Titolo,
	COUNT(*) as NumCategorie
FROM
	Tipologia JOIN Corso ON Tipologia.CodiceCorso = Corso.Codice
GROUP BY Corso.Codice
HAVING NumCategorie > 2;
-- Elencare i primi 5 studenti che hanno guadagnato più certificati, mostrando username e numero di certificati.
-- Trovare le lezioni che nessuno studente ha ancora visualizzato, mostrando il titolo del corso, il titolo del modulo e il titolo della lezione.
-- Calcolare il tasso di abbandono per ogni corso (percentuale di iscrizioni con stato "Abbandonato" sul totale delle iscrizioni).
-- Per ogni docente, trovare il corso con il maggior numero di iscrizioni e mostrare nome docente, titolo del corso e numero di iscrizioni.
-- Aggiornare la percentuale di completamento al 100% e lo stato a 'Completato' per tutte le iscrizioni dello studente 'maria.bianchi' che hanno percentuale >= 95%.
-- Trovare, per ogni paese, lo studente con il maggior numero di corsi completati.
-- Creare una query che identifichi i "corsi consigliati" per uno studente: corsi della stessa categoria dei corsi che ha già completato, che non ha ancora seguito, con valutazione media >= 4.
-- Trovare tutte le coppie di docenti che hanno collaborato (creato almeno un corso insieme), mostrando i nomi dei docenti e il numero di corsi in cui hanno collaborato.

