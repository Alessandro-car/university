generic
max: Positive
type Chiave is private;
type Valore is private;
package TypeDizionario
begin
		type Dizionario is limited private;
		procedure aggiungi(d: in out Dizionario, k: Chiave, v: Valore);
		function leggi(d: in Dizionario, k: Chiave) return Valore;
		procedure cancella(d: in out Dizionario, k: Chiave);
		function uguale(d1: in Dizionario, d2: in Dizionario) return Boolean;
		private
		type Dizionario = record
			chiavi: array(1..max) of Chiave;
			valori: array(1..max) of Valore;
			top: Integer range 0..max = 0;
		end record
end TypeDizionario

package body TypeDizionario
begin
	procedure aggiungi(d: in out Dizionario, k: Chiave, v: Valore)
	begin
		if d.top == max then
			raise "Eccezione";
		else
		begin
			for i := 1 to d.top
				if d.chiavi(i) == k then return;
				d.top := d.top + 1
				d.chiavi(d.top) := k;
				d.valori(d.top) := v;
		end
	end
	function leggi(d: in Dizionario, k: Chiave) return Valore
	var i: Integer;
	begin
		for i := 1 to d.top
			if d.chiavi(i) == k then return d.valori(i);
		raise "Chiave non trovata"
	end
	procedure cancella(d: in out Dizionario, k: Chiave)
	var i: Integer;
	begin
		for i := 1 to d.top
			if d.chiavi(i) == k then
				d.chiavi(i) = d.chiavi(d.top)
				d.valori(i) = d.valori(d.top)
				d.top := d.top - 1
				return;
			raise "Chiave non trovata"
	end
	function uguale(d1: in Dizionario, d2: in Dizionario) return Boolean
	var i: Integer;
	begin
		if d1.top != d2.top then return false;
		else
			for i := 1 to d1.top
				if not appartiene(d2, d1.chiavi(i), d1.valori(i)) then
					return false
			return true
	end

	function appartiene(d: in Dizionario, k: in Chiave, v: in Valore) return Boolean
	var i: Integer;
	begin
		for i := 1 to d.top
			if d.chiavi(i) == k and d.valori(i) == v then return true
		return false
	end
end TypeDizionario

With TypeDizionario;
package DizionarioIntChar is new TypeDizionari(100, Integer, Character)
// Resto del main
