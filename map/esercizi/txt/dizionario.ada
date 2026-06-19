package TypeDizionario
begin
	type Dizionario is limited private;
	procedure aggiungi(d: in out Dizionario, k: in Integer, v: in Character);
	function leggi(d: in Dizionario, k: in Integer) return Character;
	procedure cancella(d: in out Dizionario, k: in Integer);
	function "="(d1: in Dizionario, d2: in Dizionario) return Boolean;

	private
	const max = 100;
	type Dizionario = record
		chiavi: array(1,..,max) of Integer;
		valori: array(1,..,max) of Character;
		top: Integer range 0,..,max = 0;
	end record
end package

package body TypeDizionario
begin
	procedure aggiungi(d: in out Dizionario, k: in Integer, v: in Character)
	begin
		if d.top = max then
			raise "Eccezione";
		else
			begin
				for i := 1 to d.top
					if d.chiavi(i) = k then return;
				d.top := d.top + 1;
				d.chiavi(d.top) := k;
				d.valori(d.top) := v;
			end
	end

	function leggi(d: in Dizionario, k: in Integer) return Character
	var i: Integer;
	begin
		for i := 1 to d.top
			if k = d.chiavi(i) then return d.valori(i);
		raise "Chiave non trovata";
	end

	procedure cancella(d: in out Dizionario, k: in Integer)
	var i: Integer;
	begin
		for i := 1 to d.top
			if d.chiavi(i) = k then
			begin
				d.chiavi(i) := d.chiavi(d.top);
				d.valori(i) := d.valori(d.top);
				d.top := d.top - 1;
				return;
			end
		raise "Chiave non trovata";
	end

	function uguale(d1: in Dizionario, d2: in Dizionario) return Boolean
	if d1.top != d2.top then
	begin
		return False
	end
	for i := 1 to d1.top
		if not appartiene(d2, d1.chiavi(i), d1.valori(i)) then
			return False
	return True
	end

	function appartiene(d: in Dizionario, k: in Integer, v: in Character) return Boolean
	var i: Integer
	begin
		for i := 1 to d.top
			if d.chiavi(i) == k and d.valori(i) == v then return true;
		return false;
	end
end TypeDizionario


with TypeDizionario; use TypeDizionario;
var d1, d2: Dizionario;
aggiungi(d1, 1, 'm');
aggiungi(d1, 1, 's');
aggiungi(d1, 2, 's');
aggiungi(d2, 1, 'm');
aggiungi(d2, 2, 's');
cancella(d1, 2);
if uguale(d1, d2) then put "sono uguali";
else put "sono diversi"
