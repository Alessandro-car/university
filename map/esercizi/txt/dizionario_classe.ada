generic
package DizionarioClasse
begin
	procedure aggiungi(k: in Integer, v: in Character);
	function leggi(k: in Integer) return Character;
	procedure cancella(k: in Integer);
end DizionarioClasse
package body DizionarioClasse
begin
	const max := 100
	var chiavi: array(1..max) of Integer;
	var valori: array(1..max) of Character;
	top: Integer range(0..max) := 0

	procedure aggiungi(k: in Integer, v: in Character)
	begin
		if top = max then raise "Eccezione"
		else
			for i := 1 to top
				if chiavi(i) == k then return;
			top := top + 1;
			chiavi(top) := k;
			valori(top) := v;
	end

	function leggi(k: in Integer) return Character
	begin
		for i := 1 to top
			if chiavi(i) == k then return valori(i)
		raise "Chiave non trovata"
	end

	procedure cancella(k: in Integer)
	begin
		for i := 1 to top
			if chiavi(i) == k then
				chiavi(i) := chiavi(top)
				valori(i) := valori(top)
				top := top - 1
				return
		raise "Chiave non trovata"
	end
end
end DizionarioClasse

