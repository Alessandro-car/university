DROP DATABASE IF EXISTS gestione_aereoporti;

CREATE DATABASE IF NOT EXISTS gestione_aereoporti;

USE gestione_aereoporti;

CREATE TABLE IF NOT EXISTS aereoporto(
	citta VARCHAR(20) NOT NULL,
	nazione VARCHAR(20),
	num_piste INTEGER,
	CONSTRAINT PRIMARY KEY(citta)
);

CREATE TABLE IF NOT EXISTS aereo(
	tipo_aereo VARCHAR(15) NOT NULL,
	num_passeggeri INTEGER,
	qta_merci INTEGER,
	CONSTRAINT PRIMARY KEY(tipo_aereo)
);

CREATE TABLE IF NOT EXISTS volo(
	id_volo CHAR(5) NOT NULL,
	giorno_sett VARCHAR(15) NOT NULL,
	citta_part VARCHAR(20),
	ora_part TIME,
	citta_arr VARCHAR(20),
	ora_arr TIME,
	tipo_aereo VARCHAR(15),
	CONSTRAINT PRIMARY KEY(id_volo, giorno_sett),
	CONSTRAINT fk_volo_cittapart FOREIGN KEY (citta_part) REFERENCES aereoporto(citta) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT fk_volo_cittaarr FOREIGN KEY (citta_arr) REFERENCES aereoporto(citta) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT fk_volo_aereo FOREIGN KEY (tipo_aereo) REFERENCES aereo(tipo_aereo) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Bari', 'Italia', 2);
INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Francoforte', 'Germania', 3);
INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Milano', 'Italia', 3);
INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Atlanta', 'Stati Uniti', 5);
INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Tokyo', 'Giappone', 4);
INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Londra', 'Regno Unito', 2);
INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Amsterdam', 'Paesi Bassi', 6);
INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Roma', 'Italia', 4);
INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Los Angeles', 'Stati Uniti', 4);
INSERT INTO aereoporto (citta, nazione, num_piste) VALUES ('Dubai', 'EAU', 2);

INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('Boeing 737', 189, 2000);
INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('Airbus A320', 180, 1800);
INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('Boeing 747', 416, 5000);
INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('Airbus A380', 853, 6000);
INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('Boeing 787', 296, 3500);
INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('Airbus A350', 325, 4200);
INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('Embraer E190', 114, 1200);
INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('Boeing 777', 396, 4800);
INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('Airbus A220', 160, 1500);
INSERT INTO aereo (tipo_aereo, num_passeggeri, qta_merci) VALUES ('ATR 72', 78, 800);

INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('AZ101', 'Lunedì', 'Roma', '08:00:00', 'Londra', '10:30:00', 'Airbus A320');
INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('BA205', 'Martedì', 'Londra', '14:00:00', 'Dubai', '23:45:00', 'Boeing 777');
INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('EK312', 'Mercoledì', 'Dubai', '02:00:00', 'Tokyo', '15:30:00', 'Airbus A380');
INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('DL450', 'Giovedì', 'Atlanta', '09:30:00', 'Los Angeles', '11:45:00', 'Boeing 737');
INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('AF678', 'Venerdì', 'Amsterdam', '16:00:00', 'Roma', '18:15:00', 'Airbus A220');
INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('NH891', 'Sabato', 'Tokyo', '11:00:00', 'Los Angeles', '06:30:00', 'Boeing 787');
INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('KL234', 'Domenica', 'Amsterdam', '07:30:00', 'Dubai', '16:00:00', 'Boeing 747');
INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('UA567', 'Lunedì', 'Los Angeles', '18:00:00', 'Tokyo', '21:30:00', 'Boeing 777');
INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('BA890', 'Martedì', 'Londra', '12:00:00', 'Atlanta', '15:30:00', 'Airbus A350');
INSERT INTO volo (id_volo, giorno_sett, citta_part, ora_part, citta_arr, ora_arr, tipo_aereo) VALUES ('AZ202', 'Mercoledì', 'Roma', '10:30:00', 'Amsterdam', '12:45:00', 'Embraer E190');

/* Le città con aereoporto di cui non è noto il numero di piste */
UPDATE aereoporto SET num_piste = NULL WHERE citta = 'Bari';
UPDATE aereoporto SET num_piste = NULL WHERE citta = 'Roma';

SELECT citta FROM aereoporto WHERE num_piste IS NULL;

/* Le nazioni da cui parte e arriva il volo con codice AZ101 */
SELECT
	a1.nazione AS nazione_partenza,
	a2.nazione AS nazione_arrivo
FROM
	volo JOIN aereoporto as a1 ON volo.citta_part = a1.citta
JOIN
	aereoporto as a2 ON volo.citta_arr = a2.citta
WHERE
	volo.id_volo LIKE 'AZ101';

/* I tipi di aereo usati nei voli che partono da Roma */
SELECT tipo_aereo FROM volo WHERE citta_part LIKE 'Roma';

/* I tipo di areo e il corrispondente numero di passeggeri per i tipi di aereo usati nei voli che partono da Roma. Se la descrizione dell'aereo non è disponibile visualizzare solamente il tipo */

SELECT
	volo.tipo_aereo,
	aereo.num_passeggeri
FROM
	volo JOIN aereo ON volo.tipo_aereo = aereo.tipo_aereo
WHERE
	volo.citta_part = 'Roma';

/* Le città da cui partono voli internazionali */
SELECT
	volo.citta_part,
	volo.citta_arr
FROM
	volo JOIN aereoporto a1 ON volo.citta_part = a1.citta
JOIN
	aereoporto a2 ON volo.citta_arr = a2.citta
WHERE
	a1.nazione != a2.nazione;

/* Le città da cui partono voli diretti a Dubai, ordinate alfabeticamente*/
SELECT
	volo.citta_part
FROM
	volo
WHERE
	volo.citta_arr LIKE 'Dubai'
ORDER BY volo.citta_part;


