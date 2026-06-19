generic
	max: Positive;
	type Chiave is private;
	type Valore is private;
package ClasseDizionario
begin
	procedure aggiungi(k: in Chiave, v: in Valore);
	function leggi(k: in Chiave) return Valore;
	procedure cancella(k: in Chiave);
end ClasseDizionario

package body ClasseDizionario
begin
	var chiavi: array(1..max) of Chiave;
	var valori: array(1..max) of Valore;
	top: Integer range (0..max) = 0;
	procedure aggiungi(k: in Chiave, v: in Valore)
	var i: Integer;
	begin
		if top == max then return;
		else
			for i := 1 to top
				if chiavi(i) == k then return;
			top := top + 1;
			chiavi(top) := k;
			valori(top) := v;
	end

	function leggi(k: in Chiave) return Valore
	var i: Integer;
	begin
		for i := 1 to top
			if chiavi(i) == k then return valori(i);
		raise "Chiave non trovata";
	end

	procedure cancella(k: in Chiave)
	var i: Integer;
	begin
		for i := 1 to top
			if chiavi(i) == k then
				chiavi(i) := chiavi(top)
				valori(i) := valori(top)
				top := top - 1
				return;
		raise "Chiave non trovata";
	end
end ClasseDizionario

with DizionarioClasse;
package d1 is new DizionarioClasse(100, Integer, Char)
with d1; use d1;
