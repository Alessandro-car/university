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
	- il _problema_ specifico: portarsi da ```A``` a ```G``` (unico stato-obiettivo);
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

#algoritmo(title: "Algoritmo di ricerca generico")[
  + procedure  Search($G, s, g o a l$)
  + // riga vuota
  + Input
  + #h(2em) $G$: grafo con insiemi di nodi $N$ e di archi $A$
  + #h(2em) $s$: nodo di partenza
  + #h(2em) $g o a l$: funzione booleana sui nodi
  + Output
  + #h(2em) percorso da $s$ a un nodo per il quale $g o a l$ sia vera
  + #h(2em) oppure $perp$ quando non ci sono percorsi / soluzioni
  + Local
  + #h(2em) $f r o n t i e r a$: insieme di percorsi
  +
  + $f r o n t i e r a <- {chevron.l s chevron.r}$
  + `while` $f r o n t i e r a != emptyset$ `do`
  + #h(2em) selezionare (e rimuovere) $chevron.l n_0, ..., n_k chevron.r$ da $f r o n t i e r a$
  + #h(2em) `if` $g o a l(n_k)$ `then`
  + #h(4em) `return` $chevron.l n_0, ..., n_k chevron.r$
  + #h(2em) $f r o n t i e r a <- f r o n t i e r a union {chevron.l n_0, ..., n_k, n chevron.r : chevron.l n_k, n chevron.r in A}$
  + `return` $perp$
] <alg-ricerca>

Come descritto nell'@alg-ricerca, l'inizializzazione parte dal nodo $s$.

La selezione _non è deterministica_, ha solo impatto sull'efficienza quindi una data strategia di selezione determina il percorso da scegliere. Il ```return``` annidato può essere interpretato come _temporaneo_, continuando si trovano strade alternative; $perp$
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
```python
  procedure ID_search(G, s, goal)
  Input
    G: grafo con insiemi di nodi N e di archi A
    s: nodo di partenza
    goal: funzione booleana sugli stati
  Output
    cammino da s a un nodo per il quale goal sia vero
    ovvero ⊥ altrimenti
  Local
    raggiunta_max_profondita: boolean
    limite_profondita: integer

    procedure Ricerca_a_profondita_limitata(⟨n_0,...,n_k⟩, b)
    Input
      ⟨n_0,...,n_k⟩: percorso
      b: integer {b ≥ 0}
    Output
      percorso fino a nodo-obiettivo di lunghezza k + b

      if b > 0 then
        for each ⟨n_k,n⟩ ∈ A do
          risultato ← Ricerca_a_profondita_limitata(⟨n_0,...,n_k,n⟩, b - 1)
          if risultato ≠ ⊥ then
            return risultato
      else if goal(n_k) then
        return ⟨n_0,...,n_k⟩
      else if n_k ha vicini then {fallimento innaturale}
        raggiunta_max_profondita ← true
      return ⊥

  limite_profondita ← 0
  repeat
    raggiunta_max_profondita ← false
    risultato ← Ricerca_a_profondita_limitata(⟨s⟩, limite_profondita)
    if risultato ≠ ⊥ then
      return risultato
    limite_profondita ← limite_profondita + 1
  until not raggiunta_max_profondita
  return ⊥ {fallimento naturale}```
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
```python
  procedure DFBranchAndBound(G, s, goal, h, limite_0)
  Input
    G: grafo con nodi N e archi A
    s: nodo di partenza
    goal: funzione di test dei nodi
    h: euristica sui nodi
    limite_0: limite iniziale (∞ se non specificato)
  Output
    percorso di costo minimo da s a un nodo obiettivo se esiste una
    soluzione di costo minore di limite_0, oppure ⊥
  Local
    percorso_migliore: percorso o ⊥
    limite: numero reale non negativo

    procedure cbsearch(⟨n_0,...,n_k⟩)
      if cost(⟨n_0,...n_k⟩) + h(n_k) < limite then
        if goal(n_k) then
          percorso_migliore ← ⟨n_0,...,n_k⟩
          limite ← cost(⟨n_0,...,n_k⟩)
        else
          for each ⟨n_k,n⟩ ∈ A do
            cbsearch(⟨n_0,...,n_k,n⟩)

  {main}
  percorso_migliore ← ⊥
  limite ← limite_0
  cbsearch(⟨s⟩)
  return percorso_migliore```

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
```python
procedure SearchMPP(G, s, goal)
	Input
    - G: grafo con nodi N e archi A
    - s: nodo di partenza
    - goal: funzione booleana sui nodi
  Output
    - cammino da s a un nodo per cui goal è vero
    - oppure ⊥ se non ci sono cammini soluzione
  Variabili locali
    - frontier: insieme di cammini
    - explored: insieme di nodi esplorati

  frontier := {⟨s⟩}
  explored := {}
  while frontier != {} do
    seleziona e rimuovi ⟨n_0, ..., n_k⟩ da frontier
    if n_k ∉ explored then
      explored := explored ∪ {n_k}
      if goal(n_k) then
        return ⟨n_0, ..., n_k⟩
      frontier := frontier ∪ {⟨n_0, ..., n_k, n⟩ : ⟨n_k, n⟩ ∈ A}
  return ⊥
```
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
        + #h(3em) $"DFS_solver"(V_s backslash {"var"}, C_s backslash c e, {"var" = "val"} union "contesto_parziale")$
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
      + #h(3em) $c(X = x, Y_1 = y_1, dots, Y_k = y_k)}$
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
    + *return* $"Con_Solve"(chevron.l V_s, "dom"_1, C_s chevron.r, "inconsistenti")$ *or*
    + #h(3em) $"Con_Solve"(chevron.l V_s, "dom"_2, C_s chevron.r, "inconsistenti")$
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
    + *Input:*
      + $V_s$: insieme di variabili
      + $C_s$: insieme di vincoli su $V_s$
    + *Output:*
      + relazione contenente tutte le assegnazioni consistenti
    + *if* $|V_s| = 1$ *then*
      + *return* join di tutte le relazioni in $C_s$
    + *else*
      + Selezionare $X in V_s$ da eliminare
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
#algoritmo(title: [Schema della #smallcaps[Ricerca Locale]])[
  #pseudocode-list[
    + *procedure* $"Local_search"(V_s, "dom", C_s)$
    + *Input:*
      + $V_s$: insieme di variabili
      + $"dom"$: funzione che restituisce il dominio di una variabile
      + $C_s$: insieme di vincoli da soddisfare
    + *Output:*
      + assegnazione totale che soddisfa i vincoli
    + *Local:*
      + $A$ dizionario di valori indicizzato dalle variabili in $V_s$
    + *repeat* #text(fill: luma(150))[ $brace.l "try" brace.r$]
      + *for each* $X in V_s$ *do*
        + $A[X] <-$ valore (casuale) da $"dom"(X)$
      + #text(fill: luma(150))[ $brace.l "walk" brace.r$]
      + *while not* $"ferma_walk"()$ *and* $A$ non soddisfa $C_s$ *do*
        + Selezionare $Y in V_s$ e un valore $w in "dom"(Y)$
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

