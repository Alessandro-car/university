// Import everything from the template file
#import "../../typst_templates/classic_template.typ": *

#set heading(numbering: "1.1")

// Disattiva esplicitamente la numerazione per il livello 4 in poi
#show heading.where(level: 4): set heading(numbering: none)
#show heading.where(level: 5): set heading(numbering: none)
#show heading.where(level: 6): set heading(numbering: none)
// Apply the classic configuration
#show: doc => conf(
  title: "Ingegneria della conoscenza",
  index: true,
  doc,
)

= Ingegneria della conoscenza
#definizione(title: "Ingegneria della conoscenza")[
L'Ingegneria della Conoscenza è il processo di acquisizione, strutturazione e rappresentazione delle competenze umane in un formato che le macchine possono comprendere e utilizzare. Può essere vista come l'arte e la scienza di costruire sistemi basati sulla conoscenza in grado di ragionare, prendere decisioni e risolvere problemi complessi in modi che rispecchiano il pensiero umano.
]

Nel contesto dell'_intelligenza artificiale_ che sta rimodellando ogni settore, l'ingegneria della conoscenza rappresenta il ponte fondamentale tra le competenze umane e l'intelligenza artificiale. Gli ingegneri della conoscenza possono essere considerati come traduttori della conoscenza imp;licita che _vive_ nella mente degli esperti: essi la convertono in formati espliciti e strutturati che le macchine possono elaborare e sulle quali possono agire.
== Sistemi intelligenti basati su Conoscenza
L'ingegneria della conoscenza è una disciplina ingegneristica atta a progettare e sviluippare _sistemi intelligenti_ basati su conoscenza _esplicita_.\
L'intelligenta artificiale può essere definita come la disciplina che studia sintesi e analisi degli _agenti computazionali_, ossia dei sistemi che agiscono in modo _intelligente_. Essi possono svolgere azioni in un _ambiente_ e vanno giudicati *solo* per tali azioni. \
Aspetti salienti dell'_azione intelligente_ sono i seguenti:
- l'appropriatezza rispetto alle circostanze, agli obiettivi, ai limiti;
- la considerazione delle conseguenza a breve/lungo termine delle azioni;
- l'apprendimento dall'esperienza;
- la flessibilità rispetto ai cambiamenti.
Un *agente computazionale* è un agente le cui decisioni/azioni siano spiegabili in termini di calcolo automatico. Esso è implementato su sistema _fisico_ e presenta le seguenti _limitazioni_:
- non è onnisciente né onnipotente;
- le capacità di osservazione sono specializate e vincolate dal dominio applicativo;
- la sua memoria è finita e a tempo limitato.
La disciplina dell'AI può essere inquadrata sotto diverse prospettive:
- la prospettiva _scientifica_ considera l'AI come displina finalizzata a comprendere i principi del comportamento intelligente:
	- analizzando sistemi naturali e artificiali;
	- formulando _teorie_ sulla costruzione di agenti intelligenti che possano essere supportate da _implementazioni_ per la loro _verifica sperimentale_;
- la prospettiva _ingegneristica_ inquadra l'AI come lo studio di nuove tecnologie atte risolvere specifici problemi tipicamente risolti da agenti umani:
	- progetto e sintesi di _sistemi_ intgelligenti _basati su conoscenza_ (KBS) _testabili_: qualità valutabili attraverso metrodi standard dell'ing. informatica;
	- applicazioni costruite per la loro _utilità_ in un dato dominio.
Altri obiettivi dell'AI:
- *intelligence augmentation*: accrescimento dell'intelligenza e della creatività umane. Alcuni esempi:
	- sistema diagnostico: aiuta i medici a prendere decisioni migliori;
	- motore di ricerca: aiuta a superare i limiti della memoria umana;
	- traduzione automatica: aiuta la gente a comunicare.
- *integrazione* dei compiti di agenti umani e sistemi intelligenti che collaborano alla soluzione di problemi; si parla di modalità *human-in-the-loop*.
C'è differenza tra la definizione di intelligenza _naturale_ e l'intelligenza _artificiale_. L'intelligenza _naturale_ emerge spontanaemente in natura mentre, quella _artificiale_, viene progettata per specifici scopi. \
L'ipotesi fondamentale può essere riassunta con la seguente formula:
$
"ragionamento" approx "computazione"
$
Tale ipotesi è collegata alla _tesi di Church-Turing_: esiste un livello di astrazione nel quale il ragionamento coincide con la manipolazione di simboli. \
In termini generali potremmo definire la *conoscenza* un'informazione stabile, non transitoria.
== Dimensioni dello spazio di progettazione
La _complessità_ dei sistemi intelligenti varia e dipende dalle finalità e dai diversi contesti in cui sono immersi. Ciò vale dai casi semplici a quelli più complessi.\
Le *dimensioni della complessità* nella progettazione:
- definiscono uno _spazio di progettazione_: si hanno diversi sistemi a seconda delle loro tipologie;
- forniscono forme di _decomposizione sommaria_ dello spazio, cui andranno aggiunte altre scelte da fare;
- interagiscono fra loro: dimensioni combinabili anche se studiate separatamente.
#table(
  columns: (auto, auto),
  align: left + horizon,
  stroke: (x, y) => (
    top: if y == 0 { 1pt  } else { none },
    bottom: 1pt,
    left: none,
    right: none
  ),

  [*Dimensione*], [*Valori*],

  [Modularità], [piatta | modulare | gerarchica],

  [Orizzonte della \ pianificazione], [nessuna pianificazione | \#tappe finito (miopia) | \ indefinito | infinito (processo)],

  [Rappresentazione \ del mondo], [stati | (tuple di) feature | individui + relazioni (binarie) \ \#mondi: $n_s$ | $2^(n_f)$ | $2^(n_i^2) dot n_r$ \ ($n_s$ = \#stati, $n_f$ = \#feature, $n_i$ = \#individui e $n_r$ = \#relazioni)],

  [Incertezza], [_osservabilità del mondo:_ totale | parziale \ _effetto:_ deterministico | stocastico],

  [Preferenze], [obiettivi (da raggiungere | mantenere) | \ compromessi (preferenze cardinali | ordinali)],

  [Apprendimento], [_conoscenza data | appresa_],

  [Limiti delle risorse], [_razionalità perfetta | limitata_],

  [Numero di attori], [singolo | multipli agenti (distribuiti, cooperativi | competitivi)],

  [Interattività], [_ragionamento (computazione) online | offline_]
)
=== Modularità
Il tipo di *modularità* indica il grado di decomposizione di un sistema in _moduli_ interagenti da prendere in considerazione separatamente. Ciò serve a _dominare la complessità_, nei sistemi software ma anche nelle organizzazioni. Tipicamente la modularità viene espressa attraverso una decomposizione gerarchica: ogni modulo è organizzato in sotto-mopduli a loro volta organizzati gerarchicamente fino al livello base; astrazione procedurale e OOP servono a sfruttare modularità e astrazione.\
Le strutture possibili sono: _piatta_, ossia senza struttura organizzativa; _modulare_, se il sistema viene decomposto in moduli interagenti considerabili separatamente; _gerarchica_ quando nel sistema i moduli possono essere decomposti in sotto-moduli interagenti, a loro volta decomponibili. \
Le modalità di  _ragionamento_ dipendono dal tipo di struttura: con uno struttura piatta o modularesi ha un singolo livello di astrazione; con una gerarchica si hanno multipli livelli di astrazione.
=== Schema di Rappresentazione
Lo *schema di rappresentazione* riguarda la _descrizione del mondo_. Le rappresentazioni alternative possibili sono: a _stati_, con _caratteristiche / proposizioni_ oppure con individui e _relazioni_.
==== Stati
Gli *stati* distinti del mondo hanno un impatto sul comportamento del sistema. Essi sono fattorizzabili in stati _interni_ e stati dell'_ambiente_.
#esempio[
Un termostato può essere modellato usando 6 stati:
- stati _interni_: *spento*, *riscaldamento*,
- stati _ambiente_: *freddo*, *confortevole*, *caldo*;
	- ambiente freddo: passare o restare in modalità riscaldamento;
	- ambiente molto caldo: può passare nello stato spento;
	- ambiente confortevole: rimanere nello stato corrente;
- _azioni_: scaldare nello stato riscaldamento, altrimenti passare nello stato spento.
]
==== Caratteristiche
Il ragionamento si basa su *caratteristiche*, dette _feature_, degli stati o _proposizioni_ booleane invece della loro enumerazione. Uno stato può essere descritto in termini di caratteristiche, con un valore per ogni stato.
#esempio(title: "Domotica")[
In un sistema per la domotica le caratteristiche potrebbero essere:
- posizione degli interruttori;
- stato di ogni interruttore (_in_funzione, in_corto, fuori_uso_);
- stato dei punti luce, ad esempio _pos_s2_ con valore _up_ se l'interruttore _s2_ è accesso e _down_ se spento;
- stato della casa descritto in termini dei valori di ciascuna delle caratteristiche.
]
==== Proposizioni
Una *proposizione* è una caratteristica _booleana_. Risulta una rappresentazione _compatta_: sono state comprese _regolarità_ importanti sul dominio. Ad esempio con 30 proposizioni codificano $2^(30) approx 10^9$ stati quindi è più facile specfiicare e ragione con 30 proposizioni che con oltre un miliardo di stati.
==== Relazioni e individui
Nella descrizione di mondi complessi una relazione su un singolo individuo è una *proprietà*. Si può definire una _caratteristica_ per ogni possibile relazione tra individui, come ad esempio $R(a, b)$, che potrebbe corrispondere a "Nico studia Informatica", ossia $s t u d i a(N i c o, I n f o r m a t i c a)$.
Le _descrizioni relazionali_ sono più convenienti di caratteristiche e proposizioni:
- ad esempio, con una sola relazione binaria e 100 indvidui si possono rappresentare $100^2=10000$ proposizioni e $2^(10000)$ stati;
- si possono considerare intere classi di individui senza enumerarne caratteristiche/proposizioni, o addirittura i numerossisimi stati;
- permettono di ragione su infiniti individui; ad esempio l'insieme dei numeri, o l'insieme di tutte le stringhe, cosa impossibile in termini di stati.
==== Incertezza
Si progetta anche tenendo conto dell'*incertezza* insita nel dominio considerato:
+ percezione / osservazione;
+ effetti delle decisioni / azioni.
===== Osservazione incerta
A volte è possibile l'_osservazione diretta_ dello stato del mondo. Più spesso accade che la percezione dello stato sia _difettosa_ o _parziale / indiretta_: al più si può disporre di una _distribuzione_ di probabilità sull'insieme degli stati possibili su quanto si osserva.\
L'*incertezza sulla percezione* riguarda la possibilità di determinare lo stato del mondo attraverso osservazioni. Uno stato può essere:
- _pienamente osservabile_: si può riconoscere dalle osservazioni, assunzione spesso fatta per ragioni di trattabilità dei problemi;
- _parzialmente osservabile_: non osservato direttamente; è possibile che più stati portino alle stesse osservazioni oppure le osservazioni sono _rumorose_.
===== Effetto incerto
In certi casi è possibile conoscere sempre l'effetto delle azioni/decisioni: dato uno stato e un'azione/decisione, si può predire _precisamente_ lo stato risultante dall'applicazione dell'azione. A volte è difficile fare tale previsioni: al più si avere una _distrubuzione di probabilità_ sugli effetti possibili.\
L'_incertezza sugli effetti_ prevede che la loro _dinamica_ possa essere:
- _deterministica_ e lo stato risultante viene determinato esattamente dall'azione e dallo stato precedente;
- _aleatoria_, con una probabilità sui possibili stati risultanti: ha senso solo se il mondo è completamente osservabile.
==== Preferenza
Gli agenti sono spesso _utilitaristici_: la scelta di un'azione è dettata dai risultati attesi più desiderabili; ci possono essere le finalità _semplici_ o anche preferenze _complesse_. \
Le *preferenze* si caratterizzano come:
- _finalità_, da raggiungere, detto _achievement goal_, o di conservazione, detto _mainenance goal_, in ogni stato visitato;
- _preferenze complesse_: sono compromessi sul vantaggio derivante dei vari risultati, eventualemten anche in momenti diversi. Si distinguono:
	- preferenze _ordinali_: conta solo l'ordine;
	- preferenze _cardinali_: conta anche la grandezza del valore.

==== Apprendimento
Non sempre il progettista dispone di un buon modello del sistema e del suoi ambiente: si devono usare dati da esperienze passate e altre sorgenti di conoscenza per migliorare il modello e prendere migliori decisioni. \
La dimensione dell'*apprendimento* determina se la conoscenza sia data oppure se vada appresa.\
Apprendere significa trovare il modello migliore che si adatti ai dati e si possono presentare diversi casi:
- caso _semplice_: regolare un insieme fisso di _parametri_;
- caso più difficile: scegliere preliminarmente la migliore _rappresentazione_, ad esempio feature o relazioni.
Si possono presentare diverse problematiche:
- utilizzo di _conoscenza di fondo_;
- _selezione_ dei dati da raccogliere;
- _rappresentazione_ dei dati e dei modelli;
- selezione dei _learning bias_ appropriati;
- uso della conoscenza appresa per modificare decisioni / azioni dell'agente.
==== Limitatezza delle Risorse Computazionali
Le *limitazioni* sulle risorse computazionali disponibili spesso impediscono di prendere le migliori decisioni. Si fanno compromessi quindi sulla qualità della soluzione da cercare spesso necessari: spesso è preferibile una soluzioner ragionevole ma rapida che una migliore calcolata quando è troppo tardi perchè il mondo esterno nel frattempo è cambiato. \
Tale dimensione determina se il sistema ragione per prender la migliore decisione: senza tener conto dei limiti, _razionalità perfetta_, oppure tenenendo conto dei limiti, _razionalità limitata_.\
I _limiti_ riguardano il _tempo_, la _memoria_ e la _precisione_, il grado di approssimazione.\
Un *algoritmo anytime* produce soluzioni che migliorano con il tempo:
- in qualunque momento produce la _miglior soluzione corrente_;
- si assicura che la qualità non decresca, si conserva la migliore soluzione trovata da restituire su richiesta;
- l'attesa può avere un _costo_: a volte meglio decidere/agire subito anzichè di aspettare una soluzione probabilemente migliore.
==== Orizzonte
L'*orizzonte* misura quanto lontano sia prevista la pianificazione del lavoro, ossia quanto in avanti ci si spinga a considerare le conseguenze delle azioni. Si possono distinguere sistemi/agenti software:
- _senza pianificazione_: nelle decisioni non considerano il futuro e il fattore-tempo non è preso in considerazione;
- a _orizzonte finito_: interessano solo un numero prefissato di passi;
- a _orizzonte indefinito_: numero di passi finito, ma non predeterminato;
- a _orizzonte infinito_: sempre attivo.
==== Numero di agenti
Difficoltà aggiuntive degli ambienti con altri agenti / sistemi sono:
- occorre ragionare sugli altri agenti secondo _strategie_: potrebbero cercare di confondere e manipolare o potrebbero cooperare; conviene agire in modo casuale se gli altri adottano strategie deterministiche;
- anche quando si cooperi e vi sia un file comune, il problema della _coordinazione_ e della _comunicazione_ rende il ragionamento multi-agente più complesso.
Dal punto di vista del singolo agente, la dimensione del *numero di agenti* prevede:
- ragionamento da _agente singolo_: gli altri come parte dell'ambiente;
- ragionevole se non ci sono altri agenti o se gli altri non cambieranno il comportamento in base alle sue azioni;
- ragionamento _multi-agente_: si prende in considerazione il ragionamento altrui;
- in caso di agenti intelligenti con _fini / preferenze_ che dipendano da quello dalla _comunicazione_ con gli altri;
- più difficile se gli agenti possono agire _simultaneamente_ o se l'ambiente è solo _parzialmente osservabile_.
==== Interazione delle Dimensioni
Non si possono studiare le dimensioni separatamente perchè sono soggette a _interazioni complesse_:
- _Rappresentazione e modularità_: avendo una gerarchia di moduli semplici, il ragionamento può essere svolto su insieme finito di stati; altri livelli di astrazione richiedono il ragionamento su relazioni.
- _Orizzonte e modularità_: ad esempio, un cane robotico può ricevere una ricompensa quando risponde al richiamo; quando decide sui singoli movimenti, il momento del premio potrebbe essere lontano quindi l'orizzonte risulta potenzialmente indefinito.
- _Incertezza sull'osservazione e complessità del ragionamento_: molto più facile ragionare quando si conosce lo stato del mondo; l'incertezza su individui e relazioni è più complicata da trattare.
- _Incertezza sugli effetti e modularità_: ad un dato livello della gerarchiua, una decisione può essere _deterministica_ mentre ad un altro potrebbe essere _stocastica_.
- _Molteplicità e modularità_: agente progettato attraverso più sistemi che interagiscono condvidendo il _fine comune_ di rendere intelligente il comportamente dell'agente al livello superiore.
- _Apprendimento e rappresentazione_: spesso l'apprendimento lavora sulla rappresentazione di feature: determina modelli che portano a miglioir predizioni dei valori di una specifica feature-obiettivi; ma si può lavorare anche su individui e relazioni, ovveroi l'apprendimento di gerarchie di modelli, in domini parzialmente osservabili e attraverso sistemi multipli.
- _Modularità e razionalità limitata_ per un ragionamento più efficiente; il formalismo può diventare più complicato ma per costruire sistemi complessi servono: la decomposizione in componenti più piccole e delle approssimazioni per poter decidere in tempo accettabili anche in regime di memoria limitata.
#figure(
	image("images/risuluzione_problemi.png", width: 70%),
	caption: [Risoluzione dei problemi]
)
== Progettazione si Sistemi Intelligenti
=== Semplificazione di Ambienti e Sistemi
La conoscenza del KBS non corrisponde a quella nella mente dell'esperto e/o del progettista.\
Vi sono due casi-limite possibili:
- _sistema specializzato_ nel suo dominio/task, poco utile fuori dal suo contest;
- _sistema flessibile_ che si adatta ai contesti e accetta nuovi task.
Le strategie di costruzioni alternative sono:
- creazione di un modello dell'ambiente _semplificato_ utile a costruire sistemi di ragionemento _complessi_
- sistemi _semplici_ per contesti _complessi_.
=== Compiti e Problemi
In AI è importante *cosa* vada fatto/calcolato e non *come* ridotto a ricerca nello spazio di soluzioni possibili. Una descrizione di un *problema* dev'essere disponibile a livello informale.
=== Rappresentazione interna
La *conoscenza* può essere definita come informazione _stabile_, a _lungo termine_ su un dominio, a differenza delle *credenze* sull'ambiente che sono più _transitorie_. Per poterci ragionare essa va rappresentata formalizzandola in termini di un *linguaggio di rappresentazione*. Una *base di conoscenza* risulterà come rappresentazione interna al sistema, codificata attraverso idonee strutture dati.\
Le _proprietà_ principali degli schemi di rappresntazione sono le seguenti:
- _richezza espressiva_ sufficiente alla risoluzione del problema;
- _vicinanza_ ai termini naturali del problema; esiste una relazione fra il dominio e la sua rappresentazione il che permette verifiche di correttezza; la vicinanza è anche correlata alla _spiegabilità_ dei meccanismi di ragionemento interni;
- _trattabilità_, propensione a un'elaborazione efficiente;
- _acquisibilità_ a partire da dati e/o da esperienza pregressa da parte degli utenti.
== Soluzioni
Come nell'ingegneria del software, dato un problema, il progettista deve definire cosa costituisca una *soluzione*. Le soluzioni possono essere di diverso tipo:
- _ottimali_: la migliore secondo una _misura di qualità_:
	- _ordinale_, tipica;
	- _cardinale_, se contano anche le grandezze relative;
	- combinazione di criteri multipli.
- _soddisfacente_: buona secondo una specifica delle risposte _adeguate_;
- _approssimata_: soluzione di qualità _prossima_ a quella ottimale, sulla base di una misura _cardinale_; conveniente per ragioni di efficienza anche in virtù degli algoritmi adottati;
- _probabile_: _verosimilimente_ una soluzione, con un determinato grado di certezza:
	- forma di approssimazione precisa di soluzione soddisfacente;
	- si possono distinguere i tassi di errori di _falsi-positivi_ o di _falsi-negativi_.
=== Modelli: Livelli di Astrazione
Un *modello* è una rappresentazione del mondo che può essere statica, ciò che si crede vero, ovvero dinamica, il suo _funzionamento_. È utile lavorare a vari lvielli di dettaglio, ossia di *astrazione*: si rappresenta la parte del mondo di interesse trascurando i dettagli inutili. Il *livello di astrazione* determina un _ordine parziale_. Sono spesso ammissibili _più modelli_ a diversi livelli di astrazione, anche in contraddizione tra loro: andranno giudicato in base alla loro utilità che per la loro correttezza. \
Livelli d'astrazione comuni fra sistemi _biologici_ e _computazionali_ sono i seguenti:
- *livello della conoscenza* sul mondo esterno: considera quello che il sistema assume di sapere e i suoi obiettivi, ma non come ragiona, ossia non come calcolare la soluzione;
- *livello simbolico* interno: descrizione del modo di ragionare del sistema utile a implementare il livello precedente, manipolando simboli per produrre risposte.
== Sistemi Intelligenti basati su Conoscenza
Un *agente intelligente* è un modello capace di percezione - ragionamento - aszione che si trova immerso in un *ambiente*. Un possibile schema è il seguente:
#figure(
	image("images/schema_kbs.png", width: 70%),
	caption: [Schema di un KBS]
)
Il comportamento del KBS si basa su:
- *conoscenza pregressa* riguardo l'agente e il suo ambiente;
- *storia* dell'interazione con l'ambiente: *stimoli* ed *esperienza passata*;
- *obiettivi* da raggiungere o *preferenze* sugli stati del mondo;
- *abilità*, azioni primitivi di cui è capace.
Nella scatola nera si rappresenta un suo _stato interno delle credenze_, o *belief state*, comprendente la rappresentazione delle cose che si ritengono vere circa l'ambiente, cosa si è imparato, obiettivi intermedi presenti e futuri.\
Il funzionamento di un KBS intelligente può essere schematizzato in due fasi, come nella seguente figura:
#figure(
	image("images/funzionamento_kbs.png", width: 70%),
	caption: [Funzionamento di un KBS]
)
La KB viene coinvolta in momenti diversi:
- _Offline_, viene costruita/integrata usando conoscenza pregressa ed esperienze passate: spesso servono molti dati e conoscenza generale. Tale attività nei sistemi esperti non è automatizzata;
- _Onliune_, si prendono decisioni/compiono azioni e si aggiorna la KB; nel ragionamento si usano KB, osservazioni, obiettivi e abilità del sistema.
Una KB è utile nel futuro come _long-term memory_: viene appresa dai dati e dall'esperienza pregressa; un belief state, _short-term memory_, è un modello dell'ambiente attuale necessario tra successivi intervalli di tempo.\
Uno schema di un KBS dettagliato è il seguente:
#figure(
	image("images/kbs_dettagliato.png", width: 70%),
	caption: [Schema dettagliato di un KBS]
)
== Domini applicativi
Tipici domini applicativi sono i seguenti:
- _robotica_;
- _diagnostica_: _assistente_ che aiuta a capire i problemi di altri sistemi software e suggerisce rimedi;
- _tutoring_: _sistema_ di aiuta agli studenti che interagisce fornendo informazioni su un argomento di interesse, assegnando compiti/test e valutando le capacità; deve comprendere la materia, lo studente e come questo impari;
- _e-commerce_: assistente agli acquisti di beni e servizi per conto dell'utente che sa riconoscere richieste e preferenze; sa trovare compromessi tra obiettivi distinti.
= Ricerca di soluzioni in spazi di stati
== Risoluzione di problemi mediante ricerca
La risoluzione di diversi problemi spesso consiste nella _ricerca_ in uno specifico modello del mondo. Considernado il caso di un sistema che, dato un _obiettivo_ da raggiungere, ragiona su un _modello_ del mondo fatto di _stati_, in _assenza di incertezza_. \
Per raggiungere questo scopo, si adotta una rappresentazione _piatta_, ovvero relativa a un singolo livello in una gerarchia.
\
L'_astrazione_ del problema prevede la ricerca di un _percorso_ che vada da un nodo di partenza a uno dei nodi-obiettivo, detto _goal_, in un _grafo orientato_.
\

#esempio(title: "Navigatore")[
	L'obiettivo è la ricerca del _miglior percorso_ da un luogo a un altro: il più corto; quello di minimo costo; il più veloce; il più attrattivo, ecc.\
	Ogni _stato_ include informazioni su: localizzazione, direzione, velocità, mezzo di trasporto utilizzato e così via.
] <es-navigatore>
Una strategia di ricerca comune a molti problemi in AI è la seguente: il sistema computa su una _rappresentazione interna_. Il sistema riceve solo una descrizione di _cosa_ rappresenti una soluzione; _come_ ottenerla sarà il compito di un algoritmo di ricerca. Spesso questi problemi e i relativi algoritmi risolutivi sono NP-completi.
\
Tali problemi risultano _difficili_ anche per agenti umani. Spesso non esistono soluzioni ottimali per cui ci si accontenta di soluzioni _soddisfacenti_ in mancanza d'una _struttura_ mappabile su caratteristiche del mondo fisico.

== Spazi di stati
Possiamo formulare la nozione di azione intelligente in termini di uno *spazio di stati*. Uno _stato_ contiene tutte le informazioni necesserie per predirre gli effetti di un'azione e per determinare se soddisfi l'obiettivo. Una ricerca su uno spazio di stati assume le seguenti nozioni:
- Gli agenti hanno una conoscenza perfetta dello spazio di stati.
- In qualsiasi momento, conosce in quale stato si trova; il mondo è quindi pienamente osservabile.
- L'agente ha un insieme di azioni con effetti deterministici conosciuti.
- L'agente ha un obiettivo da raggiungere e può determinare se uno stato soddisfa l'obiettivo.
Una *soluzione* di un problema di ricerca è una sequenza di azioni che porterà l'agente dallo stato corrente allo stato obiettivo. \
Un *problema di ricerca su uno spazio di stati* comprende:
- un insieme di stati
- uno stato distinto detto _stato di partenza_
- per ogni stato, un insieme di azioni disponibili all'agente che si trova in tale stato
- una *funzione di azione* che, dato uno stato corrente e un'azione _(s, a)_, ritorna un nuovo stato in cui si transita per effetto dell'azione
- un *goal* che è una funzione booleana, _goal(s)_, che ritornerà _true_ se _s_ è uno stato che soddisfa l'obiettivo e, in tal caso, _s_ è lo *stato obiettivo*
- un criterio che specifica la qualità di una soluzione accettabile; una *soluzione ottimale* massimizza tale criterio, ad esempio se ammette _qualsiasi_ sequenza di azioni che porti a uno stato-obiettivo; ad esempio associando _costi_ alle diverse azioni da cui discende un criterio del _minimo costo totale_ delle azioni; a volte, sono soddisfacenti anche soluzioni sub-ottimali, ad esempio quelle con un costo aggiuntivo del +10% rispetto a quello di una soluzione ottimale.

#esempio(title: "Robot-consegne")[
	Un robot che debba effettuare consegne in un edificio dovrà essere in grado di risolvere _problemi di ricerca_ di percorsi da un luogo ad un altro in un dato piano. \
	Occorrerà definire:
	- gli _stati_: posizioni distinte;
	- le _azioni_: spostamenti da un luogo a un altro nelle vicinanze;
	- il _problema_ specifico: portarsi da `A` a `G` (unico stato-obiettivo);
	- la _soluzione_: sequenza di spostamenti.
] <es-robot-consegne>

Possibili _estensioni_ dei problemi di ricerca riguardano:
- la possibilità di sfruttare una _struttura interna_ agli stati: ad esempio nei videogame;
- il caso di stati _non_ completamente _osservabili_: ad esempio il robot-consegne non conosce la posizione iniziale delle consegne, oppure un sistema di tutoring può non conoscere bene le attitudini di uno studente;
- l'aggiunta di azioni _stocastiche_: ad esempio possibilità di commettere errori oppure mancato apprendimento da parte dello studente di un argomento;
- la possibilità di definire, invece degli stati finali, _preferenze aggiuntive_ complesse, in termini di _ricompense_ o _punizioni_.
#esempio(title: "Videogame")[
	Si consideri lo spazio nella seguente figura.
	#figure(
  image("images/videogame_spazio_stati.png", width: 70%),
  caption: [Spazio di stati del problema.]
) <fig-videogame>
	\
	In tal caso definiamo:
	- il _modello_: griglia nella quale ci si può muovere di una casella nelle 4 direzioni se non si è bloccati da un muro (caselle scure);
	- l'_obiettivo_: raccogliere 4 monete $M_1, dots, M_4$, ognuna in una posizione iniziale nota, ad esempio $C_3$ in (5, 7);
	- il _costo_: un'unità di energia per ogni passo: nessuna mossa è possibile senza energia; ricarica (+16 unità) presso una casella _ricarica_, ad esempio in (4, 9);
	- lo _stato_: dato da una posizione $x, y$, dalle unità di carburante $u$ possedute e da 4 flag $c_i$ che indicano il possesso della relativa moneta: $(x, y, u, m_1, m_2, m_3, m_4)$;
	- possibili stato-obiettivo $(5, 7, ?, t, t, t, t)$ dove ? indica un quantitativo qualsiasi di carburante.

] <es_videogame>

== Ricerca su Grafo
Per risolvere il problema, si definisce lo spazio di ricerca e si applica un algoritmo di ricerca. Come detto precedentemente, molti compiti possono essere ricondotti alla _ricerca_ di percorsi in un grafo. Un modello _astratto_ della soluzione sarà _indipendente_ dal particolare dominio applicativo di interesse. Dato un _grafo orientato_ fatto di nodi connessi da archi, si dovrà trovare un _percorso_ da un nodo di partenza a uno boiettivo. Ci possono essere più modi per rappresentare uno stesso problema. \ \
Un *grafo orientato* _esplicito_ consiste di:
- un insieme di _nodi N_, anche non finito;
- un insieme di _archi A_, ossia di coppie _ordinate_ di nodi, anche non infinito;
	- l'arco $n_1, n_2$ si dirà *uscente* da $n_1$ ed *entrante* in $n_2$
	- si dirà che il nodo $n_2$ è un *vicino* del nodo $n_1$ se e solo se $exists chevron.l n_1, n_2 chevron.r in A$

- un *percorso* dal nodo _s_ al nodo _g_, denotato da $chevron.l n_0, n_1, dots, n_k chevron.r$, è una _sequenza_ di nodi tale che se $s = n_0, g = n_l$ e $forall i = 1, dots, k : chevron.l n_(i-1), n_i chevron.r in A$; in alternativa, si può indicare una _sequenza di archi_ $chevron.l n_0, n_1 chevron.r, chevron.l n_1, n_2 chevron.r, dots, chevron.l n_(k-1), n_k chevron.r$ o anche _sequenza di etichette_ su tali archi: $chevron.l n_0, dots, n_i chevron.r$ _parte iniziale_ di $chevron.l n_0, n_1, dots, n_k chevron.r$, con $i <= k$.

Nel grafo esiste un insieme di _nodi-obiettivo_ che si possono identificare anche tramite il predicato _goal($dot$)_, funzione booleana definita sui nodi. Una *soluzione* è un percorso dal nodo di partenza a uno obiettivo.\
In alcuni casi è associato un *costo* a ogni arco: dato $chevron.l n_i, n_j chevron.r$
$
c o s t(chevron.l n_i, n_j chevron.r) in [0, +infinity[
$
estendibile anche ai percosi: dato $p = chevron.l n_0, n_1, dots, n_k chevron.r$
$
c o s t(p) = sum_(i=1)^k c o s t (chevron.l n_(i-1), n_i chevron.r)
$
Una soluzione *ottimale* _p_ avrà costo minimo: $exists.not p'$ soluzione con $c o s t(p') < c o s t(p)$.

#esempio(title: "Robot consegne, continuo.")[
	Ricerca di un percorso da $A$ a $G$ nel mondo rappresentato nella seguente figura.
	#figure(
  image("images/robot_spazio_stati.png", width: 70%),
	) <fig-robot-consegne>
	- $N = {A, B, C, D, E, F, G, H, J}$
	- $A = {chevron.l A, B chevron.r, chevron.l A, C chevron.r, chevron.l A, D chevron.r, chevron.l B, E chevron.r chevron.l B, F chevron.r, chevron.l C, J chevron.r, dots}$ dove: $E$ non ha vicini; $C$ ha come vicino solo $J$; $A$ ha i vicini $B, C$ e $D$;
	- vi sono 3 percorsi da  $A$ a $G$: $chevron.l A, D, H, G chevron.r, chevron.l A, C, J, G chevron.r, chevron.l A, B, F, D, H, G chevron.r$; se $A$ fosse nodo di partenza e $G$ il nodo-obiettivo, ognuno di tali percorsi sarebbe una soluzione.
] <es-continuo-robot-consegne>

Un *ciclo* è un percorso non vuoto in cui primo e ultimo nodo coincidono: $chevron.l n_0, n_1, dots, n_k chevron.r$ tale che $k > 0$ e $n_0 = n_k$.\ \
Un *grafo aciclico orientato* (_directed acyclic graph_, DAG) è un grafo orientato senza cicli. Un *albero* è un DAG con un solo nodo, la  *radice*, senza archi entranti. I nodi senza archi uscenti sono le sue *foglie*.

== Algoritmo di ricerca generico
Un algoritmo di ricerca generico è un algoritmo indipendente dalla strategia di ricercadal grafo. Dato un grafo, si esplorano _incrementalmente_ percorsi dai nodi di partenza verso nodi-obiettivo.\
Si una una struttura dati per rappresentare la *frontiera*, detta _fringe_, dei percorsi già esplorati. Inizialmente la frontiera contiene percorsi costituiti dai soli _nodi di partenza_. Successivamente si effettua l'_espanzione_ dei percorsi nella frontiera verso nodi inesplorati, fino a incontrare un nodo-obiettivo:
- si seleziona un percorso (rimuovendolo dalla frontiera);
- si estende il percorso con ogni arco uscente dall'ultimo nodo;
- si aggiungono alla frontiera i percorsi ottenuti.

#algoritmo(title: [Algoritmo di ricerca generico])[
  #pseudocode-list[
    + *procedure* $"Search"(G, s, "goal")$
    + *Input*
      + $G$: grafo con insiemi di nodi $N$ e di archi $A$
      + $s$: nodo di partenza
      + $"goal"$: funzione booleana sui nodi
    + *Output*
      + percorso da $s$ a un nodo per il quale $"goal"$ sia vera
      + oppure $bot$ quando non ci sono percorsi / soluzioni
    + *Local*
      + $"frontiera"$: insieme di percorsi
    + $"frontiera" <- {chevron.l s chevron.r}$
    + *while* $"frontiera" != emptyset$ *do*
      + selezionare (e rimuovere) $chevron.l n_0, dots, n_k chevron.r$ da $"frontiera"$
      + *if* $"goal"(n_k)$ *then*
        + *return* $chevron.l n_0, dots, n_k chevron.r$
      + $"frontiera" <- "frontiera" union {chevron.l n_0, dots, n_k, n chevron.r : chevron.l n_k, n chevron.r in A}$
    + *return* $bot$
  ]
] <alg-ricerca>

Come descritto nell'@alg-ricerca, l'inizializzazione parte dal nodo $s$.

La selezione _non è deterministica_, ha solo impatto sull'efficienza quindi una data strategia di selezione determina il percorso da scegliere. Il `return` annidato può essere interpretato come _temporaneo_, continuando si trovano strade alternative; $perp$
indica che non vi sono soluzioni; la condizione _goal($n_k$)_ viene testata doo la selezione della frontiera e non all'aggiunta del nuovo nood:
+ a volte esiste un _arco_ vers un nodo-obiettivo ma di _costo elevato_: non sempre conviene terminare restituendo subito il percorso trovato in quanto potrebbe esserci un percorso di costo inferiore;
+ va tenuto conto del fatto che lo stesso test _goal()_ può essere _costoso_; un percorso che termini con un nodo che non sia un nodo-obiettivo e che non abbia vicini andrebbe rimosso.
== Strategie di ricerca non informate
Il problema specifica il grafo e l'obiettivo mentre la *strategia di ricerca* determina il percorso da selezionare dalla frontiera. Le _strategie_ *non informate* non prendono in considerazione la posizione dell'obiettivo. Se si considera un costo unitario per ogni arco, possibili strategia sono al ricerca _in ampiezz_, quella in _profondità_ o l'_approfondimento iterativo_. Se è disponibileuna funzione di costo, allora si unano strategie dei _costi minimi_.
=== Ricerca in ampiezza
Nella *ricerca in ampiezza*, detta _breadth-first search, BFS_ la frontiera è implementata cn una _coda_, ossia una struttura FIFO. Si seleziona il _primo_ percorso aggiunto. I percorsi sono generati nell'ordine del numero di archi contenuti. A ogni passo, si seleziona uno dei percorsi più corti.

#esempio[
	Dal grafo in figura @fig-robot-consegne, ignorando i costi, si ottiene il grafo nella seguente figura:
	#figure(
	image("images/grafo_robot_no_costi.png", width: 70%),
	caption: [Grafo della figura @fig-robot-consegne ma senza informazioni sul costo]
	) <fig-robot-no-costi>
	In questa figura $A$ è il nodo di partenza e $G$ è il nodo obiettivo. Con la BFS:
	- frontiera iniziale: $[chevron.l A chevron.r]$;
	- estendendo $chevron.l A chevron.r$ con i suoi vicini si ottiene:
	$
	[chevron.l A, B chevron.r, chevron.l A, C chevron.r, chevron.l A, D chevron.r]
	$
	nodi a un arco di distanza da $A$;
	- espandendo questi perocrsi, nell'ordine si ha:
	$
	[chevron.l A, B, E chevron.r chevron.l A, B, F chevron.r, chevron.l A, C, J chevron.r, chevron.l A, D, H chevron.r]
	$
	percorsi da $A$ di lunghezza 2;
	- dopo l'espansiuone dei percorsi del passo precedente la frontiera diventa:
	$
	[chevron.l A, B, F, D chevron.r, chevron.l A, C, J, G chevron.r, chevron.l A, D, H, G chevron.r]
	$
	- selezionando, ad esempio, $chevron.l A, C, J, G chevron.r$ questo percorso viene restituito come soluzione.
]

La BFS risulta utile quando:
- non si hanno problemi di spazio;
- si cerca una soluzione con numero di archi _minimale_.

La BFS è _poco utile_ quando:
- tutte le soluzioni sono associate a percorsi lunghi;
- è disponibile conoscenza euristica;
- il grafo viene generato dinamicamente.

=== Ricerca in profondità
Nella *ricerca in profondità*, detta _depth-first search_, DFS, la frontiera è implementata con uno _pila_, struttura LIFO: gli elementi vengono aggiunti uno alla volta e quello selezionato e prelevato sarà l'ultimo aggiunto.\
Partendo dalla radice, i nodi sono considerati come ordinati da sinistra a destra: il vicino più a sinistra sarà aggiunto in cima per _ultimo_. L'ordine di espansione non dipende dalla posizione dei nodi-obiettivo.\
Con una pila, la ricerca procede in profondità:
- _completamento_ di un _singolo percorso_ prima di provare alternative;
- questo comporta il *backtracking*: si seleziona una prima alternativa per ogni nodo, _tornando indietro_ all'opzione successiva solo dopo aver tentato tutti i completamenti;
- l'_ordine di aggiunta_ dei vicini alla frontiera/pila non è specificato: questo impatta sull'efficienza e può essere _statico_, ossia prefissato, ovvero _dinamico_, dipendendo dall'obiettivo;
- per una procedura DFS alternativa si veda la figura (inserire figura slide).

#esempio(title: [DFS sul grafo in @fig-robot-no-costi])[
	La frontiera come lista con il primo percorso in _cima_. Si parte da $[chevron.l A chevron.r]$. Le frontiere successive sono:
	- $[chevron.l A, B chevron.r, chevron.l A, C chevron.r, chevron.l A, D chevron.r]$
	- $[chevron.l A, B, E chevron.r, chevron.l A, B, F chevron.r, chevron.l A, C chevron.r, chevron.l A, D chevron.r]$
	- $[chevron.l A, B, F chevron.r, chevron.l A, C chevron.r, chevron.l A, D chevron.r]$
	- $[chevron.l A, B, F, D, H chevron.r, chevron.l A, C chevron.r, chevron.l A, D chevron.r]$
	- $[chevron.l A, B, F, D, H, G chevron.r, chevron.l A, C chevron.r, chevron.l A, D chevron.r]$
Il percorso in cima viene restituito come _soluzione_.
]

La DFS è _appropriata_ in caso di:
- limitazioni di spazio;
- presenza di molteplici soluzioni, anche se costituite da percorsi lunghi;
- ideale quando _tutti_ portano a una soluzione;
- oppure se l'ordine di aggiunta dei vicini può essere variato in modo da trovare una soluzione al _primo tentativo_.

La DFS risulta _inefficiente_ quando:
- sono possibili percorsi infiniti in caso di grafo infinito o contenente cicli;
- pur esistendo soluzioni alternative poco profonde, la ricerca si attarda su percorsi più lunghi.

=== Approfondimento iterativo
L'obiettivo dell'algoritmo *ITERATIVE DEEPENING* della DFS è combinare l'efficienza in spazio di DFS con l'ottimalità di BFS. L'idea è quella di non memorizza ma ricalcolare gli elementi della frontiera di BFS usando DFS che usa meno spazio. \
DFS effettua una ricerca limitata fino a una data _profondità_ come per le iterazioni di BFS. In caso di fallimento si eliminano i percorsi via via calcolati ripartendo, se necessario, dopo aver aumentato il limite. Si parte cercando fino a profondità 1, poi si costruiscono i cammini fino a lunghezza 2, poi quelli di lunghezza 3, ecc$dots$. Se essiste, una soluzione verrà trovata, esplorando percorsi in tale ordine: uno con il numero minimo di archi sarà individuato per primo. \
Il _fallimento_ della ricerca in profondità limitata può essere:
- _innaturale_: per raggiungimento del limite di profondità e in tal caso la ricerca riparte, dopo aver incrementato il limite;
- _naturale_: quando l'intero spazio di ricerca è esaurito non esiste soluzione a nessun livello di profondità.
#algoritmo(title: [Ricerca Iterative Deepening])[
  #pseudocode-list[
    + *procedure* $"ID_search"(G, s, "goal")$
    + *Input*
      + $G$: grafo con insiemi di nodi $N$ e di archi $A$
      + $s$: nodo di partenza
      + $"goal"$: funzione booleana sugli stati
    + *Output*
      + cammino da $s$ a un nodo per il quale $"goal"$ sia vero
      + ovvero $bot$ altrimenti
    + *Local*
      + $"raggiunta_max_profondita"$: boolean
      + $"limite_profondita"$: integer
    + *procedure* $"Ricerca_a_profondita_limitata"(chevron.l n_0, dots, n_k chevron.r, b)$
      + *Input*
        + $chevron.l n_0, dots, n_k chevron.r$: percorso
        + $b$: integer $\{b >= 0\}$
      + *Output*
        + percorso fino a nodo-obiettivo di lunghezza $k + b$
      + *if* $b > 0$ *then*
        + *for each* $chevron.l n_k, n chevron.r in A$ *do*
          + $"risultato" <- "Ricerca_a_profondita_limitata"(chevron.l n_0, dots, n_k, n chevron.r, b - 1)$
          + *if* $"risultato" != bot$ *then*
            + *return* $"risultato"$
      + *else if* $"goal"(n_k)$ *then*
        + *return* $chevron.l n_0, dots, n_k chevron.r$
      + *else if* $n_k$ ha vicini *then* $\{ "fallimento innaturale" \}$
        + $"raggiunta_max_profondita" <- "true"$
      + *return* $bot$
    + $"limite_profondita" <- 0$
    + *repeat*
      + $"raggiunta_max_profondita" <- "false"$
      + $"risultato" <- "Ricerca_a_profondita_limitata"(chevron.l s chevron.r, "limite_profondita")$
      + *if* $"risultato" != bot$ *then*
        + *return* $"risultato"$
      + $"limite_profondita" <- "limite_profondita" + 1$
    + *until not* $"raggiunta_max_profondita"$
    + *return* $bot$ $\{ "fallimento naturale" \}$
  ]
] <alg:id-search>
La procedura $"Ricerca_a_profondita_limitata"$ implementa una DFS a profondità limitata: trova percorsi di lunghezza $k + b$, dove $k$ è la lunghezza del percorso e $b >= 0$; viene chiamato a profondità crescenti. I percorsi vengono trovati nello stesso ordine della BFS: si controlla di aver trovato un obiettivo solo se $b = 0$.\
Per assicurare di fallire quando anche la BFS fallirebbe, si tiene traccia dei casi in cui un limite amggiore potrebbe aiutare a trovare una soluzione. La ricerca _fallisce inaturalmente_ se ha esaurito tutto lo spazio di ricerca e non sono stati tagliati percorsi per limite raggiungo; se $"raggiunta_max_profondita"$, falsa al momento della chiamata, diventa vera alla fine, il limite può essere incrementato per la successiva iterata.

=== Ricerca di soluzioni a costo minimo
In caso di archi con _costi_ non unitari si cerca la soluzione di _minimo costo totale_. Gli algoritmi precedenti non garantiscono soluzioni di costo minimo: il costo non viene preso in considerazione. BFS minimizza solo il _numero_ degli archi: potrebbe esistere una soluzione alternativa, come un percorso più lungo ma di costo inferiore. \
L'algoritmo *LOWEST COST-FIRST SEARCH* (LcFS), detto anche _least-cost search_ o _uniform-cost search_, si comporta come BFS ma con la selezione dei percorsi di costo minimo. Viene implementato usando una _coda con priorità_ come frontiera ordinata da _cost_.
#esempio[
  Si consideri il grafo in figura @fig-robot-consegne. Si espanderà sempre il percorso più a sinistra nella frontiera (costi dei percorsi indicati come pedici):

  - $[chevron.l A chevron.r_0]$ frontiera iniziale
  - $[chevron.l A, B chevron.r_2, chevron.l A, C chevron.r_3, chevron.l A, D chevron.r_4]$
  - $[chevron.l A, C chevron.r_3, chevron.l A, B, E chevron.r_4, chevron.l A, D chevron.r_4, chevron.l A, B, F chevron.r_5]$
  - $[chevron.l A, B, E chevron.r_4, chevron.l A, D chevron.r_4, chevron.l A, B, F chevron.r_5, chevron.l A, C, J chevron.r_(10)]$
  - $[chevron.l A, D chevron.r_4, chevron.l A, B, F chevron.r_5, chevron.l A, C, J chevron.r_(10)]$
  - $[chevron.l A, B, F chevron.r_5, chevron.l A, D, H chevron.r_8, chevron.l A, C, J chevron.r_(10)]$
  - $[chevron.l A, B, F, D chevron.r_7, chevron.l A, D, H chevron.r_8, chevron.l A, C, J chevron.r_(10)]$
  - $[chevron.l A, D, H chevron.r_8, chevron.l A, C, J chevron.r_(10), chevron.l A, B, F, D, H chevron.r_(11)]$
  - $[chevron.l A, C, J chevron.r_(10), chevron.l A, D, H, G chevron.r_(11), chevron.l A, B, F, D, H chevron.r_(11)]$.

  Dopo l'espansione di $chevron.l A, C, J chevron.r$, si selezionerà $chevron.l A, D, H, G chevron.r$, percorso di costo minimale da $A$ a $G$.
]
Il fattore di ramificazione è _finito_ se i _costi_ sono _limitati_ inferiormente da una costante positiva: ciò garantisce la soluzione ottimale, quando esiste. Il primo percorso trovato termina in un nodo-obiettivo ed è ottimale perchè si procede in ordine di costo. \
In mancanza di un limite inferiore allora sono possibili percorsi _infiniti_, ad esempio con nodi $n_0, n_1, n_2, dots$ con $forall i > 0 : chevron.l n_(i-1), n_i$ di costo $1/2^i$ esistono infiniti percorsi $chevron.l n_0, n_1, dots, n_k chevron.r$, con costo $ < 1$; se $exists chevron.l n_0, g chevron.r, g o a l(g)$ con costo $>=1$, l'arco non verrebbe mai selezionato. \
La complessità è esponenziale in spazio e tempo: genera tutti i percorsi con costo inferiore a quello della soluzione.
== Ricerca Informata (Euristica)
=== Euristica
Tale tipo di ricerca prende in considerazione _informazioni sull'obiettivo_, nella selezione dei nodi da esplorare, attraverso l'uso di una *funzione euristica* _h_ che associa a ogni nodo $n$ un numero reale _non-negativo_, una stima del costo minimale di un perocorso da $n$ fino a un nodo-obiettivo. \
L'euristica $h$ si dice *ammissibile* se _sottostima_ il costo reale: $h(n)$ minore o uguale rispetto al costo minimale effettivo del percorso da ciascun nodo a un nodo-obiettivo. Tale informazione approssimata è spesso immediatamente disponibile trovando un _compromesso_ tra efficienza del suo calcolo e accuratezza della stima. Tipicamente, risolvendo una forma semplificata del problema, si possono poi usare i costi effettivi del problema semplificato come euristica nella soluzione del problema originario.
#esempio(title: [Problema nel grafo in @fig-robot-consegne])[
Considerando come _euristica_ la distanza in linea retta tra nodo e obiettivo più vicino, quindi supponendo che tali distanze siano ad esempio:

    #v(0.5em)
    #align(center)[
      #table(
        columns: 10,
        align: center,
        // Disegna la linea orizzontale sotto l'intestazione e quelle verticali tra le colonne
        stroke: (x, y) => (
          bottom: if y == 0 { 0.5pt } else { none },
          left: if x > 0 { 0.5pt } else { none }
        ),
        [], [$A$], [$B$], [$C$], [$D$], [$E$], [$F$], [$G$], [$H$], [$J$],
        [$h(dot)$], [7], [5], [9], [6], [3], [5], [0], [3], [4]
      )
    ]
    #v(0.5em)

    $h$ risulta ammissibile e in particolare: essa è

    - _esatta_ per il nodo $H$;
    - _molto sottostimata_ per il nodo $B$: sembra vicino al nodo-obiettivo (costo $5$), ma raggiungere l'obiettivo costa molto di più;
    - _ingannevole_ per il nodo $E$: sembra vicino al nodo-obiettivo (costo $3$) ma non permette di raggiungere l'obiettivo.
]
=== DFS Euristica e Greedy best-First Search
L'euristica $h$ può essere _estesa_ al caso dei percorsi:
$
h(chevron.l n_0, dots, n_k chevron.r) = h(n_k)
$
La *DFS Euristica* usa $h$ per ordinare i _vicini_ aggiunti alla pila/frontiera della DFS standard. I vicini vengono aggiunti in modo che il _migliore_ vada in cima. Tale scelta è comunque _locale_: si esplorano i percorsi che estendono quello selezionato prima di tentarne altri. Si presentano problemi analoghi al caso della DFS: non c'è garanzia di terminazione e ritrovamento di una soluzione ottimale. \
Si potrebbe considerare la _best-first search_ che sfrutta un'euristica $h$ da minimizzare nella scelta del prossimo cammino da espandere. In particolare, nella _greedy best-first search_, GbFS, si sceglie il percorso della frontiera con valore di $h$ minimo. Purtroppo potrebbe seguire cammini apparantemente promettenti che, però, potrebbero continuare a estendersi indefinitamente.
=== Ricerca $A^*$
L'algoritmo $A^*$ combina idee da LcFS e GbFS. Nella selezione del percorso da espandere si considerano: il costo effettivo del percorso parziale che dal nodo iniziale arriva al nodo corrente e l'euristica, ossia una stima del percorso dal nodo corrente fino a un obiettivo. \
Per ogni percorso $p = chevron.l s, dots, n chevron.r$ della frontiera, si stima il costo di un percorso che passi per $p$ e progesua fino a un nodo-obiettivo $g$:
$
f(p) = c o s t(p) + h(p)
 $
dove $c o s t(p)$ rappresenta il costo effettivo di $p$ e $h(p)$ è una stima del costo del cammino da $n$ a $g$. \
Si segue lo schema dell'algoritmo di ricerca generico in @alg-ricerca e si rappresenta la _frontiera_ con una coda con priorità, ordinata da $f(p)$. Se $h$ è ammissibile allora $f(p)$ non sovrastima il cost d'un percorso completo che includa $p$. \
$A^*$ può seguire molti perocrsi ma alla fine ne trova uno di costo minimo. Altri possono semprare (provvisoriamente) di costo inferiore. $A^*$ migliora le prestazioni degli algoritmi da cui origina.
#esempio(title: [$A^*$ su grafo ed euristica])[
Si consideri il grafo in figura:
#figure(
image("images/Astart.png", width: 70%),
caption: [Problema con costi effettivi sugli archi e valori dell'euristica sui nodi]
)
Sequenza delle frontiere. Il pedice indica il valore di $f(p)$.
- $[chevron.l A chevron.r_7]$ iniziale, essendo $h(A) = 7$ e $c o s t(chevron.l chevron.r) = 0$
- $[chevron.l A, B chevron.r_7, chevron.l A, D chevron.r_(10), chevron.l A, C chevron.r_(12)]$
- $[chevron.l A, B, E chevron.r_7, chevron.l A, B, F chevron.r_(10), chevron.l A, D chevron.r_(10), chevron.l A, C chevron.r_(12)]$
- $[chevron.l A, B, F chevron.r_(10), chevron.l A, D chevron.r_(10), chevron.l A, C chevron.r_(12)]$
- $[chevron.l A, D chevron.r_(10), chevron.l A, C chevron.r_(12), chevron.l A, B, F, D chevron.r_(13)]$
- $[chevron.l A, D, H chevron.r_(11), chevron.l A, C chevron.r_(12), chevron.l A, B, F, D chevron.r_(13)]$
- $[chevron.l A, D, H, G chevron.r_(11), chevron.l A, C chevron.r_(12), chevron.l A, B, F, D chevron.r_(13)]$
La soluzione è $chevron.l A, D, H, G chevron.r$ di costo 11.
]
Un algoritmo è *ammissibile* se, quando esistono soluzioni, ne trova sempre una ottimale.
#proposizione[
$A^*$ è ammissibile se:
- il fattore di ramificazione è limitato;
- i costi degli archi sono maggiori di un certo $epsilon > 0$
- $h$ è ammissibile, non supera il costo minimale di percorsi da ciascun nodo a un obiettivo.
$A^*$ garantisce che la prima soluzione sarà ottimale, anche in presenza di _cicli_, ma non assicura che ciascun nodo intermedio selezionato dalla frontiera sia un cammino ottimo.
]
==== Importanza dell'euristica
Il miglioramento dell'efficienza in $A^*$ è dato dall'uso di $h$. Sia $c$ il costo del percorso di costo minimo. Se $h$ è ammissibile, $A^*$ espande ogni percorso dal nodo di partenza nell'insieme
$
brace.l p | c o s t(p) + h(p) < c brace.r
$
più alcuni percorsi nell'insieme
$
brace.l p | c o s t(p) + h(p) = c brace.r
$
Per l'efficienza di $A^*$, $h$ è tanto migliore quanto più ridce la cardinalità del primo insieme.
=== Algoritmo Branch and Bound
L'idea di questo algoritmo è combinare l'effic ienza in spazio delle strategie in profondità con informazione euristica. Risulta efficace quando esistono molti cammini verso un nodo-obiettivo. Questo algoritmo assume che $h(n)$ sia ammissibile. \
Questo algoritmo memorizza il percorso di costo minimo verso un nodo-obiettivo trovato e il suo costo che diventa un _limite_: un percorso $p : c o s t(p) + h(p) >= l i m i t e$ aggiorando _limite_; si continua poi a cercare un'eventuale soluzione migliore.\
Si genera così una sequenza di soluzioni via via migliori restituendo quella finale: l'algoritmo viene tipicamente implementato usando la DFS per la ricerca in profondità limitata dal valore di _limite_.
#algoritmo(title: [Ricerca Depth-First Branch and Bound])[
  #pseudocode-list[
    + *procedure* $"DFBranchAndBound"(G, s, "goal", h, "limite"_0)$
    + *Input*
      + $G$: grafo con nodi $N$ e archi $A$
      + $s$: nodo di partenza
      + $"goal"$: funzione di test dei nodi
      + $h$: euristica sui nodi
      + $"limite"_0$: limite iniziale ($infinity$ se non specificato)
    + *Output*
      + percorso di costo minimo da $s$ a un nodo obiettivo se esiste una
      + soluzione di costo minore di $"limite"_0$, oppure $bot$
    + *Local*
      + $"percorso_migliore"$: percorso o $bot$
      + $"limite"$: numero reale non negativo
    + *procedure* $"cbsearch"(chevron.l n_0, dots, n_k chevron.r)$
      + *if* $"cost"(chevron.l n_0, dots, n_k chevron.r) + h(n_k) < "limite"$ *then*
        + *if* $"goal"(n_k)$ *then*
          + $"percorso_migliore" <- chevron.l n_0, dots, n_k chevron.r$
          + $"limite" <- "cost"(chevron.l n_0, dots, n_k chevron.r)$
        + *else*
          + *for each* $chevron.l n_k, n chevron.r in A$ *do*
            + $"cbsearch"(chevron.l n_0, dots, n_k, n chevron.r)$
    + #text(fill: luma(130))[{main}]
    + $"percorso_migliore" <- bot$
    + $"limite" <- "limite"_0$
    + $"cbsearch"(chevron.l s chevron.r)$
    + *return* $"percorso_migliore"$
  ]
] <alg:df-branch-and-bound>
La procedura _cbsearch_, _cost-bounded search_, comunica attraverso variabili globali; inizialmente, _limite_ è impostata a $"limite"_0$, stima per eccesso del costo d'una soluzione ottimale. \
_DFBranchAndBound_ restituirà, se esiste, una soluzione ottimale con costo inferiore a $"limite"_0$. Se $"limite"_0$ supera di poco il costo minimo, l'algoritmo non espanderà più archi di $A^*$. La variabile $"limite"_0$ serve a far eliminare percorsi di costo maggiore: trovato un percorso completo, si esplorano solo percorsi con valore di $f$ inferiore a quello del percorso trovato, ossia esattamente i percorsi esplorati da $A^*$ quando trova una soluzione. Quando restituisce $perp$, se $"limite"_0 = infinity$ allora non ci sono soluzioni, se invece $"limite"_0$ è finito allora non ci sono soluzioni di costo inferiore a $"limite"_0$.\
Combinato con ID l'algoritmo può incrementare via via il limite fino a trovare una soluzione ovvero può mostrare che non c'è soluzione. \
#esempio(title: "Robot-consegne")[
In un problema più complesso, si considerino:
- _stati_ comprendenti le consegne da fare;
- il _costo_ dato dalla distanza totale per tutte le consegne;
- un'_euristica_ possibile pari al massimo tra:
	+ la distanza massima per consegne ancora da fare non caricate: per ognina, la distanza dalla sua posizione e, da qui, fino alla destinazione;
	+ la distanza della destinazione più lontana per le consegne trasportate.
Tale massimo non sovrastima il costo: è la soluzione per un problema semplificato che non considera muri e tutte le altre consegne da fare tranne la più difficile; è appropriato: vanno consegnate quelle trasportate, passate  aprendere quelle ancora non caricate e portate a destinazione. \
Se il robot può trasportare una sola consegna, un'euristica dovrebbe sommare le distanze per il trasporto di ognuna più la distanza dalla più vicina: non è detto che sarà effettuata per prima.
]
#esempio(title: "Navigatore")[
Per la minimizzazione del tempo:
- possibile euristica: distanza in linea retta dalla locazione corrente al nodo-obiettivo divisa per la velocità massima, assumendo che ci si possa dirigere a destinazione alla massima velocità;
- euristica più sofisticata: date velocità massime diverse per autostrade e strade locali, si sceglie il massimo tra:
	+ minimo tempo stimato per andare a destinazione su strade locali lente;
	+ minimo tempo utile a raggiungere un'autostrada da una strada locale, per poi raggiungere un luogo vicino alla destinazione e arrivarci da strada locale.
]
=== Progettazione della funzione Euristica
Un'*euristica ammissibile* è una funzione non negativa $h$ definita sui nodi, tale che dato un nodo $n$, $h(n)$ non è mai superiore al costo reale del percorso ottimale da $n$ a un nodo-obiettivo. \
Una _procedura standard_ per definire un'euristica può essere descritta come segue:
- Si trovano soluzioni di un problema più semplice, ossia con _meno vincoli_, quindi spesso molto più facile da risolvere; una sua soluzione ottimale avrà un costo pari o inferiore a una soluzione del problema originario.
- Si considerino problemi di ricerca su mappe semplificate rappresentati da grafi, in cui si sia _vincolati_ a muoversi lungo i dati archi: supponendo che il loro costo sia proporzionale alla lunghezza dei collegamenti stradali, un'euristica ammissibile è costituita dalla _distanza euclidea_ tra punti/nodi.
\
*Inserire esempi slide*\
Un problema in forma semplificata può essere risolto anche attraverso una ricerca più semplice rispetto al problema originario: ricerca ripetuta anche più volte e per tutti i nodi. \
Conviene memorizzare (in una memoria cache) tali risultati in un *DB di pattern* che associ ai nodi del problema semplificato il valore dell'euristica. \
Nel problema semplificato, spesso si hanno meno nodi: più nodi originari sono mappati su uno stesso nodo di quello semplificato come fosse una _classe d'equivalenza_.
== Potatura dello Spazio di Ricerca
Si possono migliorare gli algoritmi di ricerca considerando i diversi percorsi che possono attraversare un nodo. Non tutti sono utili a risolvere il problema per cui gli altri possono essere subito eliminati. \
Essenzialmente vi sono due tipi di *pruning*, ovvero _potatura_, con relative strategie:
- _potare i cicli_ per trovare percorsi dal costo minimo;
- _potare cammini molteplici_: per ogni nodo si considererà un solo percorso che lo attraversi, eliminando tutti gli altri.
=== Potatura dei Cicli
Alcuni dei metodi di ricerca visti in precedenza potrebbero rimanere intrappolati in cicli senza possibilità di uscita anche nel caso di grafi finiti. \
Per avere la garanzia di trovare una soluzione in caso di _grafo finito_ non andranno presi in considerazione vicini già presenti nel percorso corrente. \
Nella *potatura dei cicli*, detta _cycle / loop pruning, CP_, si prevede un controllo addizionale preventivo: dato un nodo da aggiungere, va testata l'occorrenza nel percorso. \
Nello shema di *@alg-ricerca* si aggiungono alla frontiera solo percorsi $chevron.l n_0, dots, n_k, n chevron.r$, tali che $n in.not brace.l n_0, dots, n_k brace.r$, scartando il percorso selezionato; in alternativa si può effettuare il controllo dopo la selezione del nodo. \
La compelssità dei controlli aggiuntivi per la verifica della presenza di un nodo nel percorso corrente dipende dal metodo di ricerca adottato:
- _costante_ permetodi (DF) che memorizzano un _unico percorso_; si può usare una funzione _hash_ oppure si può associare un _bit_ a ogni ndoo, che sarà acceso quando viene aggiunto a un percorso e viene spento in caso di backtracking; per cui basterà non espandere nodi con il bit acceso; tale metodo funziona perchè si lavora su un solo percorso;
- _lineare_ nella lunghezza del percorso corretne per metodi che gestiscono più percorsi (esponenziali in spazio): serve una ricerca per evitare di aggiungere al percorso parziale un nodo già presente.
=== Potatura di Percorsi Multipli
Spesso più di un percorso porta a uno stesso nodo. Occorre quindi _eliminare_ dalla fronteira ogni percorso che porti a un nodo per il quale ne esista già un altro (di costo inferiore). \
Una strategia di *multiple-path pruning* (MPP) può essere implementata gestendo una lista di nodi terminali di percorsi già esplorati, detta *closed list* o _explored set_: inzialmente essa è buota poi, selezionato un percorso $chevron.l n_0, dots, n_k chevron.r$ della frontiera, se $n_k$ è già nella lista esso può essere scartato, altrimenti si aggiunge $n_k$ alla lista e si prosegue.
#algoritmo(title: [Ricerca con Multiple-Path Pruning])[
  #pseudocode-list[
    + *procedure* $"SearchMPP"(G, s, "goal")$
    + *Input*
      + $G$: grafo con nodi $N$ e archi $A$
      + $s$: nodo di partenza
      + $"goal"$: funzione booleana sui nodi
    + *Output*
      + cammino da $s$ a un nodo per cui $"goal"$ è vero
      + oppure $bot$ se non ci sono cammini soluzione
    + *Local*
      + $"frontier"$: insieme di cammini
      + $"explored"$: insieme di nodi esplorati
    + $"frontier" <- {chevron.l s chevron.r}$
    + $"explored" <- emptyset$
    + *while* $"frontier" != emptyset$ *do*
      + selezionare e rimuovere $chevron.l n_0, dots, n_k chevron.r$ da $"frontier"$
      + *if* $n_k in.not "explored"$ *then*
        + $"explored" <- "explored" union {n_k}$
        + *if* $"goal"(n_k)$ *then*
          + *return* $chevron.l n_0, dots, n_k chevron.r$
        + $"frontier" <- "frontier" union {chevron.l n_0, dots, n_k, n chevron.r : chevron.l n_k, n chevron.r in A}$
    + *return* $bot$
  ]
] <alg:search-mpp>
Si noti che questa strategia non garantisce che non eliminato un percorso di costo minimo. Per garantire di preservare le soluzioni ottimali vi sono alcune alternative:
- assicurare che il primo percorso trovato per un dato nodo si ottimale quindi gli altri si possono eliminare;
- se nella frontiera si dovesse inserire un percorso $p = chevron.l s, dots, n, dots, m chevron.r$, ma fosse già presente $p'=chevron.l s, dots, n chevron.r $ meno costoso della parte fino a $n$ in $p$, si può eliminare $p$ oppure sostituire in $p$ tale parte con $p'$.
In LcFS, il primo percorso verso un dato nodo è quello di costo minimo. Pertanto potare altri percorsi non elimina un cammino a costo minimo per il nodo. Ciò assicura di ptoer trovare una soluzione ottimale. \
$A^*$ non garantisce che quando si seleziona un percorso verso un nodo per la prima volta, questo sia quello di costo minimo: il teorema sull'ammissibilità lo garantisce solo per i percorsi verso nodi-obiettivo; per quelli verso altri nodi dipende dalle proprietà dell'euristica. \
Un'*euristica consistente* $h$ (non negativa) soddisfa il vincolo:
$
h(n) <= c o s t(n, n') + h(n')
$
per ogni coppia di nodi $n$ e $n'$. \
Se $h(g) = 0$ per ogni nodo-obiettivo $g$, allora $h$ sarà consistente e non sovrastimerà mai il costo dei percorsi da un nodo verso un obiettivo. \
La consistenza è garantita se $h$ soddisfa la *restrizione di monotonicità*:
$
h(n) <= c o s t(n, n') + h(n')
$
per ogni arco $chevron.l n, n' chevron.r$. Ciò è più facile da testare: dipende solo dagli archi, non dalle coppie di nodi considerate.
#figure(
  caption: [Consuntivo dei diversi algoritmi: si considera la complessità in spazio, con $d$ profondità e $b$ limite superiore per il _fattore di ramificazione_.],
  supplement: [Tabella],
  table(
    columns: 4,
    align: left,
    // Gestione dinamica dei bordi orizzontali senza usare hline()
    // y == 0 è l'intestazione, y == 8 è l'ultima riga dei dati
    stroke: (x, y) => (
      top: if y == 0 { 1pt } else { 0pt },
      bottom: if y == 0 or y == 8 { 1pt } else { 0pt },
      left: 0pt,
      right: 0pt,
    ),

    [*strategia*], [*selezione* \ *dalla frontiera*], [*garanzia* \ *soluzione*], [*complessità* \ *(spazio)*],

    [BFS], [primo nodo aggiunto], [con meno archi], [$O(b^d)$],
    [DFS], [ultimo nodo aggiunto], [no], [$O(b d)$],
    [ID], [n/a], [con meno archi], [$O(b d)$],
    [$G_"BFS"$], [$h(p)$ minimale], [no], [$O(b^d)$],
    [LcFS], [$c o s t(p)$ minimale], [costo minimo], [$O(b^d)$],
    [$A^*$], [$c o s t(p) + h(p)$ minimale], [costo minimo], [$O(b^d)$],
    [DF B&B], [n/a], [costo minimo], [$O(b d)$],
    [$"IDA"^*$], [n/a], [costo minimo], [$O(b d)$],
  )
)
#proposizione[
Data un'euristica consistente, MPP non impedisce ad $A^*$ di trovare una soluzione ottimale.
]
Quindi, nelle condizioni della proposizione sull'ammissibilità di $A^*$ che garantiscono solo il ritrovamento di una soluzione ottimale, se l'euristica è consistente, anche $A^*$ con MPP la potrà trovare. \
Nella pratica, $A^*$ include MPP per default.
==== Confronto fra MPP e CP
- MPP è più generale di CP: un ciclo può essere considerato come un altro percorso verso un dato nodo, destinato a essere potato;
- MPP può essere implementato in modo da poter richiedere un tempo costante;
- MPP è preferibile con metodi in ampiezza: virtualmente tutti i nodi considerati vanno memorizzati;
- CP è preferibile con le strategie in profondità, ad esempio DFS con Branch-and-Bound; con MPP+DFS c'è il rischio di crescita esponenziale per la lista chiusa.
=== Consuntiva sulle Strategie di Ricerca
Un consuntivo schematico sulle diverse strategie di ricerca e la relativa complessità in spazio è disponibile nella (linkare la tabella inserita prima). \
Un'*algoritmo* di ricerca *completo* garantisce il ritrovamento di una soluzione quando esiste. Le strategie che trovano percorsi con numero archi o costo minimale sono complete: nel caso pessimo serve un tempo esponenziale nel numero di archi dei percorsi esplorati. L'esistenza di algoritmi completi con minore complessità dipende dalla risposta alla domanda
$
P eq.not N P ?
$
== Strategia di Ricerca più sofisticate
Sono possibili alcune estensioni delle strategie di ricerca presentate:
- dato che decidere la direzione della ricerca impatta sull'efficienza, si può pensare a una ricerca retrograda per soluzioni ottimali da qualunque nodo;
- per determinare una buona euristica si può usare la _programmazione dinamica_: metodi basati sulla _decomposizione_ del problema in un numero di problemi equivalenti ma di minore complessità.
=== Direzione della ricerca
Nella *ricerca in avanti*, _forward search_, si comincia da un nodo di partenza e si prosegue fino a raggiungere i nodi-obiettivo. Nella *ricerca retrograda*, _backward search_, si parte da un nodo-obiettivo e si usa il _grafo inverso_ alla ricerca del non di partenza; i vicini del nodo-obiettivo considerati per inizializzarela fronteira sono tutti gli altri nodi-obiettivo: $brace.l n : g o a l(n) brace.r$.\
La direzione di ricerca è indifferente quando:
+ il numero di nodi-obiettivi è finito;
+ per ogni nodo _n_ si possono generare i _vicini_ del *grafo inverso* $brace.l n' : chevron.l n', n chevron.r in A brace.r$.
Le dimensioni dello spazio di ricerca sono date da $b^d$, dove $b$ è il fattore di ramificazione e $d$ la lunghezza del cammino. Riducendo questi parametri si abbassa la complessità aumentando l'_efficienza_. È possibile che vi sia una differenza tra i fattori da ramificazione uscente ed entrante; in tal caso un principio generale per la scelta della direzione della ricerca è quello di considerare la direzione per cui $b$ risulta inferiore.
=== Ricerca bidirezionale
Nella *ricerca bidirezionale* si riduce il tempo di ricerca procedendo in entrambe le direzioni: quando le due frontiere si intersecano, si deve ricostruire un in singolo cammino dal nodo di partenza al nodo-obiettivo. \
Come si è sicuro che le due frontiere s'incantrano ? Nel caso della DFS è difficile date le ridotte dimensioni delle frontiere mentre nel caso della BFS è garantito. \
Combinando DFS e BFS in direzioni opposte, si garantirebbe l'intersezione, ma la scelta per la direzione del cammino dipende. Per la BFS il fattore di tale scelta è il costo del mantenimento della frontiera (tempo proporzionale a $b^k$) mentre per la DFS è il costo della ricerca nella frontiera per avere un'intersezione; se si tratta di una ricerca simmetrica bidirezionale si è nell'ordine di $2 b^(k/2)$, con risparmi in tempo, ma la complessità rimane esponenziale.
=== Ricerca in una gerarchia di astrazioni
L'idea è quella di astrarre la definizione del problema, rimuovendo dettagli: una soluzuone parziale del problema potrà essere ottenuta da una soluzione per la versione astratta. Con l'astrazione si punta a risolvere un problema in generale, lascaindo da risolvere problemi più semplici e specifici. \
Diverse sono le modalità di astrazione di problemi. Tutte le strategie di ricerca presentate sono utilizzabili ma le specifiche decomposizioni utili non risultano facili da individuare.
#esempio(title: "Ricerca a isole")[
	Si consideri una ricerca fra i diversi piani di un edificio. Trovata la soluzione a livello di isola si passa a risolvere ricorsivamente i sotto-problemi in modo analogo:
	- informazioni sulle soluzioni trovate a livelli più bassi possono servire a quelle per livelli più alti;
	- ai livelli più alti si può usare tale informazione per riformulare un piano di ricerca;
	- il processo tipicamente non garantisce soluzioni ottimali perchè considera solo alcune delle decomposizioni possibili.
] <ex_isola_ricerca>
=== Uso della programmazione dinamica
La *programmazione dinamica, PD,* fornisce un metodo generale di ottimizzazione basato sulla memorizzazione di soluzioni parziali: una soluzione per un problema più semplice già prodotta dev'essere solo ritrovata e non ricalcolata. \
Si può ricorrere alla PD per la costruzione offline di un'*euristica perfetta*, _coast_to_goal()_, che fornisca il costo esatto di un cammino completo di costo minimo su frafi finiti:
$
"cost_to_goal"(n) = cases(
	0 & "se goal"(n),
	min_(chevron.l n, m chevron.r in A)[c o s t(chevron.l n, m chevron.r) + "cost_to_goal"(m)] & "altrimenti"
)
$
calcolato uasndo LcFS + MPP sul grafo inverso a partire dai nodi-obiettivo: si cerca il cammino di costo minimo da ogni nodo verso i nodi-obiettivo e si converva il valore di _coast_to_goal_ per ogni nodo. \
Una *policy* è una politica da seguire nella specifica dell'arco da considerare per ogni nodo; essa è *ottimale* se i suoi costi non sono mai superiori ai costi calcolati usando altre policy.
- _coast_to_goal_ viene calcolata offiline e usata nella costruzione di una policy: da $n$ si dovrebbe andare al vicino $m$ che minimizza $c o s t(chevron.l n, m chevron.r) + "cost_to_goal"(m)$. Questa policy porta sempre a un obiettivo con un cammino di costo minimo partendo da qualsiasi nodo;
- sono presenti della alternative:
	+ memorizzare il vicino per tutti i nodi offline, sfruttando le associazioni tra nodi nelle decisioni online sulle azioni, oppure
	+ fornire _cost_to_goal_ pre-calcolata e calcolare i vicini online.

Riguardo la complessità si può dire in breve che:
+ PD è lineare in tempo e spazio rispetto alle dimensioni del granfo nella costruzione di _cost_to_goal_, tipicamente esponenziali nella lunghezza del percorso;
+ Data _cost_to_goal_, determinare l'arco migliore richiede tempo costante rispetto alla grandezza del grafo, essendoci un numero limitato di vicini per nodo.
La PD può servire a costruire euristiche per $A^*$ e Branch-and-Bound: semplificando il problema fino a ottenere spazi di ricerca ridotti e trovando in tali spazi soluzioni di lunghezza ottimale; ciò definisce un DB di pattern usato nell'euristica per il problema originale. \
La PD è utile quando i nodi-obiettivo possono essere elencati esplicitamente, la soluzione cercata è un cammino di costo minimo, il grafo ridotto è finito, con memoria sufficiente per contenere la tabella, l'obiettivo non cambia. La policy può essere riusata per i diversi nodi-obiettivo: si ammortizza il costo per produrre la tabella su diverse istanze dello stesso problema; tuttavia essa va calcolata per ogni diverso nodo-obiettivo.
= Ragionamento con vincoli
== Variabili e vincoli
Vedremo come passare da problemi definiti su spazi di stati a problemi su spazi definiti da caratteristiche. Le _caratteristiche_, o _feature_, vengono descritte attraverso l'uso di *variabili*, spesso non indipendenti fra loro, e di *vincoli rigidi* che specificano combinazioni lecite di assegnazioni alle variabili, e/o *vincoli flessibili*, ossia funzioni che codificano le preferenze fra le diverse assegnazioni. \
Il _ragionamento_ si svolge generando assegnazioni che soddisfino i vincoli rigidi e ottimizzino i vincoli flessibili.
=== Variabili e Assegnazioni
Si considereranno problemi descritti in termini di variabili _algebriche_ ossia simboli usati per denotare caratteristiche del mondo (reale o immaginario). \
La notazione adotta nomi che iniziano per maiuscola: ogni variabile ha un  *dominio* associato, denotato con $d o m(X)$. Si considereranno _variabili discrete_ con dominio finito o almeno enumerabile. Un altro tipo è quello delle _variabili continue_, ad esempio variabili con dominio $RR$. \
Un'*assegnazione* è una funzione da un insieme di variabili ai loro domini: dato ${X_1, X_2, dots, X_k}$ a $X_i$ si assegna $v_i in d o m(X_i)$ per ogni $i = 1, dots, k$:

$
X_1 = v_1, X_2 = v_2, dots, X_k = v_k
$
Essendo una funzione a ogni variabile viene assegnato un solo valore. Un'*assegnazione totale* riguarda tutte le variabili, altrimenti si dice *parziale*. Un'assegnazione totale rappresenta uno stato del mondo, detto _mondo possibile_. \
Date $n$ variabili con domini di cardinalità $d$, si hanno $d^n$ assegnazioni totali. L'uso delle variabili offre un _vantaggio_: con poche variabili si possono descrivere molti stati:
- con 10 variabili binarie: $2^(10) approx 10^3$ stati;
- con 20 variabili binarie: $2^(20) approx 10^6$ stati;
- con 30 variabili binarie: $2^(30) approx 10^9$ stati;
- con 100 variabili binarie: $2^(100) approx 10^(30)$ stati.
Ragionare con 30 variabili è più facile che con un miliardo di stati ma anche con 100 variabili non ci sarebbero grossi problemi, mentre è impraticabile ragionare esplicitamente con $2^(100)$ stati. \
Tuttavia molti problemi reali possono essere definiti solo in termini di migliaia o anche milioni di variabili, come le previsioni del meteo.
=== Vincoli
Dato un problema, le assegnazioni possono essere _ammissibili_ o _non ammissibili_. Un *vincolo rigido* (_hard constraint_) specifica le assegnazioni lecite per una o più variabili e comprende:
- un *ambito*, detto _scope_, ossia l'insieme $S$ di variabili coinvolte con una sua arietà $bar S bar$
- la *condizione*, una funzione booleana sulle assegnazioni alle variabili del vincolo che dovrà risultare vera solo per assegnazioni lecite.
Seguono alcuni esempi di vincoli di diverse arietà:
- $B <= 3$ _unario_;
- $A <= B$ _binario_;
- $A + B = C$ _ternario_.
La _definizione_ di un vincolo può essere: *intensionale*, ossia in termini di formule logiche; *estensionale*, come elencazione delle assegnazioni lecite, come con le relazioni ovvero le tabelle di tuple nei DB relazionali. \
Dati il vincolo $c$ con ambito $S$ e l'assegnazione $A$ su variabili contenute in $S$, anche non tutte, si dirà che $A$ soddisfa $c$ se la condizione è vera per $A$ ristretta all'ambito di $c$ ovvero che $A$ *viola* $c$ in caso contrario.
#esempio(title: "Gita")[
In una gita di quattro giorni, tre _attività_ da svolgere possono essere rappresentate da variabili $A, B, C$ tutte con identico dominio $brace.l 1, 2, 3, 4 brace.r$.\
Si consideri il seguente vincolo in forma intensionale su $brace.l A, B, C brace.r$:
$
(A <= B) and (B < 3) and (B < C) and not (A = B and C <= 3)
$
esso richede che $A$ non possa seguire $B$, $B$ sia svolta prima del $3^degree$ giorno e comunque prima di $C$ e, infine, che se $A$ è concomitante con $B$, $C$ si svolga dopo il $3^degree$ giorno. \
Lo steso vincolo, definito estensionalmente elenca le assegnazioni lecite:
#figure(
table(
  columns: 3,
  align: center,
  stroke: none,
  table.vline(x: 1, stroke: rgb("800000")),
  table.vline(x: 2, stroke: rgb("800000")),
  table.hline(y: 1, stroke: rgb("800000")),

  [$A$], [$B$], [$C$],
  [2], [2], [4],
  [1], [1], [4],
  [1], [2], [3],
  [1], [2], [4]
)
)
Ad esempio è soddisfatto da $brace.l A = 1, B = 2, C = 3, D = 3, E = 1$ in quanto in tabella si trova $brace.l A = 1, B = 2, C = 3 brace.r$, ristretta al suo ambito.
]
=== Problema di soddisfacimento di vincoli
Un *problema di soddisfacimento di vincoli (CSP)* è definito da un insieme di variabili ognuna con un proprio _dominio_ e un insieme di _vincoli_. Una sua *soluzione* è un'assegnazione totale che soddisfa tutti i vincoli. \
Un _CSP finito_ ha un numero finito di variabili di dominio finito. Oltre a metodi per CSP finiti, si prenderanno in considerazione anche algoritmi per casi con variabili dal dominio continuo. Molti esempi vengono dal mondo dei giochi, come il Sudoku o la Criptoaritmetica.
#esempio(title: "Robot consegne")[
Si può costruire un CSP definendo:
- le attività da svolgere: $a, v, c, d, e$ e i _momenti_ possibili: $1, 2, 3, 4$;
- le rispettive variabili $A, B, C, D, E$, tutte con lo stesso dominio, ossia con $d o m(A) = d o m(B) = d o m(C) = d o m(D) = d o m(E) = brace.l 1, 2, 3, 4 brace.r$;
- l'insieme dei _vincoli_: $
	brace.l B eq.not 3; C eq.not 2; A eq.not B; B eq.not C; C < D; A = D; E < A; E < B; E < C; E < D; B eq.not D brace.r
$
]
Legati ai CSP, si possono definire diversi problemi di complessità crescente:
- determinare se esista una soluzione o meno;
- trovare una soluzione;
- contare il numero di soluzioni;
- enumerare tutte le soluzioni;
- trovare la soluzione migliore, rispetto a una data misura di qualità;
- determinare se alcuni enunciati siano veri per tutte le soluzioni.
I CSP possono risultare difficili per il loro carattere multidimensionale; il compito base è quello di trovare una soluzione. Già nel caso di CSP con domini finiti tale problema è NP-completo; metodi sistematici hanno una complessità esponenziale ma, ove possibile, si sfrutta la struttura dello spazio di ricerca.
== Risoluzione di CSP tramite ricerca
Un algoritmo *Generate-And-Test* è un algoritmo _esaustivo_ per CSP finiti semplce ma inefficiente. Per trovare una soluzione si generano e controllano in modo sistematico, una alla volta, le possibili assegnazioni totali; si restituirà la prima che soddisfa tutti i vincoli. Per trovare tutte le soluzioni si deve continuare a iterare, conservando le soluzioni via via trovate. \
Si osservi che con $n$ domini di cardinalità $d$ si hanno $d^n$ possibili assegnazioni totale; con $e$ vincoli il numero totale di test è $O(e d^n)$: al crescere di $n$ diventa rapidamente intrattabile, servono quindi soluzioni alternative.
=== Algoritmi su Grafo di Ricerca
In alternativa, si possono sfruttare _algoritmi di ricerca su grafo_ per spazi di stati determinati dalle assegnazioni parziali. L'idea conduttrice è quella di testare i vincoli su assegnazioni parziali di ambito limitato crescente: se un'assegnazione parziale viola un vincolo, anche le assegnazioni totali che la estendono lo violeranno quindi è possibile potare lo spazio di ricerca. \
Si può usare la DFS per cercare tutte le soluzioni di un CSP con variabili $V_s$ e vincoli $C_s$, estendendo via via l'assegnazione parziale _contesto_parziale_, dove:
- $V_s$ insieme delle variabili senza assegnazione in _contesto_parziale_;
- $C_s$ insieme dei vincoli che coinvolgono almeno una variabile in $V_s$;
- chiamata iniziale: ``` DFS_solver```$(V_s, C_s, emptyset)$.
Rispetto a Generate-And-Test, i test anticipati consentono di potare sotto-alberi, risparmiando lavoro.
#algoritmo(title: [Risolutore di CSP tramite DFS])[
  #pseudocode-list[
    + *procedure* $"DFS_solver"(V_s, C_s, "contesto_parziale")$
    + $c e <- {c in C_s | c " valutabile in " "contesto_parziale"}$
    + *if* $"contesto_parziale"$ viola un vincolo in $c e$ *then*
      + *return* $emptyset$
    + *else if* $V_s = emptyset$ *then*
      + *return* $"contesto_parziale"$
    + *else*
      + selezionare una variabile $"var" in V_s$
      + $"sols" <- emptyset$
      + *for* $"val" in "dom"("var")$ *do*
        + $"sols" <- "sols" union$
        + #h(2em) $"DFS_solver"(V_s backslash {"var"}, C_s backslash c e, {"var" = "val"} union "contesto_parziale")$
      + *return* $"sols"$
  ]
] <alg:risolutore-csp-dfs>
L'albero di ricerca risultante ha dimensioni che dipendono dall'ordine di scelta delle variabili. Un ordine _statica_, ad esempio sempre prima $A$, poi $B$, poi $C$, risulterà meno efficiente di uno _dinamico_. Ma l'ordine ottimale potrebbe essere più difficile da trovare.
== Algoritmi basati su Consistenza
Si introduce una nozione di *consistenza* intesa come compatibilità, o coerenza logica, fra assegnazioni e vincoli. Una *rete di vincoli* (_constraint network_) indotta da un CSP è costituita da un _grafo bipartito_:
- un nodo _(circolare)_ per ogni variabile, con un dizionario $d o m$ che, per ogni variabile $X$, contenga l'insieme $d o m[X]$ di valori possibili, inizialmente impostato con l'intero suo dominio;
- un nodo _(rettangolare)_ per ogni vincolo $c$;
- un arco $chevron.l X, c chevron.r$ per ogni variabile $X$ nell'ambito del vincolo $c$.
Un arco $chevron.l X, c chevron.r$ si dice *consistente* _rispetto ai domini (domain consistent)_ se e solo se $forall x in d o m[X]: brace.l X = x brace.r$ soddisfa $c$. \
Dato il vincolo $c$ su $brace.l X, Y_1, dots, Y_k brace.r$, l'arco $chevron.l X, c chevron.r$ è *consistente* se e solo se $forall x in d o m[X], exists y_1, dots, y_k: y_i in d o m[Y_i]$ tale che $brace.l X = x, Y_1 = y_1, dots, Y_k = y_k$ soddisfi $c$. \
Una *rete consistente* contiene solo archi consistenti. Se $chevron.l X, c chevron.r$ non è consistente allora per qualche valore di $d o m[X]$ non ci sono valori di $Y_1, dots, Y_k$ tali che l'assegnazione risultante soddisfi $c$, quindi _eliminando_ tali valori da $d o m[X]$ si può ripristinare la consistenza di $chevron.l X, c chevron.r$. È bene notare, però, che l'eliminazione di valori da un dominio può rendere altri archi non consistenti. \
L'idea di base è quella di rendere la rete consistente restringendo i domini. A tale scopo, si considera l'insieme _inconsistenti_ degli archi potenzialmente non consistenti:
- si inizializza _inconsistenti_ con tutti gli archi del grafo;
- si ripete fino a svuotare _inconsistenti_: estratto un arco $chevron.l X, c chevron.r$ da _inconsistenti_ se $chevron.l X, c chevron.r$ non è consistente, si deve restringere $d o m[X]$. Si devono, poi, aggiungere a _inconsistenti_ gli archi resi non consistenti dal passo precedente: $chevron.l Z, c' chevron.r, c' = c$, con ambito che comprende $X$ e una diversa $Z$.
#algoritmo(title: [Generalized Arc Consistency (GAC)])[
  #pseudocode-list[
    + *procedure* $"GAC"(V_s, "dom", C_s, "inconsistenti")$
    + *while* $"inconsistenti" != emptyset$ *do*
      + selezionare e rimuovere $chevron.l X, c chevron.r$ da $"inconsistenti"$
      + ${Y_1, dots, Y_k} <- "ambito"(c) backslash {X}$
      + $N D <- {x | x in "dom"[X] and exists y_1 in "dom"[Y_1], dots, y_k in "dom"[Y_k]:$
      + #h(2em) $c(X = x, Y_1 = y_1, dots, Y_k = y_k)}$
      + *if* $N D != "dom"[X]$ *then*
        + $"inconsistenti" <- "inconsistenti" union {chevron.l Z, c' chevron.r | {X, Z} subset.eq "ambito"(c'), c' != c, Z != X}$
        + $"dom"[X] <- N D$
    + *return* $"dom"$
  ]
] <alg:gac>
``` GAC``` termina con una rete consistente con variabili dai domini _ridotti_. Tre casi sono possibili:
+ un dominio è vuoto quindi non ci sono soluzioni: se uno è vuoto, lo saranno anche altri domini ridotti ad esso connessi, già prima della terminazione;
+ i domini sono tutti ridotti a un solo valore, quindi la _soluzione è unica_;
+ altrimenti, si è ottenuto CSP semplificato cui applicare altri metodi.
Dei metodi alternativi sono algoritmi basati sulla *consistenza dei percorsi*.
== Separazione dei domini
L'idea base degli algoritmi di *separazione dei domini* è quella di decomporre il CSP in una serie di _casi disgiunti_ da risolvere separatamente; le soluzioni sono ricostruire riunendo quelle trovate per i diversi casi. Ad esempio:
- $X$ binaria, dominio $brace.l t, f brace.r$, due problemi ridotti: trovare le soluzioni con $X = t$ e quelle con $X = f$; se ne basta una, secondo caso considerato solo se il primo non ha soluzione;
- $A$ con dominio $brace.l 1, 2, 3, 4 brace.r$, ci sono diverse maniere per separare i valori:
	- un caso per ciascun valore; ciò fa fare più strada con una sola suddivisione alla volta;
	- due sottoinsiemi disgiunti: $A in brace.l 1, 2 brace.r$ e $A in brace.l 3, 4 brace.r$; questo taglia di più in meno passi.
Nel seguente schema di algoritmo si integra l'approccio basato sulla consistenza in un algoritmo ricorsivo:
+ si semplifica il CSP in input tramite ``` GAC()```
+ se non è risolto direttamente:
	+ si seleziona una variabile, con dominio almeno binario;
	+ si partiziona il dominio ottenendo (2+) problemi semplificati;
	+ si risolvono ricorsivamente tali problemi.
#algoritmo(title: [Risolutore ricorsivo basato su consistenza])[
  #pseudocode-list[
    + *procedure* $"Con_Solve"(V_s, "dom", C_s, "inconsistenti")$
    + $"dom"_0 <- "GAC"(V_s, "dom", C_s, "inconsistenti")$
    + *if* $exists X: "dom"_0[X] = emptyset$ *then*
      + *return false*
    + *else if* $forall X: |"dom"_0[X]| = 1$ *then*
      + *return* soluzione con $X = x in "dom"_0[X] quad forall X$
    + *else*
      + selezionare $X$ tale che $|"dom"_0[X]| > 1$
      + partizionare $"dom"_0[X]$ in $D_1$ e $D_2$
      + $"dom"_1 <-$ copia di $"dom"_0$ con $"dom"_1[X] = D_1$
      + $"dom"_2 <-$ copia di $"dom"_0$ con $"dom"_2[X] = D_2$
      + $"inconsistenti" <- { chevron.l Z, c' chevron.r | {X, Z} subset.eq "ambito"(c'), Z != X }$
      + *return* $"Con_Solve"(V_s, "dom"_1, C_s, "inconsistenti")$ *or*
      + #h(2em) $"Con_Solve"(V_s, "dom"_2, C_s, "inconsistenti")$
  ]
] <alg:risolutore-ricorsivo-consistenza>
L'algoritmo fornisce tutte le soluzioni:
- se un dominio è vuoto non ci sono soluzioni;
- se il dominio ha un solo valore si ha una sola soluzione;
- ritornando dalla ricorsione restituisce l'unione delle soluzioni dei 2 casi;
- c'è modo di usare anche algoritmi di ricerca su grafo, ma qui contano le soluzioni e non i cammini.
Un possibile miglioramento è il seguente: se un'assegnazione rende il grafo _non connesso_, ogni componente può essere risolta separatamente. Si ricava facilmente una soluzione ricombinando le soluzioni delle componenti. Il conteggio del numero di soluzioni è fattibile in modo efficiente.
== Eliminazione di Variabili
L'*eliminazione di variabili*, _variabile elimination (VE)_, è una tecnica che semplifica la rete dei vincoli rimuovendo variabili. L'idea di base è quella di eliminare progressivamente le variabili, una alla volta, ottenendo CSP semplificati da risolvere e infine, a partire dalle loro soluzioni, ricostruire quelle dei CSP più complessi: quando si elimina la variabile $X$ si deve costruire un nuobo vincolo sulle rimanenti che rifletta gli effetti dei vincoli su $X$; esso sostituisce tutti i vincoli su $X$ producendo una rete semplificata; alla fine, ogni soluzione di un CSP ridotto va estesa per ottenere una soluzione del CSP che ricomprenda anche $X$. \
Per eliminare una variabile $X$:
+ considerate le relazioni relative a tutti i vincoli su $X$, sia $r_X (X, overline(Y))$ quella ottenuta dal join di tali relazioni, vincolo che codifica l'_influenza_ di $X$ su $overline(Y)$, insieme delle altre variabili nell'ambito di $r_X$, vicine di $X$ nel grafo dei vincoli;
+ la _proiezione_ di $r_X$ su $overline(Y)$ sostituisce tutte le relazioni in cui occorre $X$;
+ si ottiene un CSP ridotto, senza la $X$, da risolvere ricorsivamente. Al ritorno delle chiamate ricorsive si estendono le tabelle-soluzioni per il CSP ridotto tramite join con $r_X$, per aggiungere la colonna delle assegnazioni a $X$. Nel caso-base resta una sola variabile, per cui la soluzione da restituire è la tabella con i valori del dominio consistenti con i vincoli.
#esempio[
Si consideri un CSP con le variabili $A, B, C$ di dominio $brace.l 1, 2, 3, 4 brace.r$ e sia $B$ la variabile da eliminare, inclusa nei vincoli: $A < B$ e $B < C$. Per eliminarla, si fa il join tra le relazioni dei vincoli su $B$:
#let rel(cols, ..cells) = table(
  columns: cols,
  stroke: (x, y) => if y == 0 { (bottom: 0.75pt + rgb("#8b0000")) } else { none },
  align: center,
  row-gutter: 0.3em,
  ..cells
)

#align(center)[
  #grid(
    columns: 5,
    column-gutter: 1.2em,
    align: horizon,

    // Prima tabella
    rel(2,
      $A$, $B$,
      $1$, $2$,
      $1$, $3$,
      $1$, $4$,
      $2$, $3$,
      $2$, $4$,
      $3$, $4$
    ),

    // Operatore di Natural Join
    $join$,

    // Seconda tabella
    rel(2,
      $B$, $C$,
      $1$, $2$,
      $1$, $3$,
      $1$, $4$,
      $2$, $3$,
      $2$, $4$,
      $3$, $4$
    ),

    // Operatore di uguaglianza
    $=$,

    // Tabella risultato
    rel(3,
      $A$, $B$, $C$,
      $1$, $2$, $3$,
      $1$, $2$, $4$,
      $1$, $3$, $4$,
      $2$, $3$, $4$
    )
  )
]
La proiezione della tabella-join su $A$ e $C$ induce una nuova relazione senza la $B$:
#let rel(cols, ..cells) = table(
  columns: cols,
  stroke: (x, y) => if y == 0 { (bottom: 0.75pt + rgb("#8b0000")) } else { none },
  align: center,
  row-gutter: 0.3em,
  ..cells
)

#align(center)[
  #rel(2,
    $A$, $C$,
    $1$, $3$,
    $1$, $4$,
    $2$, $4$
  )
]
Tale vincolo sostituisce gli originari e contiene tutte le informazioni utili al resto della rete; con VE poi si risolve il resto della rete semplificata. \
Per avere una o tutte le soluzioni a partire dalla soluzione del CSP ridotto: si memorizza la relazione del join su $A, B, C$ per estendere la soluzione della rete ridotta includendo $B$.
]
#algoritmo(title: [Eliminazione di Variabili])[
  #pseudocode-list[
    + *procedure* $"VE_CSP"(V_s, C_s)$
    + *Input*
      + $V_s$: insieme di variabili
      + $C_s$: insieme di vincoli su $V_s$
    + *Output*
      + relazione contenente tutte le assegnazioni consistenti
    + *if* $|V_s| = 1$ *then*
      + *return* join di tutte le relazioni in $C_s$
    + *else*
      + selezionare $X in V_s$ da eliminare
      + $C X <- {c in C_s | X in "ambito"(c)}$
      + $R <-$ join di tutti i vincoli in $C X$
      + $N R <-$ proiezione di $R$ sulle variabili $V_s backslash {X}$
      + $S <- "VE_CSP"(V_s backslash {X}, (C_s backslash C X) union {N R})$
      + *return* $R join S$
  ]
] <alg:eliminazione-variabili>
Seguono alcune osservazioni:
- _caos base_: rimane una sola variabile, quindi una soluzione esiste se ci sono righe nelle relazioni finali e saranno tutte relative a una sola variabile basterà intersecarle;
- caso _ricorsivo_: l'ordine di selezione delle variabili ha un impatto sull'efficienza; al ritorno se bastasse una soluzione, si restituisce solo una tupla di $R join S$. È garantito che sia parte d'una soluzione; se un valore di $R$ non avesse tuple, non ci sarebbero soluzioni con tale valore.
VE può essere combinato con algoritmi basati su consistenza da usare per semplificare il problema quando si elimina una variabile. Le tabelle intermedie risulteranno più piccole.
== Ricerca Locale
Nel caso di spazi molto grandi, o infiniti, non è pensabile una ricerca sistematica sull'intero spazio. Si può puntare su metodi _mediamente efficienti_ per trovare soluzioni, ma _senza garanzie_ di ritrovamento anche quando esistono. Perciò tali metodi sono utili quando si sa che, verosimilmente, ce ne sono. \
La classe dei metodi di *ricerca locale*, comunemente investigati nell'ambito della _ricerca operativa_ e dell'_AI_, comprende molte tecniche, con uno stesso schema-base:
#algoritmo(title: [Schema della Ricerca Locale])[
  #pseudocode-list[
    + *procedure* $"Local_search"(V_s, "dom", C_s)$
    + *Input*
      + $V_s$: insieme di variabili
      + $"dom"$: funzione che restituisce il dominio di una variabile
      + $C_s$: insieme di vincoli da soddisfare
    + *Output*
      + assegnazione totale che soddisfa i vincoli
    + *Local*
      + $A$: dizionario di valori indicizzato dalle variabili in $V_s$
    + *repeat* #text(fill: luma(130))[{try}]
      + *for each* $X in V_s$ *do*
        + $A[X] <-$ valore (casuale) da $"dom"(X)$
      + #text(fill: luma(130))[{walk}]
      + *while not* $"ferma_walk"()$ *and* $A$ non soddisfa $C_s$ *do*
        + selezionare $Y in V_s$ e un valore $w in "dom"(Y)$
        + $A[Y] <- w$
      + *if* $A$ soddisfa $C_s$ *then*
        + *return* $A$
    + *until* terminazione
  ]
] <alg:ricerca-locale>
- si inizia con un'assegnazione totale di un valore a ciascuna variabile;
- si tenta di migliorare l'assegnazione iterativametne effettuando passi di _miglioramento_, passi _casuali_ e _ripartenze_ da assegnazioni iniziali differenti.
Ogni iterazione della ``` repeat``` rappresenta un *tentativo* (_try_): con il primo ciclo ``` for each``` si ha l'*inizializzazione casuale* di $A$; per ogni assegnazione casuale successiva si ha una *ripartenza casuale* in alternativa anche congetture più informate basate su euristiche o conoscenza pregressa, poi migliorate iterando. Nel ciclo ``` while``` si effettua una *ricerca locale* (_walk_) nello spazio delle assegnazioni:
- si seleziona una assegnazione tra i possibili *successori* di $A$ che differiscono per il valore assegnato a una sola variabile;
- si ha lo stop se si è trovata una soluzione o si avvera il criterio di ``` ferma_walk()```, ad esempio è stato raggiunto un numero massimo di iterate.
La fermata non è garantita: l'algoritmo può divergere se il CSP non ha soluzione. In alcuni casi, anche se ne esistessero, potrebbe rimanere intrappolato in una regione; una garanzia di _completezza_ dipende dai criteri di selezione e di stop. \
*Random Sampling* e la versione della ricerca locale in cui:
- ``` ferma_walk()``` risulta sempre vera quindi il ciclo ``` while``` non viene mai eseguito: si continua indefinitamente a provare assegnazioni casuali che possano soddisfare tutti i vincoli;
- l'algoritmo è completo ossia garantisce di trovare la soluzione se questa esiste, tuttavia il tempo richiesto non può essere limitato e tipicamente risulta molto lento;
- la sua efficienza dipende dalle dimensioni dei domini e dal numero di soluzioni esistenti.
*Random Walk* è la versione della ricerca locale in cui:
- ``` ferma_walk()``` risulta sempre falsa per cui non si hanno ripartenze casuali: si esce dal ciclo ``` while``` solo se si trova una soluzione e, nel ciclo, si ripete la selezione casuale di una variabile e un valore da assegnarle;
- l'algoritmo è completo con passi più veloci rispetto al resampling di tutte le variabili, ma può richiedere più passi, in base alla distribuzione delle soluzioni;
- in alternativa, quando le dimensioni dei domini delle variabili differiscono, si può selezionare a caso una variabile e poi un valore del suo dominio oppure selezionare casualmente una coppia variabile-valore, il che favorisce la selezione di variabili con dominio più grande.
=== Miglioramento Iterativo
L'approccio del *miglioramento iterativo* è un tipo di ricerca locale che prevede la selezione del _miglior successore_ vicino all'assegnazione corrente in termini di una *funzione obiettivo*. Quando la funzione è da minimizzare  (una funzione di _costo_ o di _perdita_), il metodo prende il nome di _Greedy Descent_, _discesa sbrigativa_. Se, invece, è da massimizzare, il metodo prende il nome di _Greedy Ascent_, o anche *Hill Climbing*. Nel seguito si considereranno solo funzioni da _minimizzare_, per l'altro criterio sarà sufficiente cambiare il segno della funzione. Nei casi di parità di valore della funzione si opera una scelta casuale. \
Si distinguono:
- *ottimi locali*, ossia assegnazioni non migliorabili da alcun successore, come i _minimi_ o _massimi locali_ trovati, rispettivamente, con _greedy descent_ o _ascent_;
- *ottimi globali*, quelli con valutazione massima fra tutte le assegnazioni, che risultano comunque anche ottimi locali.
Una funzione di valutazione tipica per i CSP è il numero di *conflitti*, come i vincoli violati: un'assegnazione totale con 0 conflitti è una soluzione. Tale funzione può essere raffinata pesando i vincoli in maniera differenziata. Adottando il _numero di conflitti_, si dirà che un CSP è _soddisfacibile_ se si trova un minimo globale con valore nullo ovvero è non soddisfacibile se il minimo globale ha valore positivo: se si trova un minimo locale con valore positivo, non è detto che esso sia globale, e quindi che il CSP non sia soddisfacibile. \
Si considera il miglior successore anche quando questo non ha una migliore valutazione rispetto all'assegnazione corrente. È possibile che l'algoritmo trovi ottimi locali che risultano successori reciproci e che continui a passare da uno all'altro senza poter trovare una soluzione. Questo rende l'algoritmo _incompleto_.
=== Algoritmi stocastici
Per evitare minimi locali che non siano anche globali, negli *algoritmi stocastici* si ricorre a una maggiore casualità. Le mosse casuali previste saranno:
+ il *random restart*, in cui valori scelti a caso per tutte le variabili: costituisce una mossa casuale globale che consente di ripartire da regione anche completamente diverse dello spazio;
+ il *random step*, una mossa casuale locale da alternare a passi di ottimizzazione: utilizzata nel _Greedy descent / ascent_ permette pasasi in direzione opposta in modo da sfuggire a minimi / massimi locali.
Integrando _massimo miglioramento iterativo_ e mosse _casuali_ si definiscono algoritmi per la *ricerca locale stocastica*.
#esempio(title: "Spazi 2D")[
Si veda la seguente figura:
#figure(
image("images/spazi_ricerca.png", width: 70%),
caption: [Due spazi di ricerca con caratteristiche diverse]
)
Il _successore_ si ottiene tramite un piccolo passo dall'attuale posizione verso sinistra o destra.
- spazio di ricerca (a): _Greedy descent_ può trovare facilmente minimi locali, serve un _random restart_ che porti nella parte centrale nella quale si converge rapidamente verso uno globale; invece _random walk_ non funzionerebbe bene; richiederebbe molti piccoli passi casuali per uscire da un minimo locale;
- spazio di ricerca (b): _random restart_ rimane bloccato a cercare tra numerosi minimi locale mentre _random walk_ con _greedy descent_ potrebbe evitare tali minimi locali.
]
Con spazi con diverse caratteristiche in regioni differenti si può pensare di ricorrere a un *catalogo di algoritmi* da cui scegliere.
== Varianti della ricerca Locale
Molte altre varianti sono possibili nella _scelta del successore_ e nelle scelte _casuali_. Con domini _limitati_ tutti i valori possono essere scelti per i successori. COn domini più estesi si possono considerare solo alcuni valori, risparmiando tempo, in genere si considerano solo quelli più vicini ai precedenti, ma esistono metodi più sofisticati di selezione.
=== Tabu Search
La *tabu search* è una forma di ricerca locale con memoria che evita la modifica di assegnazioni introdotte di recente. Si memorizzano le variabili modificate negli ultimi $t$ passi (*tenure*) che andranno considerate non selezionabili. In tal modo si evitano i cicli dopo poche assegnazioni. Va ottimizzato il parametro $t$. Nella sua implementazione, se è piccolo si può considerare una lista delle variabili modificate di recente, invece se è grande si memorizza per ogni variabile il passo in cui si è avuto l'ultima sua modifica.
=== Passo di Massimo Miglioramento
In questo metodo di ricerca locale, si seleziona una coppia variabile-valore che porta al miglioramento di valutazione massimale. In caso di più coppie si opera una scelta casuale. \
Nella sua implementazione "ingenua" data l'assegnazione totale corrente, per ogni variabile $X$ e ogni valore $v in d o m(X)$ diverso da quello corrente, si confronta l'assegnazione corrente con quella in cui si assegna $X = v$. Si seleziona quindi una delle coppie di _massimo miglioramento_. Si noti che la modifica potrebbe portare a _differenze negative_ nella valutazione, ossia a peggioramenti. Inoltre, le variabili non coinvolte in vincoli possono essere trascurate. \
In un'implementazione alternativa si adotta una coda con priorità fatta di coppie variabile-valore pesate. Per ogni $X$ e ogni $v in d o m(X)$ non assegnato in $A$, in coda ci sarà una coppia $chevron.l X, v chevron.r$ con peso $w = h(A') - h(A)$. Si considera allora il miglioramento dell'assegnazione $A'$ ottenuta sostituendo $X = v$ rispetto ad $A$. Questo dipenderà dai valori assegnati a $X$ e dai suoi vicini nella rete dei vincoli, non da quelli assegnati alle altre variabili. A ogni iterata si seleziona una _coppia-successore_ di massimo miglioramento, ossia con _peso minimale_. Ogni nuova assegnazione comporta il ricalcolo dei pesi e il riordimento della coda, ma solo per coppie con variabili presenti in vincoli il cui soddisfacimento è mutato.
=== Scelta a due fasi
L'algoritmo di *scelta a due fasi* prevede la selezione della coppia articolata in:
+ selezione della variabile per la riassegnazione;
+ selezione del valore.
Si gestisce una coda con priorità di variabili con associato un peso pari al numero dei conflitti in cui ognuna sia coinvolta. Ad ogni passo:
+ si seleziona $X$ che partecipa a più conflitti;
+ le si cambia il valore assegnato, scegiendolo fra quelli che minimizzano il numero di conflitti oppure casualmente.
Vanno infine ricalcolati i pesi per le variabili coinvolte in vincoli il cui soddisfacimento è mutato.
=== Algoritmo Any-Conflict
L'idea-base dell'algoritmo *Any-Conflict* è quella di scegliere, per la modifica, una *variabile conflittuale* ossia una che partecipa a uno o più conflitti. A ogni iterata: si seleziona casualmente una variabile conflittuale, non necessariamente quella con più conflitti, quindi le si assegna, in alternativa, un valore che minimizzi il numero di conflitti oppure un valore casuale. \
Sono possibili alcune varianti, ad esempio cambiando il criterio di selezione casuale della variabile: si può scegliere prima un conflitto e poi una variabile coinvolta oppure si opera una semplice scelta casuale di una variabile conflittuale. La differenza fra i due criteri sta nella probabilità di selezione di una variabile: nel primo essa dipende dal numero di conflitti in cui la variabile è coinvolta, nel secondo si ha la stessa probabilità per tutte le variabili.
=== Simulated Annealing
Il *simulated annealing* prende in prestito una metafora dal dominio della _metallurgia_ (ovvero della _termodinamica_): ad alte temperature l'algoritmo deve comportarsi con maggiore casualità o plasticità mentre a basse temperature deve consentire minore casualità in conseguenza una maggiore durezza. Come funzione di valutazione si adotta un'euristica basata sul numero di conflitti. \
L'algoritmo riduce lentamente la temperatura cui è legata una misura di probabilità:
- ad _alte temperature_ si deve comportare come _random walk_ per poter evitare i minimi locali, alla ricerca di regioni con bassi valori dell'euristica, quindi i passi peggiorativi dovranno risultare più probabili;
- a _basse temperature_ si deve comportare come _greedy descent_, portando direttamente verso i minimi (locali).
A ogni passo, data l'assegnazione corrente $A$: si sceglie a caso una variabile e un valore ottenendo una nuova assegnazione $A'$; se $A'$ non peggiore l'euristica andrà a rimpiazzare l'assegnazione corrente, altrimenti può farlo ma con una probabilità che dipende dalla temperatura e dal valore dell'euristica. \
Si consideri la seguente figura:
#figure(
image("images/funzione_esp.png", width: 70%),
caption: [Una funzione esponenziale]
) <fig:funzione_esp>
Sia la *temperatura* $T in RR_+$. Si consideri l'andamento della @fig:funzione_esp.
- Sia $h(A)$ l'euristica da minimizzare, il numero di conflitti legati ad $A$;
- Se $h(A') <= h(A)$, si accetta direttamente la nuova $A'$ altrimenti, la si può accettare con probabilità (*distribuzione di Gibss / Boltzmann*):
$
exp[- (h(A') - h(A))/T]
$
	Si noti che quando $A'$ è peggiorativa, quindi l'esponente è negativo. Tendendo  $h(A') - h(A)$ a 0, sarà più probabile accettare $A'$. Infatti ad alte temperature l'argomento dell'esponenziale tende a 0 e la probabilità a 1, mentre a basse temperature, l'esponente tende a $-infinity$ e la probabilità a 0. \
Il cosidetto *problema di annealing* specifica cme ridurre la temperatura al progredire della ricerca: spesso si usa il _raffreddamento geometrico_ che, ad esempio parte da $T = 10$ e si moltiplica per $0.99$ ad ogni passo, arrivando a $0.07$ dopo 500 passi. - a temperature alte, come $T = 10$, si tende ad accettare passi che peggiorano di poco, con una leggera preferenza rispetto a passi che migliorano;
- a temperature ridotte, come $T = 1$, i passi peggiorativi sono accettati molto meno frequentamente;
- a temperature basse, come $T = 0.1$, i passi peggiorativi sono accetti molto raramente.
=== Ripartenza casuale
L'algoritmo di *ripartenza casuale*, _random restart_, permette di migliorare le prestazioni di un _algoritmo causale debole_, uno che abbia successo in pochi casi specifici. Nel seguito sarà indicata con $p$ la probabilità di successo d'una singola esecuzione. Per stimare le prestazioni di _random restart_, si considera una sequensza di $n$ sue esecuzioni indipendenti. \
La probabilità di successo in almeno una di tali esecuzioni sarà $1 - (1 - p)^n$ essendo $(1-p)^n$ la probabilità di fallimento in tutti gli $n$ tentativi. \
_Random restart_ risulta computazionalmente costoso quando sono coinvolte molte variabili. Nella sua variante _partial restart_ si fanno assegnazioni solo ad alcune variabili, per consentire di spostarsi verso un'altra regione. In tal caso le esecuzioni non sono più indipendenti fra loro quindi si richiede un'analisi teorica più complessa.
== Algoritmi basati su popolazioni
A differenza degli algoritmi esaminati in precedenza che considerano un'assegnazione alla volta, tali metodi gestiscono *popolazioni* di *individui*, ossia insiemi di assegnazioni. Nella _beam search_ si considerano le migliori $k$ assegnazioni, numero che può variare casualmente nella loro variante stocastica. Anche negli algoritmi evoluzionistici si considerano i migliori $k$ individui nella metafora riproduttiva.
== Beam Search
La *beam search* si comporta in maniera simile agli algoritmi di massimo miglioramento iterativo, con la differenza di lavorare simultaneamente su più assegnazioni (fino a $k$) anziché una sola. Essa ha successo quando viene trovata un'assegnazione che soddisfa tutti i vincoli. A ogni passo, si selezionano i migliori $k$ successori. La selezione è casuale in caso di parità di valutazione. Si continua con il nuovo insieme di $k$ assegnazioni. \
In caso di _memoria limitata_ si sceglie $k$ in base alla memoria disponibile. È possibile usre le diverse varianti di ricerca locale viste in precedenza. Occorrerà ovviamte più tempo nel cercare i migliori $k$ successori. Per una ricerca più rpida, si può ricorrere ad approssimazioni dei migliori $k$ individui.
=== Beam Search Stocastica
In questa variante si selezionano $k$ individui casualmente favorando quelli con valutazione migliore. La probabilità di selezione sarà definita in funzione dell'euristica: per un individuo $A$ la probabilità di selezione (_distribuzione di Gibbs/Boltzmann_) proporzionale a:
$
exp[(-h(A))/T]
$
dove $h(A)$ è la funzione obiettivo e $T$ una misura della temperatura. Questa variante consente più diversità nella popolazione: $h$ riflette la capacità di _adattamento_ come in biologia dove vale il principio di _sopravvivenza dei più adatabbili_ per cui un individuo più adattabile ha maggiori probabilità di passare il proprio materiale genetico alle future generazioni. \
Questa è interpretabile come una forma di _riproduzione asessuata_ in cui si produce una discendenza leggermente mutata. Si osservi che gli stessi individui potranno essere selezionati casulamente anche più volte.
=== Algoritmi Genetici
Anche questi metodi sono definiti per gestire _popolazioni_ di individui. Restando nella metafora evoluzionistica, il loro patrimonio genetico è rappresentato da un'assegnazione. Nuovi individui vengono creati dalla _combinazione_ di _coppie_ di _genitori_ della generazione precedente. I migliori sono poi selezionati per far parte della generazione successiva.
#algoritmo(title: [Schema di algoritmo genetico])[
  #pseudocode-list[
    + *procedure* $"Genetic_algorithm"(V_s, C_s, S, k)$
    + *Input*
      + $V_s$: insieme di variabili
      + $C_s$: insieme di vincoli da soddisfare
      + $S$: programma di raffreddamento della temperatura
      + $k$: dim. popolazione - intero pari
    + *Output*
      + assegnazione totale che soddisfa i vincoli
    + *Local*
      + $"Pop", "NPop"$: insieme di assegnazioni
      + $T$: numero reale
    + $"Pop" <-$ insieme di $k$ assegnazioni totali casuali
    + $T$ inizializzato in base a $S$
    + *repeat*
      + *if* $exists A in "Pop"$ che soddisfa tutti i vincoli in $C_s$ *then*
        + *return* $A$
      + $"NPop" <- emptyset$
      + *repeat* $k/2$ volte
        + $A_1 <- "Random_selection"("Pop", T)$
        + $A_2 <- "Random_selection"("Pop", T)$
        + $N_1, N_2 <- "Crossover"(A_1, A_2)$
        + $"NPop" <- "NPop" union {"mutate"(N_1), "mutate"(N_2)}$
      + $"Pop" <- "NPop"$
      + $T$ viene aggiornato in base a $S$
    + *until* terminazione
    + *procedure* $"Random_selection"("Pop", T)$
      + selezionare $A$ da $"Pop"$ con probabilità proporzionale a $e^(-h(A)/T)$
      + *return* $A$
    + *procedure* $"Crossover"(A_1, A_2)$
      + selezionare casualmente un intero $i$, $1 <= i < |V_s|$
      + $N_1 <- {(X_j = v_j) in A_1 | j <= i} union {(X_j = v_j) in A_2 | j > i}$
      + $N_2 <- {(X_j = v_j) in A_2 | j <= i} union {(X_j = v_j) in A_1 | j > i}$
      + *return* $N_1, N_2$
  ]
] <alg:algoritmo-genetico>
Sono possibili diverse tecniche di selezione:
- _Selezione proporzionale alla fitness_: a ogni iterata, si generano $k$ nuovi individui. Si opera una seleezione casuale delle coppie, che favorisca gli individui più adatti con probabilità dipendente dall'incremento della misura di fitness apportato e da una misura della temperatura. Per ogni coppia, si opera un _crossover_ e si fanno _mutare_ casualmente alcuni valori, per alcune variabili scelte a caso. Si passa infine a considerare la successiva generazione.
- _Selezione a torneo_: a ogni iterata si selezionano casualmente $t$ individui (misura di _greediness_) e poi si scelgono i più adattabili fra questi.
Un'operazione di combinazione tipicamente utilizzata è il *crossover* che prevede la selezione di una coppia di individui e la conseguente generazione della loro prole ossia di individui ottenuti copiando parte delle assegnazioni da un genitore e il resto dell'altro. Si tratta di un'operazione aggiuntiva rispetto alla mutazione. Vi sono diverse forme di crossover:
- *crossover uniforme*: si considerano due individui genitore e si generano due figli; per ogni variabile, si copia nel primo figlio il valore da uno dei genitori scelto in maniera casuale, quello dell'altro genitore sarà copiato nel secondo figlio;
- *one-point crossover*: assumendo un _ordinamento_ sulle variabili, si seleziona casualmente un indice $i$ per generare ciascun figlio selezionando i valori per le variabili fino a $i$ da un genitore e per le successive dall'altro. L'efficacia dipenderà dall'ordinamento scelto in fase di progettazione.
== Ottimizzazione
A volte si hanno informazioni sulla preferibilità delle assegnazioni. Un *problema di ottimizzazione* richiede di trovare le migliori assegnazioni totali. Esso può essere formalizzato come segue, dati:
- un insieme di variabili con dominio associato;
- una *funzione-obiettivo* dalle assegnazioni totali a $RR$, tipicamente una funzione di costo/errore/loss;
- un *criterio di ottimalità*, tipicamente _minimizzare_ la funzione-obiettivo.
Bisogna trovare un'assegnazione totale *ottimale* per il criterio adottato. \
Un *problema di ottimizzazione vincolato* prevede anche _vincoli rigidi_ che specificano le assegnazioni ammissibili. L'obiettivo è quello di trovare un'assegnazione ottimale ammissibile. \
Sul tema dell'ottimizzazione esiste una vasta letturatura scientifica, con molte tecniche proposte: ad esmepio nella programamzione lineare sono coinvolte variabili continue, funzioni-obiettivo lineari e diseguaglianze lineari come vincoli. Quando un problema da risolvere, prevedendo anche qualche trasformazione, rientra in categorie classiche, allora converrà preferire algoritmi specifici. \
Rispetto ai CSP, l'ottimizzazione presenta un'ulteriore difficoltà: riconoscere le soluzioni solo per confronto fra assegnazioni. Si possono trattare i vincoli rigidi come quelli flessibili ma assegnando un costo infinito in caso di violazione: se il costo è finito non vi sarà stata nessuna violazione. In alternativa si può associare alla violazione di vincolo rigido un costo elevato maggiore della somma di tutti i costi di vincoli flessibili. L'algoritmo di ottimizzazione dovrà trovare una soluzione con il minor numero di vincoli rigidi violati e, tra questi,, quelli di costo minimo.
=== Metodi Sistematici per il Caso Discreto
Si parla di *ottimizzazione discreta* in caso di problema che coinvolge solo variabili _discrete_. Possono essere adattati i metodi di ricerca di percorsi ottimali su grafo visti in precedenza. In questo caso il grafo avrà nodi contenenti assegnazioni a un insieme di variabili. I vicini di un nodo $n$ si trovano scegliendo una variabile $v a r$ non presente in $n$ e le relative assegnazioni di valori, consistenti con gli eventuali vincoli rigidi. Il costo di un arco è dato dalla somma dei costi dei vincoli valutati dopo l'assegnazione a _var_. \
Il nodo di partenza conterrà l'assegnazione vuota metnre un nodo-goal conterrà un'assegnazione totale. I costi sono assengati solo quando un vincolo flessibile può essere valutato. Per usare gli algoritmi $A^*$, _Branch-and-Bound_ i costi-arco devono essere non-negativi.
=== Ricerca locale per l'ottimizzazione
L'uso della ricerca locale nel caso di problemi di ottimizzazione mira a minimizzare la funzione-obiettivo. Gli algoritmi di ricerca lcoale aggiornano via via e infine restituiscono la _migliore assegnazione trovata_. La terminazione può essere garantita fissando un numero massimo di iterate. \
È difficile stabilire se un'assegnazione totale trovata sia ottimale: si ha un *ottimo locale* trovando un'assegnazione non peggiore di tutte le successive possibili; un *ottimo globale* è dato da un'assegnazione non peggiore di tutte le assegnazioni. Senza la ricerca sistematica non si può sapere se la migliore assegnazione trovata localmente costituisca un ottimo globale o se ne esiste altrove una migliore. \
Per arrivare a una soluzione si può consentire la violazione di vincoli rigidi, ad esempio adottando costi di violazione alti ma finiti.
=== Domini Continui: Discesa di Gradiente
In questo caso, la ricerca locale è più complicata: bisogna stabilire come definire il _successore_ di un'assegnazione. \
L'idea dell'algoritmo di _Discesa del Gradiente (Gradient Descent)_ è quella di minimizzare la funzione di valutazione (purchè continua e differenziabile). Come in un percorso in discesa, si fanno passi nelle direzioni più ripide. Il successore di un'assegnazione viene calcolato facendo un passo in discesa di lunghezza proporzionale alla _pendenza_ della funzione, ossia alla sua derivata. \
Esiste anche una ricerca di massimi di funzione obiettivo tramite _Risalita del Gradiente (Gradient Ascent)_ facendo passi di segno positivo.\
Nel caso _monodimensionale_ se a $X$ è assegnato $v in RR$ il valore successivo sarà:
$
v - eta dot.c (d f)/(d X)(v)
$
dove $eta$ è la misura del pass che determina la rapidità della discesa; la derivata viene valutata in $v$:
$
lim_(epsilon -> 0)(f(X=v + epsilon) - f(X=v))/epsilon
$
Nel caso _multidimensionale_ si fanno passi in tutte le direzioni, proporzionali a ogni _derivata parziale_. Date le variabili $chevron.l X_1, dots, X_n chevron.r$ e un'assegnazione iniziale di valori $chevron.l v_1, dots, v_n chevron.r$, l'assegnazione successiva si ottiene muovendosi lungo ogni direzione, in proporzione alla relativa pendenza di $h$. Il nuovo valore per $X_i$ si ottiene calcolando:
$
v_i <- v_i - eta dot.c (partial h)/(partial X_i)(arrow(v)) quad forall i = 1, dots, n
$
dove $(partial h)/(partial X_i)$ è la _derivata parziale_ rispetto a $X_i$ (le altre vengono trattate come costanti):
$
(partial h)/(partial X_i)(arrow(v))=lim_(epsilon -> 0)(h(v_1, dots, v_i + epsilon, dots, v_n) - h(v_1, dots, v_i, dots, v_n))/(epsilon)
$
L'utilità dell'algoritmo sarà evidente nell'apprendimento automatico del valore dei parametri di un modello, anche nel caso di modelli complessi con $10^(12)$ parametri da ottimizzare. \
Vi sono numerose *varianti*, ad esempio per $eta$ si può usare una forma di ricerca binaria per cercare un valore ottiamle, oppure potrebbe variare in funzione delle diverse iterate. \
Per quanto riguarda la convergenza in caso di funzioni regolari con un minimo, GD converge a un minimo locale se $eta$ è sufficientemente piccolo. Qunado è troppo grande allora è possibile che diverga, se, invece è troppo piccolo esso converge molto lentamente. Se il minimo locale è unico allora sarà anche un minimo globale. In caso di più minimi locali è necessaria un'ulteriore ricerca per trovare il minimo globale. Ad esempio, si può usare _random restart_ o _random walk_. È garantito il minimo globale solo quando sarà stato attraversato l'intero spazio di ricerca.
= Rappresentazione e Ragionamentoi Proposizionale
== Proposizioni
Le *proposizioni* sono _enunciati_ che possono essere veri o falsi. Esse sono espresse in un linguaggio formale che si può descrivere in termini di sintassi e semantica, la *logica proposizionale*. \
Il _ragionamento_, che potrà essere definito in termini di proposizioni, si propone obiettivi quali trovare modelli, trovare conseguenze logiche, formulare ipotesi e fare debugging della conoscenza descritta per correggere eventuali errori.
=== Sintassi del Calcolo Proposizionale
A ciascun enunciato, se formulato correttamente in un linguaggio basato su variabili booleano e connettivi logici, potrà poi essere associato un valore di verità. \
Una *proposizione atomica*, o *atomo* viene rappresntato da un simbolo, condizionalmente una stringa alfanumerica, contenente eventuali "\_", che inizi con una lettera minuscola. Esempi di atomi ben formati sono: _ai\_divertente_, _piove_, _soleggiato_.
Una *proposizione* o *formula logica* è costituita da atomo oppure da una proposizione *composta* formata usando connettivi logici e proposizioni più semplici. Nella seguente tabella sono elencate le diverse proposizioni composte che si possono formare a partire da due generiche proposizioni $p$ e $q$:
#align(center)[
  #table(
    columns: 3,
    align: center + horizon,
    stroke: (x, y) => (
      top: if y == 0 { 1pt } else { 0pt },
      bottom: if y == 0 or y == 7 { 1pt } else { 0pt }
    ),
    [sintassi], [lettura], [definizione],
    $not p$, ["non $p$"], [_negazione di $p$_],
    $p and q$, ["$p$ e $q$"], [_congiunzione di $p$ e $q$_],
    $p or q$, ["$p$ o $q$"], [_disgiunzione di $p$ e $q$_],
    $p arrow.r q$, ["$p$ implica $q$"], [_implicazione di $q$ da $p$_],
    $p arrow.l q$, ["$p$ se $q$"], [_implicazione di $p$ da $q$_],
    $p arrow.l.r q$, ["$p$ se e solo se $q$"], [_equivalenza di $p$ e $q$_],
    $p xor q$, ["$p$ XOR $q$"], [_or esclusivo di $p$ e $q$_]
  )
]
Vale il classico ordine di _precedenza_ fra connettivi: $not, and, or, ->, <-, <->, xor$. Si possono usare le parentesi per disambiguare e avere una maggiore leggibilità, ad esempio la proposizione
$
not a or b and c -> d and not e or f
$
si potrà scrivere nella forma equivalente
$
((not a) or (b and c)) -> ((d and (not e)) or f)
$
=== Semantica del Calcolo Proposizionale
La *semantica* definisce il significato degli enunciati, fornendo la corrispondenza tra simboli e stato del mondo che viene rappresentato. Ogni proposizione sarà _interpretabile_ come vera o falsa rispetto allo stato del mondo: le proposizioni vere determinano il mondo conosciuto dal sistema, essendo un _atomo_ l'unità minima che possa essere dotata di significato. Il significato delle proposizioni più complesse discenderà da quello degli atomi. \
Un'*interpretazione* è definita come funzione: $pi: "Atomi" -> brace.l "true, false" brace.r$
- se $pi(alpha) = "true"$, si dice che $alpha$ *vero* nell'interpretazione $pi$;
- se $pi(alpha) = "false"$, si dice che $alpha$ *falso* nell'interpretazione $pi$.
Un'interpretazione si può anche definire come l'insieme $I$ di tutti e soli gli atomi veri, ossia associati al valore di verità $"true"$. Tutti gli altri atomi saranno interpretati come associati a $"false"$. \
Per associare i valori di verità alle proposizioni non atomiche, si dovranno considerare le tavole di verità dei connettivi, mostrate di seguito:
#align(center)[
  #table(
    columns: 9,
    align: center + horizon,
    stroke: (x, y) => (
      top: if y == 0 { 1pt } else { 0pt },
      bottom: if y == 0 or y == 4 { 1pt } else { 0pt }
    ),
    $p$, $q$, $not p$, $p and q$, $p or q$, $p arrow.l q$, $p arrow.r q$, $p arrow.l.r q$, $p xor q$,
    [_true_], [_true_], [_false_], [_true_], [_true_], [_true_], [_true_], [_true_], [_false_],
    [_true_], [_false_], [_false_], [_false_], [_true_], [_true_], [_false_], [_false_], [_true_],
    [_false_], [_true_], [_true_], [_false_], [_true_], [_false_], [_true_], [_false_], [_true_],
    [_false_], [_false_], [_true_], [_false_], [_false_], [_true_], [_true_], [_true_], [_false_]
  )
]
Si noti che la verità di una proposizione dipende solo dall'interpretazione dei suoi atomi. Una stessa proposizione ammette diverse interpretazioni per gli atomi contenuti, quindi potrà avere assegnati valori di verità diversi. \
Una *base di conoscenza* (KB, _knowledge base_) è costituita da un insieme di proposizioni dette *assiomi*: essi sono dichiarati come veri. La base di conoscenza può essere vista come una congiunzione implicita degli assiomi, quindi sarà vera se tutti i suoi assiomi sono veri. \
Gli assiomi servono a specificare il mondo da rappresentare attraverso quella che si dice la sua *interpretazione intesa*, ossia quella che dovrebbe risidere nella mente ell'esperto di dominio e che va formalizzata dall'ingegnere della conoscenza fornendo la sua assiomatizzazione. Nella *teoria dei modelli*, un *modello* di una base di conoscenza _KB_ è un'interpretazione per la quale sia vero ogni assioma di _KB_. \
La proposizione $g$, _goal_, è *conseguenza logica* di _KB_, ovvero $g$ segue logicamente da _KB_ se e solo se $g$ vera in ogni modello di _KB_, in simboli:
$
K B models g
$
In inglese questa relazione fra _KB_ e _g_ si dice _entailment_. \
Quindi, se vale $K B models g$, non esistono modelli di _KB_ nei quali _g_ sia falsa. In caso contrario, si può scrivere $K B cancel(models) g$ per dire che "_g_ non è conseguenza logica di _KB_", ciò significa che esiste un modello di _KB_ in cui _g_ è falsa. Un caso da distinguere è quello in cui $K B models not g$. \
È bene notare che non vengono prese in considerazione altre possibili interpretazioni di $g$ che non siano modelli di $K B$.
#esempio(title: "Base di conoscenza")[
Data la _KB_ contenente gli assiomi:
- _sam\_felice_;
- _ai\_divertente_;
- _vermi\_vivono\_sottoterra_;
- _sera_;
- _bruco\_mangia\_mela_;
- _mela\_mangiata_ $<-$ _bruco\_mangia\_mela_;
- _interruttore\_acceso_ $<-$ _sam\_nella\_stanza_ $and$ _sera_
si può scrivere:
- $K B models $_bruco\_mangia\_mela_
- $K B models$ _mela\_mangiata_
mentre $K B cancel(models) $_interruttore\_acceso_ ossia esiste un modello di _KB_ in cui _interruttore\_acceso_ è falso; tale modello, dovendo risultare vero l'ultimo assioma in _KB_, può essere definito assumento che _sam\_nella\_stanza_ sia falso.
]
=== Semantica: punto di vista del progettista
Per caratterizzare un dominio / mondo, il progettista della _KB_ lo definisce come *interpretazione intesa*: il significato dei simboli viene definito attraverso proposizioni, ossia assiomi che si possono assumere veri rispetto a tale stato del mondo, quindi le conseguenze logiche di _KB_ saranno vere rispetto all'_interpretazione intesa_. Il significato viene così condiviso e potrà essere usato per interpretare le risposte a interrogazioni della _KB_.
==== Metodologia di Costruzione di Basi di Conoscenza
Il progetto della base di conoscenza _KB_ si sviluppa nelle seguenti fasi:
+ SI sceglie il dominio/mondo da rappresentare, ossia l'interpretazione intesa. Questo può comprendere sia aspetti del mondo reale, un mondo immaginario oppure un dominio astratto come quello numero e/o dell'insiemistica.
+ Si scelgono gli atomi per rappresentare le proposizioni d'interesse, la cosiddetta *concettualizzazione*, cui associare un significato preciso rispetto all'interpretazione intesa.
+ Si definiscono gli assiomi di _KB_, ossia proposizioni vere nell'interpretazione intesa, l'*assiomatizzazione* del dominio applicativo per il sistema.
+ Si pongono al sistema domande sull'interpretazione intesa; le sue risposte dovranno essere interpretate in base ai significati associati ai simboli.
=== Semantica: Punto di vista della Macchina
Il sistema elabora la _KB_ per decidere se _g_ è vera nell'interpretazione intesa. I modelli di _KB_ rappresentano tutti e soli i modi in cui il mondo potrebbe essere fatto. Data una concettualizzazione e un'assiomatizzazione corrette, l'interpretazione intesa sarà uno dei modelli di _KB_, ma il sistema non sa determinarlo esattamente. \
Il sistema deve determinare se $K B models g$: se $K B models g$, esso potrà concludere che _g_ sarà vera nell'interpretazione intesa, essendo _g_ vera in tutti i modelli di _KB_. Se, invece, $K B cancel(models) g$, allora non può trarre conclusioni: _g_ potrebbe essere falsa proprio nell'interpretazione intesa ma il sistema non può stabilirlo dato che non la conosce. \
Queste forme di inferenza sono implementate dalle procedure di dimostrazione trattate nel seguito. \
È bene notare che $K B cancel(models) g$ non comporta necessariamente che $ K B models not g$. \
Inoltre, si noti che il progettista può sbagliare e codificare nella _KB_ assiomi falsi nell'interpretazione intesa. In tali casi non può essere garantito che le risposte della macchina siano vere in tale interpretazione.
== Vincoli Proposizionali
Si considereranno ora CSP con vincoli rappresentati come _formule logiche_ dalla struttura concisa e formale per consentire l'elaborazione automatica. \
Un _problema_ di *soddisfacibilità proposizionale (SAT)* è definito da:
- un insieme di _variabili booleane_;
	si usa la sintassi $X = t r u e$ abbreviata in $x$, e $X = f a l s e$ oppure $not x$.
- un insieme di _vincoli clausali_ o *clausole*, ossia espressioni logiche della forma:
	$
	l_1 or l_2 or dots.c or l_k
	$
	in cui ogni *letterale* $l_i$ è un atomo $a$ o la sua negazione $not a$, ossia un'assegnazione a una variabile booleana; si dirà che $a$ _occorre negativamente_ (risp. _positivamente_) nel letterale $not a$ (risp. $a$).
La clausola $l_1 or l_2 or dots.c or l_k$ è vera in un'interpretazione se e solo se $exists i in brace.l 1, dots, k brace.r : l_i$ vero in tale interpretazione. In tal casol, si dice anche che il vincolo clausale è _soddisfatto_. \
In Logica Proposizionale, una clausola è una forma logica in una forma ristretta. Esiste un algoritmo di conversione per cui ogni proposizione può essere convertita in forma di clausola. \
Nei CSP, una clausola è un vincolo su un insieme di variabili booleane che è soddisfatto se almeno uno dei suoi letterali è vero: $l_1 or l_2 or dots.c or l_k$ equivale a $not(not l_1 and not l_2 and dots.c and not l_k)$, ciò esclude che le assegnazioni in cui tutti i letterali risultino falsi.
=== Forma Clausale per CSP
Un CSP finito si può trasformare in un problema di soddisfabilità di una _KB_ proposizionale in cui:
- per ogni variabile $Y$ del CSP, con $d o m(Y) = brace.l v_1, dots, v_k brace.r$ si considerano le *variabili indicatrici* booleane $brace.l Y_1, dots, Y_k brace.r$ tali che $forall i = 1, dots, k : Y_i$ vera se $Y = v_i$ e falsa altrimenti; quindi per rappresentare $Y$ in _KB_ si considereranno gli atomi $y_1, dots, y_k$;
- si aggiungeranno a _KB_ le seguenti clausole:
	- $not y_i or not y_j (equiv not(y_i and not y_j))$ per ogni $i, j in brace.l 1, dots k brace.r$ con $i < j$, poichè $y_i$ e $y_j$ non possono essere entrambi veri;
	- $y_1 or dots.c or y_k$, poichè uno degli $y_i$ dev'essere necessariamente vero, ossia $Y$ avrà un certo valore $i$ nell'assegnazione totale;
- per ogni vincolo del CSP, si definirà una clausola per ogni assegnazione che lo violi:
	- $not(l_1 and l_2 and dots.c and l_k)$ che equivale a $not l_1 or not l_2 or dots.c or not l_k$, ad esempio letterali per le assegnazioni alle $Y_i$ non ammesse dal vincolo;
	- per semplificare, si possono combinare le clausole; ad esempio, combinando $a or b or c$ con $a or b or not c$ si ha $a or b$.
#esempio[
Considerando le variabili $A$ e $B$ con dominio $brace.l 1, 2, 3, 4 brace.r$
- per $A$, le variabili indicatrici saranno $a_1, a_2, a_3$ e $a_4$ con $a_i$ vera se e solo se $A = i$, variabili disgiunte che coprono tutti i casi per cui, in tutto, 7 clausole:
$
not a_1 or not a_2, not a_1 or not a_3, not a_1 or not a_4, not a_2 or not a_3, not a_2 or not a_4, not a_3 or not a_4, a_1 or a_2 or a_3 or a_4
$
]
- analogamente per $B$;
- il vincolo $A < B$ implica che $a_4$ sika falsa, $b_1$ falsa e le coppie che lo violano siano parimenti false quindi un totale di 5 clausole: $not a_4, not b_1, not a_2 or not b_2, not a_3 or not b_3, not a_3 or not b_2$. Si noti che non serve $not a_1 or not b_1$ già implicata da $not b_1$.
L'algoritmo *DPLL Davis-Putnam-Logemann-Loveland* prevede:
- la riduzione dei domini e dei vincoli;
- la separazione dei domini;
- l'assegnazione di letterali _puri_.
L'algoritmo risulta efficiente con strutture dati indicizzate ad hoc.
== Clausole Definite Proposizionali
Il linguaggio delle *clausole definite proposizionali* è un sottolinguaggio della logica proposizionale con la stessa semantica. Esso ammette una forma più specifica di proposizioni, le clausole con un unico letterale positivo della forma seguente:
$
a or not b_1 or dots.c or not b_m
$
Le _proposizioni atomiche_ o _atomi_ sono gli stessi della logica proposizionale. Valendo l'equiivalenza $A or not B equiv A <- B$, una *clausola definita* proposizionale si può scrivere come segue:
$
h <- a_1 and dots.c and a_m
$
formula che si legge "_h_ se $a_1$ e $dots.c$ e $a_m$". In tale formula, $h$ si dice *testa* (_head_) e $a_1 and dots.c and a_m$ si dice *corpo* della clausola. \
Una clausola definita è una *regola* se $m > 0$ (ossia ha un corpo che rappresenta una condizione), altrimenti è un *fatto* o *clausola atomica* quando $m = 0$ nel qual caso si può omettere $<-$. \
Una *base di conoscenza* può essere specificata come insieme di clausole definite. \
La clausola $h <- a_1 and dots.c and a_m$ è falsa nell'interpretazione $I$ se $a_1, dots, a_m$ sono tutti veri in $I$ ma $h$ è falsa, altrimenti essa è vera in $I$. \
La clausola definita è una forma ristretta di clausola nella quale compare esattamente un letterale positivo. Ad esempio, $a <- b and c and d$ è equivalente a $a or not b or not c or not d$. Essa non può rappresentare una qualunque disgiunzione3 di atomi, nemmeno se tutti negati.
#let a(s) = text(style: "italic")[#s]
#esempio(title: "Scheda impianto elettrico")[
Si consideri un ambiente intelligente per la simulazione (diagnostica) come quello nella figura sottostante:
#figure(
image("images/impianto_elettrico.png", width: 70%),
caption: [Impianto elettrico]
)
- si definisce una _rappresentazione_ dello stato di cavi (_wire_), prese (_outlet_), luci, deviatori (_switch_) e fusibili (_circuit breaker_), ecc.. I dettagli trascurabili non verranno modellati (ad es. colori, peso, lunghezze, altezze, ecc.);

- bisogna decidere il _livello di astrazione_ per la rappresentazione: per _specialisti_ (i voltaggi, le correnti, le frequenze, ...) oppure comprensibile anche a non specialisti (in base al _senso comune_);

- poi si decide _cosa_ rappresentare: proposizioni su accensione luci, funzionamento cavi, stato deviatori, ecc.;

- si definiscono _atomi_ con significati precisi per il mondo da modellare: nomi descrittivi come #a("su_d2") per indicare che il deviatore #a("d2") è in posizione #a("su") oppure #a("alimentata_l1") che indica che il punto-luce #a("l1") è sotto tensione.

- si definisce anche la _conoscenza di fondo_ (_background knowledge_, BK) che fornisce altri fatti veri riguardo il mondo, ed è rappresentata nel sistema attraverso altre clausole definite, spesso in forma semplice, come fatti:

  #pad(left: 1.5em)[
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 0.8em,
      [
        - #a("luce_l1.")
        - #a("luce_l2.")
        - #a("ok_l1.")
        - #a("ok_l2.")
      ],
      [
        - #a("ok_f1.")
        - #a("ok_f2.")
        - #a("alimentazione_esterna.")
      ]
    )
  ]

- si può anche considerare una parte del dominio e definire altre _regole_:

  #pad(left: 1.5em)[
    - $#a("alimentata_l1") arrow.l #a("alimentato_c0.")$ \
      "(luce) " #a("l1") " alimentata se (cavo) " #a("c0") " sotto tensione"
    - $#a("alimentato_c0") arrow.l #a("alimentato_c1") and #a("su_d2.")$
    - $#a("alimentato_c0") arrow.l #a("alimentato_c2") and #a("giu_d2.")$
    - $#a("alimentato_c1") arrow.l #a("alimentato_c3") and #a("su_d1.")$
    - $#a("alimentato_c2") arrow.l #a("alimentato_c3") and #a("giu_d1.")$
    - $#a("alimentata_l2") arrow.l #a("alimentato_c4.")$
    - $#a("alimentato_c4") arrow.l #a("alimentato_c3") and #a("su_d3.")$
    - $#a("alimentata_p1") arrow.l #a("alimentato_c3.")$
    - $#a("alimentato_c3") arrow.l #a("alimentato_c5") and #a("ok_f1.")$
    - $#a("alimentata_p2") arrow.l #a("alimentato_c6.")$

    #v(1em)
    #align(center)[_4 Rappresentazione e Ragionamento Proposizionale_]
    #v(1em)

    - $#a("alimentato_c6") arrow.l #a("alimentato_c5") and #a("ok_f2.")$
    - $#a("alimentato_c5") arrow.l #a("alimentazione_esterna.")$
    - $#a("accesa_l1") arrow.l #a("luce_l1") and #a("alimentata_l1") and #a("ok_l1.")$
    - $#a("accesa_l2") arrow.l #a("luce_l2") and #a("alimentata_l2") and #a("ok_l2.")$
  ]

- a run-time, si forniranno al sistema delle _osservazioni_, ad es. fatti sullo stato dei deviatori, come:

  #pad(left: 1.5em)[
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 0.8em,
      [
        - #a("giu_d1.")
- #a("su_d2.")
      ],
      [
        - #a("su_d3.")
      ]
    )
  ]
] <es:impianto_elettrico>

=== Domande e Risposte
Si deve determinare la verità di fatti riguardanti il mondo ossia il dominio rappresentato:
- un utente può porre domande sulle conseguenze logiche della base di conoscenza fornita alla macchina;
- il sistema è in grado di dare risposte decidendo se date proposizioni seguano logicamente dalla base di conoscenza o meno;
- l'utente potrà comprendere il significato di tali risposte, se conosce la semantica degli atomi utilizzati.
A tale scopo si definisce una *query*, ossia una domanda utile a sapere se una data proposizione segua logicamente da una base di conoscenza, denotata con:
$
"ask" b
$
dove $b$ è un atomo o una congiunzione di atomi il che corrisponde al corpo di una regola: $<- b_1 and dots.c and b_m$. \
Le risposte possibili sono:
- $"yes"$ se $b$ è conseguenza logica, $K B models b$;
- $"no"$ altrimenti, $K B cancel(models) b$: ciò significa che $b$ sia falso in un modello della _KB_, non necessariamente nell'interpretazione intesa, ma non è possibile determinarlo con la conoscenza disponibile.
=== Dimostrazioni
La relazione $models$ definisce le risposte corrette secondo la _teoria dei modelli_. La *teoria ella dimostrazione*, _proof theory_, si occupa invece di come calcolare tqali risposte, ossia della dimostrazione delle conseguenza logiche. Si tratta di un problema di _deduzione_, una forma di _inferenza_. \
Una *prova*, (_proof_), è una dimostrazione, derivabile anche _automaticamente_, del fatto che una proposizione seuga logicamente da un insieme di assiomi. Una proposizione dimostrabile si dice anche *teorema*. \
Una *procedura di dimostrazione*, _proof procedure_, è un algoritmo, eventualmente non deterministico, utile a costruire prove. Data una procedura di dimostrazione, si denota con
$
K B tack g
$
la possibilità di produrre attraverso al procedura una prova del fatto che $g$ sia conseguenza di $K B$. \
Le proprietà più importanti delle procedure riguardano le relazioni tra prove e modelli:
- una procedura è *corretta* (_sound_) se e solo se ogni proposizione dimostrata dalla procedura è conseguenza logica di _KB_:
$
"se" K B  tack g "allora" K B models g
$
- una procedura è *completa* se e solo se ogni conseguenza logica di _KB_ può essere dimostrata dalla procedura:
$
"se" K B models g "allora" K B tack g
$
Esistono due tipi principali di procedure: le _bottom-up (BU)_ e le _top-down (TD)_.
=== Procedura Bottom-Up
L'obiettivo di una procedura _bottom-up_ è quello di derivare tutte le conseguenze logiche di una base di conoscenza. A tal fine si costruisce la prova gradualmente, basandosi su quanto è stato già dimostrato. Si procede per *concatenazione in avanti* (_forward chaining_) su clausole definite, derivando fati nuovi a partire da quanto è già stato dimostrato. \
A tal fine si impiega una sola _regola di derivazione_ che costituisce una generalizzazione della *regola d'inferenza* detta *modus ponens*
$
(p -> q quad p)/(q)
$
Se $h <- a_1 and dots.c and a_m$ è in _KB_ e ogni $a_i$ è già stato provato, allora si potrà derivare $h$. \
Ogni fatto ($m=0$) in _KB_ è un assioma quindi viene considerato immediatamente provato. \
La seguente procedura trova $C$, l'_insieme delle conseguenze_ di _KB_:
#algoritmo(title: [Procedura bottom-up])[
  #pseudocode-list[
    + *procedure* $"Prove_DC_BU"(K B)$
    + *Input*
      + $K B$: insieme di clausole definite
    + *Output*
      + insieme di tutte le conseguenze logiche di $K B$
    + *Local*
      + $C$: insieme di atomi
    + $C <- emptyset$
    + *repeat*
      + selezionare $h <- a_1 and dots and a_m$ da $K B$
      + #h(2em) tale che $forall i: a_i in C$ e $h in.not C$
      + $C <- C union {h}$
    + *until* nessuna clausola selezionabile
    + *return* $C$
  ]
] <alg:procedura-bottom-up>
La risposta restituita è `yes` ossia $K B tack g$ quando $g in C$, se $g$ atomica, ovvero quando $brace.l g_1, dots, g_k brace.r subset.eq C$ se $g$ è una congiunzione di atomi $g_1 and dots.c and g_k$.
#esempio[
_KB_ con gli assiomi:
#grid(
    columns: (1fr, 1fr),
    [
      - $a <- b and c$.
      - $b <- d and e$.
      - $b <- g and e$.
      - $c <- e$.
    ],
    [
      - $d$.
      - $e$.
      - $f <- a and g$.
    ]
  )

  La traccia dei valori (insiemi) assegnati via via a $C$ è la seguente:

  #grid(
    columns: (1fr, 1fr),
    [
      - ${}$
      - ${d}$
      - ${e, d}$
    ],
    [
      - ${c, e, d}$
      - ${b, c, e, d}$
      - ${a, b, c, e, d}$
    ]
  )

Da $C = {a, b, c, e, d}$ si può concludere che $K B tack a$, $K B tack b$, ecc. \
Si noti che:
  - non viene mai usata l'ultima regola di $K B$;
  - non si riesce a provare né $f$ né $g$, difatti c'è un modello della $K B$ in cui $f$ e $g$ sono entrambe false.
]
La procedura bottom-up gode delle seguenti proprietà:
- _Punti Fissi_: $C$ restituito è un *minimo punto fisso*:
	- ogni ulteriore applicazione della regola di derivazione non lo cambia;
	- detta $I$ l'interpretazione in cui ogni atomo in $C$ è vero e tutti gli altri sono falsi, $I$ dev'essere un modello di _KB_;
	- $I$ è un modello minimale di _KB_: ha il minor numero di proposizioni vere tra tutti i suoi modelli.
- _Correttezza_: ogni atomo in _C_ è la conseguenza logica di _KB_
	- se $K B tack g$ allora $K B models g$
- _Completezza_: tutte le conseguenze logiche sono derivabili
	- se $K B models g$ allora $g$ è vera in ogni modello di _KB_ quindi anche in quello minimo, ovvero in $C$, per cui $K B tack g$.
=== Procedura Top-Down
Tale procedura effettua una ricerca _retrogada top-down_ a partire da una query per determinare se questa segua logicamente dalle clausole di _KB_. Essa si basa su una diversa regola di ragionamento detta *risoluzione*:
$
(l_1 or dots.c or a or dots.c or l_r quad l'_1 or dots.c or not a or dots.c or l'_m)/(l_1 or dots.c or l_r or l'_1 or dots.c or l'_m)
$
si noti che si applica alla forma generale delle clausole: basta individuare un atomo che compare positivamente in una delle due premesse e negativamente nell'altra.\
In particolare, si usa la *risoluzione SLD* (Selezione di un atomo usando una strategia Lineare su clausole Definite):
$
(a <- a_1 and dots.c and underline(a_i) and dots.c and a_r quad a_i <- b_1 and dots.c and b_m)/(a <- a_1 and dots.c and underline(b_1 and dots.c and b_m) and dots.c and a_r)
$
versione _proposizionale_ di una forma più generale presentata in seguito.
==== Procedura Top-Down con Clausole di Risposta
Una *clausola di risposta* ha la forma
$
"yes" <- a_1 and a_2 and dots.c and a_m
$
dove _yes_ è un atomo _speciale_, vero se la risposta alla query è _yes_. \
Data la query $"ask" q_1 and dots.c and q_m$, si parte dalla clausola di risposta iniziale
$
"yes" <- q_1 and dots.c and q_m
$
successivamente si ripete:
- la _selezione_ di un atomo del corpo da dimostrare;
- la _scelta_ di una clausola definita in _KB_ avente come testa l'atomo selezionato per effettuare un passo di *risoluzione*; qualora non vi fossero altre clausole per dimostrare l'atomo selezionato, la dimostrazione _fallisce_.
Il *risolvente* della clausola di risposta e della clausola scelta sarà una nuova clausola di risposta:
$
("yes" <- underline(a_1) and a_2 and dots.c and a_m quad a_1 <- b_1 and dots.c and b_p)/("yes" <- b_1 and dots.c and b_p and a_2 and dots.c and a_m)
$
In sostanza l'atomo _goal_ selezionato ($a_1$) viene sostituito dal corpo della clausola scelta. \
In una dimostrazione di successo si raggiunge la *risposta*, ossia una clausola di risposta con corpo vuoto (tutti i goal sono stati dimostrati):
$
"yes" <-
$
Nella *derivazione SLD* per una query $"ask" q_1 and dots.c and q_k$ da _KB_ si avrà una sequenza di clausole di risposta $gamma_0, gamma_1, dots, gamma_n$ tali che:
- $gamma_0$ è la clausola di risposta che ingloba la _query originaria_ $"yes" <- q_1 and dots.c and q_k$;
- $gamma_i$ è il _risolvente_ di $gamma_(i-1)$ con una clausola definita in _KB_;
- $gamma_n$ è la _risposta_.
==== Procedura Top-Down Alternativa
Si parte da un insieme $G$ (_goal_) di _atomi da dimostrare_, quindi:
- si inizializza $G$ con tutti gli atomi della query (_sotto-goal_) quindi $G$ corrisponde a $"yes" <- and.big_(g_i in G)g_i$;
- selezionato $a$, la clausola scelta $a <- b_1 and dots.c and b_p$ indica che $a$ può essere sostituito in $G$ dai sotto-goal $b_1, dots, b_p$;
- si ha una terminazione con successo se $G = emptyset$
#algoritmo(title: [Algoritmo Top-Down])[
  #pseudocode-list[
    + *non-deterministic procedure* $"Prove_DC_TD"(K B, "Query")$
    + *Input*
      + $K B$: insieme di clausole definite
      + $"Query"$: insieme di atomi da dimostrare
    + *Output*
      + *yes* se $K B models "Query"$, altrimenti fallisce (*no*)
    + *Local*
      + $G$: insieme di atomi
    + $G <- "Query"$
    + *repeat*
      + selezionare un atomo $a in G$
      + scegliere da $K B$ una clausola definita $a <- B$ con $a$ come testa
      + #text(fill: luma(130))[{se possibile, altrimenti il tentativo fallisce}]
      + $G <- (G backslash {a}) union B$
    + *until* $G = emptyset$
    + *return yes*
  ]
] <alg:algoritmo-top-down>
Qualsiasi atomo di $G$ può essere selzionato (tutti lo saranno). Se una seleziona non porta a terminare la prova, non serve tentarne selezionarne un altro, l'intera dimostrazione fallisce. \
La procedura di _scelta_ della clausola per la risoluzione è non deterministica. Se ci sono scelte che portano a $G$ vuoto, l'algoritmo ha successo, altrimenti il tentativo fallisce. \
Il corpo della clausola $B$ e $G$ sono considerati come insiemi di atomi. In alternativa $G$ può essere costituito da una lista ordinata di atomi che possono occorrere più volte.
#esempio[
  Data la base di conoscenza con le seguenti clausole:

  #grid(
    columns: (1fr, 1fr),
    [
      - $a arrow.l b and c.$
      - $b arrow.l d and e.$
      - $b arrow.l g and e.$
      - $c arrow.l e.$
    ],
    [
      - $d.$
      - $e.$
      - $f arrow.l a and g.$
    ]
  )

  e la query: _ask a._\
  Si userà un insieme di goal $G$ in luogo del corpo della clausola di risposta $y e s arrow.l G$, inizialmente gli atomi (della query) da dimostrare: $G = {a}$; si seleziona sempre l'atomo _più a sinistra_ del corpo. I passi sono i seguenti:

  #align(center)[
    #table(
      columns: 2,
      align: left,
      stroke: (x, y) => if y == 0 { (bottom: 0.5pt + rgb("#990000")) } else { none },
      [risolventi $gamma_i$], [clausole da $K B$],
      [$y e s arrow.l underline(a)$], [$a arrow.l b and c$],
      [$y e s arrow.l underline(b) and c$], [$b arrow.l d and e$],
      [$y e s arrow.l underline(d) and e and c$], [$d$],
      [$y e s arrow.l underline(e) and c$], [$e$],
      [$y e s arrow.l underline(c)$], [$c arrow.l e$],
      [$y e s arrow.l underline(e)$], [$e$],
      [$y e s arrow.l$], []
    )
  ]

  Una sequenza _alternativa_ di scelte in cui si sceglie la seconda clausola per $b$ è la seguente:

  - $y e s arrow.l a$
  - $y e s arrow.l b and c$
  - $y e s arrow.l g and e and c$

  ma selezionando $g$ non ci sono regole da scegliere, per cui _questo tentativo fallisce_: occorre scegliere altre alternative, se ve ne sono.
]
==== Algoritmo TD su Grafo di Ricerca
Si può anche pensare a un algoritmo alternativo indotto dalla strategia di selezione basato su _grafo di ricerca_ in cui:
- i _nodi_ contengono clausole di risposta (bastano gli atomi nei loro corpi);
- i _vicini_ di $"yes" <- underline(a_1) and dots.c and a_m$ rappresentano tutte le possibili clausole di risposta ottenute risolvendo su $a_1$ e possono essere generati dinamicamente, uno per ogni clausola definita con testa $a_1$;
- i _nodi obiettivo_ sono del tipo $"yes" <- $
- si può usare qualsiasi metodo di ricerca su grafo: basta trovare un percorso di successo perchè la query sia conseguenza logica della base di conoscenza; per ogni nodo, lo spazio viene determinato dalla query e dall'atomo selezionato.
#figure(
image("images/albero_ricerca.png", width: 70%),
caption: [Albero di ricerca generato dall'algoritmo alternativo]
)
==== Confronto fra procedure
Le dimostrazioni TD e BU sono interscambiabili: ciò può essere utile a provare la correttezza e la completezza della TD. La BU prova ogni atomo una sola volta mentre TD potrebbe provare lo stesso atomo più volte, ma si concentra su quelli rilevanti per la query. Con TD sono possibili cicli infiniti.
#esempio[
Data la base di conoscenza
$
K B = brace.l g <- a. quad a <- b. quad b <- a. quad g <- c. quad c.
$
e la query $"ask" g.$, si ha che:
- le uniche conseguenze logiche sono $g$ e $c$;
- la procedura BU termina con il punto fisso $brace.l c, g brace.r$
- la procedura TD con DFS semplice potrebbe continuare indefinitamente a meno che non sia prevista la potatura dei cicli
]
La _strategia di selezione_ dell'atomo per la risoluzione condiziona _efficienza_ e _terminazione_:
- negli esempi precedenti: atomo più a sinistra, il che risulta problematico senza controllo sui cicli;
- una strategia migliore seleziona l'atomo che porti al fallimento più rapidamente;
- una strategia comune prevede l'ordinamento degli atomi per la selezione; ciò consente l'uso di un'euristica.
== Interrogare l'utente
A run-time il sistema riceve *osservazioni* dagli utenti, da sensori o altre sorgenti. \
Esse sono rappresentate come _insiemi di atomi_. Le osservazioni interagiscono con la *conoscenza di fondo* (_background knowledge, BK_): possono esservi aggiunte o essere tenute separate dalla BK (base knowledge). \
Le informazioni fornite dall'utente sono incomplete: è possibile che non sappia usare il vocabolario o non sappia giudicarne la rilevanza. Per questo servirebbero:
+ un'_ontologia_ che specifichi il significato dei simboli
+ un'_interfaccia_ che possa aiutare a fornire informazioni rilevanti.
Analogamente, i _sensori_ possono essere _passivi_, quando raccolgono osservazioni dirette oppure _attivi_, se atti a raccogliere risposte a esplicite richieste di informazioni necessarie. \
Per l'_acquisizione_ si può pensare a un meccanismo *ask-the-user* integrato nella procedura di ragionamento: si considerano atomi dichiarati come *askable* per rappresentare fatti veri acquisibili a run-time dall'utente. Nella procedura TD, selezionato un atomo da dimostrare, si usa una clausola della base di conoscenza oppure, se è askable si chiede all'utente se sia vero o falso. Si noti che ciò vale solo per atomi rilevanti per la risposta, quindi si considerano tre diverse classi di atomi:
+ non askable;
+ askable senza risposta-utente: si può chiedere e memorizzare;
+ askable con risposta-utente memorizzata: usati senza chiedere di nuovo.
Si può adottare un meccanismo simile anche con procedure bottom-up, ma vanno evitate troppe richieste all'utente.
== Debugging a Livello di Conoscenza
Data una semantica esplicita si possono realizare spiegazione e debugging a livello di conoscenza. Il *knowledge-level-debugging* consiste nel trovare errori nelle basi di conoscenza facendo riferimento solo al significato dei simboli e a quanto risulta vero nel mondo codificato e non ai passi di ragionamento. \
I diversi tipi di errori possibili sono:
+ risposta _errata_: derivazione di atomo falso nell'interpretazione intesa;
+ risposta _mancante_: dimostrazione fallita per qualche atomo vero nell'interpretazione intesa;
+ _loop infinito_: solo con procedure TD, in base alla strategia di selezione. Ma si può evitare con meccanismi di potatura dei cicli.
=== Risposte Errate
Si tratta di risposte fornite dalla procedura di dimostrazione che sono _false_ nell'interpretazione intesa, cioè casi di *falsi positivi*. Se la procedura è corretta allora nella dimostrazione sarà stata impiegata una clausola errata. \
Per il _debugging dei falsi positivi_, si considerano l'atomo $g$ dimostrato che, invece, dovrebbe essere falso nell'interpretazione intesa e la clausola usata per dimostrarlo $g <- a_1 and dots.c and a_k$. I casi possibili sono i seguenti:
- tutti gli $a_i$ sono veri nell'interpretazione intesa, quindi la clausola $g <- a_1 and dots.c and a_k$ è errata;
- uno o più $a_i$ dimostrati sono a loro volta falsi nell'interpretazione intesa, per cui si ha un analogo problema da risolvere.
L'algoritmo da usare può essere schematizzato come segue:
#algoritmo(title: [Debug dei falsi positivi])[
  #pseudocode-list[
    + *procedure* $"Debug_false"(g, K B)$
    + *Input*
      + $K B$: base di conoscenza
      + $g$: atomo tale che $K B tack g$ ma falso nell'interpretazione intesa
    + *Output*
      + clausola in $K B$ che risulta falsa
    + trovare $g <- a_1 and dots.c and a_k in K B$ usata per dimostrare $g$
    + chiedere all'utente se ogni $a_i$ sia vero o meno
    + *if* l'utente indica un $a_i$ falso *then*
      + *return* $"Debug_false"(a_i, K B)$
    + *else if* l'utente risponde che tutti gli $a_i$ sono veri *then*
      + *return* $g <- a_1 and dots.c and a_k$
  ]
] <alg:debug-falsi-positivi>
=== Risposte mancanti
In tal caso una risposta positiva attesa (ossia un goal vero nell'interpretazione intesa) non viene derivata dal sistema. Il _fallimento_ dipende da un atomo $g$ vero nell'interpretazione intesa ma tale che $K B cancel(tack) g$, si tratta, cioè, di un caso di *falso negativo*. \
Tale atomo segnala il caso di una o più _clausole mancanti_ tra gli assiomi della base di conoscenza e si può individuare con una procedura, come quella riportata, per trovare atomi cui manchino clausole utili alla loro dimostrazione:
#algoritmo(title: [Debug dei falsi negativi])[
  #pseudocode-list[
    + *procedure* $"Debug_missing"(g, K B)$
    + *Input*
      + $K B$: base di conoscenza
      + $g$: atomo tale che $K B cancel(tack) g$ ma $g$ vero nell'interpretazione intesa
    + *Output*
      + atomo per il quale manchi una clausola utile
    + *if* $exists g <- a_1 and dots.c and a_k in K B$ con tutti gli $a_i$ veri nell'interpretazione intesa *then*
      + selezionare $a_i$ che non può essere dimostrato
      + *return* $"Debug_missing"(a_i, K B)$
    + *else*
      + *return* $g$
  ]
] <alg:debug-falsi-negativi>
== Dimostrazione per Contraddizione
=== Clausole di Horn
Si intende estendere il ragionamento ammettendo regole che producano _contraddizioni_, ossia utili a specificare casi _impossibili_. Ciò ha anche lo scopo di implementare successvimente forme di _diagnostica_. A tale scopo il linguaggio delle clausole definite può essere esteso per esplicitare le contraddizioni. Definiti un atomo speciale, detto _false_, che codifica la contraddizione, ossia che è falso in tutte le interpretazioni, saranno amesse regole, dette *vincoli d'integrità*, rappresentate da clausole con l'atomo _false_ come testa:
$
"false" <- a_1 and dots.c and a_k
$
Una *clausola di Horn* è una clausola definita o un vincolo d'integrità, ossia la sua testa è un atomo normale oppure l'atomo speciale _false_. \
Da una base di conoscenza di clausole di Horn si possono derivare *negazioni* di atomi tramite la regola di ragionamento detta _modus tollens_:
$
(p -> q quad not q)/(not p)
$
#esempio[
Data la base di conoscenza $K B_1$:
+ $"false" <- a and b$;
+ $a <- c$.
+ $b <- c$.
$c$ è falso in tutti i modelli di $K B_1$. Pertanto si può scrivere $K B_1 models not c$
]
Inoltre, valendo le seguenti equivalenze:
$
("false" <- a_1 and dots.c and a_k) equiv not(a_1 and dots.c and a_l) equiv not a_1 or dots.c or not a_k
$
dimostrare che una _congiunzione di atomi_ sia falsa in tutti i modelli di $K B$ equivale a provare una *disgiunzione* di _negazione di atomi_. \
Un insieme di clausole $K B$ è *insoddisfacibile* se non ha modelli:
$
K B models "false"
$
Un insieme di clausole $K B$ è *inconsistente* rispetto a una procedura di dimostrazione $tack$ se consente di derivare $"false"$:
$
K B tack "false"
$
Se la procedura $tack$ è corretta e completa allora $K B$ è inconsistente se e solo se è insoddisfacibile. \
Una base di conoscenza di clausole definite è sempre soddisfacibile, per esempio basta considerare l'interpretazione che assegna il valore _true_ a tutti gli atomi. Ciò non vale per le basi di clausole di Horn.
=== Assumibili e Conflitti
Le _contraddizioni_ sono utili a individuare combinazioni di assunzioni incompatibili, ossia ipotesi fatte (per mancata conoscenza) che possono dimostrarsi false. \
Si definisce *assumibile* un atomo che può essere assunto in una _dimostrazione per contraddizione_. In diagnostica, sarà utile a determinare una _disgiunzione di negazioni_ di assumibili, provando la contraddizione a partire da una base di conoscenza e una combinazione di assumibili. \
Si dice *conflitto* di $K B$ l'insieme di assumibili $C = brace.l c_1, dots, c_r brace.r$ tale che $K B union C models "false"$. Si tratta di una *risposta* per una dimostrazione per contraddizione del tipo: $K B models not c_1 or dots.c or not c_r$. Un conflitto è *minimale* se nessun suo sottoinsieme costituisce, a sua volta, un conflitto.
#esempio[
Data $K B_2$ e l'insieme di atomi assumibili $brace.l c, d, e, f, g, h brace.r$:
$
K B_2 = cases(
"false" <- a and b.,
a <- c.,
b <- d.,
b <- e.
)
$
- $brace.l c, d brace.r$ e $brace.l c, e brace.r$ sono conflitti minimali;
- $brace.l c, d, e, h brace.r$ è un conflitto non minimale.
]
=== Diagnosi basata sulla consistenza
Lo scopo della diagnosi è quello di determinare possibili guasti in base a un modello del sistema, una base di conoscenza, e a osservazioni aggiuntive sul sistema stesso. \
In sostanza si fanno assunzioni sul funzionamento normale, considerando quindi assumibili in assenza di guasti. Si derivano i componenti _anormali_, ossia i conflitti, le anomalie nel sistema.
#esempio[
  (impianto elettrico, cont.) Si riconsideri la base di conoscenza _@es:impianto_elettrico _. Si aggiungono:

  - _assunzioni_ di normalità tramite _assumibili_: atomi _ok_`*` per ogni componente (dev'essere in buono stato per funzionare);
  - _osservazioni_ fornite dall'utente che specificano le posizioni effettive (_su_ / _giu_) dei deviatori, lo stato delle luci (_lit_ / _spenta_),...;
  - _vincoli d'integrità_ utili a definire stati reciprocamente incompatibili come, ad esempio, che sia possibile un solo stato per i punti-luce: \
    _false_ $<-$ _spenta\_l1_ $and$ _accesa\_l1._

  _KB_ risultante:

  - _luce\_l1._
  - _luce\_l2._
  - _alimentazione\_esterna._
  - _alimentata\_l1_ $<-$ _alimentato\_c0._
  - _alimentato\_c0_ $<-$ _alimentato\_c1_ $and$ _su\_d2_ $and$ _ok\_d2._
  - _alimentato\_c0_ $<-$ _alimentato\_c2_ $and$ _giu\_d2_ $and$ _ok\_d2._
  - _alimentato\_c1_ $<-$ _alimentato\_c3_ $and$ _su\_d1_ $and$ _ok\_d1._
  - _alimentato\_c2_ $<-$ _alimentato\_c3_ $and$ _giu\_d1_ $and$ _ok\_d1._
  - _alimentata\_l2_ $<-$ _alimentato\_c4._
  - _alimentato\_c4_ $<-$ _alimentato\_c3_ $and$ _su\_d3_ $and$ _ok\_d3._
  - _alimentata\_$p_1$_ $<-$ _alimentato\_c3._
  - _alimentato\_c3_ $<-$ _alimentato\_c5_ $and$ _ok\_f1._
  - _alimentata\_$p_2$_ $<-$ _alimentato\_c6._
  - _alimentato\_c6_ $<-$ _alimentato\_c5_ $and$ _ok\_f2._
  - _alimentato\_c5_ $<-$ _alimentazione\_esterna._
  - _accesa\_l1_ $<-$ _luce\_l1_ $and$ _alimentata\_l1_ $and$ _ok\_l1._
  - _accesa\_l2_ $<-$ _luce\_l2_ $and$ _alimentata\_l2_ $and$ _ok\_l2._

  vincoli d'integrità:

  - _false_ $<-$ _spenta\_l1_ $and$ _accesa\_l1._
  - _false_ $<-$ _spenta\_l2_ $and$ _accesa\_l2._

  osservazioni:

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      - _su\_d1._
      - _su\_d2._
      - _su\_d3._
    ],
    [
      - _spenta\_l1._
      - _spenta\_l2._
    ]
  )

  dichiarazioni:

  - `assumable` _ok\_f1,ok\_f2,ok\_d1,ok\_d2,ok\_d3,ok\_l1,ok\_l2._

  Tutto considerato, ci sono due conflitti minimali:

  1. {_ok\_f1,ok\_d1,ok\_d2,ok\_l1_}
  2. {_ok\_f1,ok\_d3,ok\_l2_}

  Pertanto:

  1. _KB_ $models not$ _ok\_f1_ $or not$ _ok\_d1_ $or not$ _ok\_d2_ $or not$ _ok\_l1_ \
     quindi almeno un componente fra _f1,$d_1$,$d_2$,l1_ ha un guasto;
  2. _KB_ $models not$ _ok\_f1_ $or not$ _ok\_d3_ $or not$ _ok\_l2_ \
     ossia almeno uno tra _f1,$d_3$,l2_ non funziona.
]
Dato l'insieme dei conflitti, l'utente può diagnosticare il problema: ciò è anche utile a farsi un'idea della numerosità dei possibili guasti. \
Nella *diagnosi basata su consistenza* (CBD) dato un insieme di conflitti, cioè un insieme di assumbili con almeno un elemento in ogni conflitti, si costruisce una diagnosi che sarà *minimale* se nessun suo sotto-insieme è una diagnosi. Intuitivamente, una sola delle diagnosi minimali è quella giusta: qualla contenente solo conflitti falsi nell'interpretazione intesa.
=== Ragionamento con Assunzioni e Clausole di Horn
L'_obiettivo_ è la ricerca dei _conflitti_ in basi di conoscenza di clausole di Horn attraverso dimostrazioni per contraddizione dei due tipi considerati in precedenza.
==== Implementazione Bottom-Up
Si estende l'algoritmo bottom-up per clausole definite:
- le conclusioni sono _coppie_ $chevron.l a, A chevron.r$, con $A$ insiemi di assumibili che implicano l'atomo $a$ rispetto a $K B$;
- nell'inizializzazione, l'insieme di conclusioni sarà $C <- brace.l chevron.l a, brace.r a brace.r chevron.r brace.r bar a "assumibile" brace.r$;
- si usano poi le clausole in _KB_ per derivare nuove conclusioni:
	se $exists h <- b_1 and dots.c and b_m in K B$ tale che ogni $chevron.l b_i, A_i chevron.r in C$, allora si può aggiungere $chevron.l h, A_1 union dots union A_m$ a $C$
#algoritmo(title: [Algoritmo bottom-up per la dimostrazione di conflitti])[
  #pseudocode-list[
    + *procedure* $"Prove_conflict_BU"(K B, A s)$
    + *Input*
      + $K B$: insieme di clausole di Horn
      + $A s$: insieme di atomi che si possono assumere veri
    + *Output*
      + insieme di conflitti
    + *Local*
      + $C$: insieme di coppie atomo/insieme di assumibili
    + $C <- {chevron.l a, {a} chevron.r | a in A s}$
    + *repeat*
      + selezionare la clausola $h <- b_1 and dots and b_m in K B$ tale che:
      + #h(2em) per ogni $i$, $chevron.l b_i, A_i chevron.r in C$ e $chevron.l h, A chevron.r in.not C$, dove $A = A_1 union dots union A_m$
      + $C <- C union {chevron.l h, A chevron.r}$
    + *until* nessun'altra selezione possibile
    + *return* ${A | chevron.l "false", A chevron.r in C}$
  ]
] <alg:bottom-up-conflitti>
==== Implementazione Top-Down
L'implementazione top-down deriva dall'omologa per clausole definite, con due _differenze_:
- la query da provare è dall'atomo speciale _false_;
- nella dimostrazione, gli atomi assumibili non vanno dimostrati ma semplicemente raccolti via via assunti come veri.
#algoritmo(title: [Algoritmo top-down per la dimostrazione di conflitti])[
  #pseudocode-list[
    + *non-deterministic procedure* $"Prove_conflict_TD"(K B, A s)$
    + *Input*
      + $K B$: insieme di clausole di Horn
      + $A s$: insieme di atomi che si possono assumere veri
    + *Output*
      + un conflitto
    + *Local*
      + $G$: insieme di atomi (che implicano $"false"$)
    + $G <- {"false"}$
    + *repeat*
      + selezionare un atomo $a in G$ tale che $a in.not A s$
      + scegliere una clausola $a <- B$ di $K B$ con $a$ come testa
      + $G <- (G backslash {a}) union B$
    + *until* $G subset.eq A s$
    + *return* $G$
  ]
] <alg:top-down-conflitti>
Si osservi che l'algoritmo contiene diverse scelte _non deterministiche_ in corrispondenza delle quali si ptoranni trovare diversi conflitti: in mancanza di scelte, l'algoritmo fallisce.
== Assunzione di Conoscenza Completa
Nella semantica dele basi di dati quello che non è derivabile viene considerato falso: la conoscenza su un dominio viene considerata _completa_. In Logica la mancanza di conoscenza non consente di trarre conclusioni dal fallimento delle dimostrazioni. \
Assumendo la *completezza della conoscenza*, le clausole con uno stesso atomo come testa coprono tutti e soli i casi in cui esso è vero. Tale assunzione si dice anche *closed-world (CWA)*. In base ad essa, se non si riesce a dimostrare che $a$ sia vero, si conclude che è falso, ossia che la sua negzione $not a$ è vera. Si assume quindi che tutto quello che è rilevante sia stato asserito esplicitamente nella base di conoscenza. \
In Logica normalmente si può assumere che una base di conosceza possa definire tutta la conoscenza su un dato diminio nella sua completezza, si parla pertanto di *open-world assumption (OWA)*. Quindi, non potendo trarre conclusioni dalla mancanza di conoscenza, la base di conoscenza di clausole definite non può avere $not a$ come conseguenza logica.
==== Completare la Base di Conoscenza
Per codificare l'assunzione di conosceza completa negli assiomi della base di conoscenza essa dev'essere trasfomrata ossia _completata_. \
Dato l'atomo $a$, si considerino tutte le clausole della base di conoscenza che lo definiscono:
$
a <- b_1. quad dots quad a <- b_n.
$
dove $b_i$ è una congiunzione di atomi oppure _true_. In mancanza di clausole per $a$ si considera: $a <- "false"$. \
Tali clausole possono essere riassunte da un'unica proposizione:
$
a <- b_1 or dots.c or b_n
$
Se $a$ è vero allora, per la CWA, dovrà necessariamente essere vero uno dei corpi $b_i$ quindi si può aggiungere:
$
a -> b_1 or dots.c or b_n
$
Il significato delle clausole per l'atomo $a$ sotto CWA è la congiunzione delle due proposizioni, ossia l'equivalenza:
$
a <=> b_1 or dots.c or b_n
$
detta _complemnto di Clark_ delle clausole per $a$. Si noti che se non ci sono regole per $a$, il complemento sarà $a <=> "false"$. \
Il *complemento di Clark* della base di conoscenza ricomprende i complementi di tutti gli atomi della base.
#esempio[
  Si consideri la base di conoscenza precedente con le clausole:

  - _giu\_d1._
  - _su\_d2._
  - _ok\_f1._
  - _alimentata\_l1_ $<-$ _alimentato\_c0._
  - _alimentato\_c0_ $<-$ _alimentato\_c1_ $and$ _su\_d2._
  - _alimentato\_c0_ $<-$ _alimentato\_c2_ $and$ _giu\_d2._
  - _alimentato\_c1_ $<-$ _alimentato\_c3_ $and$ _su\_d1._
  - _alimentato\_c2_ $<-$ _alimentato\_c3_ $and$ _giu\_d1._
  - _alimentato\_c3_ $<-$ _alimentazione\_esterna_ $and$ _ok\_f1._
  - _alimentazione\_esterna._

  Si noti che non sono definite clausole per _su\_d1_ e _giu\_d2_. \
  _Completamento_ della base di conoscenza:

  - _giu\_d1_ $<=>$ _true._
  - _su\_d1_ $<=>$ _false._
  - _su\_d2_ $<=>$ _true._
  - _giu\_d2_ $<=>$ _false._
  - _ok\_f1_ $<=>$ _true._
  - _alimentata\_l1_ $<=>$ _alimentato\_c0._
  - _alimentato\_c0_ $<=>$ (_alimentato\_c1_ $and$ _su\_d2_) $or$ (_alimentato\_c2_ $and$ _giu\_d2_).
  - _alimentato\_c1_ $<=>$ _alimentato\_c3_ $and$ _su\_d1._
  - _alimentato\_c2_ $<=>$ _alimentato\_c3_ $and$ _giu\_d1._
  - _alimentato\_c3_ $<=>$ _alimentazione\_esterna_ $and$ _ok\_f1._
  - _alimentazione\_esterna_ $<=>$ _true._

  Così, ad esempio, _su\_d1_ è falso, _alimentato\_c1_ è falso e _alimentato\_c2_ è vero.
]
==== Negazione come Fallimento
Un *letterale* è un atomo o la negazione di un atomo. Con il completamento si possono dimostrare negazioni di proposizioni, quindi la negazione può essere ammessa anche nel corpo delle clausole. Si considereranno clausole definite estese contenenti nel corpo letterali. La _negazione sotto assunzione di conoscenza completa_, detta anche *negation as failure (NaF)*, verrà denotata con $tilde a$ per distinguerla dalla negazione classica. Sotto CWA, il corpo $g$ è una conseguenza di $K B$ se e solo se $K B' models g$, dove $K B'$ è il completamento di $K B$. Si noti come $tilde a$ nel corpo di una clausola diventi $not a$ nel completamento. \
#esempio[
  Si consideri l'assiomatizzazione vista in precedenza. Si semplifica la rappresentazione chiedendo all'utente di indicare solo i deviatori _su_, gli altri saranno _giu_ per default. Analogamente, si potrebbe specificare che i fusibili sono _funzionanti_ a meno che non risultino _rotti_. \
  Regole da aggiungere:

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      - _giu\_d1_ $<- tilde.op$ _su\_d1._
      - _giu\_d2_ $<- tilde.op$ _su\_d2._
      - _giu\_d3_ $<- tilde.op$ _su\_d3._
    ],
    [
      - _ok\_f1_ $<- tilde.op$ _rotto\_f1._
      - _ok\_f2_ $<- tilde.op$ _rotto\_f2._
    ]
  )

  Per rappresentare lo stato della figura, l'utente specifica:

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      - _su\_d2._
    ],
    [
      - _su\_d3._
    ]
  )

  Il sistema può inferire che $d_1$ dev'essere in posizione _giu_ e i due fusibili non sono guasti. Completamento:

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      - _giu\_d1_ $<=> not$ _su\_d1._
      - _giu\_d2_ $<=> not$ _su\_d2._
      - _giu\_d3_ $<=> not$ _su\_d3._
      - _ok\_interruttore1_ $<=> not$ _rotto\_interruttore1._
      - _ok\_interruttore2_ $<=> not$ _rotto\_interruttore2._
    ],
    [
      - _su\_d1_ $<=>$ _false._
      - _su\_d2_ $<=>$ _true._
      - _su\_d3_ $<=>$ _true._
      - _rotto\_interruttore1_ $<=>$ _false._
      - _rotto\_interruttore2_ $<=>$ _false._
    ]
  )
]
Con la NAF, le basi di conoscenza non acicliche diventa problematiche dal punto di vista semantico. Ad esempio, data la base non aciclica:
- $a <- tilde b$
- $b <- tilde a$
il completamento equivalente a $a <=> not b$, indica che $a$ e $b$ hanno valori di verità opposti: solo uno può essere vero. \
Un altro esempio di base di conoscenza non aciclica è una con l'assioma:
- $a <- tilde a$
con completamento:
- $a <=> not a$
che risulta _inconsistente_ dal punto di vista logico. Il completamento di una base aciclica è sempre consistente e prevede un solo valore di verità per ogni atomo.
=== Ragionamento Non Monotono
In una logica *monotona* ogni proposizione derivabile da una base di conoscenza rimane derivabile dopo l'aggiunta di altre proposizioni: aggiungendo assioni non si riduce l'insieme delle proposizioni derivabili. In una _Logica non monotona_ alcune conclusioni possono essere invalidate con l'aggiunta di altri assiomi.
==== Default ed Eccezioni
Una logica non monotona è utile a rappresentare casi predefiniti. Si dice *default* una regola che resta valida fintantochè non si verifichi un'eccezione. Ad esempio per asserire che normalmente $b$ è vera se $c$ è vera si può definire la regola:
$
b <- c and tilde a b\_a
$
con $a b\_a$ che indica l'anormalità rispetto a qualche aspetto di $a$. Dato $c$ si può derivare $b$, a meno che non venga asserito $a b\_a$, in quanto l'aggiunta di $a b\_a$ inibisce la possibilità di concludere $b$. Le regole che implicano $a b\_a$ possono inibire il default, sotto le condizoni del corpo della regola. Ad esempio, nella maggior parte dei casi gli uccelli ($c$) sono volatili $(b)$, ma i pinguini fanno eccezione $(a b\_a)$.
=== Procedure di Dimostrazione per la NAF
==== Procedura Bottom-Up + NAF
La procedura BU per clausole definite va modificata: quando $p$ fallisce va aggiunto il letterale $tilde p$ all'insieme $C$ delle conseguenze derivate. \
Si ha una definzione ricorsiva del *fallimento*: $p$ fallisce se fallisce il corpo di ogni clausola che abbia $p$ coem testa; un corpo fallisce se almeno uno dei suoi letterali fallisce; un atomo $b_i$ fallisce se si può derivare $tilde b_i$ e la negazione $tilde b_i$ fallisce se si può derivare $b_i$.
#algoritmo(title: [Algoritmo bottom-up di dimostrazione con NAF])[
  #pseudocode-list[
    + *procedure* $"Prove_NAF_BU"(K B)$
    + *Input*
      + $K B$: insieme di clausole che possono includere NAF
    + *Output*
      + insieme di letterali che seguono dal completamento di $K B$
    + *Local*
      + $C$ insieme di letterali
      + $C <- \{ \}$
    + *repeat*
      + *either*
        + selezionare $(h <- b_1 and dots.c and b_m) in K B$ tale che: $h in.not C$ e $forall i: b_i in C$
        + $C <- C union \{h\}$
      + *or*
        + selezionare $h$ con $tilde h in.not C$ tale che:
          + $forall(h <- b_1 and dots.c and b_m) in K B: exists i: tilde b_i in C$ oppure $b_i = tilde g$ e $g in C$
        + $C <- C union \{tilde h\}$
    + *until* non ci sono altre selezioni possibili
  ]
] <alg:naf-bottom-up>
#esempio[
  Si considerino le clausole:

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      1. $p <- q and tilde.op r.$
      2. $p <- s.$
      3. $q <- tilde.op s.$
    ],
    [
      #set enum(start: 4)
      1. $r <- tilde.op t.$
      2. $t.$
      3. $s <- w.$
    ]
  )

  Una possibile sequenza di letterali aggiunti a $C$ è la seguente:

  - $C = {t}$ #h(1fr) 5. (fatto)
  - $C = {t, tilde.op r}$ #h(1fr) $t in C$ e 4.
  - $C = {t, tilde.op r, tilde.op w}$ #h(1fr) non ci sono clausole per $w$
  - $C = {t, tilde.op r, tilde.op w, tilde.op s}$ #h(1fr) $tilde.op w in C$ e 6.
  - $C = {t, tilde.op r, tilde.op w, tilde.op s, q}$ #h(1fr) $tilde.op s in C$ e 3.
  - $C = {t, tilde.op r, tilde.op w, tilde.op s, q, p}$ #h(1fr) $q in C$, $tilde.op r in C$ e 1.
] <es-bottom-up>
==== Procedura Top-Down + NAF
La procedura TD è analoga a quella delle clausole definite, ma procede per NAF. È non-deterministca e, come tale, si può implementare come ricerca di scelte di successo: selezionato un atomo $tilde a$, parte una nuova dimostrazione per $a$; se questa fallisce allora $tilde a$ ha successo altrimenti l'algoritmo fallisce: deve tentare altre scelte se possibile.
#algoritmo(title: [Algoritmo top-down di dimostrazione con NAF])[
  #pseudocode-list[
    + *non-deterministic procedure* $"Prove_NAF_TD"(K B, Q u e r y)$
    + *Input*
      + $K B$: insieme di clausole che includono la NAF
      + $Q u e r y$: insieme di letterali da dimostrare
    + *Output*
      + yes se $Q u e r y$ segue dal completamento di $K B$, 'fail' altrimenti
    + *Local*
      + $G$: insieme di letterali
    + $G <- Q u e r y$
    + *repeat*
      + selezionare il letterale $l in G$
      + *if* $l = tilde a$ *then*
        + *if* $"Prove_NAF_TD"(K B, a) = " 'fail' "$ *then*
          + $G <- G backslash {l}$
        + *else*
          + *return* 'fail'
      + *else*
        + scegliere una clausola $l <- B in K B$
        + $G <- G backslash {l} union B$
    + *until* $G = emptyset$
    + *return yes*
  ]
] <alg:naf-top-down>
#esempio[
  Data la base di conoscenza nell'@es-bottom-up la query `ask` $p$:

  - $G = {p}$ -- inizializzazione
  - $G = {q, tilde.op r}$ -- sostituzione con il corpo di 1.;
  - $G = {tilde.op s, tilde.op r}$ -- sostituendo $q$ con il corpo della 3.;
  - $G = {tilde.op r}$ -- selezionato ed eliminato $tilde.op s$ la dim. di $s$ _fallisce_;
  - $G = {}$ -- selezionato $tilde.op r$, la dim. di $r$ _fallisce_ poiché, usando la 4., si deve provare il sotto-goal $tilde.op t$, si tenta quindi di dimostrare $t$; data 5., tale dim. ha _successo_ immediato, e quella di $tilde.op t$ _fallisce_. non ci sono altre regole per $r$. da cui il successo di $tilde.op r$ che può essere eliminato.

  Essendo $G$ vuoto l'output sarà `yes`.
]
Quanto detto vale solo enl caso di fallimento finito: nessuna conclusione è possibile in caso di divergenza. Ad esempio, data una base di conoscenza con la sola regola $p <- p$ e la query $"ask" p$, l'algoritmo non converge: il completamento è $p <=> p$ ma, pur potendosi accertare l'indimostrabilità di $p$, una procedura corretta non può concludere $tilde p$ poichè non segue logicamente dal completamento.
== Abduzione
L'*abduzione* è una forma di ragionamento nella quale si fanno ipotesi, ossia assunzioni, al fine di spiegare osservazioni. Le ipotesi da farsi possono implicare le osservazioni fatte: se verificate, esse giustificano quanto osservato ma non si devono introdurre _contraddizioni_ poichè queste giustificherebbero qualsiasi conclusione. \
L'abduzione si differenzia dalla deduzione la quale mira alle conseguenze logiche di un set di assiomi e dall'induzione che comporta l'inferenza di relazioni generali da casi particolari.
==== Scenari e Spiegazioni
Possiamo schematizzare questa forma di ragionamento come segue. I dati sono i seguenti:
- una base $K B$ di Horn;
- un insieme $A$ di atomi utili a costruire ipotesi, detti assumibili o anche abducibili,
dobbiamo trovare delle spiegazioni per delle osservazioni. \
Si dice *scenario* di $chevron.l K B, A chevron.r$ un insieme di abducibili $H subset.eq A$ tale che $K B union H$ sia soddisfacibile. In tal caso deve esistere un modello in cui tutti gli elementi di _KB_ e di _H_ sono veri, quindi nessun sottoinsieme di $H$ deve essere un conflitto per _KB_. \
Una *spiegazione* della proposizione $g$ da $chevron.l K B, A chevron.r$ è uno scenario $H subset.eq A$ che, assieme a $K B$, abbia $g$ come conseguenza, quindi:
- $K B union H models g$ e
- $K B union H cancel(models) "false"$
Essa è *minimale* se $H$ non contiene altre spiegazioni: per ogni altra $H'$ di $g$ da $chevron.l K B, A chevron.r$ deve risultare $H' subset.not H$.
#esempio[
  Si consideri una base di conoscenza con assumibili per la _diagnosi medica_:

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      - _bronchite_ $<-$ _influenza._
      - _bronchite_ $<-$ _fumatore._
      - _tosse_ $<-$ _bronchite._
      - _affanno_ $<-$ _bronchite._
      - _febbre_ $<-$ _influenza._
    ],
    [
      - _febbre_ $<-$ _infezione._
      - _mal\_di\_gola_ $<-$ _influenza._
      - _false_ $<-$ _fumatore_ $and$ _non\_fumatore._
      - `assumable` _fumatore, non\_fumatore, influenza, infezione._
    ]
  )

  Se si osserva _affanno_ (respiro affannoso), due spiegazioni minime, {_influenza_} e {_fumatore_}, che implicano _bronchite_ e _tosse_ (tosse). \
  Se si osservano _affanno_ $and$ _febbre_, spiegazioni minimali: {_influenza_} e {_fumatore,infezione_}. \
  Se si osservano _affanno_ $and$ _non\_fumatore_, spiegazione minimale: {_influenza,non\_fumatore_}. Anche {_fumatore_} potrebbe spiegare _affanno_, ma il vincolo la rende inconsistente rispetto a _non\_fumatore_ osservato.
]

#esempio[
  Si consideri la base di conoscenza:

  - _allarme_ $<-$ _manomissione._
  - _allarme_ $<-$ _incendio._
  - _fumo_ $<-$ _incendio._

  Se si osserva _allarme_, spiegazioni minimali sono: {_manomissione_} e {_incendio_}. \
  Se si osservano _allarme_ $and$ _fumo_, la spiegazione minimale è solo {_incendio_}. Difatti avendo osservato _fumo_ non c'è bisogno di ipotizzare _manomissione_ per spiegare _allarme_, è già spiegato da _incendio_.
]
==== Diagnosi Abduttiva
La _diagnosi abduttiva (AbD)_ formula iptoesi su problemi riscontrati e funzionamento normale. \
Confrontandola con quella basata su consistenza (CbD):
- al livello di _rappresentazione_, la CbD mira solo al comportamento normale quindi le ipotesi saranno assunzioni sul comportamento normale, mentre con la AbD si modella anche il comportamento anomalo, si devono prevedere assumibili anche per ciascun guasto;
- per quanto riguarda le osservazioni, la CbD le aggiunge alla base di conoscenza per poi dimostrare _false_ mentre la AbD le considera come goal da spiegare attraverso ipotesi;
- in termini di qualità, la AbD risulta più dettagliata,le diagnosi sono migliori: si distinguono base di conoscenza e assunzioni consentono di dimostrare le osservazioni, anche per casi in cui non sia definibile la normalità.
==== Ragionamento Abduttivo: Procedure
Il ragionamento abduttivo è basato su assunzioni e si realizza mediante le procedure su clausole di Horn:
- con la procedura BU si calcolano spiegazioni minimali per ogni atomo, essa è ulteriormente specialzizabile con il pruning delle spiegazioni dominate;
- con la procedura TD si trovano spiegazioni di un $g$ generando i conflitti, ma mirando a dimostrare $g$ anzichè _false_: la spiegazione minimale di $g$ sarà un insieme minimale di assumibili raccolti nella prova.
= Rappresentazione e Ragionamento Relazionale
Nel rappresentare la struttura del mondo, è utile ragionare in termini di individui e relazioni. \
Gli *individui* sono entità, cose, oggetti del dominio, e potranno essere _concreti_ (persone, edifici, ecc.), _immaginari_ (unicorni, programmi che superano il Turing test, ecc.) o anche _concetti astratti_, come i processi (ad esempio la lettura di un libro) o  altri concetti (come corsi di studio, istanti di tempo, ecc.). \
Le *relazioni* specificano verità riguardanti gli individui. Possono essere _proprietà_, vere o false, dei singoli individui oppure _proposizioni_ che possono vere o false indipendentemente da specifici individui, e anche associazioni che possono intercorrere tra più individui. \
Con questa rappresentazione il ragionamento su più istanze potrà risultare più semplice in quanto più generale.
#esempio[
Nella rappresentazione proposizionale della domotica, si consideravano atomi senza una vera struttura interna, come $"su_d"_2$, $"su_d"_3$ e $"ok_d"_2$. La rappresentazione non risulta sufficiente a esprimere ad esempio che:
- $"su_d"_2$, $"su_d"_3$ riguardano la stessa proprietà ma individui diversi;
- $"su_d"_2$, $"ok_d"_2$ riguardano proprietà diverse dello stesso individuo.
In alternativa si possono rappresentare esplicitamente e separatamente gli individui $d_1, d_2, d_3$ e le rispettive proprietà _su_ e _ok_. Inoltre si potrà usare la relazione binaria $a_3\_p_1$ per collegare individui, indipendentemente dalle loro proprietà.
]
I vantaggi della nuova rappresentazione sono molteplici:
- essa è più naturale poichè sfrutta la struttura delle feature come proprietà degli individui;
- è utile anche nel caso di _domini sconosciuti_ per i quali non vi sia nessuna conoscenza sugli individui, sul loro numero e carattteristiche: si deve interagire con l'ambiente per apprendere la rappresentazione;
- consente forme di ragionamento più generali e indipendenti dai singoli invidui, con obiettivo quali la derivazione di conclusioni che valgono per tutti gli individui senza conoscerli necessariamente, la scoperta dell'esistenza di nuovi individui e le loro proprietà, a prescindere dagli altri e, inoltre, la possibilità di rispondere a query che riguardano intere popolazioni e non singoli invidui;
- rende possibile il trattamento dell'esistenza incerta di individui: nno si conoscono completamente invidui attuali e futuri, nonchè le loro proprietà;
- rende possibile il ragionamento su un infinito numero di invidui.
== Simboli e Semantica
La logica può risultare molto utile nella progettazione di basi di conoscenza. I progettisti devono caratterizzare un particolare mondo formalizzando la cosiddetta *interpretazione intesa*: scegliendo significati per i simboli in base a tale interpretazione e descrivendo ciò che dev'essere vero attraverso una base di conoscenza fatta di clausole. Chiunque conosca il significato dei simboli può interpretare, rispetto a tale modello, le conseguenze logiche derivata dalla base: ciò che è vero in tutti i modelli della base sarà vero, in particolare, nell'interpretazione intesa.  \
Estendendo il linguaggio delle clausole proposizionali si possono definire atomi con una struttura interna descritti in termini di relazioni e individui. \
Una *concettualizzazione* è un'associazione fra simboli nella mente e gli individui e le relazioni da essi denotati. \
Vi è una separazione tra l'aspetto semantico e quello computazionale: la correttezza della base di conoscenza e delle risposte alla query è definita dalla semantica indipendentemente dall'algoritmo di ragionamento, che si può ottimizzare a patto di rimanere semanticamente corretto.
== Calcolo dei Predicati
Il *calcolo dei predicati* (_logica dei predicati_ o _logica del primo ordine_) estende il calcolo proposizionale in due modi: gli atomi sono dotati di una loro struttura con la possibilità di includere variabili; inoltre, le variabili logiche sono quantificate.
==== Sintassi
Per definire la sintassi, occorre specificare le seguenti nozioni preliminari:
- *simbolo*: stringa alfanumerica che può includere anche "\_";
- *variabile logica*: simbolo che inizia con maiuscola o "\_";
- *costante*: simbolo che inizia con una minuscola o numero o stringa;
- *simbolo di predicato*: simbolo che inizia con una minuscola. Le costanti e i predicati sono distinguibili in base al contesto;
- *termine*: variabile o costante;
- *atomo*: forma _p_ oppure $p(t_1, dots, t_n)$ con _p_ simbolo di predicato e ogni $t_i$ è un termine.
Una *formula logica* viene definita costruttivamente a partire dagli atomi, usando connettivi logici e quantificatori. Date la variabile $X$ e la formula logica _p_:
- $forall X quad p$: si dice che $X$ è quantificata *universalmente*;
- $exists X quad p$: si dice che $X$ è quantificata *esistenzialmente*.
=== Sematica delle formule logiche di base
Un'espressione *ground*, o di lviello base, non contiene variabili. Essa è un atomo o, più in generale, una formula che si riferisce solo a precisi individui. \
Un'*interpretazione* delle espressioni ground è definita da una tripla:
$
I = chevron.l D, phi, pi chevron.r
$
ove
- il *dominio* _D_ è un insieme non vuoto di *individui*;
- la funzione $phi: c |-> phi(c)i in D$ assegna a ogni costante $c$ un individuo di $D$;
- la funzione $pi: p |-> pi(p)$ assegna a ogni simbolo di predicato $n$-ario $p$ una funzione $pi(p): D^n |-> brace.l "true, false" brace.r$ che per ogni $n$-pla di individui $chevron.l i_1, dots, i_n chevron.r in D^n$, $pi(p)$ specifica se la relazione $p$ sia vera o falsa: $pi(p)(chevron.l i_1, dots, i_n chevron.r) in {"true, false"}$;
	- $pi$ è una *funzione di ordine superiore* in quanto associa un nome di predicato a una funzione;
	- se $p$ non ha argomenti (arietà $n = 0$) allora $pi(p)$ sarà una funzione costante: true o false.
==== Semantica degli atomi ground
Nell'interpretazione _I_, ogni termine ground _c_ denota un individui $phi(c)$. Nell'interpretazione $I$, l'atomo ground $p(t_1, dots, t_n)$ è *vero* se $pi(p)(chevron.l t'_1, dots, t'_n chevron.r) = "true"$ ed è *falso*, altrimenti.
=== Semantica: Interpretazione delle Variabili
Un'*assegnazione* di variabili $rho$ è una funzione dall'insieme delle variabili a $D$ che associa un elemento del dominio a ogni variabile. \
Data l'interpretazione $I = chevron.l D, phi, pi, chevron.r$ e l'assegnazione $rho$, ogni termine denota un individuo in $D$ interpretato da $phi$ se costante, da $rho$ se variabile. La semantica degli atomi è definita come visto in precedenza, ottenuti associando invidui ai termini.
==== Semantica della Quantificazione
Una formula _universalmente quantificata_ $forall X quad p$ è *vera* in un'interpretazione se $p$ è vera per ogni assegnazione di $X$ e sarà falsa se c'è un'assegnazione a $X$ per la quale la formula risulti falsa: la formula $p$ costituisce l'*ambito* di $X$. \
Una formula esistenzialmente quantificata $exists X quad p$ è *vera* in un'interpretazione se e solo se $p$ è vera per qualche assegnazione di $X$: l'individuo assegnato può dipendere da variabili universalmente quantificate nel cui ambito compaia $exists X quad p$:
- in $forall Y(exists X quad p)$, $X$ può dipendere da  $Y$;
- in $exists X(forall Y quad p)$, $X$ non può dipendere da $Y$ poichè $X$ non è nell'ambito di $Y$.
==== Semantica delle Formule e Conseguenza Logica
Una *formula* con variabili è *vera* in _I_ se e solo se per qualsiasi assegnazione $rho$ la formula ground ottenuta applicando $rho$ alle sua variabili risulta vera. \
Una formula si dice *aperta* se ha almeno una variabile non quantificata, per cui la sua semantica non può essere determinata. \
La nozione di modello e la relazione di *conseguenza logica* fra una data base di conoscenza _KB_ e un goal _g_ si estende al caso delle formule logiche del calcolo dei predicati:
$
K B models g "se "g "è vera in ogni modello di" K B
$
=== Semantica: la Prospettiva Umana
Estendendo la metodologia introdotta per le basi di conoscenza proposizionali:
+ si seleziona il dominio del task ossia il mondo da rappresentare, definendo:
	- $D$ insieme di tutti gli individui cui si farà riferimento e sui quali ragionare
	- le _relazioni_ da rappresentare;
		- aspetti specifici del mondo reale (ad esempio la struttura dei cordi e studenti presso un'università);
		- mondi immaginari o ipotetici;
		- mondi astratti (ad esempio numeri e insiemi).
+ si associano le _costanti_ del linguaggio a individui del mondo da nominare:
	- a ogni elemento di $D$ si assegna una costante per riferirvisi, ad esempio _gino_ per un particolare docente, _inf322_ per un corso, ecc;
+ si associa un simbolo di _predicato_ a ogni relazione da rappresentare, associazioni simbolo-significato per costituire l'*interpretazione intesa*:
	- un simbolo ($n$-ario) denota una funzione $D^n -> brace.l "true, false" brace.r$, basta specificare le $n$-ple per le quali la relazione sia vera. Ad esempio il predicato _insegna_ binario rappresenta una relazione vera tra un individuo e un corso insegnato.
	- le relazioni possono avere qualunque arietà (anche nulla), ad esempio _is\_red_ è un predicato unario;
+ si definisce l'*assiomatizzazione del dominio*, ossia _formule_ vere nell'interpretazione intesa
	- *assiomi* del dominio in forma di clausole, ad esempio se la persona denotata da _gino_ insegna il corso denotato da _inf322_, la formula _insegna(gino, inf322)_ sarà vera nell'interpretazione intesa;
+ si possono formulare _query_ riguardanti l'interpretazione intesa:
	- risposte del sistema da interpretare nella semantica attribuita ai simboli.
#esempio[
concettualizzazioni diverse di un colore: il _rosa_.
- colore come simbolo di predicato unario: atomo vero se l'individuo dell'argomento è rosa: _rosa(i)_;
- colore come _individuo_: rosa rappresenta il colore rosa, secondo argomento per un predicato binario _colore(i, c)_;
- a basso livello di dettaglio: le diverse sfumature di rosso risultano indistinguibili, non si considera il colore rosa ma solo _rosso_;
- aumentando il dettaglio; si considera rosa come termine generale, prevedendo anche _corallo_ o _salmone_.
]
== Datalog: Linguaggio Relazione a Regole
Il *Datalog* estende il linguaggio delle clausole definite proposizionali con la sintassi del calcolo dei predicati. \
Una *clausola definita* si scrive nella forma:
$
h <- a_1 and dots and a_m
$
e si legge "_h_ se $a_1$ e $dots$ e $a_m$", dove:
- l'atomo _h_ è la *testa* della clausola;
	- se $m > 0$ si dice *regola* e la congiunzione di atomi $a_1 and dots and a_m$ ne costituisce il *corpo*
	- se $m = 0$ la clausola si dice clausola *atomica* o *fatto*
- le variabili contenute sonod a intendersi implicitamente quantificate universalmente, ad esempio $h(X) <- b(X, Y)$ è da intendersi come $forall X forall Y (h(X) <- b(X, Y))$, che è equivalente a $forall X (h(X) <- exists Y b(X, Y))$.
#esempio(title: "Impianto elettrico")[
Esempio, @es:impianto_elettrico, rivisitato con individui e relazioni.
+ _individui_: secondo il livello di astrazione scelto
	- ogni deviatore, luce, presa;
	- ogni cavo tra deviatori o tra deviatore e luce;
	- si assume un modello di flusso dell'elettricità in cui l'energia fluisca dall'esterno della casa attraverso i cavi e verso le luci, appropriato dovendo determinare se una luce dev'essere accesa o meno, ma potrebbero non esserlo per altri task
+ _nomi_ da dare a ciascun individuo al quale ci si vorrà riferire, ad esempio $c_0$ è il cavo tra la luce $l_1$ e il deviatore $d_2$
+ _relazioni_ da rappresentare: predicato con le interpretazioni intese associate
	- `luce(L)` è vero se l'individuo denotato da $L$ è una luce;
	- `accesa(L)` è vero se la luce _L_ è accesa ed emette luce;
	- `alimentato(W)` è vero se passa corrente attraverso $W$, ossia se $W$ è in tensione;
	- `su(S)` è vero se il deviatore $S$ è su;
	- `giu(S)` è vero se il deviatore $S$ è giù;
	- `ok(E)` è vero se $E$ non è guasto; $E$ salvavita o luce;
	- `connesso_con(X, Y)` è vero se il componente $X$ è connesso con $Y$ in modo che la corrente passi da $Y$ a $X$
+ base di _assiomi_ per la macchina
	- _regole_ generali come $"accesa"(L) <- "luce"(L) and "alimentato"(L) and "ok"(L)$ anche ricorsive, come $"alimentato"(X) <- "connesso_con"(X, Y) and  "alimentato"(Y)$ con $"alimentato(esterno)"$.
	- _fatti_ per la sua configuraszione di un impianto specifico: $"luce"(l_1), "luce"(l_2), "giu"(d_1), "su"(d_2), "ok(interruttore"_1)$ e inoltre:
		- $"connesso_con"(c_0, c_1) <- "su"(d_2)$
		- $"connesso_con"(c_0, c_2) <- "giu"(d_2)$
		- $"connesso_con"(c_1, c_3) <- "su"(d_1)$
		- $"connesso_con"(c_3, "esterno") <- "ok(interruttore"_1)$
+ la macchina saprà quindi rispondere a query su questo impianto domestico in particolare.
]
==== Query con variabili
Una *query* serve a chiedere se un enunciato sia conseguenza logica di una base di conoscenza. Le query _decisionali_ sono quelle tipiche della logica proposizionali e hanno come risposta `yes` o `no`. Le query _con variabili_ consentono, in aggiunta, di determinare e restituire tuple di individui per le quali la query si avvera. \
Si dirà *istanza* di una query la formula ottenuta sostituendo termini a variabili: ogni occorrenza di una variabile dev'essere sostituita con uno stesso termine. L'*estrazione della risposta* serve a determinare quali istanze seguano dalla base di conoscenza. Le *risposte* possibili per una query con variabili libere sono:
- _istanze_ della query che seguono logicamente dalla base, una per ciascuna distinta tupla di valori assegnabile alle variabili della query, oppure
- `no`, se nessuna istanza segue logicamente dalla base (ciò non significa che la query sia falsa nell'interpretazione intesa).
#esempio[
Dati i seguenti fatti riguardanti i paesi del SudAmerica

- _paese(C)_ – vero se $C$ è un paese
  - _paese(argentina)._
  - _paese(brasile)._
  - _paese(cile)._
  - _paese(paraguay)._
  - _paese(peru)._

- _superficie(C, A)_ – vero se $C$ ha superficie $A$ in Kmq
  - _superficie(argentina, 2780400)._
  - _superficie(brasile, 8515767)._
  - _superficie(cile, 756102)._
  - _superficie(paraguay, 406756)._
  - _superficie(peru, 1285216)._

- _lingua(C, L)_ – vero se $L$ lingua principale di $C$
  - _lingua(argentina, spagnolo)._
  - _lingua(brasile, portoghese)._
  - _lingua(cile, spagnolo)._
  - _lingua(paraguay, spagnolo)._
  - _lingua(peru, spagnolo)._

- _confina\_con_$a$($C_1, C_2$) – vero se $C_1$ e $C_2$ confinano e $C_1 <= C_2$ alfabeticamente
  - _confina\_con_$a$_(\argentina, brasile)._
  - _confina\_con_$a$_(\argentina, cile)._
  - _confina\_con_$a$_(\argentina, paraguay)._
  - _confina\_con_$a$_(\brasile, paraguay)._
  - _confina\_con_$a$_(\brasile, peru)._
  - _confina\_con_$a$_(\cile, peru)._

- _confina\_con_($C_1, C_2$) – vero se $C_1$ e $C_2$ confinano
  - _confina\_con(X, Y)_ $<-$ _confina\_con_$a$_(X, Y)._
  - _confina\_con(X, Y)_ $<-$ _confina\_con_$a$_(Y, X)._

Si possono formulare le seguenti query per le quali si ottengono le risposte riportate:
- ask _lingua(cile, spagnolo)._ \
  risposta: yes;
- ask _lingua(venezuela, spagnolo)._ \
  no, la query non è conseguenza logica (conoscenza insufficiente) ma non dice che sia falsa in generale;
- ask _lingua(X, spagnolo)._ \
  4 risposte fra cui quella con $X = italic("cile")$ per la quale _lingua(cile, spagnolo)_ risulta conseguenza logica della base di conoscenza;
- ask _confina\_con_$a$_(paraguay, X)._ \
  nessuna risposta;
- ask _confina\_con(paraguay, X)._ \
  risposte $X = italic("argentina")$ e $X = italic("brasile")$.
- ask _confina\_con(X, Y)._ \
  12 risposte;
- ask _confina\_con(cile, Y)_ $and$ _superficie(Y, A)_ $and$ $A > 2000000$. \
  si noti che il predicato $>$ (tipicamente predefinito) ha argomenti numerici ed è qui scritto in forma infissa.

Aggiungendo altri fatti
- _capitale(A, B)_ – vero se $B$ capitale di $A$
  - _capitale(argentina, buenos\_aires)._
  - _capitale(cile, santiago)._
  - _capitale(peru, lima)._
  - _capitale(brasile, brasilia)._
  - _capitale(paraguay, asuncion)._

- _nome(E, N)_ – vero se la stringa $N$ è il nome di $E$
  - _nome(buenos\_aires, "Buenos Aires")._
  - _nome(santiago, "Santiago")._
  - _nome(lima, "Lima")._
  - _nome(brasilia, "Brasilia")._
  - _nome(asuncion, "Asunción")._
  - _nome(argentina, "Argentina")._
  - _nome(cile, "Cile")._
  - _nome(peru, "Perù")._
  - _nome(brasile, "Brasile")._
  - _nome(paraguay, "Paraguay")._

Una query potrebbe chiedere il nome della capitale del Cile: \
ask _capitale(cile, C)_ $and$ _nome(C, N)._
]
== Sostituzioni e Dimostrazioni
Per implementare il ragionamento su basi di conoscenza e query Datalog si possono generalizzare le procedure bottom-up e top-down per basi di clausole definite proposizionali. Si ponga attenzione al fatto che in clausola Datalog una variabile _libera_ indica che tutte le istanze della clausola dovranno essere vere, al variare delle possibili assegnazioni. Una dimostrazione potrà anche basarsi su istanze diverse di una stessa clausola.
=== Istanze e Sostituzioni
Come per le query, un'*istanza* di clausola si ottiene sostituendo variabili con termini uniformemente: ogni occorrenza di una data variabile dev'essere sostituta con lo stesso termine. Una *sostituzione*. Una *sostituzione* specifica, per ciascuna variabile, il termine da sostituire:
$
brace.l V_1 slash t_1, dots, V_n slash t_n brace.r
$
- ogni $V_i$ è una distinta variabile e ogniu $t_i$ è un termine;
- ogni $V_i slash t_i$ si dice *binding* per la variabile $V_i$ e si dirà in *forma normale* se nessuna $V_i$ occorre in un $t_j$.
#esempio[
Sostituzioni:
- $brace.l X slash Y, Z slash "cile" brace.r$ è una sostituzione in forma normale;
- $brace.l X slash Y, Z slash X brace.r$ non è in forma normale: $X$ occorre sia a sinistra sia a destra di associazioni diverse.
]
Un'_espressione_ è un termine, un atomo o una clausola. Un'*istanza* $e sigma$ dell'espressione _e_ si ottiene dall'*applicazione* di $sigma = brace.l V_1 slash t_1, dots, V_n slash t_n$ a $e$: ogni occorrenza di $V_i$ va sostituita con $t_i$. L'istanza si dice *ground* se non contiene variabili.
#esempio[
Diverse applicazioni di sostituzioni ad atomi:

- _confina\_con(peru, X)_ $\{X \/ italic("cile")\} =$ _confina\_con(peru, cile)_
- _confina\_con(Y, cile)_ $\{Y \/ italic("peru")\} =$ _confina\_con(peru, cile)_
- _confina\_con(peru, X)_ $\{Y \/ italic("peru"), Z \/ X\} =$ _confina\_con(peru, X)_
- $p(X, X, Y, Y, Z)\{X \/ Z, Y \/ italic("brasile")\} = p(Z, Z, italic("brasile"), italic("brasile"), Z)$

Le sostituzioni si applicano anche alle clausole: data $sigma = \{X \/ Y, Z \/ italic("peru")\}$, \
$[p(X, Y) <- q(italic("peru"), Z, X, Y, Z)] sigma = p(Y, Y) <- q(italic("peru"), italic("peru"), Y, Y, italic("peru"))$
]
Un *unificatore* delle espressioni $e_1$ e $e_2$ è una sostituzione $sigma$ tale che
$
e_1 sigma = e_2 sigma
$
Quando esiste un tale unificatore si dice che $e_1$ e $e_2$ sono _unificabili_ o che si _unificano_.
#esempio(title:"Esempi di unificatori")[
- $\{X \/ italic("cile"), Y \/ italic("peru")\}$ è un unificatore per _confina\_con(peru, X)_ e _confina\_con(Y, cile)_ \
  dalla cui applicazione si ottiene: _confina\_con(peru, cile)_
- $\{X \/ a, Y \/ b\}$ unificatore di $t(a, Y, c)$ e $t(X, b, c)$ \
  per cui: $t(a, Y, c)\{X \/ a, Y \/ b\} = t(X, b, c)\{X \/ a, Y \/ b\} = t(a, b, c)$

Diversi unificatori possibili di $p(X, Y)$ e $p(Z, Z)$ sono: \
$\{X \/ b, Y \/ b, Z \/ b\}$, $\{X \/ c, Y \/ c, Z \/ c\}$, $\{X \/ Z, Y \/ Z\}$, $\{Y \/ X, Z \/ X\}$, ecc.

- i primi due specificano precisamente i valori sostituiti
- gli altri due sono _più generali_.
]
L'*unificatore più generale*, _most general unifier, MGU_ $sigma$ di $e_1$ ed $e_2$ è l'unificatore tale che, considerato qualunque altro loro unificatore $sigma'$, risulta che $e sigma'$ è un'istanza di $e sigma$, per ogni espressione $e$. \
Si dirà che $e_1$ è una *ridenominazione* di $e_2$ se e solo se esse sono istanze l'una dell'altra, ossia differiscono solo nei nomi delle variabili. Due espressioni unificabili avranno almeno un MGU e, applicando loro degli MGU, si otterranno renaming reciproci: dati $sigma$ e $sigma'$ MGU di $e_1$ ed $e_2$ si ha che $e_1 sigma$ è un renaming di $e_1 sigma'$ (analogamente per $e_2$).
#esempio[
Due MGU degli atomi $p(X, Y)$ e $p(Z, Z)$ sono $brace.l X slash Z, Y slash Z brace.r$ e $brace.l Z slash X, Y slash X brace.r$. Applicando entrambi a $p(X, Y)$ si ottengono: $p(X, Y) brace.l X slash Z, Y slash Z brace.r = p(Z, Z)$ e $p(X, Y)brace.l Z slash X, Y slash X brace.r = p(X, X)$ che è un renaming di $p(Z, Z)$.
]
=== Procedura Bottom-up con Variabili
Per estendere la procedura bottom-up proposizionale al Datalog, si deve effettuare preventivamente il *grounding* degli assiomi della base di conoscenza ottenendo le _istanze ground_ delle clausole, sostituendo uniformemente nelle clausole costanti a variabili. Le costanti da considerare sono quelle che occorrono nella base di conoscenza o nella query. Qualora non ve ne fossero, se ne deve inventare una nuova.
#esempio[
Data la base di conoscenza con le clausole Datalog;
- _q(a)_
- _q(b)_
- _r(a)_
- $s(W) <- r(W)$
- $p(X, Y) <- q(X) and S(Y)$
Tutte le istanze ground saranno:
- _q(a)_
- _q(b)_
- _r(a)_
- $s(a) <- r(a)$
- $s(b) <- r(b)$
- $p(a, a) <- q(a) and s(a)$
- $p(a, b) <- q(a) and s(b)$
- $p(b, a) <- q(b) and s(a)$
- $p(b, b) <- q(b) and s(b)$
Applicando la procedura BU proposizionale si derivano atomi _ground_. È facile desumere che possibili conseguenza logiche sono: $q(a), q(b), r(a), s(a), p(a, a), p(b, a)$
]
#esempio[
Data la base di conoscenza con:
- $p(X, Y)$
- $g <- p(W, W)$
e la query $"ask" g$, la procedura BU introduce ad hoc la nuova costante $c$. Il grounding della base sarà:
- $p(c, c)$
- $g <- p(c, c)$
La BU proposizionale deriva $brace.l p(c, c), g brace.r$, per cui la rispota è `yes`. \
Per la query ask $p(b, d)$, il grounding della base sarà:
- $p(b, b)$
- $p(b, d)$
- $p(d, b)$
- $p(d, d)$
- $g <- p(b, b)$
- $g <- p(d, d)$
La BU proposizionale deriva $brace.l p(b, b), p(b, d), p(d, b), p(d, d), g brace.r$ per cui la risposta è `yes`.
]
Si può dimostrare che la procedura BU, applicata al grounding di una base di conoscenza, è *corretta* e *completa*.
=== Unificazione
Dati due termini o atomi, occorre determinare se si unificano e, nel caso, restituire un loro unificatore. \
Il seguente algoritmo consente di trovare un eventuale MGU di due atomi o termini e, altrimenti, restituisce $perp$ per indicare la mancata unificabilità.
#algoritmo(title: [Algoritmo di unificazione])[
  #pseudocode-list[
    + *procedure* $"Unify"(t_1, t_2)$
    + *Inputs*
      + $t_1, t_2$: atomi o termini
    + *Output*
      + MGU di $t_1$ e $t_2$ se esiste, altrimenti $bot$
    + *Local*
      + $E$: insieme di uguaglianze
      + $S$: sostituzione
    + $E <- {t_1 = t_2}$
    + $S = emptyset$
    + *while* $E != emptyset$ *do*
      + selezionare e rimuovere $alpha = beta$ da $E$
      + *if* $beta$ non identica ad $alpha$ *then*
        + *if* $alpha$ variabile *then*
          + sostituire $alpha$ con $beta$ ovunque in $E$ e $S$
          + $S <- {alpha slash beta} union S$
        + *else if* $beta$ variabile *then*
          + sostituire $beta$ con $alpha$ ovunque in $E$ e $S$
          + $S <- {beta slash alpha} union S$
        + *else if* $alpha$ è $p(a_1, dots, a_n)$ e $beta$ è $p(b_1, dots, b_n)$ *then*
          + $E <- E union {a_1 = b_1, dots, a_n = b_n}$
        + *else return* $bot$
    + *return* $S$
  ]
] <alg:unificazione>
L'algoritmo lavora su un insieme $E$ di uguaglianze ($alpha = beta$) che implicano e sono implicate dall'unificazione e un insieme $S$ di binding che formeranno la sostituzione cercata. Se $alpha slash beta in S$ allora, per costruzione, $alpha$ sarà una variabile che non appare altrove in $S$ o in $E$. Nel caso in cui $alpha$ e $beta$ siano atomi, essi devono avere stesso simbolo di predicato e stessa arietà, altrimenti l'unificazione fallisce.
#esempio[
Volendo unificare $p(X, Y, Y)$ e $p(a, Z, b)$:
- $E = brace.l p(X, Y, Y) = p(a, Z, b)$ e $S = brace.l brace.r$, inizialmente;
- $E = brace.l X = a, Y = Z, Y = b brace.r$, dopo la prima iterata;
- $E = brace.l Y = Z, Y = b brace.r, S = brace.l X slash a brace.r$;
- $E = brace.l Z = b brace.r, S = brace.l X slash a, Y slash Z brace.r$
- $E = brace.l brace.r, S = brace.l X slash a, Y slash b, Z slash b$
Il risultato finale è _S_. \
Provando a unificare $p(a, Y, Y)$ e $p(Z, Z, b)$:
- $E = brace.l p(a, Y, Y) = p(Z, Z, b) brace.r, S = brace.l brace.r$, inizialmente;
- $E = brace.l a = Z, Y = Z, Y = b brace.r$
- $E = brace.l Y = a, Y = b brace.r$
- $E = brace.l a = b brace.r$
resta $a = b$ ma le costanti $a$ e $b$ non sono uficabili, quindi si restituisce $perp$.
]
=== Risoluzione Definita con Variabili
La proceudura top-down proposizionale può essere estesa per gestire le variabili ammettendo istanze di regole nella derivazione. \
Una *clausola di risposta generalizzata* avrà la forma:
$
y e s(t_1, dots, t_k) <- a_1 and a_2 and dots and a_m
$
dove $t_1, dots, t_k$ sono termini e gli $a_1, dots, a_m$ sono atomi. \
L'uso del predicato `yes` consente l'estrazione della risposta, ossia di determinare quali istanze ella query seguano logicamente da una base di clausole definite. \
Data la query _q_, si considera in partenza la clausola di risposta iniziale:
$
y e s(V_1, dots, V_k) <- q
$
dove $V_1, dots, V_k$ sono le variabili della query $q$. Intuitivamente, un'istanza di $y e s(V_1, dots, V_k)$ risulta vera se la corrispondente istanza di _q_ è vera. In ogni fase successiva, l'algoritmo
+ seleziona un atomo nel corpo della clausola di risposta corrente;
+ sceglie una clausola di _KB_ la cui testa si unifichi con tale atomo.
Nella *risoluzione SLD*, avendo selezionato $a_1$ della clausola di risposta generalizata corrente $y e s(t_1, dots, t_k) <- underline(a_1) and a_2 and dots and a_m$, se la clausola scleta dalla base di conoscenza è:
$
a <- b_1 and dots and b_p
$
con $a_1$ e $a$ unificabili da un MGU $sigma$, la risolvente sarà la nuova clausola di risposta:
$
[y e s(t_1, dots, t_k) <- b_1 and dots and b_p and a_2 and dots and a_m]sigma
$
Ripetendo passi di risoluzione si ottiene una *derivazione SLD*, ossia una sequenza $gamma_0, gamma_1, dots, gamma_n$ di clausole di risposta in cui:
- $gamma_0$ è una clausola di risposta corrispondente alla query originaria $q$;
	date $V_1, dots, V_k$ variabili libere di $q: y e s(V_1, dots, V_k) <- q$
- ogni $gamma_i$ si ottiene per risoluzione SLD:
	- selezionando $a_1$ nel corpo di $gamma_(i-1)$;
	- scegliendo dalla base di conoscenza una copia $a <- b_1 and dots and b_p$ la cui testa $a$ si unifichi con $a_i$ tramite un certo MGU $sigma$;
	- sostituendo $a_1$ con il corpo $b_1 and dots and b_p$;
	- applicando $sigma$ alla clausola di risposta risultante;
- $gamma_n$ sarà la *risposta* della forma $y e s(t_1, dots, t_k) <-$ di una dimostrazione terminata con successo. In risposta alla query si restituirà: $V_1 = t_1, dots, V_k = t_k$ dove i $t_i$ sono i termini determinati dai binding delle variabili della query $V_i$.
#algoritmo(title: [Algoritmo di dimostrazione top-down per il Datalog])[
  #pseudocode-list[
    + *non-deterministic procedure* $"Prove_datalog_TD"(K B, q)$
    + *Input*
      + $K B$: insieme di clausole definite
      + Query $q$: insieme di atomi da provare, con variabili $V_1, dots, V_k$
    + *Output*
      + sostituzione $theta$ se $K B models q theta$ altrimenti fallisce
    + *Local*
      + $G$: clausola di risposta generalizzata
    + Impostare $G$ a $"yes"(V_1, dots, V_k) <- q$
    + *while* $G$ non è una risposta *do*
      + Sia $G = "yes"(t_1, dots, t_k) <- a_1 and a_2 and dots and a_m$
      + Selezionare l'atomo $a_1$ nel corpo di $G$
      + Scegliere una clausola $a <- b_1 and dots and b_p in K B$
      + ridenominando tutte le variabili con nuovi nomi
      + Sia $sigma <- "Unify"(a_1, a)$
      + *if* $sigma = bot$ *then* fallire
      + Assegna a $G$ la clausola $("yes"(t_1, dots, t_k) <- b_1 and dots and b_p and a_2 and dots and a_m) sigma$
    + *return* $\{V_1 = t_1, dots, V_k = t_k\}$ dove $G$ è $"yes"(t_1, dots, t_k) <-$
  ]
] <alg:datalog-top-down>
La procedura top down per KB Datalog è non deterministica: si possono trovare tutte le derivazioni tentando altre scelte che portino al successo. Essa fallisce se tutte le scelte portano al fallimento: non esiste alcuna derivazione. \
La scelta della clausola può essere implementata come algoritmo di ricerca, come nel caso proposizionale, mantenendo la lista degli atomi da dimostrare.
#esempio(title:"Shakira")[
Data una base di conoscenza:
- _luogo\_nascita(shakira, barranquilla)._
- _luogo\_nascita(P, L)_ $<-$ _parte\_di(S, L)_ $and$ _luogo\_nascita(P, S)._
- _parte\_di(barranquilla, atlantico)._
- _parte\_di(atlantico, colombia)._
- _parte\_di(colombia, america\_del\_sud)._

per rispondere alla query \
ask _luogo\_nascita(P, colombia)._ \
si può costruire la _derivazione_ seguente:

- _yes(P)_ $<-$ _luogo\_nascita(P, colombia)._ \
  risolta con _luogo\_nascita_($P_1, L_1$) $<-$ _parte\_di_($d_1, L_1$) $and$ _luogo\_nascita_($P_1, d_1$). \
  usando $\{P_1 \/ P, L_1 \/ italic("colombia")\}$;

- _yes(P)_ $<-$ _parte\_di_($d_1$, _colombia_) $and$ _luogo\_nascita_($P, d_1$). \
  risolta con _parte\_di(atlantico, colombia)._ \
  usando $\{d_1 \/ italic("atlantico")\}$;

- _yes(P)_ $<-$ _luogo\_nascita(P, atlantico)._ \
  risolta con _luogo\_nascita_($P_2, L_2$) $<-$ _parte\_di_($d_2, L_2$) $and$ _luogo\_nascita_($P_2, d_2$). \
  usando $\{P_2 \/ P, L_2 \/ italic("atlantico")\}$;

- _yes(P)_ $<-$ _parte\_di_($d_2$, _atlantico_) $and$ _luogo\_nascita_($P, d_2$). \
  risolta con _parte\_di(barranquilla, atlantico)._ usando $\{d_2 \/ italic("barranquilla")\}$;

- _yes(P)_ $<-$ _luogo\_nascita(P, barranquilla)._ \
  risolta con _luogo\_nascita(shakira, barranquilla)._ \
  usando $\{P \/ italic("shakira")\}$;

- _yes(shakira)_ $<- .$
]
== Simboli di Funzione e Strutture dati
Il Datalog richiede un nome (simbolo di costante) per ogni individuo sul quale si debba ragionare. Spesso risulta più semplice identificare un individuo indirettamente, ossia _in termini di altri individui_. \
Considerando una costante per individuo, si può rappresentare solo un numero inito di invididui, fissato alla costruzione della base di conoscenza. Per ragionare su un dominio potenzialmente _infinito_ si fa ricorso alla *programmazione logica*, e in particolare, al linguaggio Prolog.
#esempio[
Vediamo alcuni esempi:
+ Riferimenti temporali:
	- _orari_:
		- una costante per ogni orario, ad esempio `inizio-lezione: 1.30 p.m.`;
		- numero di ore dopo mezzanotte e numero di minuti dopo l'ora.
	- _date_:
		- una costante per data (sono infinite);
		- più facile in termini di `anno, mese, giorno`
+ Sistema QA:
	- se gli individui sono le _frasi_ servirebbero troppi nomi;
	- se le frasi fossero raprpesentate come sequenze di parole:
		- nella pratica si potrebbero usare solo un vocabolario finito di parole;
		- oppure aveva parole costituite come sequenze di sillabe o lettere.
+ Liste (di studenti):
	- lista come individuo con sue proprietà come `lunghezza, elemento_i`
	- oppure scegliendo un nome a ciascuna lista, ma è poco pratico;
	- o definendo le liste in termini dei loro elementi.
]
Le funzioni consentono di descrivere individui indirettamente, in termini di altri individui. Alla sintassi si aggiunge la nozione di _simbolo_ di *funzione*, una parola che comincia con una lettera minuscola. Quindi il linguaggio viene esteso nella nozione di *termine* che potrà essere una variabile, una costante o avere la forma
$
f(t_1, dots, t_n)
$
dove $f$ è un simbolo di funzione ($n$-aria) e i $t_i$ sono termini. Nelle clausole i termini possono comparire esclusivamente all'interno di atomi: le funzioni sono distinte dai predicati. \
In ogni interpretazione $chevron.l D, phi, pi chevron.r$ la $phi$ dev'essere estesa: si assegna una funzione $D^n |-> D$ a ogni simbolo di funzione $n$-aria: essa, per ogni termien ground, deve specificare l'individuo denotato. Le costanti possono essere viste come funzioni $0$-arie, cioè senza argomenti.
#esempio[
Per definire delle date si possono usare
_costanti_:
- numeri interi naturali;
- _gen, feb, mar, apr, mag, giu, lug, ago, set, ott, nov, dic_;
_funzioni_: (definizione _estensionale_)
	- _ce_ per date _common era_: $c e(Y, M, D)$ date con anno $Y$, mese $M$ e giorno $D$
	- _bce_ per date prima della _common era_;
_predicati_:
	- _mese(M, N)_ vero se $M$ mese dall'anno con numero d'ordine $N$, ad esempio _mese(gen, 1)_
	- $italic("precede")(D_1, D_2)$ vero se $D_1$ precede $D_2$
Il predicato $<$ rappresenta la relazione `minore_di` sugli interi, può essere descritto in termini di clausole, ma più spesso è predefinito.
]
==== Programmazione Logica
Qualunque funzione computabile può essere calcolata usando una base di clausola con simboli di funzione ossia è interpretabile come *programma logico* (adottando una _semantica operazionale_). \
Il linguaggio dei programmi logici è _Turing equivalente_. Con un solo simbolo di funzione e una sola costante, si può definire un numero infinito di termini o atomi ground che consente di ragionare su un numero di individui potenzialmente infinito. Inoltre, con le funzioni si possono definire le tipiche *strutture dati* per i linguaggi di programmazione.
#esempio[
Struttura di albero (con etichette). \
_funzioni_:
- _nodo(N, LT, RT):_ denota un nodo interno di un albero con il nome $N$ e due (sotto)-alberi sinistro _LT_ e destro _RT_;
- _foglia(L)_: indica un nodo-foglia con etichetta _L_;
_relazioni_ definita in forma ricorsiva:
- _alla\_foglia(L, T)_ vera se _L_ è l'etichetta di una foglia dell'albero _T_:
	- _alla\_foglia(L, foglia(L))_
	- _alla\_foglia(L, nodo(N, LT, RT))_ $<-$ _alla\_foglia(L, LT)_
	- _alla\_foglia(L, nodo(N, LT, RT))_ $<-$ _alla\_foglia(L, RT)_
- _al\_nodo(L, T)_ vera se $L$ è l'etichetta di un nodo interno dell'albero $T$:
	- _al\_nodo(L, nodo(L, LT, RT))_;
	- _al\_nodo(L, nodo(N, LT, RT))_ $<-$ _al\_nodo(L, LT)_
	- _al\_nodo(L, nodo(N, LT, RT))_ $<-$ _al\_nodo(L, RT)_
]
=== Procedure di Dimostrazioni con Funzioni
Per gestire i termini con funzioni vanno estese le procedure definite per il Datalog. Il problema principale è che il numero di termini possibili è infinito. \
Nel definire una procedura bottom-up sulla base di quella per basi di clausole definite proposizionali, se si operasse preventivamente il grounding delle clausole, una clausola potrebbe generare un'infinita sequenza di conseguenza sulla base del numero di termini formabili usando le funzioni. \
Una procedura ingenua di grounding potrebbe innescare un problema di *starvation*, con clausole che vengano sistematicamente trascurate.
#esempio[
Base di conoscenza con le clausole:
+ _num(0)_
+ _num(s(N))_ $<-$ _num(N)_
+ $a <- b$
+ $b$
Senza selezione fair, nel _forward chaining_ si selezionerebbe prima la 1. e, successivamente, sempre la 2. che porta ripetutamente a derivare una nuova conseguenza ad ogni iterata: non arrivando a selezionare anche 3. e 4., non si potrà mai derivare $a$ o $b$.
]
Va pertanto considerata una _proprietà_ come la *fairness* del criterio di selezione delle clausole da elaborare che assicura che ogni clausola della base prima o poi debba essere selezionata. La procedura BU con un criterio di selezione _equo (fair)_ risulta completa: ogni conseguenza potrà essere generata. \
Per estendere la procedura TD per il Datalog con il trattamento di termini costruiti da funzioni, occorre una procedura di _unificazione_ che possa seguire ricorsivamente la struttura dei termini in profondità, considerando anche le applicazioni di funzioni a diversi livelli. Nell'algoritmo esteso per trovare MGU, una variabile $X$ non potrà unificarsi con termini $t$ (con $t != X$) in cui essa occorre come, ad esempio, $g(f(X))$. Serve quindi un *controllo di occorrenza* aggiuntivo, senza del quale la procedura non risulterebbe più corretta.
#esempio[
Data una base di conoscenza con una sola clausola:
$
brace.l l t(X, s(X)) brace.r
$
nella sua interpretazione intesa il predicato _lt_ corrisponde al classico _minore di_ definito sul dominio degli interi ee la funzione _successore_ $s(X)$ serve a denotare l'intero $X + 1$. \
Per la query `ask lt(Y, Y)`, la procedura dovrebbe _fallire_: l'atomo è falso nell'interpretazione intesa perchè nessun numero è minore di se stesso. \
Tuttavia se non si impedisse l'unificazione di $X$ e $s(X)$ (per mancato controllo di occorrenza) la dimostrazione avrebbe successo e la correttezza della procedura sarebbe compromessa.
]
In un _algoritmo di unificazione_ con simboli di funzione e _occurs-check_, avendo selezionato $alpha = beta$, si restituisce $perp$ se $alpha$ è una variabile e $beta$ è un termine che la contiene essendo diverso da $alpha$ stesso. Omettendo il controllo, tipicamente per aumentarne l'efficienza, la procedura non sarà più corretta. Una procedura non sound potrebbe derivare un goal _g_ anche quando questo non fosse una conseguenza logica della base di conoscenza.
#esempio(title: "Risoluzione SLD")[
Considerata una base di conoscenza con le clausole
+ _append(c(A, X), Y, c(A, Z))_ $<-$ _append(X, Y, Z)_
+ _append(nil, Z, Z)_
una derivazione per la query
$
"ask" italic("append")(F, c(L, n i l), c(l, c(i, c(s, c(t, n i l )))))
$
è la seguente:
- _yes(F, L)_ $<-$ _append(F, c(L, nil), c(l, c(i, c(s, c(t, nil)))))_
	risolvendo con _append(c($A_1, X_1$), $Y_1$, c($A_1, Z_1$))_ $<-$ _append($X_1, Y_1, Z_1$)_ copia della 1. con variabili ridenominate aggiungendo l'indice 1:
		- sostituzione: $brace.l F slash c(l, X_1), Y_1 slash (L, n i l), A_1 slash l, Z_1 slash c(i, c(s, c(t, n i l)))$
- _yes(c(l, $X_1$), L)_ $<-$ _append($X_1$, c(L, nil), c(i, c(s, c(t, nil))))_:
	risolvendo con _append(c($A_2, X_2$), $Y_2$, c($A_2, Z_2$))_ $<-$ _append($X_2, Y_2, Z_2$)_;
	- sostituzione: $brace.l X_1 slash c(i, X_2), Y_2 slash c(L, n i l), A_2 slash i, Z_2 slash c(s, c(t, n i l))$;
- _yes(c(l, c(i, $X_2$)), L)_ $<-$ _append($X_2$, c(L, nil), c(s, c(t, nil))):_
	rilvendo con _append(c($A_3, X_3$), $Y_3$, c($A_3, Z_3$))_ $<-$ _append($X_3, Y_3, Z_3$)_
	- sostituzione: $brace.l X_2 slash c(s, X_3), Y_3 slash c(L, n i l), A_3 slash s, Z_3 slash c(t, n i l) brace.r$
- _yes(c(l, c(i, c(s, $X_3$))), L)_ $<-$ _append($X_3$, c(L, nil), c(t, nil))_:
	applicabili entrambe le clausole, scegliendo la 1.: si risolve con _append(c($A_4, X_4$), $Y_4$, c($A_4, Z_4$))_ $<-$ _append($X_4, Y_4, Z_4$)_
	- sostituzione: $brace.l X_3 slash c(t, X_4), Y_4 slash c(L, n i l), A_4 slash t, Z_4 slash n i l$;
- _yes(c(l, c(i, c(s, c(t, $X_4$)))), L)_ $<-$ _append($X_4$, c(L, nil), nil)_
qui la dimostrazione fallisce:  le teste delle clausole non si unificano con l'atomo nel corpo. Si torna al punto di scelta precedente:
- _yes(c(l, c(i, c(s, $X_3$))), L)_ $<-$ _append($X_3$, c(L, nil), c(t, nil))_:
	scegliendo invece la 2., si risolve con: _append(nil, $Z_5, Z_5$)_;
	- sostituzione $brace.l Z_5 slash c(t, n i l), X_3 slash n i l, L slash t$;
- _yes(c(l, c(i, c(s, nil))), t)_ $<-$
e la dimostrazione ha successo con risposta $F = c(l, c(i, c(s, n i l))), L = t$
]
==== Liste: Notazione Prolog
Abbreviazioni ammesse nella notazione del Prolog:
- $[ ]$ o _nil_ denotano la lista vuota;
- $[E bar R]$ è la lista con primo elemento $E$ e resto della lista $R$, scritta anche _cons(E, R)_;
- semplificazione: $[X bar [Y]]$ si può scrivere $[X, Y]$, se $Y$ è una sequenza di valori: ad esempio $[a]$ per $[a bar []]$, $[b bar [ a bar n i l]]$ e $[a, b bar C]$ per $[a bar [b bar C]]$
#esempio[
Definizione che usa la notazione:
- _append([ A | X], Y, [A | Z])_ $<-$ _append(X, Y, Z)_
- _append([ ], Z, Z)_
Data la query $"ask" a p p e n d(F, [L], [l, i, s, t])$ \
una risposta che si ottiene è $F = [l, i, s], L = t$. \
La dimostrazione resta la stessa: vengono ridenominate una funzione e una costante.
]
== Uguaglianza
A volte è utile usare più termini per denotare uno stesso individuo: ad esempio i termini $3 * 5, F, 273-258$ e 15 possono denotare lo stesso numero. Altre volte serve che ogni nome si riferisca a un diverso individuoL ad esempio un nome distinto per insegnamenti differenti. Spesso non si sa due nomi denotino lo stesso individuo: ad esempio se `postino_delle_8` e `postino_delle_15` siano la stessa persona. Negli esempi di ragionamento in Datalog presentati in precedenza, tutte le risposte erano valide a prescindere dal fatto che i termini denotassero individui diversi o meno. \
Può essere utile considerare il predicato speciale "$=$" avente un'interpretazione intesa standard _indipendente_ dal dominio da rappresentare. Dati due termini $t_1$ e $t_2$ si può scrivere l'atomo
$
t_1 = t_2
$
e sarà vero in un'interpretazione $I$ se e solo se $t_1$ e $t_2$ in $I$ denotano lo stesso individuo. \
Non si tratta di semplice similarità o identicità ma di _identità_: due nomi per un solo individuo, e non due individui simili del dominio.
=== Ammettere Asserzioni d'Uguaglianza
Spesso è utile poter concludere che termini distinti debbano denotare lo stesso individuo. Se non si ammettono atomi con predicato d'uguaglianza come teste delle clausole, un termine può essere uguale solo a se stesso in ogni interpretazione. Per poter derivare relazioni d'uguaglianza, occorrono clausole con questo tipo di atomi nella testa. Le alternative possibili sono:
+ _assiomatizzare_ l'uguaglianza come un qualunque altro predicato: aggiungere clausole che codifichino l'interpretazione del predicato $=$;
+ definire _procedure speciali_ d'inferenza per l'uguaglianza: attraverso regole di riscrittura, si mappano termini diversi che denotino uno setsso individuo su una forma standard.
=== Unique Names Assumption
In alternativa dell'assiomatizzazione dell'uguaglianza si può adottare una _convezione_. Nella semantica delle clausole definite data in precedenza, la funzione $phi$ non è necessariamente iniettiva, quindi termini diversi possono denotare lo setsso individuo o individui distinti. \
Con l'*assunzione di unicità dei nomi*, o _Unique Names Assumption (UNA)_, termini ground diversi denotano individui distinti. Tale assunzione è tipica del contesto delle basi di dati. Per ogni coppia di termini ground distinti $t_1$ e $t_2$ si assumerà:
$
t_1 != t_2
$
dove $!=$ corrisponde ad assumere la verità di $not(t_1 = t_2)$ in ogni interpretazione. Sotto UNA, un atomo con $!=$ può occorrere nel corpo delle clausole. \
Quindi sotto UNA, termini ground sono identici solo se si unificano. Ciò non vale per termini non ground, ad esempio l'atomo $a != X$ ha istanze vere nelle quali $X$ assume un certo valore, diciamo $b$, e un'istanza falsa in cui $X$ assume il valore $a$. La UNA è utile a integrare conoscenza proveniente dal database, senza essere costretti ad esplicitare troppe distinzioni, come ad esempio quelle tra le persone con nomi diversi. Tuttavia la UNA risulta inappropriata in certi altri casi, come $2 + 2 != 4$.
== Assunzione di Conoscenza Completa
Come visto in precedenza per la Logica Proposizionale, l'*assunzione di conoscenza completa*, consente di derivare conclusioni altrimenti non ammissibili rispetto alla semantica standard della Logica. Così un enunciato che non segua logicamente dalla base di conoscenza potrà essere considerato falso. Come visto in precedenza, questo consente anche di definire una forma di *negazione come fallimento* (NAF). \
Per estendere l'assunzione di conoscenza completo al caso dei programmi logici con variabili e funzioni si devono considerare: _assiomi d'uguaglianza_, la prorietà di _chiusura del dominio_ e una nozione più sofisticata di _completamento_.
#esempio[
Sia data la relazione _student_ definita in una base di conoscenza con le sole clausole:
- _student(gianni)_
- _student(mario)_
- _student(carla)_
Assumendo che la conoscenza sia completa, i tre individui sarebbero gli unici studenti;
$
s t u d e n t(X) <-> X = "gianni" or X = "mario" or X = "carla"
$
ossia si potrebbe dire che, se $X$ è _gianni, mario o carla_, allora è uno studente e se $X$ è studente allora dev'essere uno dei tre. \
L'assunzione di conoscenza completa includa la UNA. Ad esempio, la dimostrazione dell'atomo $not italic("student(gino)")$ richiederebbe di dimostrare $"gino" != "gianni" or  "gino" != "mario" or "gino" != "carla"$, atomi immediatamente provati sotto UNA.
]
Dato un predicato _p_, la clausola
$
p(t_1, dots, t_k) <- B
$
in *forma normale di Clark* diventa
$
p(V_1, dots, V_k) <- exists c_1 dots.c exists c_m quad V_1 = t_1 and dots.c and V_k = t_k and B
$
dive, se la clausola è atomica allora $B$ sarà _true_, le variabili $c_1, dots, c_m$ sono quelle originaria della clausola mentre le variabili $V_1, dots, V_k$ sono nuove variabili aggiuntive. \
Ponendo tutte le clausole per il dato predicato $p$ in forma normale, usando uno stesso insieme di nuove variabili si può scrivere:
$
p(V_1, dots, V_k) <- B_1, quad dots.c quad p(V_1, dots, V_k) <- B_n
$
riassumibili in
$
p(V_1, dots, V_k) <- B_1 or dots.c or B_n
$
Tale enunciato è equivalente all'insieme di clausole originario. \
Il *completamento* del predicato _p_ sarà la formula logica:
$
forall V_1 dots.c forall V_k p(V_1, dots, V_k) <-> B_1 or dots.c or B_n
$
dove, nei corpi, la *negazione come fallimento* ($tilde$)  viene sostituita dlla negazione logica standard ($not$). Dal punto di vista della semantica, $p(V_1, dots, V_k)$ sarà vero se e solo se è vero almeno uno dei corpi $B_i$. \
Il *completamento* di una base di conoscenza comprende i completamenti di ogni predicato che occorre nella base. \
Sotto l'assunzione di conoscenza completa, si possono definire relazioni per la cui definizione le clausole definite non sono sufficientemente espressive.
#esempio[
Date le clausole considerate in precedenza:
- _student(gianni)_
- _student(mario)_
- _student(carla)_
la forma normale sarà:
- _student(V)_ $<- V = $_gianni_
- _student(V)_ $<- V = $_mario_
- _student(V)_ $<- V = $_carla_
Questa definizione è equivalente a
$
s t u d e n t(V) <- V = "gianni" or V = "mario" or V = "carla"
$
quindi il completamento di _student_ è il seguente
$
forall V s t u d e n t(V) <-> V = "gianni" or V = "mario" or V = "carla"
$
]
#esempio(title: "Esami superati")[
Si consideri la definzione ricorsiva di un predicato
- $italic("lista_superati([ ], St, MinPass)")$
- $italic("al_nodo([C|R], St, MinPass)") <- italic("ha_superato(St, C, MinPass)") and italic("al_nodo(R, St, MinPass)")$
In forma normale, cambiando i nomi delle variabili:
- $italic("al_nodo(L, S, M)") <- L = [ ]$
- $italic("al_nodo(L, S, M)") <- exists C exists R L = [C bar R] and italic("ha_superato(S, C, M)") and italic("al_nodo(R, S, M)")$
Il completamento è il seguente:
$
&forall L forall S forall M italic("al_nodo(L, S, M)") <-> L = [space]
or \
&exists C exists R (L = [C bar R] and italic("ha_superato(S, C, M)") and italic("al_nodo(R, S, M)"))
$
]
#esempio[
Si consideri una base di conoscenza con:
- _corso(C)_ vero se _C_ è un corso;
- _iscritto(S, C)_ vero se $S$ è iscritto a $C$.
Senza assunzione di conoscenza completa, non si potrebbe dimostrare _senza\_iscritti(C)_, vero se non ci sono iscritti al corso _C_. \
Con l'assunzione, usando la NAF, la definizione sarebbe:
- _senza\_iscritti(C)_ $<-$ _corso(C)_ $and tilde$ _con\_iscritti(C)_
- _con\_iscritti(C)_ $<-$ _iscritto(S, C)_
da cui il completamento risultante è il seguente:
- $forall C italic("senza_iscritti(C)") <-> italic("corso(C)") and not italic("con_iscritti(C)")$
- $forall c italic("con_iscritti(C)") <-> exists S italic("iscritto(S, C)")$
Occorre cautela nell'inclusione di variabili libere in atomi con la NAF: in genere cambiano il significato inteso. Il predicato _con\_iscritti_ serve ad evitare di avere una varibile libera nel contesto di una negazione tipi $tilde italic("iscritto(S, C)")$
]
==== Procedure Complete di Dimostrazione con NAF
Risulta problematico adottare una procedura TD che possa trattare oltre a variabili e funzioni anche la NAF:
#esempio[
Si consideri la base di conoscenza:
- $p(X) <- tilde q(X) and r(X)$
- $q(a)$
- $q(b)$
- $r(d)$
e la query
$
"ask" p(X)
$
Per la semantica, ci sarebbe una sola risposta: $X = d$ essendo $r(d)$ e $tilde q (d)$ vere, $p(d)$ segue logicamente dalla base di conoscenza. \
Ma la dimostrazione di $p(X)$ con la procedura TD fallisce:
- selezionato $tilde q(X)$, la procedura riesce a dimostrare $q(X)$ con $brace.l X slash a brace.r$
- mentre $p(X)$ vero se $brace.l X slash d brace.r$ essendo $tilde q(d)$ e $r(d)$
Questo mostra che la procedura TD risulta _incompleta_ e _non corretta_: ad esempio, aggiungendo alla base di conoscenza la clausola $s(X) <- tilde q(X)$, dal fallimento di $q(X)$ si arriverebbe a poter derivare erroneamnte $s(X)$.
]
Per evitare i problemi causati da _variabili libere nei goal negati_ la procedura dovrebbe posticipare tali sotto-obiettivi fino a quando le variabili libere non vengano legate. Qualora ciò non fosse possibile in alcun modo, la dimostrazione del goal si inceppa (_flounders_) e non si potrà concludere nulla su tale goal.
#esempio[
Data la base di conoscenza:
- $p(X) <- tilde q(X)$
- $q(X) <- tilde r(X)$
- $r(a)$
con completamento:
- $p(X) <-> not q(X)$
- $q(X) <-> not r(X)$
- $r(X) <-> X = a$
e la query
$
"ask" p(X)
$
Sostituendo $X = a$ ad $r(X)$ si ha $q(X) <-> not (X = a)$ quindi: $p(X) <-> X = a$. \
La risposta giusta sarebbe $X = a$ ma il differimento del goal non aiuterebbe a trovarla. La procedura dovrebbe essere capace di analizzare i casi nei quali il goal è fallito.
]
