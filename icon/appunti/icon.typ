// Import everything from the template file
#import "../../typst_templates/classic_template.typ": *

// Apply the classic configuration
#show: doc => conf(
  title: "Ingegneria della conoscenza",
  index: true,
  doc,
)

= Sistemi intelligenti basati su conoscenza

= Ricerca di soluzioni in spazi di stati
== Risoluzione di problemi mediante ricerca
La risoluzione di diversi problemi spesso consiste nella _ricerca_ in uno specifico modello del mondo. Considernado il caso di un sistema che, dato un _obiettivo_ da raggiungere, ragiona su un _modello_ del mondo fatto di _stati_, in _assenza di incertezza_.

Per raggiungere questo scopo, si adotta una rappresentazione _piatta_, ovvero relativa a un singolo livello in una gerarchia.

L'_astrazione_ del problema prevede la ricerca di un _percorso_ che vada da un nodo di partenza a uno dei nodi-obiettivo, detto _goal_, in un _grafo orientato_.

Una strategia di ricerca comune a molti problemi in AI è la seguente: il sistema computa su una _rappresentazione interna_. Il sistema riceve solo una descrizione di _cosa_ rappresenti una soluzione; _come_ ottenerla sarà il compito di un algoritmo di ricerca. Spesso questi problemi e i relativi algoritmi risolutivi sono NP-completi.

Tali problemi risultano _difficili_ anche per agenti umani. Spesso non esistono soluzioni ottimali per cui ci si accontenta di soluzioni _soddisfacenti_ in mancanza d'una _struttura_ mappabile su caratteristiche del mondo fisico.

== Spazi di stati
Possiamo formulare la nozione di azione intelligente in termini di uno *spazio di stati*. Uno _stato_ contiene tutte le informazioni necesserie per predirre gli effetti di un'azione e per determinare se soddisfi l'obiettivo. Una ricerca su uno spazio di stati assume le seguenti nozioni:
- Gli acenti hanno una conoscenza perfetta dello spazio di stati.
- In qualsiasi momento, conosce in quale stato si trova; il mondo è quindi pienamente osservabile.
- L'agente ha un insieme di azioni con effetti deterministici conosciuti.
- L'agente ha un obiettivo da raggiungere e può determinare se uno stato soddisfa l'obiettivo.
Una *soluzione* di un problema di ricerca è una sequenza di azioni che porterà l'agente dallo stato corrente allo stato obiettivo.

Un *problema di ricerca su uno spazio di stati* comprende:
- un insieme di stati
- uno stato distinto detto _stato di partenza_
- per ogni stato, un insieme di azioni disponibili all'agente che si trova in tale stato
- una *funzione di azione* che, dato uno stato corrente e un'azione _(s, a)_, ritorna un nuovo stato in cui si transita per effetto dell'azione
- un *goal* che è una funzione booleana, _goal(s)_, che ritornerà _true_ se _s_ è uno stato che soddisfa l'obiettivo e, in tal caso, _s_ è lo *stato obiettivo*
- un criterio che specifica la qualità di una soluzione accettabile; una *soluzione ottimale* massimizza tale criterio, ad esempio se ammette _qualsiasi_ sequenza di azioni che porti a uno stato-obiettivo; ad esempio associando _costi_ alle diverse azioni da cui discende un criterio del _minimo costo totale_ delle azioni; a volte, sono soddisfacenti anche soluzioni sub-ottimali, ad esempio quelle con un costo aggiuntivo del +10% rispetto a quello di una soluzione ottimale.

*Inserire esempi del libro/dispense*

Possibili _estensioni_ dei problemi di ricerca riguardano:
- la possibilità di sfruttare una _struttura interna_ agli stati: ad esempio nei videogame;
- il caso di stati _non_ completamente _osservabili_: ad esempio il robot-consegne non conosce la posizione iniziale delle consegne, oppure un sistema di tutoring può non conoscere bene le attitudini di uno studente;
- l'aggiunta di azioni _stocastiche_: ad esempio possibilità di commettere errori oppure mancato apprendimento da parte dello studente di un argomento;
- la possibilità di definire, invece degli stati finali, _preferenze aggiuntive_ complesse, in termini di _ricompense_ o _punizioni_.

*Inserire esempi del libro/dispense*

== Ricerca su Grafo
Per risolvere il problema, si definisce lo spazio di ricerca e si applica un algoritmo di ricerca. Come detto precedentemente, molti compiti possono essere ricondotti alla _ricerca_ di percorsi in un grafo. Un modello _astratto_ della soluzione sarà _indipendente_ dal particolare dominio applicativo di interesse. Dato un _grafo orientato_ fatto di nodi connessi da archi, si dovrà trovare un _percorso_ da un nodo di partenza a uno boiettivo. Ci possono essere più modi per rappresentare uno stesso problema.

Un *grafo orientato* _esplicito_ consiste di:
- un insieme di _nodi N_, anche non finito;
- un insieme di _archi A_, ossia di coppie _ordinate_ di nodi, anche non infinito;
	- l'arco _\<n_1, n_2\>_ si dirà *uscente* da _n_1_ ed *entrante* in _n_2_
	- si dirà che il nodo _n_2_ è un *vicino* del nodo _n_1_ se e solo se $exists <n_1, n_2> in A$

- un *percorso* dal nodo _s_ al nodo _g_, denotato da $<n_0, n_1, dots, n_k>$, è una _sequenza_ di nodi tale che se $s = n_0, g = n_l$ e $forall i = 1, dots, k : <n_(i-1), n_i> in A$; in alternativa, si può indicare una _sequenza di archi_ $<n_0, n_1>, <n_1, n_2>, dots, <n_(k-1), n_k>$ o anche _sequenza di etichette_ su tali archi: $<n_0, dots, n_i>$ _parte iniziale_ di $<n_0, n_1, dots, n_k>$, con $i <=k$.

Nel grafo esiste un insieme di _nodi-obiettivo_ che si possono identificare anche tramite il predicato _goal($dot$)_, funzione booleana definita sui nodi. Una *soluzione* è un percorso dal nodo di partenza a uno obiettivo.

In alcuni casi è associato un *costo* a ogni arco: dato $<n_i, n_j>$
$
c o s t(<n_i, n_j>) in [0, +infinity[
$
estendibile anche ai percosi: dato $p = <n_0, n_1, dots, n_k>$
$
c o s t(p) = sum_(i=1)^k c o s t (<n_(i-1), n_i>)
$
Una soluzione *ottimale* _p_ avrà costo minimo: $not exists p'$ soluzione con $c o s t(p')< c o s t(p)$.


*Inserire esempio libro/slide*.
*Inserire esercizio slide*

Un *ciclo* è un percorso non vuoto in cui primo e ultimo nodo coincidono: $<n_0, n_1, dots, n_k>$ tale che $k>0$ e $n_0 = n_k$.

Un *grafo aciclico orientato* (_directed acyclic graph_, DAG) è un grafo orientato senza cicli. Un *albero* è un DAG con un solo nodo, la  *radice*, senza archi entranti. I nodi senza archi uscenti sono le sue *foglie*.

== Algoritmo di ricerca generico
Un algoritmo di ricerca generico è un algoritmo indipendente dalla strategia di ricercadal grafo. Dato un grafo, si esplorano _incrementalmente_ percorsi dai nodi di partenza verso nodi-obiettivo.

Si una una struttura dati per rappresentare la *frontiera*, detta _fringe_, dei percorsi già esplorati. Inizialmente la frontiera contiene percorsi costituiti dai soli _nodi di partenza_. Successivamente si effettua l'_espanzione_ dei percorsi nella frontiera verso nodi inesplorati, fino a incontrare un nodo-obiettivo:
- si seleziona un percorso (rimuovendolo dalla frontiera);
- si estende il percorso con ogni arco uscente dall'ultimo nodo;
- si aggiungono alla frontiera i percorsi ottenuti.

```
procedure Search(G, s, goal)

Input
	G: grafo con insiemi di nodi N e di archi A
	s: nodo di partenza
	goal: funzione booleana sui nodi
Output
	percorso da s a un nodo per il quale goal sia vera oppure quando non ci sono percorsi
Local
	frontiera: insiemi di percorsi

frontiera <- {<s>}
while frontiera != (simbolo insieme vuoto) do
	selezionare (e rimuovere) <n_0, dots, n_k> da frontiera
	if goal(n_k) then
		return <n_0, dots, n_k>
	frontiera <- frontiera unito {<n_0, dots, n_k, n> : <n_k, n> in A}
return (simbolo perpendicolare)

```

La selezione _non è deterministica_, ha solo impatto sull'efficienza quindi una data strategia di selezione determina il percorso da scegliere. Il ```return``` annidato può essere interpretato come _temporaneo_, continuando si trovano strade alternative; $perp$
indica che non vi sono soluzioni; la condizione _goal($n_k$)_ viene testata doo la selezione della frontiera e non all'aggiunta del nuovo nood:
+ a volte esiste un _arco_ vers un nodo-obiettivo ma di _costo elevato_: non sempre conviene terminare restituendo subito il percorso trovato in quanto potrebbe esserci un percorso di costo inferiore;
+ va tenuto conto del fatto che lo stesso test _goal()_ può essere _costoso_; un percorso che termini con un nodo che non sia un nodo-obiettivo e che non abbia vicini andrebbe rimosso.
== Strategie di ricerca non informate
Il problema specifica il grafo e l'obiettivo mentre la *strategia di ricerca* determina il percorso da selezionare dalla frontiera. Le _strategie_ *non informate* non prendono in considerazione la posizione dell'obiettivo. Se si considera un costo unitario per ogni arco, possibili strategia sono al ricerca _in ampiezz_, quella in _profondità_ o l'_approfondimento iterativo_. Se è disponibileuna funzione di costo, allora si unano strategie dei _costi minimi_.
=== Ricerca in ampiezza
Nella *ricerca in ampiezza*, detta _breadth-first search, BFS_ la frontiera è implementata cn una _coda_, ossia una struttura FIFO. Si seleziona il _primo_ percorso aggiunto. I percorsi sono generati nell'ordine del numero di archi contenuti. A ogni passo, si seleziona uno dei percorsi più corti.

*Inserire esempio slide*

La BFS risulta utile quando:
- non si hanno problemi di spazio;
- si cerca una soluzione con numero di archi _minimale_.

La BFS è _poco utile_ quando:
- tutte le soluzioni sono associate a percorsi lunghi;
- è disponibile conoscenza euristica;
- il grafo viene generato dinamicamente.

=== Ricerca in profondità
Nella *ricerca in profondità*, detta _depth-first search_, DFS, la frontiera è implementata con uno _pila_, struttura LIFO: gli elementi vengono aggiunti uno alla volta e quello selezionato e prelevato sarà l'ultimo aggiunto.

Partendo dalla radice, i nodi sono considerati come ordinati da sinistra a destra: il vicino più a sinistra sarà aggiunto in cima per _ultimo_. L'ordine di espansione non dipende dalla posizione dei nodi-obiettivo.

Con una pila, la ricerca procede in profondità:
- _completamento_ di un _singolo percorso_ prima di provare alternative;
- questo comporta il *backtracking*: si seleziona una prima alternativa per ogni nodo, _tornando indietro_ all'opzione successiva solo dopo aver tentato tutti i completamenti;
- l'_ordine di aggiunta_ dei vicini alla frontiera/pila non è specificato: questo impatta sull'efficienza e può essere _statico_, ossia prefissato, ovvero _dinamico_, dipendendo dall'obiettivo;
- per una procedura DFS alternativa si veda la figura (inserire figura slide).

*Inserire esempio slide*

La DFS è _appropriata_ in caso di:
- limitazioni di spazio;
- presenza di molteplici soluzioni, anche se costituite da percorsi lunghi;
- ideale quando _tutti_ portano a una soluzione;
- oppure se l'ordine di aggiunta dei vicini può essere variato in modo da trovare una soluzione al _primo tentativo_.

La DFS risulta _inefficiente_ quando:
- sono possibili percorsi infiniti in caso di grafo infinito o contenente cicli;
- pur esistendo soluzioni alternative poco profonde, la ricerca si attarda su percorsi più lunghi.

=== Approfondimento iterativo
