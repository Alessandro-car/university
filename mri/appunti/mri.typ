// Import everything from the template file
#import "../../typst_templates/classic_template.typ": *

#set heading(numbering: "1.1")

// Disattiva esplicitamente la numerazione per il livello 4 in poi
#show heading.where(level: 4): set heading(numbering: none)
#show heading.where(level: 5): set heading(numbering: none)
#show heading.where(level: 6): set heading(numbering: none)
// Apply the classic configuration
#show: doc => conf(
  title: "Metodi per il ritrovamento delle informazioni",
  index: true,
  doc,
)

= Introduzione
== Gestire la conoscenza
Gestire la conoscenza significa raccogliere la conoscenza, organizzarla, distruibuirla e renderla accessibile a chi ne ha bisogno (nel momento e nel posto in cui serve) al fine di:
- risparmiare tempo,
- migliorare la qualità dei servizi,
- ridurre i tempi di accesso all'informazione ed alla fruizione dei servizi.
La conoscenza è un capitale:
- intangibile,
- volatile,
- difficile da concretizzare e conservare.
Circa il 90% dei dati presenti nei database del mondo è in forma non strutturata. Gli obiettivi sono quelli di costruire sistemi in grado di processare documenti in linguaggio naturale e ritrovare conoscenza da basi di dati in forma testuale.
== Acquisizione della conoscenza
Il processo di acquisizione della conoscenza dal testo in linguaggio naturale è chiamato *text mining*. La classificazione delle tecniche di estrazione ed esplorazione dei dati si basa sull'incrocio di due dimensioni fondamemtali: l'obiettivo dell'utente e la natura dei dati analizzati.
- L'approccio dell'utente:
	- *Search (Goal-oriented)*: l'utente ha un obiettivo e sa cosa sta cercando. Formula una query per recuperare informazioni o documenti specifici.
	- *Discover (Opportunistic)*: l'utente ha un approccio esplorativo. Non cerca un dato esatto noto a priori, ma vuole "scoprire" pattern nascoti, tendenza, anomalie o estrarre nuova conoscenza dei dati.
- Il formato dei dati:
	- *Structured Data*: Dati strutturati, tipicamente organizzati in schemi rigidi.
	- *Unstructured Data*: Dati non strutturati, composti prevalentemente da testo libero in linguaggio naturale, privi di uno schema predefinito.
Incrociando queste dimensioni si ottengono quattro diverse aree di studio e applicazione:
- *Data Retrieval (Dati Strutturati + Search)*: consiste nel recuperare record esatti da un database strutturato. Si basa su logica deterministica: un record corrisponde o non corrisponde alla query,
- *Information Retrieval (Dati non Strutturati + Search)*. È la ricerca di informazioni all'interno di collezioni di documenti testuali. Poichè il testo non è strutturato, il sistema restituisce un ranking di documenti in base al loro grado di "rilevanza" rispetto alla query.
- *Data Mining (Dati strutturati + Discover)*. È l'applicazione di algoritmi statistici e di macchine di learning su grandi database strutturati per scoprire pattern ricorrenti, regole di associazione o per addestrare modelli predittivi.
- *Text Mining (Dati non strutturati + Discover)*. È il processo di derivazione di informazioni di alta qualità, pattern e nuova conoscenza partendo da enormi quantità di testo libero.
Tutto ciò è mostrato nella seguente figura.
#figure(
image("images/conoscenza.png", width: 70%),
caption: [Processo di acquisizione della conoscenza]
)
=== Data Retrieval
Come detto in precedenza, il processo di data retrieval è il ritrovamento di un record in un database strutturato.
#figure(
image("images/data_retrieval.png", width: 70%),
caption: [Data Retrieval]
)
=== Information Retrieval
Il processo di information retrieval è la ricerca di un'informazione rilvante in una sorgente di dati non strutturati (tipicamente in formato testo).
#figure(
image("images/information_retrieval.png", width: 70%),
caption: [Information Retrieval]
)

=== Data mining
Il processo di data mining permette di scoprire nuova conoscenza attraverso l'analisi di dati.
#figure(
image("images/data_mining.png", width: 70%),
caption: [Data Mining]
)

=== Il processo KDD
Il processo KDD, acronimo per _Knowledge Discovery from Databases_, è un processo non banale di identificazione valida, nuova e potenzialmente, e ultimente di comprensibili pattern nei dati.
=== Text Mining
Il processo di text mining è la scoperta di nuova conoscenza attraverso l'analisi del testo.
#figure(
image("images/text_mining.png", width: 70%),
caption: [Text Mining]
)
Il processo di text mining si può dividere nei seguenti passi:
+ *Text Preprocessing (Pre-elaborazione del testo)*. Coinvolge l'analisi _sintattica_ e _semantica_ per preparare i dati in un formato leggibile dalle fasi successive.
+ *Features Generation (Generazione delle Feature / Trasformazione del testo)*. Consiste nel trasformare il testo pre-elaborato in una rappresentazione matematica o strutturata. L'approccio principale è il *Bag of words* che ignora l'ordine delle parole e la grammatica, concentrandosi slla presenza e la molteplicità dei termini.
+ *Features Selection (Selezione delle feature)*. La fase precedente genera uno spazio vettoriale di dimensioni enormi, questa fase selezione solo le caratteristiche più rilevanti e informative. Si basa su tecniche come:
	- *simple counting*: metodi basati sul conteggio semplice delle frequenze dei termini.
	- *statistics:* valutazioni statistiche per capire quali feature hanno il maggiore potere discriminante.
+ *Text/data mining*. È il cuore del processo, dove si applicano gli algoritmi di macchine di machine learning ai dati ormai strutturati e filtrati. Si divide in due paradigmi:
	- *Classification (Supervised learning)*. Apprendimento supervisionato, dove si addestra un modello su testi già etichettati per classificare nuovi documenti.
	- *Clustering (Unsupervised learning)*. Apprendimento non supervisionato, dove l'algoritmo raggruppa autonomamente i documenti in base alle loro similarità intrinseche, senza avere categorie predefinite.
+ *Analyzing result (Interpretazione e valutazione)*. L'ultima fase in cui i pattern estratti vengono analizzati e interpretati per estrarre il vero e proprio "valore" o "conoscenza". Questa fase prevede un *meccanismo di feedback*. L'interpretazione dei risultati può portare a rivalutare e modifcare i parametri di qualsiasi delle fasi precedenti per migliorare l'output finale.\
Il text mining è importante anche nell'impresa, in quanto il processo di estrazione di conoscenza, precedentemente sconosciuta, da fonti testualii è utilizzabile per prendere decisioni aziendali. Inoltre, permette di organizzare e di categorizzare scoprendo tendenza e apprendendo concetti. Inoltre, il text minining nell'impresa è anche necessario in quanto scoprire tendenze, idee, opinioni e gusti degli utenti sta diventando sempre più impegnativo. Ci sono tante fonti da analizzare come e-mail, forum, articol, ecc, e l'obiettivo è quello di analizzare migliaia di testi in pochi secondi raggruppandoli in funzione del loro contenuto.
== Ritrovamento delle informazioni intelligente
=== Ritrovamento delle informazioni
Il ritrovamento delle informazioni, oppure _information Retrieval, IR_, si occupa della rappresentazione, dell'archiviazione, organizzazione e accesso a elementi informativi, come documenti, pagine Web, cataloghi online, record strutturati e oggetti multimediali. L'ambito di ricerca iniziale nell'area del ritrovamento delle informazioni riguardava l'indicizzazione del testo e la ricerca di documenti utili in una collezione. Cercare pagine nel web è un compito non banale in quanto bisogna prima ritrovare documenti relativi ad una data query e poi ritrovare, in modo efficiente, informazioni da un grande set di documenti. \
Il compito del ritrovamento delle informazioni è quello di trovare una classifica di un insieme di documenti che sono relativi ad una data query. Data la query dell'utenet l'obiettivo di un sistema di ritrovamento delle informazioni è quello di ritrovare informazioni utili o rilevanti per l'utente. Il sistema IR deve classificare le informazioni in accordo con un grado di rilevanza alla query data dall'utente.
=== Come le persone cercano informazioni
L'interazione degli utenti con le interfacce di ricerca è influenzata da diversi fattori. Nel campo dell'information retrieval, si fa, inoltre, una distinzione fondamentale tra le modalità con cui si cerca l'informazione. \
Il modo in cui un utente interagisce con un'interfaccia di ricerca varia in funzione di tre elementi:
- *il tipo di compito*: l'obiettivo pratico che l'utente deve portare a termine.
- *l'esperienza nel dominio*: il livello di conoscenza pregressa che chi cerca l'informazione possiede riguardo allo specifico argomento trattato.
- *tempo e sforzo*: la quantità di tempo e di impegno cognitivo che l'utente ha a disposizione o è disposto a inverstire nel processo.
Come detto prima, si opera una distinzione principale tra due approcci alla ricerca:
- *information lookup*, ricerca mirata;
- *exploratory search*, ricerca esplorativa.
I compiti basati sull'information lookup presentano le seguenti caratteristiche:
- sono assimilabili al recupero di dato di fatto o alla ricerca di risposte dirette a domande specifiche;
- il bisogno dell'utente può essere soddisfatto ottenendo pezzi discreti di informazioni, come numeri, date, siti Web, ecc.;
- questa modalità si sposa molto bene con i paradigmi di interazione standard offerti dai classici motori di ricerca Web. \
L'exploratory search, invece, è divisa in compiti di apprendimento e compiti investigativi. La ricerca di apprendimento richiede più di singole coppie query-risposta e richiede a chi effettua le ricerca di spendere tempo per: analizzare e leggere molteplici elementi di informazione e per sintetizzare i contenuto in una nuova forma comprensibile. \
Il compito investigativo riguarda un processo a lungo termine che:
- coinvolge interazioni che prendono luogo in un periodo di tempo prolungato;
- può restituire risultati che necessitano di essere valutati criticamente prima di essere integrati nel personale bagaglio professionale e di conoscenza;
- può occuparsi di trovare una grande proporzione di informazioni rilevanti disponibili.
La ricerca di informazioni può essere vista come parte di un processo più grande al quale ci si riferisce come _sensemaking_. Il processo di *sensemaking* è un processo iterativo che consiste nel formulare una rappresentazione concettuale a partire da una vasta collezione di dati. All'interno di questo processo, la maggior parte dello sforzo cognitivo e del tempo dell'utente viene investita nella sintesi, ovvero nella creazione di una "buona rappresentazione" strutturata dell'argomento. \
Le attività di sensemaking possono svilupparsi secondo diverse modalità operative:
- *interwoven search, ricerca intrecciata*. In alcuni casi, l'attività di ricerca si intreccia continuamente con l'analisi lungo tutto l'arco del processo.
- *batch process, ricerca a blocchi*. In altri casi, il processo è diviso in fasi distinte: l'utente esegue prima un blocco intensivo di sole ricerche, che viene poi seguito da un blocco separato dedicato interamente all'analisi e alla sintesi dei risultati raccolti. \
Degli esempi di compiti di analisi profonda che richiedono l'utilizzo del processo di sensemaking sono:
- *Legal discovery*: il processo in ambito legale di ricerca, raccolta e analisi di grandi quantità di documenti o prove elettroniche.
- *Epidemiologia*: il tracciamento e lo studio della diffusione delle malattie.
- *Analisi del customer care*: lo studio sistematico dei reclami dei clienti con l'obiettivo di migliorare il servizio offerto.
- *Business intelligence*: l'acquisizione e l'analisi di dati complessi per ricavare informazioni strategiche e supportare le decisioni aziendali.
== Sistemi di ritrovamento delle informazioni
=== Rilevanza
La rilevanza è un giudizio soggettivo e può includere:
- essere sul giusto argomento;
- avere informazioni recenti;
- soddisfare gli obiettivi dell'utente e del suo uso previsto delle informazioni.
La definizione più semplice di rilevanza è che la query appare parola per parola nel documento. Una nozione più generale, invece, è che le parole nella stringa appaiono frequentemente nel documento, in qualsiasi ordine. Per questo si usa il termine di _bag of words_, intesa come una sacca di parole del quale non importa l'ordine. \
Il problema di queste parole chiave è che è possibile non ritrovare documenti rilevanti che includono, però, dei sinonimi di tali parole. Oppure, è possibile ritrovare documenti irrilevanti che possono contenere termini polisemici, ovvero stessa parola ma con significato diverso. Ad esempio, la parola "bat" in inglese può significare sia pipistrello che la mazza da baseball.
=== Ritrovamento delle informazioni intelligente
Un sistema di _intelligent IR_ si distingue dai sistemi di base per le seguenti caratteristiche:
- prende in considerazione il _significato_ delle parole utilizzate;
- prende in considerazione l'_ordine_ delle parole all'interno della query;
- si adatta all'utente basandosi su un feedback che può essere diretto o indiretto;
- nel processo di _relevance feedback_, il sistema raccoglie il feedback fornito, genera una nuova query e ripete l'operazione di redcupero delle informazioni.
Analizziamo l'architettura di un sistema IR:
#figure(
image("images/architettura_ir.png", width: 70%),
caption: [Architettura di un sistema IR]
)
Dalla foto precedente descriviamo le seguenti componenti:
- *Text operations*, le operazioni sul testo. Questa fase si occupa di formare le parole indice, ovvero i _token_. Include operazioni come:
	- la rimozione delle stopword
	- lo stemming, ovvero ridurre le parole alle loro radici tramite la rimozione di prefissi e suffissi.
- *Indexing*, l'indicizzazione. Questa fase consiste nel costruire un _indice invertito_ detto _inverted index_ che mappa le parole verso i puntatori dei documenti in cui esse compaiono.
- *Searching*, la ricerca. Questa fase ha lo scopo di recuperare, a partire dall'inverted index, i documenti che contengono uno specifico token di ricerca.
- *Ranking*. Questa fase assegna un punteggio a tutti i documenti recuperati basandosi su una metrice di rilevanza. Questa componente può occuparsi anche del raggruppamento, ovvero trovare elementi in comune per presentare all'utente dei gruppi di documenti.
Le aree di ricerca dei sistemi di intelligent IR riguardano il processing del linguaggio naturale e il machine learning.
=== Natural Language Processing
Il Natural Language Processing, NLP, nell'ambito dell'Information Retrieval si caratterizza per i seguenti aspetti:
- è focalizzato sull'analisi sintattica, semantica e pragmatica del testo e del discorso in linguaggio naturale.
- la capacità di analizzare la sintassi e la semantica potrebbe consentire un recupero delle informazioni basato sul significato, piuttosto che sulle semplici parole chiave.
L'applicazione del Natural Language Processing al campo dell'Information Retrieval si sta sviluppando lungo diverse direzioni di ricerca principali:
- *Word Sense Disambiguation*. Sviluppo di emtodi per determinare il significato corretto di una parola ambigua basandosi sul contesto in cui si trova.
- *Information Extraction*. Utilizzo di metodi volti a indentificare specifiche porzioni di informazione all'interno di un documento.
- *Question answering*. Creazione di metodi per fornire risposte a specifiche domande poste in linguaggio naturale ricavandole da ampi corpi di documenti.
=== Machine learning
Il campo del Machine Learning si concentra sui seguenti aspetti:
- È focalizzato sullo sviluppo di sistemi computazionali che sono in grado di migliorare le proprie prestazioni attraverso l'esperienza.
- *Apprendimento supervisionato (Supervised learning)*. Prevede la classificaione automatica di esempi basandosi sull'apprendimento di concetti derivati da esempi di addestramento precedentemente etichettati.
- *Apprendimento non supervisionato (Unsupervised learning)*. Consiste nell'utilizzo di metodi automatici per raggruppare esempi non etichettati all'interno di gruppo che risultino significativi.
= Boolean and Vector Space Retrieval Models
== Retrieval Models
Un modello di ritrovamento, detto *retrieval model*, specifica i dettagli di:
- rappresentazione dei documenti;
- rappresentazione delle query
- funzione di ritrovamento, detta *retrieval function*.
Per implementare la funzione di ritrovamento bisogna determinare la nozione di rilevanza che può essere binaria o continua.\
Inoltre, determina anche la funzione di classificazione, detta *ranking function* che assegna i punteggi ai documenti relativi ad una data query.
== Definizione formale dei modelli IR
Definiamo formalmente i modelli di ritrovamento, _IR models_, come segue:
#definizione(title: "Modello IR")[
Un modello di ritrovamento delle informazioni è una quadrupla $[D, Q, F, R(q_i, d_j)]$ ove:
+ $D$ è un insieme di viste logiche per i documenti nella collezione.
+ $Q$ è un insieme di viste logiche per le informazioni che servono all'utente. Queste viste sono chiamate _query_.
+ $F$ è un framework per la modellazione dei documenti e query.
+ $R(q_i, d_j)$ è una funzione di ranking, che confronta la query con il documento e rileva quanto il documento è rilevante rispetto alla query data.
]
Esistono diversi modelli di ritrovamento, come mostrari nella figura di seguito: \
#figure(
image("images/taxonomy_IR.jpg", width: 70%),
caption: [Tassonomia dei modelli di ritrovamento]
)
*Cercare foto simile a quella nelle slide* \
== Modello di ritrovamento booleano
Il modello di ritrovamento booleano è basato sulla teoria degli insiemi. Per approcciarsi a questi modelli ci sono dei passi comuni nella fase di preprocessing:
- rimuovere caratteri non voluti, come tag HTML, punteggiature, numeri, ecc.
- dividere il documento in _token_ dividendolo sulla base degli spazi;
- ricondurre i token alla radice, detta operazione di _stemming_
- rimuovere comuni parole chiuse, come congiunzioni, articoli, ecc.
- Individuare frasi comuni, possibilmente usando un dizionario specifico di dominio
- costruire gli indici invertiti, detti _inverted index_, che permettono di accedere alla lista dei documenti che contengono una data parola, detta _keyword_.
Nel modello di ritrovamento booleano un documento è rappresentato mediante un *insieme* di parole e le query sono espressioni booleane di keyword collegate tramite le operazioni di AND, OR e NOT, includendo l'uso di parentesi graffe per indicare lo scopo. In output si ottiene se il documento è rilevante o meno, non ci sono corrispondenze parziali o una classificazione di rilevanza. Quindi la nozione di rilevanza in questo modello è di tipo booleana.
=== Vettori di incidenza
Consideriamo la seguente tabella:
#let header(content) = text(fill: rgb("#0000cc"))[#content]
#let row-title(content) = text(fill: rgb("#9c3115"))[#content]
#table(
  columns: 7,
  // Aggiunge solo la linea grigia superiore alla prima riga
  stroke: (x, y) => if y == 0 { (top: 0.5pt + rgb("#f0f0f0")) } else { none },
  align: (x, y) => if x == 0 { right + horizon } else { center + horizon },
  column-gutter: 0.6em,
  row-gutter: 0.6em,

  // Intestazione
  [], header[Antony and Cleopatra], header[Julius Caesar], header[The Tempest], header[Hamlet], header[Othello], header[Macbeth],

  // Dati
  row-title[Antony], [1], [1], [0], [0], [0], [1],
  row-title[Brutus], [1], [1], [0], [1], [0], [0],
  row-title[Caesar], [1], [1], [0], [1], [1], [1],
  row-title[Calpurnia], [0], [1], [0], [0], [0], [0],
  row-title[Cleopatra], [1], [0], [0], [0], [0], [0],
  row-title[mercy], [1], [0], [1], [1], [1], [1],
  row-title[worser], [1], [0], [1], [1], [1], [0]
)
Quindi, per ogni termine abbiamo un vettore composto da 0 o 1. Per rispondere ad una query come:
$
"Brutus, Ceaser and NOT Calpurnia"
$
si prendono i vettori per le rispettive parole:
- _Brutus_: 110100;
- _Caesar_: _110111_;
- _Calpurnia_ (complementato): 101111.
Infine, eseguiamo l'and bit a bit e otteniamo:
$
110100 " AND " 110111 " AND " 101111 = 100100
$
=== Indice invertito
Per ogni termine $t$, memorizziamo una lista di tutti i documenti che contengono tale ptermine. Ogni documento è identificato da un *docID* è un numero seriale per i documenti. \
Supponiamo di implementare gli indici invertiti utilizzando array di dimensione statica e consideriamo la seguente figura:
#figure(
image("images/indici_invertiti_statici.png", width: 70%),
)
Se, ad esempio, si aggiunge la parola _Caesar_ al documento 14, non possiamo inserire quest'ultimo nell'array e, quindi, bisogna usare strutture dati in grado di supportare liste di *postings* a dimensione variabile. \
In memoria centrale, questo problema si risolve tipicamente utilizzando:
- *Liste concatenate*
- *Array a lunghezza variabile*.
Queste soluzioni dinamiche permettono di aggiungere nuovi *docID* man mano che l'indice cresce, accettando dei compromessi tra l'ottimizzazione dello spazio occupato e la facilità di inserimento. Su disco, invece, è normale e ottimale mantenere una sequenza continua di dati per velocizzare i tempo di lettura. \
Inoltre, a prescindere dalla struttura dinamica scelta in memoria, è fondamentale ricordare che i documenti all'interno di ogni lista di *posting* devono sempre essere mantenuti ordinati per *docID* crescente per garantire l'efficienza delle operazioni di intersezione durante le query. \
Segue un esempio di costruzione dell'indice invertito:
#figure(
image("images/costruzione_indice.png", width: 70%),
caption: [Costruzione dell'indice invertito]
)
=== Fasi dell'Indicizzatore
Analizziamo le passi che compongono l'indicizzatore:
+ Creazione delle coppie (Token, docID)
	- Il processo estrae il testo e genera una sequenza formata da coppie di valori: un *token modificato* e l'*ID del documento* in cui quel token compare.
	- I token vengono definiti "modificati" perchè, subiscono una pre-elaborazione prima di essere inseriti nella tabella.
+ *Ordinamento*. Una volta generata la sequenza iniziale di coppie (Token, docID), il sistema procede con l'ordinamento di questi dati. Questo passaggio è identificato come la fase centrale e più importante del processo di indicizzazione. \
	L'algoritmo riorganizza l'intera tabella applicando due criteri di ordinamento in sequenza:
	+ *Ordinamento primario per termine*: tutte le coppie vengono ordinate alfabeticametne in base alla colonna del token. In questo modo, tutte le occorrenze della stessa parola vengono raggruppate vicine.
	+ *Ordinamento secondario per docID*: a parità di termine, le tuple vengono ordinate in modo crescente in base all'identificativo del documento.
+ *Dizionario e postings*. Dopo aver ordinato alfabeticametne i termini e i relativi docID, il sistema trasforma la lista lineare nella struttura finale dell'indice invertito attraverso tre operazioni fondamentali:
	- *Unione dei termini (Merging)*: le entrate multiple dello stesso termine relative a un singolo documento vengono unite. Se una parola compare più volte, non si creano puntatori duplicati allo stesso documento, ma le occorrenze vengono compattate.
	- *Divisione in due strutture (Split)*: I dati elaborati vengono formalmente suddivisi nelle due componenti principali: il *Dizionario* e le relative liste di *Postings*.
	- *Aggiunta della Document Frequency*: Per ogni termine nel dizionario viene aggiunta l'informazione sulla _Document Frequency_. Questo valore indica il numero totale di documenti distinti all'interno della collezione in cui quel termine è presente.
=== Elaborazione della query: Operazione AND
Per comprendere come il sistema estrae i documenti a partire da un indice invertito, consideriamo l'elaborazione di una query con operatore logico AND: *Brutus AND Caesar*. \
Le fasi dell'elaborazione sono le seguenti.
+ Localizza il termine *Brutus* all'interno del Dizionario e ne recupera la rispettiva lista di _postings_.
+ Localizza il termine *Caesar* nel Dizionario e ne recupera la relativa lista di _postings_.
+ Esegue un Merge delle due liste di postings per individuare i documenti che contengono contemporaneamente entrambe le parole. \
Affinchè l'intersezione sia computazionalmente efficiente, sussistono due vincoli fondamntali:
- I postings all'interno di ciascuna lista devono essere rigorosamente ordinati per docID;
- Le liste devono essere processate in *ordine di lunghezza crescente*, iniziando dalle parole più rare per ridurre da subito il numero di documenti da confrontare.
L'algoritmo di intersezione è il seguente.
#algoritmo(title: [Intersezione])[
  #pseudocode-list[
	+ Intersect($p_1$, $p_2$)
    + $a n s w e r <- chevron.l chevron.r$
    + *while* $p_1 != "NIL"$ *and* $p_2 != "NIL"$
      + *do if* $d o c I D(p_1) = d o c I D(p_2)$
        + *then* $"ADD"(a n s w e r, d o c I D(p_1))$
        + $p_1 <- n e x t(p_1)$
        + $p_2 <- n e x t(p_2)$
      + *else if* $d o c I D(p_1) < d o c I D(p_2)$
        + *then* $p_1 <- n e x t(p_1)$
        + *else* $p_2 <- n e x t(p_2)$
    + *return* $a n s w e r$
  ]
] <alg:intersect>
=== Query booleane: corrispondenza esatta
Il modello di ritrovamento booleano si basa sulla capacità di sottoporre al sistema delle query formulate come vere e proprie espressioni booleane.
+ *Caratteristiche del modello*.
	- Le query booleane utilizzano gli opearatori logici fondamentali.
	- In questo modello, ogni documento viene visto e trattato matematicamente come un semplice _insieme di parole_.
	- La sua natura è *precisa*: l'esito della ricerca è puramente binario. Un documento soddisfa esattamente la condizione dettata dalla query oppure non la soddisfa affatto.
	- Per via di queste caratteristiche, rappresenta forse il modello più semplice su cui sia possibile costruire un sistema di Information Retrieval.
+ *Rilevanza storica e attuale*
	- È stato lo strumento di retrieval principale in ambito commerciale per circa tre decenni.
	- Ancora oggi, molti dei sistemi di ricerca di uso comune si basano su logico booleana. Tra questi figurano la ricerca all'interno delle emeail, i cataloghi delle biblioteche e la funzione Spotlight di Mac OS X.
=== Problemi del modello booleano
Nonostante la loro semplicità, i modelli di retrieval booleano presentano diverse criticità e limitazioni:
- *Estrema rigidità*: l'utilizzo dell'operatore AND richiede che tutti i termini siano presenti, portando spesso a ottenere troppi pochi risultati. Al contrario, l'operatore OR si accontenta di un qualsiasi termine, rischiando di generare una mole eccessiva di risultati.
- *Difficoltà nell'esprimere richieste complesse*. Risulta complicato esprimere i bisogni informativi complessi degli utenti, poichè queste informazioni devono essere obbligatoriamente tradotte e forzate all'interno di un'espressione booleana.
- *Mancanza di controllo sul volume dei risultati*. È difficile controllare il numero di documenti che il sistema recupera, poichè tutti i documenti che presentano una corrispondenza verranno inevitabilmente restituiti.
- *Difficoltà nel ranking*. Non è possibile generare una classifica di rilevanza accurata, dato che tutti i documenti recuperati soddisfano logicamente la query allo stesso livello.
- *Difficoltà nell'applicazione del relevance feedback*. Risulta problematico implementare meccanismi di feedback. Se l'utente identifica un documento restituito come rilevante o irrilevante, non è chiaro come la query originale debba essere modificata di conseguenza.
== Fasi di preprocessing
Quando un sistema si appresta a elaborare un documento greszzo, deve prima determinare alcune sue caratteristiche fondamentali, rispondendo a tre domande:
- *Formato*: in quale formato si trova il file;
- *Lingua*: in quale lingua è scritto il testo;
- *Codifica*: quale codifica dei caratteri viene utilizzata.
Dal punto di vista formale, ognuna di queste sfide rappresenta un vero e proprio *problema di classificazione*. Nonostante la loro natura, nella pratica questi compiti vengono spesso affrontati in modo _euristico_: invece di addestrare modelli complessi, la classificazione viene predetta applicando delle regole semplici. Un esempio di questa implementazione è il riconoscimento della lingua: se nel testo ci sono molte occorrenze della parole "the", allora il documento è in inglese. \
Durante il processo di parsing e indicizzazione, i sistemi devono affrontare diverse complicazioni legate alla varietà di formati e lingue:
+ *la gestione del multilinguismo*
	- la collezione di documenti da indicizzare può includere testi scritti in molte lingue differenti. Questo implica che un singolo indice potrebbe trovarsi a memorizzare e gestire termini appartenenti a diverse lingue contemporaneamente
+ *documenti e componenti ibridi*. In alcuni casi, un singolo documento o i vari componenti che lo formano possono contenere al loro interno molteplici lingue o formati. Un tipico esempio è un'email scritta in france che ha come allegato un documento PDF scritto in tedesco.
+ *Il problema dell'unità documentale*. Alla luce di queste complessità strutturali, sorge una domanda fondamentale: come si definisce esattametne un "documento unitario" da indicizzare? Ci sono diverse interpretazioni a seconda del contesto:
	- è un singolo file?
	- è un'email?
	- è un'email considerata insieme a tutti i suoi allegati?
	- oppuer un gruppo di file interconnessi?
=== Tokenizzazione
La tokenizzazione è il processo di suddivisione del testo grezzo in unità fondamentali e significative. Analizziamone un esempio.
#esempio[
Sia data in input la frase:
$
"Friends, Romans and Countrymen"
$
e in output il sistema elabora il testo e restituisce un insieme di tokens. In questo esempio specifico vengono estratti:
$
"Friends Romans Countrymen"
$
]
Diamo una definizione formale di token.
#definizione(title: "Token")[
Un *token* è definito come un'istanza di una specifica sequenza di caratteri all'interno del testo.
]
Ogni token così generato diventa un candidato potenziale per diventare una voce vera e propria all'interno dell'indice. Tuttavia, per diventare una voce definitiva dell'indice, il token deve prima subire un *ulteriore processamento*. \
La domanda findamentale che guida le fasi successive della progettazione di un indicizzatore è: *quali sono i token validi da emettere?* \
Nel processo di tokenizzazione sorgono diverse problematiche e ambiguità su come interpretare correttamente i caratteri speciali, i trattini e la punteggiatura. I casi critici principali sono i seguenti:
- *Gestione degli apostrofi e dei genitivi*. Prendendo come esempio la frase "Finland's capital", come deve essere gestito il termine possessivo? Il token risultante deve essere _Finland?, Finlands?_ oppure _Finland's?_
- *Parole con trattino*. Espressioni come "Hewlett-Packard" devono essere suddivise in due token distinti? Ci sono casi come "state-of-the-art", in cui bisogna decidere se spezzare o meno una sequenza complessa unita da trattini. Esistono parole ambigue come "co-education", o variazioni ortografiche come _lowercase_, _lower-case_ e _lower case_.
	In questi casi, può rilevarsi efficace fare in modo che sia l'utente stesso a inserire eventuali trattini per guidare la ricerca.
- *Nomi composti*. Nomi propri come "San Francisco" devono essere considerati come un unico token oppure come token separati? E soprattutto: con quale criterio logico si deicde se un'espressione plurinominale costituisce un token unico?
==== La gestione dei numeri nella tokenizzazione
La gestione delle sequenze numeriche e dei codici alfanumerici rappresenta un aspetto critico durante la tokenizzazione, a causa della grande varietà di formati esistenti. \
Ad esempio le date possono essere rappresentate come _3/20/91_, _Mar. 12, 1991_ oppure _20/3/91_.\
Spesso queste stringhe contengono spazi interni che complicano la separazione dei token. I sistemi di IR meno recenti potrebbero scegliere di non indicizzare affatto i numeri. Tuttavia, indicizzare i numeri è spesso estremamente utile: basti pensare alla ricerca sul web di codici di errore o di _stack trace_. Una possibile soluzione tecnica a questo problema è l'uso degli *n-grammi*. Molto spesso, i metadati associati vengono indicizzati separatamente come *meta-data*.
==== Problematiche legate alla lingua
Le scelte di tokenizzazione variano profondamente in base alle specifità linguistiche e morlogiche della lingua in cui è scritto il documento.
+ *Caso di lingua francese*:
	- *Gestione delle elisioni*: un'espressione come l'_ensemble_ solleva il dubbio se debba essere considerata come un token unico oppure come due distinti. Le opzioni di suddivisione includono: separare in _L_ e _ensemble_?, considerare _L'_? oppure espandere in _Le_ e _ensamble_.
	- *Problemi di corrispondenza (matching)*. Spesso si desidera che la ricerca di _l'ensemble_ restituisca una corrispondenza anche con forme simili come un _esemble_. TUttavia, su Google questo comportamento non era garantito fino al 2003, evidenziando le grandi sfide legate all'*internazionalizzazione*.
+ *Caso del Tedesco*:
	- *Composti nominali non segmentati*. In lingua tedesca i sostantivi composti vengono scritti unizi senza spazi. Un esempio stano è la parola _Lebensversicherungsgeselischaftangestellter_, che significa letteralmente "impiegato di una compagnia di assicurazioni sulal vita".
	- *L'uso del Compound Splitter*. Per ovviare a questo rpoblema, i sitemi di Information Retrieval in lingua tedesca traggono enormi vantaggi dall'integrazione di un modulo di scompozione noto come *compound splitter*. L'adozione di qeusto modulo può incrementare le prestazioni di ricerca per il tedesco fino al 15%.
+ *Caso di cinese e giapponese*:
	- Assenza di spazi: il cinese e il giapponese non prevedono sapzi tra le parole;
	- Tokenizzazione non unica: a causa di ciò, non è sempre garantita una tokenizzazione univoca;
	- Nel caso del giapponese ci sono _alfabeti multipli mescolati_: la gestione diventa più complessa a causa dellapresenza contemporanea di più alfabeti intrecciati tra loro. Le date e gli importi si presentano in formati differenti. Inoltre, l'utente finale può scegliere di esprimere la propria query intermante utilizzando l'alfabeto hiragana.
+ *Caso di arabo e ebraico*
	- _Direzione di scrittura_: l'arabo e l'ebraico si scrivono fondamentalmente da destra a sinistra, sebbene determinati elementi come i numeri siano scritti da sinistra a destra.
	- _Rappresentazione e Unicode_: grazie all'utilizzo di Unicode, la presentazione visiva di superficie risulta complessa a causa della mescolanza di direzioni, ma la forma memorizzata sottostante rimane lineare e diretta.
==== Stop words
Con una stop list, puoi escludere completamente dal dizionario le parole più comuni, in quanto hanno un contenuto semantico piccolo e ce ne sono tante. \
La tendenza attuale però tende ad includere nel dizionario anche le stop word. Questo perchè sono state sviluppate tecniche di compressione efficaci e lo spazio richiesto per includere le stop words nel sistema è diventato estremamente ridotto. Inoltre ci sono avanzate tecniche di ottimizzazione che fanno si che il costo computazionale al momento della query sia minimo. \
Infine, ci sono dei casi in cui le stop words sono necessarie:
- _Ricerche per frase_: risultano indispensabili per query specifiche come "King of Denmark"
- Titoli di opere o canzoni: sono essenziali per gestire stringhe come "Let it be".
- _Query "relazionali"_: servono per interpretare correttamente ricerche come "flights to London".
==== Normalizzazione dei termini
La normalizzazione dei termini è necessaria sia per le parole presenti nel testo indicizzato e sia per le parole inserite nelle query in una forma comune. L'obiettivo è, ad esempio, fare in modo che il sistema riconosca e metta in corrispondenza forme equivalenti come _U.S.A_ e _USA_. \
Il risultato del processo di normalizzazione prende il nome di *termine*, inteso come una parola normalizzata (_word type_) che rappresenta una singola voce all'interno del dizionario del sistema di Information Retrieval. \
Il processo definisce implicitamente delle classi di equivalenza tra i termini. Questo avviene operativamente attraverso regole quali:
- La rimozione dei punti per formare un termine standard ad esempio _U.S.A_ e _USA_ appartengono alla classe di equivalenza $[U S A]$.
- La rimozione dei trattini, ad esempio _anti-discriminatory_ e _antidiscriminatory_ appartengono alla classe di equivalenza $["antidiscriminatory"]$.
Inoltre, ci sono lingue in cui anche gli accenti possono diventare critici. Ad esempio, il termine francese _résumé_ rispetto a _resume_. Queste forme differenti dovrebbero essere trattate come equivalenti dal sistema. \
Il fattore più importante da considerare nella progettazione è il modo in cui gli utenti tendono a digitare le proprie query per queste parole. Anche nelle lingue che prevono standardmente l'uso di accenti, gli utenti spesso non li digitano quando effetuano una ricerca. Di conseguenza, è spesso preferibile normalizzare i termini riconducibili a una forma priva di eccenti. \
Anche le date e l'alternanza nell'uso giapponese dei caratteri _kana_ rispetto ai caratteri cinesi devono essere normalizzati. Il processo di tokenizzazione e normalizzazione dipende strettamente dalla lingua e risulta pertanto profondamente intrecciato con il rilevamento della lingua stessa. Ad esempio nella frase "Morgen will ich in MIT" bisogna stabilire se si tratta effettivamente della preposizione tedesca _mit_. \
La regola fondamentale è quella di normalizzare sia il testo che viene inserito nell'indice sia i termini specifici della query, riconducendoli esattamente alla medesima forma standard. \
Un'altra operazione fondamentale è quella della riduzione delle maiuscole, e ci sono diversi modi per farlo:
- _Conversione universale_: prevede di ridurre tutte le lettere a minuscole;
- _Eccezioni contestuali_: si valutano le maiuscole a metà frase, come nel caso di _General Motors_, o la distinzione tra acronimi e parole comuni.
Risulta spesso ottimale applicare la conversione in minuscolo a tutto, poichè gli utenti tendono a digitare in minuscolo a prescindere dalla capitalizzazione formalmente corretta. \
Ci si interroga su quale sia l'effetto concreto delle operazioni di normalizzazione sulle prestazioni del sistema in termini di precisione e richiamo. \
Un'alternativa alle classi di equivalenza è quella di includere nel dizionario tante varianti di un termine e poi fare un'espansione asimettrica a query time. Ad esempio se l'utente inserisce la query _window_ il sistema cerca per _window, windows_. Questo approccio è potenzialmente più potente ma meno efficiente.
==== Thesauri e Soundex
Analizziamo la gestione di sinonimi e omonimi. È possibile gestirli tramite classi di equivalenza costruite manualmente, come ad esempio l'equivalenza tra _Car_ e _automobile_, oppure tra _color_ e _colour_. Si possono riscrivere i termini per formare classi di equivalenza: quando un documento contiene la parola _automobile_, ad esempio, viene indicizzato sotto la forma combinata _car-automobile_ (e viceversa). Un'alternativa consiste nell'espandere la query in fase di ricerca, facendo in modo che se la query contiene _automobile_, il sistema cerchi anche sotto _car_. \
Per gestire gli errori di ortografia, invece, si applica l'approccio _soundex_, un sistema che raggruppa le parole in classi di equivalenza basandosi su euristiche di tipo fonetico.
=== Lemmatizzazione
Il processo di lemmatizzazione consiste nel ridurre le forme flesse o varianti alla loro forma base, ovvero la forma che si cercherebbe all'interno di un dizionario. Esempi di lemmatizzazione sono:
- le voci verbali _am, are, is_ vengono ricondotte a _be_;
- i termini _car, cars, car's, cars'_ vengono ricondotti a _car_.
Un esempio di trasformazione di una frase è: "the boy's cars are different colors" che diventa "the boy car be different color". \
Diamo una definizione formale di lemmatizzazione:
#definizione(title: "Lemmatizzazione")[
La lemmatizzazione implica l'esecuzione di una riduzione "corretta" alla forma del lemma presente come intestazione nel dizionario.
]
=== Stemming
Il processo di stemming consiste nel ridurre i termini alle "radici" prima di procedere con l'indicizzazione. Lo stemming suggerisce un'operazione grossolana di rimozione dei suffissi, la cui implementazione è dipendente dalla lingua. Ad esempio, parole derivate come _automate, automatic_ e _automation_ vengono tutte ridotte alla forma comune _automat_. \
Analizziamone un impatto pratico sul testo:
$
"for example compressed and compression are both accepted as equivalent compress"
$
venga trasformata in forme alterate quali
$
"for exampl compress and compress ar both accept as equival to compress"
$
==== Algoritmo di Porter
L'algoritmo di Porter è l'algoritmo più diffuso per lo stemming della lingua inglese. I risultati suggeriscono che sia almeno tanto valido quanto le altre opzioni di stemming disponibili. Il processo si basa su convezioni e su 5 fasi di riduzione.
- Le fasi vengono applicate in modo sequenziale.
- Ciascuna fase è costituita da un insieme di comandi.
- Una convenzione tipica stabilisce che, tra le regole presenti in un comando composto, si debba selezionare quella che si applica al suffisso più lungo.
Analizziamone un esempio pratico: la parola _Girls_, la lettera "s" viene identificata come suffisso, mentre _Girl_ costituisce la radice.
== Punteggio, Pesatura dei Termini e Modello dello Spazio Vettoriale
=== Problemmi del modello di ritrovamento booleano
Fino ad ora, le nostre query sono state booleane, quindi i documenti potevano essere rilevanti o meno. Il modello di ritrovamento booleano è utile per utenti esperti che hanno una conoscenza completa dei loro bisgoni e della collezione di documenti. È anche utile per le applicazioni che possono facilmente consumare migliaia di risultati. \
Non risulta efficiente, però, per la maggior parte degli utenti in quanto non capaci di scrivere query booleano (oppure se lo sono, pensano che sia troppo impegnativo). Inoltre, la maggior parte degli utenti non vogliono guardare tra migliaia di risultati. \
Le query booleane spesso risultano in troppi pochi risultati oppure in troppo risultati. Ci vogliono grandi capacità per costruire una query che produce un numero di documenti rilevanti ragionevoli, in quanto le operazioni di AND ne producono pochi e l'operazione di OR ne producono tanti.
=== Ranked Retrieval Models
I modelli di ritrovamento basati su ranking, anzichè restituire un insieme non ordinato di documenti che soddisfano un'espressione booleana, il sitema restituisce un ordinamento sui migliori documenti della collezione rispetto a una specifica query. \
Inoltre, invece di utilizzare un linguaggio di interrogazione basato su operatori ed espressioni formali, la query dell'utente è costituita semplicemente da una o più parole scritte in linguaggio naturale. In linea di principio si possono distinguere due scelte separate, ovvero il linguaggio di interrogazione (_query language_) e il modello di ritrovamento (_retrieval model_). Tuttavia, nella pratica, i modello di ritrovamento basati sul ranking sono normalmente associati alla query a testo libero. \
Quando un sistema produce una classifica di risultati, un insieme di risultati troppo grande non è più un problema, in quanto ne mostriamo i primi $k (approx 10)$.
=== Classificazione come base del ranked retrieval
L'obiettivo dei sistemi di ranking e restituire in ordine i documenti che hanno la maggiore probabilità di risultare utili per l'utente che effettua la ricerca. Sorge spontanea la domanda su come sia possibile ordinare per grado di importanza i documenti presenti nella collezione in relazione a una determinata query. \
Si assegna un punteggio, ad esempio compreso nell'intervallo [0, 1], a ciascun documento. Questo punteggio misura quanto bene un documento e una query riescono a "corrispondere". \
Ci serve un modo per assegnare un punteggio ad un documento. Per iniziare la trattazione, si prende in considerazione una query composta da un unico termine. Se il termine della query non compare all'interno del documento il punteggio deve essere pari a 0. A tal proposito ci si chiede il motivo di questa regola e se sia possibile adottare soluzioni migliori. Più il termine della query è frequente all'interno del documento, maggiore dovrebbe essere il punteggio assegnato.
==== Primo approccio: Coefficiente di Jaccard
Il coefficiente di Jaccard rappresenta una misura comunemente impiegata per calcolare la sovrapposizione tra due insiemi, $A$ e $B$. \
Il coefficiente si calcola come il rapporto tra la cardinalità dell'intersezione e la cardinalità dell'unione dei due insiemi, espresso dalla formula:
$
j a c c a r d(A, B) = bar A inter B bar backslash bar A union B bar
$
Analizziamone alcune proprietà:
- $j a c c a r d(A, B) = 1$ nel caso di insiemi identici;
- $j a c c a r d(A, B) = 0$ nel caso in cui l'intersezione sia nulla.
Gli insiemi non devono necessariamente avere la stessa dimensione e il coefficiente assegna sempre un valore compreso tra 0 e 1.
#esempio[
Viene posto l'interrogativo su quale sia il punteggio di corrispondenza tra query e documento calcolato dal coefficiente di Jaccard per due documenti specifici. Sia data la seguente query:
$
Q: "ides of march"
$
I documenti sono:
- $D_1: "caesar died in march"$
- $D_2: "the long march"$.
Applichiamo la formula
$
j a c c a r d(Q, D) = bar Q inter D bar backslash bar Q union D bar
$
e ottieniamo:
- $j a c c a r d(Q, D_1) = 1/6$
- $j a c c a r d(Q, D_2) = 1/5$
]
Il coefficiente di Jaccard non considera la *frequenza dei termini*. Inoltre, i termini rari all'interno di una collezione sono più informativi rispetto a quelli frequenti, ma il coefficiente di Jaccard ignora completamente questa informazione. Emerge la necessità di disporre di un metodo più sofisticato per effettuare la noramalizzazione basata sulla lunghezza del testo.
==== Secondo approccio: matrici di conteggio termini-documenti
Consideriamo il numero di volte in cui un determinato termine compare all'interno di un documento. Ciascun documento viene rappresentato come un vettore di conteggio appartenente a $NN^V$ corrispondente a una colonna della matrice.
#let blu = rgb("#0000ff")
#let marrone = rgb("#993300")

#let opere = (
  "Antony and Cleopatra", "Julius Caesar", "The Tempest",
  "Hamlet", "Othello", "Macbeth",
)

#let dati = (
  ("Antony",    157,  73, 0, 0, 0, 0),
  ("Brutus",      4, 157, 0, 1, 0, 0),
  ("Caesar",    232, 227, 0, 2, 1, 1),
  ("Calpurnia",   0,  10, 0, 0, 0, 0),
  ("Cleopatra",  57,   0, 0, 0, 0, 0),
  ("mercy",       2,   0, 3, 5, 5, 1),
  ("worser",      2,   0, 1, 1, 1, 0),
)

#table(
  columns: 7,
  inset: (x: 10pt, y: 7pt),
  align: center + horizon,
  stroke: (x, y) => if x == 2 {
    (
      left: red,
      right: red,
      top: if y == 0 { red },
      bottom: if y == dati.len() { red },
    )
  },

  // intestazione
  [],
  ..opere.map(o => text(fill: blu, weight: "bold", o)),

  // righe
  ..dati
    .map(r => (
      text(fill: marrone, weight: "bold", r.at(0)),
      ..r.slice(1).map(n => text(weight: "bold", str(n))),
    ))
    .flatten(),
)
=== Bag of words model
In questo modello si fa uso della rappresentazione vettoriale che non tiene conto dell'ordine delle parole all'interno di un documento. Ad esempio frasi come "John is quicker than Mary" e "Mary is quicker than John" generano esattamente gli stessi vettori. \
Per certi versi, questo modello rappresenta un passo indietro rispetto all'indice posizionale, il quale era in grado di distinguere questi due documenti.
=== Term frequency tf
#definizione(title: "Term frequency")[
La frequenza del termine $t f_(t, d)$ di un termine $t$ in un documento $d$ è definita come il numero di volte in cui $t$ compare all'interno di $d$.
]
Vogliamo utilizzare il valore di $t f$ nel calcolo dei punteggi di corrispondenza tra query e documento, ma ci si interroga su come farlo correttamente. La frequenza grezza in sè non è ciò che vogliamo. Un documento con 10 occorrenze di un termine è certamente più rilevante rispetto a un documento con una sola occorrenza, ma non è 10 volte più rilevante. \
La rilevanza non cresce in modo direttamente proporozionale rispetto alla frequenza del termine. È bene notare che la frequenza, nell'ambito dell'Information Retrieval, è pari al conteggio puro.
==== Pesatura basata sulla frequenza logaritmica
Il peso basato sulla frequenza logaritmica di un termine $t$ in un documento $d$ è definito dalla funzione a tratti:
$
w_(t, d) = cases(
1 + log_10(t f_(t, d)) & "se" t f_(t, d) > 0,
0 & "altrimenti"
)
$
Ad esempio:
- $0 -> 0$
- $1 -> 1$
- $2 -> 1.3$
- $10 -> 2$
- $1000 -> 4$ e così via.
Per una coppia documento query il punteggio complessivo si ottiene sommando i pesi per tutti i termini $t$ presenti sia nella query $q$ che nel documento $d$:
$
s c o r e(d, q) = sum_(t in q inter d)(1 + log(t f_(t, d)))
$
La *condizione di annullamento*, ovvero se il punteggio è pari 0, si avvera se nessuno dei termini della query è presente all'interno del documento. \
La formula precedentemente introdotta definisce il cosidetto *_sublinear tf-scaling_*, in cui il peso è calcolato come
$
w_(t, d) = cases(
1 + log_10(t f_(t, d)) & "se" t f_(t, d) > 0,
0 & "altrimenti"
)
$
L'approccio normale, *normal* è il metodo più semplice e diretto e consiste nell'utilizzare il numero puro di occorrenze del termine all'interno del documento. Ma, come discusso in precedenza, l'utilizzo di una scala sublineare per la frequenza dei termini risulta complessivamente migliore e più efficace.
=== Document frequency
I termini rari, nell'intera collezione dei documenti, sono più informativi dei termini frequenti, ad esempio delle stop word. \
Consideriamo un termine in una query che è raro nella collezione, ad esempio _aracnocentrico_. Un documento che contiene tale termine sarà, molto probabilmente, rilevante alla query "aracnocentrico". Quindi, dobbiamo assegnare un peso alto per termini considerati rari. \
Generalmente i termini frequenti sono *meno informativi* dei termini rari. \
*VEDERE ESEMPI SLIDE* \
==== idf weight
$d f_t$ è la _frequenza del documento_ del termine $t$: il numero di documenti che contiene tale termine $t$
- $d f_t$ è una misura inversa dell'informatività di $t$, più piccola è meglio è.
- $d f_t <=N$
Definiamo con _idf_, *inverse document frequency*, di $t$ come
$
i d f_t = log(N / (d f_t))
$
è una funzione che dipende solo da $t$, non dal documento. Utilizziamo $log(N / (d f_t))$ e non $N / (d f_t)$ per attenuare l'effetto di _idf_. \
Per ogni termine $t$ nella collezione di documenti esiste il corrispettivo valore di _idf_. \
L'idf non ha effetto su query che presentano un'unico termine in quanto esiste un valore di idf per ogni termine nella collezione. Il valore di idf influisce sulla classificazione dei documenti per query che hanno almeno 2 termini. \
==== Differenza fra collection e document frequency
La collection frequency di un termine $t$ conta il numero di occorrenze di $t$ nella collezione, contando occorrenze multiple. La document frequency, conta in quanti documenti è presente il termine $t$. \
Per avere una ricerca migliore uniamo questi due concetti nel *tf-idf weighting*.
==== tf-idf weighting
Il *tf-idf weight* di un termine è il prodotto del suo _tf weight_ e del suo _idf weight_:
$
w_(t, d) = (1 + log(t f_(t, d))) times log(N / (d f_t))
$
Questo è il migliore schema di pesatura nell'ambito dell'information retrieval. È bene notare che il segno "-" non indica sottrazione, ma un trattino. Ci sono altre nomenclature per questo schema, come *tf.idf* oppure *tf* $times$ *idf*.
Il tf-idf ha 2 proprietà:
+ Aumenta con il numero di occorrenze in un documento;
+ Aumenta con la rarità del termine nella collezione.
Con questo possiamo definire la classificazione finale dei documenti data una query con la seguente formula:
$
S c o r e(d, q) = sum_(t in q inter d)t f_(t, d) times i d f_t
$
=== Documenti come vettori
Supponiamo di avere uno spazio vettoriale con $V$ dimensioni, ove:
- i termini sono gli assi dello spazio;
- i documenti sono i punti o i vettori nello spazio.
In un web search engine questo spazio vettoriale può arrivare anche ad avere una dimensione di decine di millioni. \
Questi sono vettori molto scarsi in quanto la maggior parte delle voci è pari a 0.
=== Query come vettori
Vogliamo fare la stessa cosa fatta per i documenti, rappresentare le query come uno spazio vettoriale e vogliamo classificare i documenti secondo la loro vicinanza alla query nello spazio vettoriale. La vicinanza rappresenta la similarità dei vettori e l'inverso della distanza. \
Stiamo volgendo la nostra attenzione per non far ricorso al modello di ritrovamento booleano e per classificare con un punteggio più alto i documenti più rilevanti rispetto ai documenti meno rilevanti.
==== Formalizzazione della prossimità nello spazio vettoriale
Un primo approccio è quello di considerare la distanza tra due punti, intesa come la distanza tra gli estremi dei due vettori. \
Ci si interroga sulla possibilità di utilizzare la distanza euclidea ma è una cattiva idea perchè restituisce valori elevanti quando viene applicata a vettori con lunghezze differenti. Consideriamo il seguente esempio:
#figure(
image("images/distanza_euclidea.png", width: 70%),
)
La distanza euclidea tra $q$ e $d_2$ è grande anceh quando la distribuzione dei termini nella query $q$ e la distribuzione dei termini nel documento $d_2$ sono molto simili.\
La soluzione è quella di utilizzare l'angolo anzichè la distanza. Consideriamo il seguente esperimento: si prenda un documento $d$ e lo si concaten a se stesso. Questo documento viene chiamato $d'$. Semanticamente $d$ e $d'$ possiedono esattamente lo stesso contenuto. La distanza euclidea tra i due documenti può risultare piuttosto grande. Se si utilizza la rappresentazione $t f_(t, d)$ l'angolo tra i due documenti è pari a 0, il che corrisponde alla massima somiglianza. \
Quindi l'idea è quella di ordinare i documenti in base all'angolo che formano con la query.
==== Dagli angoli ai coseni
Le due seguenti modalità di ordinamento risultano equivalenti:
- ordinare i documenti in ordine _decrescente_ rispetto all'angolo compreso tra la query e il documento;
- ordinare i documenti in ordine crescente rispetto al coseno tra query e documento ($cos("query", "documenti")$)
La funzione coseno è monoticamente decrescente nell'intervallo $[0^degree, 180^degree]$. \
Analizziamo come e perchè dovremmo calcolare i coseni. \
Un vettore può essere normalizzato dividendo ciascun componente per la sua lunghezza, per questo utilizziamo la norma 2, $L_2$:
$
lr(||arrow(x)||)_2 = sqrt(sum_i x_i^2)
$
Dividendo un vettore per la sua norma 2 lo rende un vettore di lunghezza pari ad 1, quindi un *versore*. I due documenti $d$ e $d'$ dell'esperimento precedente avranno vettori identici dopo averli normalizzati. Quindi documenti lunghi e corti avranno un peso comparabile. \
Consideriamo ora la formula $cos("query", "document")$.
$
cos(arrow(q), arrow(d)) = (arrow(q) dot.c arrow(d))/(|arrow(q)| |arrow(d)|) = (arrow(q))/(|arrow(q)|) dot.c (arrow(d))/(|arrow(d)|) = (sum_(i=1)^(|V|)q_i d_i)/(sqrt(sum_(i=1)^(|V|)q_i^2) sqrt(sum_(i=1)^(|V|)d_i^2))
$
Per vettori normalizzati, la similarità del coseno è semplicemente il prodotto scalare:
$
cos(arrow(q), arrow(d)) = arrow(q) dot.c arrow(d) = sum_(i=1)^(|V|)q_i d_i
$
#esempio(title: "Similarità del coseno tra 3 documenti")[
Consideriamo i tre documenti:
- _Sas: Sense and Sensibility_
- _Pap: Pride, and Prejudice_
- _WH: Wuthering Heights?_
e consideriamo la frequenza dei termini:
#figure(
image("images/cos_tf_ex.png", width: 70%),
caption: [Term frequency]
)
Il peso calcolato tramite log frequency è il seguente:
#figure(
image("images/log_ex.png", width: 70%),
caption: [Log frequency]
)
Normalizzando tali pesi otteniamo:
#figure(
image("images/norm_ex.png", width: 70%),
caption: [Normalizzazione della lunghezza]
)
Analizziamo i calcoli del coseno:
$
cos("Sas, PaP") approx 0.789 times 0.832 + 0.515 times 0.555 + 0.335 times 0.0 + 0.0 times 0.0 approx 0.94
$
$
cos("Sas, WH") approx 0.79
$
$
cos("Pap, WH") approx 0.69
$
]
Per calcolare il punteggio tramite coseno si utilizza il seguente algoritmo:
#algoritmo(title: [CosineScore($q$)])[
  #pseudocode-list[
    + _float_ $S c o r e s[N] = 0$
    + _float_ $L e n g t h[N]$
    + *for each* query term $t$
      + *do* calculate $w_{t,q}$ and fetch postings list for $t$
        + *for each* pair$(d, "tf"_{t,d})$ in postings list
          + *do* $S c o r e s[d] "+=" w_{t,d} times w_{t,q}$
    + Read the array $L e n g t h$
    + *for each* $d$
      + *do* $S c o r e s[d] = (S c o r e s[d]) / (L e n g t h[d])$
    + *return* Top $K$ components of $S c o r e s[]$
  ]
] <alg:cosine-score>
Il tf-idf weighting ha diverse varianti:
#figure(
image("images/tf-idf-varianti.png", width: 90%),
caption: [Varianti del tf-idf weighting]
) <fig:varianti_tf_idf>
Alcuni motori di ricerca consentono di avere sistemi di classificazioni diversi per documenti e query. Si usa una specifica notazione per specificare il sistema di classificazione usato per le query e per i documenti, ed è il seguente _ddd.qqq_ utilizzando gli acronimi della @fig:varianti_tf_idf . Uno schema di pesatura comunemente usato è _lnc.ltc_. Lo schema lnc per i documenti è il term frequency logaritmico (_l_), senza inverse document frequency (_n_) e con normalizzazione del coseno (_c_). Per la query invece si adotta il term frequency logaritmico (_l_), l'inverse document frequency (_t_) e la normalizzazione del coseno.
=== Riepilogo
Il ranking nello spazio vettoirlae permette di:
- rappresentare la query come un vettore pesato (tf-idf);
- ciascun documento viene rappresentato come un vettore pesato tf-idf;
- viene calcolato il punteggio di somiglianza del coseno tra il vettore della query e il vettore di ciascun documento;
- i documenti vengono ordinati rispetto alla query in base al punto ottenuto;
- vengono restituiti all'utente i primi $K$ documenti.
== Integrazione di conoscenza lessicale: WordNet
WordNet è un'ontologia linguistica che rappresenta in maniera esplicita e formale la conoscenza linguistica umana. L'obiettivo di WordNet è quello di consentire la ricerca concettuale nei dizionari e il risultato è quello di aver definito un database lessicale. \
WordNet è un'ontologia linguistica top-level in quanto rappresenta la conoscenza linguistica che presenta due aspetti fondamentali:
- _senso comune_: costituisce una forma di conoscenza di senso comune.
- _versatilità d'uso_: può essere impiegata trasversalmente in qualsiasi dominio.
=== Utilizzo di WordNet
Sistemi per Information Retrieva e Text Categorization utilizzano la conoscenza linguistica di WordNet per aggiungere "semantica" al processo di ritrovamento/categorizzazione. \
La memoria lessicale umana si suddivide in quattro parti ognuna rispettivamente dedicata a: nomi, verbi, aggettivi e avverbi. Gli ideatori di WordNet, ispirandosi a tale teoria, hanno suddiviso in modo analogo la conoscenza lessicale.
=== Concetto di parola
La parola è un'associazione fra una word form e una word meaning:
- _word form_: espressione fisica della parola ovvero l'insieme di lettere che la costituisce;
- _word meaning_: concetto lessicale che la word form vuole esprimere ovvero il suo significato sottinteso.
WordNet realizza il mapping tra word form e word meaning.
#figure(
image("images/wordnet.png", width: 70%),
caption: [Mapping tra word form e word meaning]
)
Una word form è *polisemica* se ad essa possono essere associate più word meaning. Due word form sono *sinonimi* se ad esse è associata la stessa word meaning. \
Lo scopo principale di WordNet è quello di riuscire a trasferire ad un computer tutta la conoscenza linguistica (le word form, le word meaning e il mapping fra queste). La rappresentazione delle word form, in una forma comprensibile ad un calcolatore, non ha suscitato molti problemi. \
Ogni word meaning è rappresentata dall'insieme delle word form che possono essere usate per esprimerla: _synset_. Un synset associato ad una word form consente all'utente di inferire la semantica della word form in esame purchè conosca la semantica di almeno una word form elencata nel synset.
#figure(
image("images/synset.png", width: 70%),
caption: [Synset]
)
Se una parola è polisemica, viene applicato l'algoritmo di disambiguazione *WSD (Word Sense Disambiguation)*.
=== Synset Semantic Similarity
La metrica di Leacock-Chodorow introduce un approccio per quantificare la somiglianza tra due synset $a$ e $b$ sfruttando la struttura tassonomica di WordNet.
#algoritmo(title: [Funzione SINSIM])[
  #pseudocode-list[
    + *function* $"SINSIM"(a, b)$
    	+ $N_p <-$ the number of nodes in path $p$ from $a$ to $b$
    	+ $D <-$ maximum depth of the taxonomy
    	+ $r <- -log(N_p / 2D)$
    + *return* $r$
  ]
] <alg:sinsim>
Sia dato il seguente esempio:
#figure(
image("images/leacock_chodorow.png", width: 70%)
)
Per la coppia $S I N S I M("cat", "mouse")$, il percorso attraversa 5 nodi e applicando la formula con $D= 16$ si ottiene il valore $log(5/32) = 0.806$.
=== Relazioni tra synset
Wordnet organizza i concetti attraverso due tipi fondamentali di relazioni semantiche che catturano la struttura della conoscenza lessicale umana. Queste relazioni sono:
- *Iperonimia/Iponimia*. Relazioni gerarchica *_is_a_* che esprimono specializzazione tra concetti.
- *Meronimia/Olonimia*. Relazioni *parte-tutto* che descrivono come gli elementi costituiscono strutture più complesse.
==== Iperonimia e Iponimia: la Gerarchia
#definizione(title: "Iperonimia")[
L'_iperonimia_ rappresenta una relazione _is_a_ asimettrica transitiva. Un synset _Y_ è iperonimo di $X$ se $X$ è un tipo di $Y$.
]
L'_iponimia_ è la relazione inversa: $X$ è iponimo di $Y$ se $X$ rappresenta un tipo più specifico di _Y_. \
Analizziamone le proprietà.
- *Asimmetria*: se $X$ è iponimo di $Y$, $Y$ non può essere iponimo di $X$.
- *Transitività*: se $A$ è iponimo di $B$ e $B$ è iponimo di $C$, allora $A$ è iponimo di $C$.
- *Ereditarietà*: gli iponimi ereditano le proprietà dei loro iperonimi (nodi superiori della tassonomia).
==== Profondità e Ampiezza della Gerarchia
La struttura gerarchica di WordNet varia significativamente tra domini semantici, riflettendo diversi livelli di specificità. Si possono avere 16 livelli massimi, ovvero la profondità massima della gerarchia per sostantivi. Ci possono essere 8 livelli medi che è la profondità tipica della maggior parte delle gerarchia e ci possono essere 25.000 synset foglia, ovvero concetti terminal senza iponimi.
==== Meronimia e Olonimia: Relazioni parte-tutto
Le relazioni parte-tutto catturano la composizione strutturale degli oggetti e sono fondamentali per comprendere la struttura fisica e funzionale delle entità. Le diverse tipologie di *meronimia* sono le seguenti.
- *Part-Meronym* (Parte-Tutto strutturale). Riguarda i componenti fisici e strutturali di un oggetto. Ad esempio una "ruota" è parte di un "automobile".
- *Member-Meronym* (Membro - Collezione). Riguarda l'appartenenza di un elemento individuale a un gruppo o collezione. Ad esempio un "albero" è membro di una "foresta".
- *Substance-Meronym* (Materiale - Sostanza). Riguarda la materia prima o il materiale costitutivo con cui è fatto un oggetto. Ad esempio il "legno" è la sostanza di un "tavolo".
#esempio(title: "Struttura di un albero")[
#figure(
image("images/meronimia.png", width: 70%),
caption: [Esempi di meronimia]
)
]
==== Differenze Formali tra le relazioni.
Analizziamo le differenze fra le relazioni di iperonimia/iponimia rispetto a quelle di meronimia/olonimia. Le relazioni di iperonimia/iponimia sono delle relazioni tassonomiche, sono transitive e godono della proprietà di ereditarietà. Le relazioni di meronimia indicano una relazione compositiva, la transitività è limitata, non c'è ereditarietà ed esiste una dipendenza strutturale.
==== Applicazioni nel Natural Language Processing
Le relazioni semantiche sono fondamentali per numerose applicazioni di elaborazione del linguaggio naturale e rappresentazione della conoscenza. Sono impoeranti per i seguenti motivi.
- *Disambiguazione del senso*. Le gerarchie aiutano a risolvere l'ambiguità lessicale attraverso vincoli semantici.
- *Espansione di Query*. Gli iperonimi e iponimi migliorano il recupero dell'informazione.
- *Inferenza Semantica*. Le relazioni permettono di dedurre proprietà implicite e inferenze logiche.
- *Similarity Semantica*. La distanza nella gerarchia quantifica la similarità concettuale.
= Relevance Feedback
Il relevance feedback è il feedback dell'utente sulla rilevanza dei documenti sul set iniziale dei risultati. Il processo di relevance feedback può essere scomposto nelle seguenti fasi.
+ L'utente formula una query (breve e semplice).
+ L'utente marca alcuni risultati come rilevanti o non rilevanti.
+ Il sistema computa una miglior rappresentazione del bisogno informativo basandosi sul feedback ricevuto.
+ Questo processo può ripetersi una o più volte.
Può essere difficile formulare una buona query quando non si ha una buona conoscenza della collezione, per questo si itera il processo di relevance feedback. \
Il processo di modifica della query è comunemente riferito come:
- *relevance feedback*, quando l'utente fornisce informazioni su documenti rilevanti ad una data query, oppure come
- *query expansion* (_espansioni della query_), quando l'informazione correlata alla query viene usata per espanderla.
Ci riferiamo ad entrambi come metodi per fornire feedback al sistema. Due approcci comuni dei metodi di feedback sono:
- *feedback esplicito* (_explicit feedback_), dove le informazioni per la riformulazione della query sono fornite direttamente dagli utenti;
- *feedback implicito* (_implicit feedback_), dove le informazioni per la riformulazione della query vengono derivate implicitamente dal sistema.
== Un concetto chiave: il centroide
Il *centroide* è il centro di una massa di un insieme di punti. Ricordiamo che i documenti vengono rappresentati come punti in uno spazio multi-dimensionale. \
Il centroide viene definito come segue:
$
arrow(u)(C) = (1)/(bar C bar)sum_(d in C)arrow(d)
$
dove $C$ è l'insieme dei documenti. Il centroide rappressenta il "documento medio". Il centroide per definizione non è normalizzato. \
Vediamo come si mettono insieme tutte queste informazioni da un punto di vista operazionale. Utilizziamo un algoritmo, detto *algoritmo di Rocchio*.
=== Algoritmo di Rocchio
Definiamo la terminologia riguardante il processo di una data query $q$, come segue:
- $D_r$ è l'insieme dei documenti rilevanti tra i documenti ritrovati;
- $N_r$ è la cardinalità dell'insieme $D_r$;
- $D_n$ è l'insieme dei documenti non rilevanti tra i documenti ritrovati;
- $N_n$ è la cardinalità dell'insiemem $D_n$
- $C_r$ è l'insieme dei documenti rilevanti tra tutti i documenti nella collezione;
- $N$ è il numero di documenti nella collezione
- $alpha, beta, gamma$ sono delle costanti di accordatura.
L'algoritmo di rocchio usa il modello a spazio vettoriale per scegliere una query sul feedback di rilevanza. L'algoritmo cerca di separare i documenti rilevanti da quelli non rilevanti, la soluzione è la seguente:
$
arrow(q)_(o p t) = 1/(bar C_r bar)sum_(arrow(d)_j in C_r)arrow(d)_j - 1/(N - bar C_r bar)sum_(arrow(d)_j in.not C_r)arrow(d)_j
$
ove $arrow(q)_(o p t)$ è ìl vettore della query ottimale. \
Il problema è che non conosciamo veramente l'insieme dei documenti rilevanti $C_r$. \
L'insieme $C_r$ non è noto a priori. Per risolvere questo problema, possiamo formulare una query iniziale e cambiare incrementalmente il vettore di query iniziale. \
Pertanto, l'algoritmo cambia nel seguente modo:
$
arrow(q)_m = alpha arrow(q)_0 + (beta) / N_r sum_(arrow(d)_j in D_r)arrow(d)_j - (gamma)/(N_n)sum_(arrow(d)_j in D_n) arrow(d)_j
$
ove
- $D_r$ è l'insieme dei vettori dei documenti rilevanti noti
- $D_n$ è l'insieme dei vettori dei documenti irrilevanti noti
- $q_m$ è il vettore della query modificato;
- $q_0$ è il vettore della query iniziale;
- $alpha, beta, gamma$ sono i pesi che possono essere scelti a mano oppure possono essere impostati empiricamente.
La nuova query avanza verso i documenti rilevanti e si allontana dai documenti irrilevanti.
#figure(
image("images/rocchio.png", width: 70%),
caption: [Applicazione dell'algoritmo di Rocchio]
)
Ci sono alcune cose che bisogna notare. Ci deve essere un buon tradeoff tra $alpha$, $beta$ e $gamma$ in quanto se abbiamo tanti documenti valutati, vogliamo una $beta$ e una $gamma$ più alti. Alcuni pesi nel vettore della query possono essere negativi, anche se vengono ignorati e vengono impostati a 0. \
Un feedback positivo è più importante di uno negativo, anche se molti sistemi consentono solo l'uso di feedback positivi. \
Il feedback può migliorare la precisione.
=== Problemi del relavance feedback
I problemi del relavance feedback sono i seguenti.
+ *Inefficienza della query lunghe*.
	Query molto lunghe sono inefficeinti per i motori di information retrieval per diversi motivi citati di seguito.
	- Comportano tempi di risposta elevanti per l'utente.
	- Rappresentano un costo computazionale elevato per il sistema di recupero.
	Per questo si ricorre ad una soluzione parziale: si ricalcola il peso soltanto di alcuni termini prominenti, ad esempio limitandosi ai primi 20 in base alla frequenza dei termini.
+ *Riluttanza degli utenti*: gli utenti sono spesso riluttanti a fornire un feedback esplicito.
+ *Difficoltà di interpretazione*: dopo aver applicato il relevance feedback, risulta spesso più complesso comprendere il motivo per cui uno specifico documento sia stato recuperato.
+ *Evoluzione del bisogno informativo*: i bisogni informativi possono cambiare durante l'interazione con il sistema.
== Valutazione delle strategie di relevance feedback
- _Metriche e grafici_:
	- Utilizzare la query iniziale $q_0$ per calcolare il grafico di precisione e copertura.
	- Utilizzare la query modificata $q_m$ per calcolare il grafico di precisione e copertura.
+ Metodo 1: *Valutazione su tutti i documenti della collezione*
	- Mostra miglioramenti spettacolari, ma si tratta di una forma di "imbroglio"
	- I documenti già noti come rilevanti ottengono posizioni più elevate nel ranking.
	- La valutazione deve essere effettuata rispetto a documenti non ancora visti dall'utente
+ Metodo 2: Uso della collezione residura (tutti i documenti meno quelli valutati come rilevanti)
	- Le metriche risultano solitamente inferiori rispetto a quelle della query originale.
	- Rappresenta una valutazione più realistica.
	- Consente di confrontare in modo valido le prestazioni relative.
- _Riscontro empirico_: un solo ciclo di feedback di rilevanza risulta spesso molto utile, mentre un secondo ciclo offre talvolta solo benefici marginali.
Il metodo più soddisfacente è quello di utilizzare due collezioni, ognuna con la propria valutazione di rilevanza:
- $q_0$ e il feedback dell'utente vengono usati sulla prima collezione;
- $q_m$ viene eseguita sulla seconda collezione e viene valutata.
Una vera valutazione dell'utilità deve confrontare i metodi a parità di tempo impeigato o a parità di sforzo richiesto dall'utente. Un'alternativa comune al feedback di rilevanza consiste nel permettere all'utente di revisionare e inviare nuovamente la query. Gli utenti potrebbero preferire la revisione e il reinvio della query piuttosto che dover giudicare manualmente la rilevanza dei singoli documenti. \
Non esistono prove evidenti che il feedback di rilevanza rappresenti l'impiego migliore del tempo dell'utente. \
Alcuni motori di ricerca offrono funzionalità di pagine simili o correlate, che costituisce una forma elementare di feedback di rilevanza. Ad esempio Google è basato sul link. Altri motodi di ricerca non implementano questa opzione perchè risulta complessa da spiegare all'utente medio, come ad esempio Altheweb. \
Il motore di ricerca Excite, invece, integrava un vero e proprio sistema di rilevanza, ma è stato successivamente abbandonato a causa dello scarso utilizzo.
=== Feedback di pseudo-rilevanza
Il feedback di pseudo-rilevanza automatizza la parte manuale del feedback di rilevanza autentico. L'algoritmo di pseudo-rilevanza è basato sui seguenti passi.
+ Recupera un elenco ordinato di risultati per la query dell'utente.
+ Assume che i primi $k$ documenti siano rilevanti.
+ Esegue il feedback di rilevanza (ad esempio, adottazndo l'algoritmo di Rocchio).
In media questo algoritmo funziona molto bene ma può fallire drasticamente per alcune query, ad esempio se i primi risultati di una ricerca riguardano tutti un sottoargomento specifico. Diverse iterazioni possono causare la deriva della query e ci si chiede il perchè.
=== Relevance feedback indiretto
Il feedback di rilevanza indiretto assegna un punteggio più alto a documenti che gli utenti osservano più spesso. I link si cui si fa clic sono considerati presumibilmente rilevanti e questa assunzione si basas sul fatto che i sommari visualizzati siano validi, ecc. \
Questo tipo di feedback non è necessariamente specifoc per un singolo utente o per una specifica query. Questo aspetto rientra nell'area generale del _clickstream mining_. \
Oggigiorno questo processo viene gestito come parte integrante del ranking basato sull'apprendimento automatico.
== Espansione della query
Nel feedback di rilevanza, gli utenti forniscono input aggiuntivi sui documenti, che veogno usati per riassegnare un peso ai termini della query per quei documenti. Nell'*espansione della query*, l'utente fornisce input aggiuntivi (se è un buon termine o un cattivo termine) su *parole o frasi*.\
Un esempio sono le cosiddete _search images_ presenti su google:
#figure(
image("images/search_images.png", width: 70%),
)
Le ricerche correlate, come mostrate nella figura soprastante, sono tecniche di *query assist*. Il processo di query assist viene generalmente effettuato tramite l'analisi dei log delle query e questo processo raccomanda query frequenti e recenti che contengono la stringa parziale digitata dall'utente. Questo viene trattato come un problema di ordinamento in cui ciascuna query precedente è vista come un documento, ordinando per rango quelle che corrispondono alla stringa parziale. \
Per ampliare la query dell'utente si possono adottare diverse tecniche.
- *Thesaurus manuale*. Ad esempio, in _MedLine_ peril termine *physician* i sinonimi sono: _doc, doctor, MD, medico, ecc._
	Il thesaurus può riguardare query correlate anzichè limitarsi ai soli sinonimi.
- *Analisi globale*: di natura statica, basata sull'interezza dei documenti nella collezione. Solitamente viene applicato il processo di thesaurus derivato in modo automatico e vengono applicate statistiche di co-occorrenza. Alternativamente, si possono effettuare perfezionamenti basatu sul query log mining che è l'approccio comune usato sul Web.
- *Analisi locale*: di natura dinamica. Vengono analizzati i documenti inclusi nell'insieme dei risultati.
=== Espansione della query basato su thesaurus
Per ogni termine $t$ in una query, si espande quella query con sinonimi e parole correlate prese dal thesaurus, ad esempio:
$
"feline" -> "feline cat"
$
Questo approccio incrementa generalmente la copertura ed è ampiemente utilizzato in ambiti scientifici e ingegneristici. Tuttavia, presenta grossi svantaggi: ha un costo di produzione manuale molto elevato, richiede un aggiornamento costante per seguire l'evoluzione scientifica e rischia di abbassare drasticamente la precisione a causa dell'ambiguità dei termini. Ad esempio, espandere in modo improprio _interest rate_ può portare a risultati distorti come _interest rate fascinate value_. Per mitigare questo problema, i termini aggiunti vengono solitamente pesati meno rispetto a quelli originali.
= Valutazione dei Sistemi di Ritrovamento
Ci sono tanti modelli, algoritmi e sistemi di ritrovamento, ma dobbiamo capire quali siano i migliori. \
Dobbiamo capire quale sia il miglior componente per:
- funzione di ranking;
- selezione dei termini;
- pesatura dei termini.
È importante capire quanto in baso nella lista ordinata dei risultati un utente debba spingersi per trovare alcuni o tutti i documenti rilevanti.
== Difficoltà nel valutare sistemi di ritrovamento
L'efficacia di un sistema di ritrovamento è collegata alla rilevanza degli elementi ritrovati. La rilevanza, tipicamente, non è binaria ma è continua. Anche se fosse binaria, sarebbe difficile effettuare un giudizio. La rilevanza, da un punto di vista umano, è:
- *soggettiva*: dipende dal giudizio di uno specifico utente;
- *situazionale*: dipende dagli bisogni attuali di un utente;
- *cognitiva*: dipende dalla percezione e dal comportamento umano;
- *dinamico*: ci sono cambiamenti nel corso del tempo;
- *contestuale*: influenzata dallo stato dell'utente, come mood, tempo disponibile, ecc.
=== Pardigma di Cranfield
La valutazione dei sistemi di ritrovamento è il risultato di un esperimento condotto al college di Cranfield da un bibliotecario, Cyrill Cleverdon. \
Le intuizioni tratte da questi esperimenti costituiscono ancoa oggi la base fondamentale per la valutazione dei sistemi di ritrovarmento. Cleverdon prese in considerazione un nuovo sistema di indicizzazione denominato _Uniterm_. Il sistema prevedeva l'anaalisi di 40.000 intestazioni di argomento, che portarono a 7.000 parole distinte. Successivamente, venne eseguito un test che consisteva nell'indicizzare manualmente 200 documenti utilizzando il sistema _Uniterm_, chiedendo poi di eseguire alcune query. \
Il cuore del *paradigma di Cranfield* risiede nell'utilizzo di una *collezione di riferimento di test*, composta strutturalmente da tre elementi fondamentali:
+ un insieme di documenti;
+ delle query;
+ dei relativi giudizi di rilevanza.
In questo contesto, il concetto di rilevanza viene intesto in senso stretto come _rilevanza tematica_, verificando se un documento contenga informazioni che vertono sullo stesso argomento della query. \
Questo impianto metodologico ha trovato concreta realizzazione nella nota collezione *Cranfield 2*, la quale raccoglieva 1400 articoli di ricerca in lingua inglese appartenenti ad un unico dominio accompagnati da 221 argomento o query di test. L'aspetto cruciale di questa metodologia è che l'utilizzo di una collezione di riferimento standardizzata permette di impiegare lo stesso identico set di documenti e query per valutare e confrontare diversi sistemi di ranking. Di conseguenza, l'uniformità di questa configurazione garantisce una valutazione rapida ed efficiente di nuove funzioni di ranking. \
All'interno del paradigam di Cranfield, la procedura operativa per la valutazione comparativa dei sistemi si sviluppa attraverso una sequenza logica strutturata in diverse fasi.
+ Vengono selezionati diversi sistemi di ritrovamento da confrontare.
+ Vengono utilizzati i sistemi scelti per produrre liste pesate dei documenti, dette _runs_, per ogni query.
+ Vengono calcolati l'efficicacia di ogni strategia per ogni query nella collezione di test come la funzione di ritrovamento dei documenti ritrovati.
+ I punteggi ottenuti vengono mediati su tutte le query, calcolando l'efficacia globale del sistema o della strategia.
+ Vengono usati i punteggi del passo prendente per classificare i sistemi di ritrovamento tra loro
+ (opzionale, per determinare l'approccio migliore) Vengono eseguiti test statistici per determinare se le differenze tra il punteggio di efficacia per i sistemi e il loro punteggio  è rilevante.
==== Human Labeld Corpus (Test collection)
La costruzione di una collezione di test da parte di esseri umani richiede una metodologia rigorosa che parte da un corpus inziale di documenti. Su questa base si raccolgono differenti bisogni informativi, i quali vanno tenuti distinti dalle semplice query, specifici per quel determinato corpus. Successivamente, uno o più esperti umani si occupano di etichettare in modo esauistivo i documenti rilevanti associati a ciascun bisogno informativo. Tale approccio si basa tipicamente su giudizi di rilevanza di tipo binario e comporta uno sforzo umano considerevole, in particolare quando si opera su corpus di grandi dimensioni.
== Benchmark standard di rilevanza
Nel panorama dell'Information Retrieval, per superare i limiti dei primi esperimenti e disporre di banchi di prova su larga scala, sono stati definiti dei *becnhmark standard di rilevanza*. Il punto di riferimento fondamentale è costituito dalla *TREC, Text Retrieval Conference*, un grande sistema di test, forte di una collezione di un millione di documenti e di una serie annuale di workshop dedicati.\
Con l'espansione della rete, la ncessità di valutare sistemi su scala Web ha portato allo sviluppo di corpus imponenti, tra cui la collezione *ClueWeb09*, che raccoglie più di un miliardo di pagine web in dieci lingue distribuite su vari domini. A competere figurano altre importanti colezioni, come:
- *ILST*
- *UCKS*
- *MEDLARS*
Oltre a corpus storici, nel panorama dei benchmark standard rientrano raccolte di documenti di riferimento come *Reuters*. All'interno di questi contesti vengono definiti specific compiti di recupero, espressi talvolta sotto forma di query. Per effettuare la valutazione, esperti umani si occupano di etichettare cianscun documento rispetto a ogni query, distiguendolo in rilevante o non rilevante. Tale attività di giudizio viene condotta almeno su sottoinsiemi di documenti, mediante una tecnica nota come _pooling_, restituiti da alcuni sistemi per quella specifica query.
== Precisione e richiamo
Per valutare l'efficacia di un sistema di Information Retrieval, si fa affidamento a due metriche fondamentali: la *precisione* e la *copertura (recall)*. \
Questi parametri vengono definiti analizzando la relazione tra l'intera collezione di documenti, l'insiemi dei documenti realmente rilevanti per un dato bisogno informativo e l'insieme dei documenti effettivamente recuperati dal sistema. Attraverso una rappresentazione a insiemi o una matrice di contigenza, è possibile suddividere i risultati i documenti recuperati e rilevanti, recuperati ma irrilevanti, non recuperati ma rilevanti, e infine non recuperati e irrilevanti.
#figure(
image("images/rapp_insieme.png", width: 70%),
caption: [Insiemi di documenti rilevanti e non]
)
#figure(
image("images/mat_doc.png", width: 70%),
caption: [Matrice di contingenza]
)
La *precisione* misura l'esattezza dei risultati restituiti e si calcola nel seguente modo:
$
"precision" = ("Number of relevant documents retrived") / ("Total number of documents retrieved")
$
In altre parole, indica quale percentuale dei risultati forniti sia effettivamente pertinente per l'utente. \
La *copertura* misura la completezza del processo di recupero e si determina nel seguente modo:
$
"recall" = ("Number of relevant documents retrieved") / ("Total number of relevant documents")
$
Tale metrica evidenzia la capacità del sistema di individuare quanta parte dell'informazione utile disponibile sia stata effettivamente portata alla luce. \
Trasformiamo la matrice di contigenza nel seguente modo:
#figure(
image("images/mat_doc2.png", width: 70%),
)
Calcoliamo la precisione e la copertura nel seguente modo:
$
"precision" = ("Number of relevant documents retrieved") / ("Total number of documents retrieved") = ("TP") / ("TP + FP")
$
$
"recall" = ("Number of relevant documents retrieved") / ("Total number of relevant documents") = ("TP") / ("TP + FN")
$
Approfondendo ulteriormente il concetto di *precisione* e *copertura*, possiamo definirli formalmente anche attraverso la probabilità condizionata e le specifiche capacità del sistema:
- Precisione:
	- Rappresenta la frazione di documenti recuperati che risulta effettivametne rilevante.
	- Corrisponde alla capacità del sistema di collocare i documenti più pertinenti ai vertici della graduatoria.
	- Dal punto di vista probabilistico, si esprime come la probabilità che un documento sia rilevante dato che è stato recuperato: $P("rilevante" bar "recuperato")$
- Copertura:
	- Rappresenta la frazione di documenti rilevanti che viene effettivamente recuperata dal sistema.
	- Riflette la capacità della ricerca di individuare *tutti* gli elementi pertineti presenti all'interno del corpus.
	- Dal punto di vista probabilistico, si esprime come la probabilità che un documento sia stato recuperato dato che è rilevante: $P("recuperato" bar "rilevante")$
Analizzando il comportamento di precisione e copertura, sorge spontaneo chiedersi quale sia il livello di copertura di una query nel caso in cui venissero recuperati tutti i documenti della collezione. Adottando questa strategia estrema è possibile ottenere una copertura elevata, sebbene associata a una precisione molto bassa. \
La copertura costituisce una funzione non decrescente rispetto al numero di documenti recuperati. Questa proprietà si spiega osservando che, incrementando la quantità di documenti restituiti, se il documento aggiunto è rilevante aumentano i veri positivi e diminuiscono i falsi negativi, mentre se è irrilevante aumentano i fasli positivi e diminuiscono i veri negativi: in entrambi i casi, il rapporto che definisce la copertura non subisce diminuzioni. \
Per contro, in un sistema efficiente, la precisione tende tipicamente a diminuire all'aumentare del numero di documenti recuperati o dalla copertura stessa. Sebbene questo comportamento non raprpesenti un teorema matematico rigoroso, gode di una fortissima e costnate conferma empirica. \
La determinazione della copertura presenta notevoli difficoltà pratiche, principalmente perchè il numero totale di elementi rilevanti all'interno di un'intera collezione non è sempre disponibile. Per superare questo ostacolo e stimare tale valore, si ricorre solitamente a due approcci principali:
- *Campionamento del database*: si estrae un campione rappresentativo attraverso la base di dati e si effettuano giudizi di rilevanza su questi specifici elementi.
- *Aggregazioni di algoritmi multipli*: si applicano diversi algoritmi di recupero allo stesso database a fronte della medesima query, assumendo che l'insieme aggregato degli elementi rilevanti restituiti dai vari sistemi costituisca l'intero insieme di riferimento.
Il seguente grafo mette in relazione la copertura e la precisione ed evidenzia chiaramente il tradeoff tra queste due metriche.
#figure(
image("images/tradeoff.png", width: 70%),
caption: [Tradeoff tra precisione e copertura]
)
In uno scenario ideale, si vorrebbe raggiungere il punto in cui entrambe le metriche assumono valore massimo pari a 1. \
Tuttavia, nella realtà operativa i sistemi si muovono lungo una curva di compromesso:  - *Alta precisione e bassa copertura*: concentrandosi sui primi risultati, il sistema restituisce documenti rilevanti ma rischia di tralasciarne molti altri che potrebbero rivelarsi utili.
- *Alta copertura e bassa precisione*: cercando di includere la maggior parte dei documenti pertinenti (ad esempio espandendo il recupero), il sistema intercetta i documenti rilevanti ma finisce per includere una grande quantità di materiale irrilevante o "spazzatura" (junk).
=== Limiti nell'utilizzo della precisione e della copertura
L'utilizzo delle metriche di precisione e copertura comporta diverse difficoltà pratiche che è necessario considerare. Prima di tutto, per ottenere una valutazione significativa, è opportuno calcolare la media su sistemi estesi di query e grandi collezioni di documenti. Il processo richiede inoltre valutazioni umane della rilevanza, sebbene le persone non si rivelino sempre valutatrici affidabili. Un'ulteriore limitazione deriva dal fatto che tali valutazioni devono solitametne essere binarie, il che rende complessa l'eventuale gestione di giudizi più sfumati. \
Infine, i dati rischiano di risultare fortemente distorti dalla collezione e dalla paternità dei testi, con la conseguenza che i risultati ottenuti in un determinato dominio potrebbero non essere facilmente trasferibili a un altro.
== Accuratezza
Data una query, un sistema, detto *classifier* o _classificatore_, classifica ogni documento come _rilevante_ o _non rilevante_. L'*accuratezza* del classificatore è calcolata come segue:
$
"accuracy" = ("TP" + "TN") / ("TP" + "FP" + "TN" + "FN")
$
L'accuratezza è una misura di precisione comunemente usata nel lavoro del classificazione in machine learning, ma nell'ambito dell'Information Retrieval questa misura non è molto utile.
== Misura F1
La *misura F1* è una misura di efficacia che tiene conta sia della copertura e sia della precisione. Viene effettuata una media armonica tra copertura e precisione:
$
F = (2 P R) / (P + R) = 2 / ((1 / R) + (1/P))
$
Confrontandola con la media aritmetica, entrambi i valori devono essere alti affinchè la media armonica sia alta. \
La misura F1 è la generalizzazione della misura $F_beta$, ove $beta$ è un parametro che serve a dare più o meno peso a uno dei due parametri (precisione o copertura).
$
F_beta = (1 + beta^2)P R / (beta^2 P + R) = (1 + beta^2) / ((beta^2 / R) + (1 / P))
$
Analizziamo il comportamento di questa misura in base al valore di $beta$:
- $beta = 1$: uguale compromesso tra precisione e copertura ($F_beta = F$)
- $beta > 1$: la copertura ha più peso;
- $beta < 1$: la precisione ha più peso;
- $beta = 0$: $F_beta = P$
A completamento di questa misura di valutazione, viene spesso definita anche la misura $E$, la quale si calcola semplicemente come il complemento a uno della misura $F_beta$. $
E = 1 - F_beta
$
== Curva di precisione-copertura
Quando si passa alla *valutazione dei risultati ordinati*, l'approccio metodologico deve adattarsi alla natura della risposta fornita dal sistema. Un sistema di Information Retrieval può restituire un numero variabile di risultati, modificando il proprio comportamento oppure considerando differenti sottoinsiemi dei migliori documenti restituiti a vari livelli di copertura. Attraverso questa variazione sistematica, il valutatore è in grado di tracciare e produrre una curva di precisione-copertura. \
Consideriamo il seguente esempio.
#figure(
image("images/prec-rec.png", width: 70%),
)
ove 1000 rappresenta il numero di documenti rilevanti per la data query. \
La curva di precisione-copertura che ne deriva è la seguente.
#figure(
image("images/prec_rec_curve.png", width: 70%),
caption: [Curva di precisione-copertura]
)
Analizzare il grado di precisione-copertura relativo a una singola query non risulta particolarmente utile nè significativo. Per ottenere una valutazione affidabile e complessiva delle prestazioni, è infatti necessario calcolare la media della performance estesa a un intero sistema di query. Tuttavia, questo processo di aggregazione fa emergere una questione tecnica rilevante: i calcoli di precisione e copertura restituiscono soltanto determinati punti discreti sul grafico. Di conseguenza, si pone il problema metodologico di stabilire come determinare i valori intermedi, ovvero come interpolare correttametne lo spazio compreso tra i diversi punti calcolati.
#esempio[
Consideriamo la seguente tabella:
#let rows = (
  (1, 588, true, $R = 1/6 = 0.167; quad P = 1/1 = 1$),
  (2, 589, true, $R = 2/6 = 0.333; quad P = 2/2 = 1$),
  (3, 576, false, none),
  (4, 590, true, $R = 3/6 = 0.5; quad P = 3/4 = 0.75$),
  (5, 986, false, none),
  (6, 592, true, $R = 4/6 = 0.667; quad P = 4/6 = 0.667$),
  (7, 984, false, none),
  (8, 988, false, none),
  (9, 578, false, none),
  (10, 985, false, none),
  (11, 103, false, none),
  (12, 591, false, none),
  (13, 772, true, $R = 5/6 = 0.833; quad P = 5/13 = 0.38$),
  (14, 990, false, none),
)

#table(
  columns: (auto, auto, auto, auto),
  align: center + horizon,
  inset: (x: 8pt, y: 5pt),
  // borders only around the first three columns; labels column has none
  stroke: (x, y) => if x < 3 { 0.5pt } else { none },
  table.header([*n*], [*doc \#*], [*relevant*], []),
  ..rows
    .map(r => (
      [#r.at(0)],
      [#r.at(1)],
      [#if r.at(2) [x]],
      table.cell(align: left, if r.at(3) != none { r.at(3) } else { [] }),
    ))
    .flatten(),
)
Consideriamo ora questa tabella:
#let rows = (
  (1, 588, true, $R = 1/6 = 0.167; quad P = 1/1 = 1$),
  (2, 576, false, none),
  (3, 589, true, $R = 2/6 = 0.333; quad P = 2/3 = 0.667$),
  (4, 342, false, none),
  (5, 590, true, $R = 3/6 = 0.5; quad P = 3/5 = 0.6$),
  (6, 717, false, none),
  (7, 984, false, none),
  (8, 772, true, $R = 4/6 = 0.667; quad P = 4/8 = 0.5$),
  (9, 321, true, $R = 5/6 = 0.833; quad P = 5/9 = 0.556$),
  (10, 498, false, none),
  (11, 113, false, none),
  (12, 628, false, none),
  (13, 772, false, none),
  (14, 592, true, $R = 6/6 = 1.0; quad P = 6/14 = 0.429$),
)

#table(
  columns: (auto, auto, auto, auto),
  align: center + horizon,
  inset: (x: 8pt, y: 5pt),
  // borders only around the first three columns; labels column has none
  stroke: (x, y) => if x < 3 { 0.5pt } else { none },
  table.header(
    [*n*], [*doc \#*], [*relevant*],
    table.cell(align: left)[
      Let total \# of relevant docs be = 6 \
      Check each new recall point:
    ],
  ),
  ..rows
    .map(r => (
      [#r.at(0)],
      [#r.at(1)],
      [#if r.at(2) [x]],
      table.cell(align: left, if r.at(3) != none { r.at(3) } else { [] }),
    ))
    .flatten(),
)
L'ultima tabella ha una precisione e una copertura migliore. Tuttavia, la prima tabella risulta preferibile, nonostante i valori di precisione e copertura siano inferiori, in quanto i documenti li posiziona meglio.
]
=== Interpolazione una curva di precisione-copertura
Per risolvere il problema dell'interpolazione tra i punti discreti di un grafico di performance e consentire l'aggregazione dei dati tra query differenti, si ricorre all'interpolazione della curva di copertura e precisione. \
Il metodo standard consiste nell'interpolare un valore di precisione in corrispondenza di specifici livelli standard di copertura definiti nell'insieme $r_j in brace.l 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0 brace.r$ dove $r_0 = 0.0$ e $r_(10) = 1.0$.\
Formalmente, la regola di interpolazione stabilisce che la precisione interpolata al $j$-esimo livello standard di copertura, indicata come $P(r_j)$, è definita come il valore massimo di precisione noto tra tutti i livelli di copertura superiori o uguali a $r_j$:
$
P(r_j) = max_(forall r bar r_j <= r)P(r)
$
#esempio[
Consideriamo la seguente curva:
#figure(
image("images/curva1.png", width: 70%)
)
dove i pallini bianchi rappresentano la prima query. Applicando la formula ho potuto calcolare gli 11 valori di precisione. Ad ogni valore di recall va preso il massimo valore di precisione. Man mano che si va avanti per forza di cose la curva scende verso il basso, non si può mai ottenere un salto, è una crescita costante o decrescente. La curva ad un certo punto va a 0, questo accade quando il sistema non ritrova tutti i documenti rilevanti. Se i documenti rilevanti vengono trovati allora la curva non andrà mai a 0. \
Consideriamo la seguente curva:
#figure(
image("images/curva2.png", width: 70%)
)
Rispetto alla prima curva, questa è peggiore perchè la prima presenta una precisione massima per più documenti rilevanti trovati.
]
Le curve di precisione-copertura sono una particolare forma di metrica che consentono di valutare la funzione di ranking.
== Precisione media
La precisione media calcola la media dei valori di precisione ottenuti in corrispoendenza delle posizioni $p$ in cui viene effettivamente recuperato un documento rilevante. \
Formalmente, data una query per cui vengono recuperati $m$ documenti rilevanti, la precisione media si esprime come la media delle precisioni calcolate nei ranghi in cui compaioni i documenti pertinenti:
$
A P = (1) / (m)sum_(k=1)^m "Precision"(p = k)
$
=== MAP
Per estendere la valutazione delle prestazioni a un intero insieme di queru, si introuduce la *Mean Average Precision, MAP*, la quale si ottiene calcolando la media dei valori di precisione media registrati su un insieme complessivo di interrogazioni. \
Formalmente, considerando un totale di $n$ query all'interno del testo, dove ciascuna $j$-esima query è associata a un numero $m_j$ di documenti rilevanti, la formula della MAP aggrega le prestazioni su tutte le richieste effettuate:
$
"MAP" = 1 / n sum_(j=1)^1 1/(m_j)sum_(k=1)^(m_j)"Precision"(p = k)
$
In questo modo, la metrica riesce a sintetizzare in un unico valore complessivo e robusto l'efficacia dell'intero sistema di recupero, tenendo conto sia della qualità del ranking per le singole query sia del compertamento su molteplici bisogni informativi differenti. \
Nonostante la MAP raprpesenti una metrica solida e ampiamente diffusa, essa presenta intriseci limiti strutturali che ne evidenziano l'insufficienza in determinati contesti di valutazione. Il problema fondamentale risiede nel fatto che la media aritmetica tende a mascherare le variazioni di performance sulle singole query.
Consideriamo il seguente esempio:
#align(center)[
#table(
  columns: (auto, auto, auto),
  align: (left, center, center),
  stroke: none,
  inset: (x: 10pt, y: 6pt),
  [], [IRS1], [IRS2],
  [Q1], [0.02], [0.06],
  [Q2], [0.4], [0.3],
  [Q3], [0.3], [0.3],
  [Q4], [0.18], [0.24],
  [MAP], [0.225], [0.225],
)
]
Nonostante le differenze puntaili nei risultati delle singole interrogazioni, se si calcola la media aritmetica di entrambi i sistemi si ottiene esattamente lo stesso identico punteggio di MAP pari a 0.225. \
Questo limite dimostra che la MAP può restituire valutazioni globali identiche per sistemi che si comportano in modo diverso sulle singole query, occultando le difficoltà specifiche incontrate dal sistema su determinati bisogni informativi e giustificando lanecessità di metriche complementari come la *GMAP*.
=== GMAP
Per ovviare ai limiti della media aritemcica utilizzata nella MAP, si introduce la *Geometric Mean Average Precision, GMAP*. Questa metrica si calcola utilizzando la media geometrica dei valori di precisione media associato alle diverse query. \
Dal punto di vsita matematico e opeartivo, la GMAP presenta caratteristiche peculiari:
- gli incrementi nei valori pìu bassi esercitano un impatto molto più forte sul valore finale, poichè la formula si basa su un prodotto di valori anzichè su una somma.
- Risulta ideale per testare i sistemi in presenza di query difficili, ovvero quelle situazioni in cui viene recuperato un numero eseguo di documenti rilevanti.
$
"GMAP" = root(n, product_n "AP"_n)
$
Consideriamo il seguente esempio:
#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: (left, center, center),
    stroke: none,
    inset: (x: 10pt, y: 6pt),
    [], [IRS1], [IRS2],
    [Q1], [0.02], [0.06],
    [Q2], [0.4], [0.3],
    [Q3], [0.3], [0.3],
    [Q4], [0.18], [0.24],
    [MAP], [0.225], [0.225],
    [GMAP], [0.144], [0.19],
  )
]
Riprendendo il confronto tra i due sistemi di recupero ($"IRS"_1$ e $"IRS"_2$) precedentemente analizzati, l'utilizzo della *GMAP* (_Geometric Mean Average Precision_) permette di superare i limiti strutturali della media aritmetica della MAP. Sebbene entrambi i sistemi ottenessero lo stesso identico punteggio di MAP pari a $0.225$, l'applicazione della media geometrica riflette efficacemente le differenze di performance sulle singole query.

- Nel caso del sistema $"IRS"_1$, caratterizzato da valori di precisione media sulle singole query pari a $0.02$ ($"Q"_1$), $0.4$ ($"Q"_2$), $0.3$ ($"Q"_3$) e $0.18$ ($"Q"_4$), il calcolo della GMAP produce un valore complessivo pari a $0.144$.
- Per il sistema $"IRS"_2$, che presenta valori di $0.06$ ($"Q"_1$), $0.3$ ($"Q"_2$), $0.3$ ($"Q"_3$) e $0.24$ ($"Q"_4$), la GMAP risulta pari a $0.19$.

Questo confronto dimostra come la GMAP riesca a penalizzare maggiormente i sistemi che falliscono sulle query difficili --- dando un peso preponderante ai valori più bassi a causa della natura moltiplicativa della formula --- evidenziando così la superiorità complessiva del secondo sistema ($"IRS"_2$) in termini di robustezza e stabilità su tutte le interrogazioni.
== Precision\@k
Nonostante i grafici offrano una visualizzazione dettagliata, gli utenti e i valutatori richiedono spesso delle misure di sintesi immediate. Per rispondere a questa esigenza si ricorre alla precisione a un livello di recupero fisso, nota come *Precision\@k*. Questa metrica calcola la precisione considerando esclusivamente i primi $k$ risultati restituiti dal sistema (valori comunemente impiegati sono $k = 10$ oppure $k = 20$).\
L'utilizzo di questa misura presenta importanti vantaggi e svantaggi operativi:

- *Vantaggi:*
  - Si adatta in modo ottimale alla maggior parte dei contesti di ricerca sul Web, dove l'utente si aspetta di trovare buoni riscontri già nella prima o nelle prime due pagine di risultati.
  - Risulta utile per stimare un valore di taglio (_cutoff_) $k$.
- *Svantaggi:*
  - Si presta difficilmente al calcolo di medie affidabili e introduce la criticità di un parametro $k$ arbitrario.
  - Essendo una misura basata su insiemi (_set-based measure_), non effettua alcuna distinzione tra differenti ordinamenti interni a parità di documenti rilevanti recuperati.
  - La scelta del parametro $k$ può risultare fuorviante e condizionare l'affidabilità della valutazione; ad esempio, se $k = 10$ ma il numero totale di documenti rilevanti per quella query è pari a $5$, la metrica $"Precision@10"$ non potrà mai raggiungere il valore massimo di $1$, neppure nel caso di un sistema di IR perfetto. \
#esempio[
Consideriamo i seguenti sistemi:
#figure(
image("images/precisionk.png", width: 50%)
)
Bisogna capire quale tra $I R S_1$ ed $I R S_2$ sia migliore. Calcoliamo la copertura dei due sistemi:
$
"recall" = ("documenti rilevanti ritrovati")/("documenti totali rilevanti") \
"recall("I R S_1")" = 3/5 = "recall("I R S_2")"
$
Notiamo che la copertura dei sistemi è uguale, quindi non possiamo utilizzare questa metrica. Analizziamo la precisione:
$
"precision" = ("documenti rilevanti trovati")/("documenti totali ritrovati") \
"precision"(I R S_1) = 3/10 = "precision"(I R S_2)
$
La precisione è uguale per entrambi. Calcoliamo la precisione e la copertura per ogni posizione $p$ e otteniamo il seguente risultato:
#figure(
image("images/precisionk2.png", width: 70%),
)
Se la precisione di $I R S_1 > I R S_2$ allora anche la copertura sarà maggiore. Da questo possiamo costruire il grafico di copertura-precisione:
#figure(
image("images/precisionk3.png", width: 50%),
)
Quindi, si conclude che il sistema $I R S_1$, rappresentato dalla linea magenta, mantenga prestazioni complessivamente migliori rispetto a $I R S_2$, rappresentato dalla liena verde, poichè i suoi documenti rilevanti sono concentrati più in alto nella graduatoria.
]
== R-precision
Per ovviare ai limiti derivanti dalla scelta arbitraria di un parametro fisso $k$ come nella Precision\@k, si introduce la metrica della *R-precision*. Questa misura calcola la precisione esattamente alla $R$-esima posizione della graduatoria, dove $R$ rappresenta il numero totale di documenti rilevanti associati a quella specifica query.
\
Tra le sue caratteristiche principali si evidenziano:
- Un sistema ideale può raggiungere un punteggio massimo pari a $1.0$.
- La misura della R-precision risulta particolarmente utile per osservare il comportamento di un algoritmo a livello di singole query.
- I valori di R-precision possono essere mediati sull'intero insieme delle query per ottenere una valutazione complessiva del sistema.
Consideriamo il seguente esempio:
#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: center + horizon,
    inset: (x: 8pt, y: 4pt),
    stroke: 0.5pt,
    table.header([*n*], [*doc \#*], [*relevant*]),
    [1], [588], [x],
    [2], [589], [x],
    [3], [576], [],
    [4], [590], [x],
    [5], [986], [],
    [6], [592], [x],
    table.hline(stroke: 1.5pt),
    [7], [984], [],
    [8], [988], [],
    [9], [578], [],
    [10], [985], [],
    [11], [103], [],
    [12], [591], [],
    [13], [772], [x],
    [14], [990], [],
  )
]
Analizzando la tabella dei risultati ordinati restituiti dal sistema:
- Nelle prime $R$ posizioni (cioè fino a $n = 6$), i documenti rilevanti contrassegnati dalla "x" si trovano alle posizioni $1$, $2$, $4$ e $6$.
- All'interno di questo cutoff pari a $6$, il sistema ha recuperato correttamente $4$ documenti rilevanti su un totale di $6$.
- Di conseguenza, la *R-precision* si calcola come il rapporto $4\/6$, ottenendo un valore pari a $0.67$.
== Mean Reciprocal Rank (MRR)
Per valutare l'efficacia dei motori di ricerca quando l'obiettivo principale è misurare la capacità di restituire documenti rilevanti ai primissimi ranghi della graduatoria, si introduce il concetto di *Mean Reciprocal Rank (MRR)*. In questo specifico contesto, la copertura non rappresenta una metrica adeguata, e ci si interroga se la Precision\@k sia effettivamente lo strumento ideale per rispondere a questa esigenza. \
Per soddisfare la necessità di una metrica più sensibile alla posizione del ranking, si introduce il concetto di *Reciprocal Rank, RR*, definito formalmente come il reciproco della posizione in cui viene recuperato il primo documento rilevante. \
La *Mean Reciprocal Rank* rappresenta la media dei valori di Reciprocal Rank calcolati su un intero insieme di query. \
La MRR viene calcolata come segue.
$
"MRR" = 1/(bar Q bar)sum_(i=1)^(bar Q bar) 1 / ("rank"_i)
$
ove $bar Q bar$ indica il numero totale di query nell'insieme di test e $"rank"_i$ rappresenta la posizione in cui compare il primo documento rilevante per la $i$-esima query. \
#esempio[
Consideriamo l'immagine proposta:
#figure(
image("images/mrr1.png", width: 50%)
)
Analizzando quest'immagine, possiamo osservare un ulteriore limite metodologico delle metriche basate su sistemi come la Precision\@k.
- Nel confronto tra i due sistemi $I R_1$ e $I R_2$, intuitivamente percepiamo che il sistema $I R_2$ risulta migliore, poichè posiziona i documenti rilevanti più in altro rispetto a $I R_1$
- Tuttavia, se calcoliamo la Precision\@5 considerando un taglio a $k = 5$, entrambi i sistemi ottengono lo setsso identico punteggio: $"Precision@5"(q, I R_2) = 2/5 = 0.4$ e $"Precision@"(q, I R_1) = 2/5=0.4$.
Questo esempio dimostra chiaramente che metriche come la Precision\@k non fanno alcuna distinzione tra differenti ordinamenti interni dei risultati, fallendo nel cogliore la qualità del ranking quando il numero di elementi rilevanti all'interno della soglia è identica. \
Consideriamo ora la seguente immagine:
#figure(
image("images/mrr2.png", width: 50%),
)
L'immagine evidenzia come la metrice del Reciprocal Rank, RR, riesca a cogliere le differenze di ordinamento tra i due sistemi, superando i limiti visti in precedenza con la Precision\@k.
- Nel sistema $I R_2$, il primo documento rilevante compare subito alla prima posizione, restituendo un valore di $R R(q, I R_2) = 1/1 = 1$
- Nel sistema $I R_1$, invece, il primo documento rilevante compare soltanto alla quarta posizione, producendo un valore di $R R(q, I R_1) = 1 / 4 = 0.25$.
Questo dimostra che il sistema $I R_2$ è effettivametne migliore rispetto a $I R_1$ secondo questa metrica, poichè premia in modo sensibile la capacità di posizionare un risultato utile ai primissimi ranghi della graduatoria.
]
La MRR rappresenta una metrica ottimale nei casi in cui l'interesse primario sia focalizzato sul reperimento della *prima risposta corretta*. Tali contesti applicativi includono in particolare:
- I sistemi di Question-Answering (QA).
- Le ricerche di tipo navigazionale, ossia le interrogazioni rivolte ai motori di ricerca alla ricerca di siti specific, tra cui le query basate su URL, le home-page query e le named-page query.
#esempio[
Consideriamo la seguente tabella:
#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto),
    align: (left + horizon, left + horizon, left + horizon, left + horizon, left + horizon),
    inset: (x: 10pt, y: 8pt),
    stroke: 0.5pt,
    table.header(
      table.cell(align: center + horizon)[Query],
      table.cell(align: center + horizon)[Results],
      table.cell(align: center + horizon)[Correct \ response],
      table.cell(align: center + horizon)[Rank],
      table.cell(align: center + horizon)[Reciprocal \ Rank],
    ),
    [cat], [catten, \ cati, *cats*], [cats], [3], [1/3],
    [torus], [torii, *tori*, \ toruses], [tori], [2], [1/2],
    [virus], [*viruses*, \ virii, viri], [viruses], [1], [1],
  )
]
Consideriamo un insieme di tre query al'interno della tabella:
- Per la query _cat_, la risposta corretta _cats_ compare alla terza posizione nella lista dei risultati, restituendo un valore di RR pari a $1/3$.
- Per la query _torus_, la risposta corretta _tori_ si trova alla seconda posizione, generano un valore di RR pari a $1/2$.
- Per la query _virus_, la risposta corretta _viruses_ appare direttamente al primo posto ottentendo un valore di $RR$ pari a 1.
Mediando i valori ottenuti per la tre query, il calcolo della MRR risulta pari a
$
(1 / 3 + 1 / 2 + 1)/3 = 11/18 approx 0.61
$
]
== Rilevanza valutata (Non-Binario)
Finora abbiamo esaminato metriche basate su valutazioni di tipo rigorosamente binario, le quali presentano importanti limiti operativi:
- *Limiti del giudizio binario*: la precisione e la copertura tradizionali permettono unicamente valutazioni di tipo binario. Nella realtà dei fatti, però, i documenti sono raramente del tutto pertinenti o totalmente estranei a una query.
- *Perdita di sfumature*: di conseguenza, il sistema binario non offre alcuna distinzione pratica tra documenti altamente rilevanti e documenti blandamente o parzialmente rilevanti.
Per superare questi limiti, si adotta l'utilizzo di *metriche di rilevanza graduata*, che forniscono:
- *Giudizi multi-livello*: vengono integrate fonti di giudizio basate su scale di valutazione estese, come ad esempio scale Likert a 5 punti.
- *Categorie multiple*: ciascun documento non è più confinato a una scelta secca, ma viene giudicato lungo una scala a cateogorie multiple, distinguendo chiaramente tra livelli come _altamente rilevante_, _parzialmente rilevante_ o _non rilevante_.
Questo approccio consetne di modellare in modo molto più accurato la realtà utile dei risultati restituiti dai sistemi di ricerca rispetto alle reali esigenze informative degli utenti.
=== Discounted Cumulative Gain (DCG)
Per superare i limiti delle valutazioni binarie e sfruttare i giudizi di rilevanza graduata che abbiamo appena introdotto, si ricorre al *Discounted Cumulative Gain (DCG)*. Questa metrica combina in modo efficace le valutazioni di rilevanza graduata. \
L'ideazione del DCG si fonda su due osservazioni fondamentali quando si esaminano i risultati di una query:
- i documenti *altamente rilevanti* sono molto più utili rispetto a quelli blandamente o marginalmente rilevanti;
- più è bassa la posizione in graduatoria di un documento rilevanti, minore è la sua utilità per l'utente, poichè è statisticamente meno probabile che venga esaminato.
#esempio[
Per comprendere concretamente come applicare il DCG, consideriamo un esempio in cui i risultati delle query vengono valutati su una scala graduata da 0 a 3 (0 non rilevante e 3 fortemente rilevante). \
Supponiamo di avere due query, $q_1$ e $q_2$, per le quali i punteggi di rilevanza graduata assegnati ai documenti sono i seguenti:
- per la query $q_1$:
$
R_(q_1) = brace.l [d_3, 3], [d_5, 3], [d_9, 3], [d_(25), 2], [d_(39), 2], [d_(44), 2], [d_(56), 1], [d_(71), 1], [d_(89), 1], [d_(123), 1] brace.r
$
- Per la query $q_2$:
$
R_(q_2) = brace.l [d_3, 3], [d_(56), 2], [d_(129), 1] brace.r
$
Ciò significa che, ad esempio, mentre il documento $d_3$ risulta altamente rilevante per la query $q_1$, il documento $d_(56)$ viene classificato come blandamente rilevante. Questo sistema a più livelli permette di superare la rigidità della classificazione binaria e di riflettere con maggiore precisione il reale grado di soddisfazione dell'utente.
]
==== Vettore di guadagno
A partire dai giudizi di rilevanta, analizziamo come valutare i risultati di un nuovo algoritmo di ranking introducendo il concetto di *vettore di guadagno G*. \
Gli specialisti assegnano un punteggio di rilevanza graduata ai primi 10-20 risultati restituiti per una determinata query: questa lista ordinata di punteggi prende il nome di *Gain Vector G*. \
#esempio[
Consideriamo i primi 15 documenti delle graduatoria prodotta per le query $q_1$ e $q_2$, i rispettivi vettori di guadagno vengono espressi in forma di sequenza numerica:
$
G_1 = (1, 0, 1, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 0, 3) \
G_2 = (0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3)
$
Questo vettore rappresenta la base numerica essenziale su cui si applcia successivamente il fattore di sconto basato sulla posizione per calcolare il valore effettivo del *Discounted Cumulative Gain (DCG)*.
] <es:gain_vector>
==== Cumulative Gain
Sommando progressivamente i punteggi di rilevanza graduata fino a un qualsiasi punto della gruaduatoria, si ottiene direttamente il guadagno cumulativo, il *cumulated gain CG*. \
#esempio[
Proseguendo l'*@es:gain_vector*, sommiamo progressivamente sui vettori di guadagno e otteniamo i vettori di guadagno cumulato per le due query:
$
C G_1 = (1, 1, 2, 2, 2, 5, 5, 5, 5, 7, 7, 7, 7, 7, 10) \
C G_2 = (0, 0, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 6)
$
] <es:cumulative_gain_vector>
Tuttavaia, il semplice guadagno cumulato non tiene ancora conto della posizione in cui compaiono i documenti. Per risolvere questo limite, il passo successivo consiterà nell'introdurre il fattore di sconto, arrivando così alla formula completa del DCG. \
In termini formali, definiamo:
$
C G_j[i] = cases(
G_j[1] & "se" i = 1,
G_j[i] + C G_j[i - 1] & "altrimenti"
)
$
ove $C G_j[i]$ è il guadagno cumulato all'$i$-esima posizione del ranking per la query $q_j$.
==== Fattore di sconto
Viene introdotto un *fattore di sconto, _discount factor D_*, che riduce l'impatto del guadagno man mano che si sposta verso il basso nella graduatoria. \
Un semplice fattore di sconto comunemente adottato consiste nell'utilizare il *logaritmo della posizione di ranking*. \
Se consideriamo i logaritmi in base 2, questo fattore di sconto sarà pari a $log_2(2)$ alla posizione 2, $log_2(3)$ alla posizione 3, e così via. \
Infine, dividendo il guadagno per il corrispondente fattore di sconto lungo la posizione, si ottiene la formula definita del *Discounted Cumulative Gain (DCG)*. \
In termini formali:
$
D C G_j[i] = cases(
G_j[1] & "se" i = 1,
(G_j[i])/(log_2(i)) + D C G_j[i - 1] & "altrimenti"
)
$
ove $D C G_j[i]$ è il DCG all'$i$-esima posizione della graduatoria per la query $q_j$.
#esempio[
Proseguendo l'*@es:cumulative_gain_vector*, otteniamo i seguneti vettori DCG:
$
D C G_1 = (1, 1, 1.6, 1.6, 1.6, 2.8, 2.8, 2.8, 2.8, 2.8, 3.4, 3.4, 3.4, 3.4, 4.2) \
D C G_2 = (0, 0, 1.3, 1.3, 1.3, 1.3, 1.3, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 2.4)
$
]
Facciamo delle considerazioni chiave sul DCG.
- *Riduzione dell'impatto sul fondo della classifica*: i guadagni cumulati scontati risentono molto meno dei documenti rilevanti sitauti verso la fine del ranking, poichè è la divisione per il logaritmo della posizione ne riduce drasticamente il peso.
- *Controllo della penalizzazione*: adottando logaritmi in basi inferiori è possibile accentuare ulteriormente il fattore di sconto, rendendo la metrica ancora più severa nei confronti dei risultati posizionati in basso.

==== Curve DCG
Per produrre curve di CG e DCG complessive su un set di test, è necessario calcolare la media dei valori ottenuti sull'intero insieme delle query. \
Dato un insieme di $N_q$ query, la media del guadagno cumulato, $overline(C G)[i]$, e del guadagno cumulato scontato, $overline(D C G)[i]$, per ciascuna posizione $i$ della graduatoria viene calcolata sommando i rispettivi valori di tutte le query e dividendoli per il numero totale $N_q$:
$
overline(C G)[i] = sum_(j=i)^(N_q) (C G_j[i])/(N_q) \
overline(D C G)[i] = sum_(j=1)^(N_q)(D C G_j[i])/(N_q)
$
Questi valori medi aggreati permettono di tracciare grafici di performance uniformi, consentendo di confrontare in mdoo solido l'efficacia media di differenti algoritmi di ranking su un'intera collezione di interrogazioni.
#figure(
image("images/dcg.png", width: 70%)
)
=== Normalized DCG
==== CG e DCG Ideali
A differenza di quanto avviene per la precisione e la copertura, che vengono calcolate in relazione all'insieme dei documenti rilevanti, i punteggi di CG e DCG visti finira non sono rapportati ad alcuna linea di base fissa. Questo limite implica che l'utilizzo diretto dei punteggi grezzi di CG e DCG può risultare fuorviante quando si cerca di confrontare direttamente due algoritmi di recupero differenti. \
Per ovviare a questo problema, la strategia standard nell'introdurre una linea di base da utilizzare come riferimento per la normalizzazione. \
Questa specifica linea di base è rappresentata proprio dalle metriche di *CG e DGC ideali*, che riflettono il rendimento massimo ottenibile ordinando perfettamente i documenti in base al loro grado di rilevanza. \
Proseguendo con la costruzione delle metriche ideali per la normalizzazione, definiamo il *vettore di guadagno ideale, IG*. \
Per una data query di test $q$, assumendo che le valutazioni di rilevanza espresse degli specialisti abbiano prodotto $n_3$ documenti con punteggio 3, $n_2$ con punteggio 2, $n_1$ con punteggio 1 e $n_0$ con punteggio 0, il vettore _IG_ viene generato ordinando tutti i punteggi di rilevanza in *ordine decrescente*. La struttura generale assume la forma:
$
I G = (3, dots, 3, 2, dots, 2, 1, dots, 0, dots, 0)
$
#esempio[
Applicando questa regola alle nostre query di esempio, otteniamo i rispettivi vettori di guadagno ideale che rappresentano il limite massimo teorico di performance ottenibile ordinando perfettamente i documenti rilevanti in cima alla graduatoria:
$
I G_1 = (3, 3, 3, 2, 2, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0) \
I G_2 = (3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
$
]
Questo vettore ideale costituisce il riferimento fondamentale per calcolare successivamente il _Normalized Discounted Cumulative Gain (NDCG)_, permettendo di normalizzare le prestazioni reali di qualsiasi algoritmo di ranking rispetto al miglior risultato teorico possibile. \
==== Gain Cumulato Ideale e Gain Cumulato Scontato Ideale
Analizziamo come calcolare i vettori di *Gain Cumulato Ideale, ICG*, e di *Gain Cumulato Scontato Ideale, IDCG*, in modo del tutto analogo a quanto visto per i vettori standard. \
Analizziamo il calcolo dei vettori _ICG_. Sommando progressivamente i punteggi del vettore di guadagno ideale _IG_, si ottengono i valroi massimi teorici cumulati per le qiery $q_1$ e $q_2$:
$
I C G_1 &= (3, 6, 9, 11, 13, 15, 17, 18, 19, 19, 19, 19, 19, 19) \
I C G_2 &= (3, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6)
$
Analizziamo ora il calcolo dei vettori _IDCG_. Applicando il fattore di sconto basato sul logaritmo della posizione ai vettori ideali, si ottengono i vettori di _Ideal Discount Cumulative Gain, IDCG_.
$
I D C G_1 &= (3.0, 6.0, 7.9, 8.9, 9.8, 10.5, 10.9, 11.2, 11.5, 11.8, 11.8, 11.8, 11.8, 11.8, 11.8) \
I D C G_2 &= (3.0, 5.0, 5.6, 5.6, 5.6, 5.6, 5.6, 5.6, 5.6, 5.6, 5.6, 5.6, 5.6, 5.6, 5.6)
$
Questi vettori _IDCG_ rappresentano il punteggio massimo teorico ottenibile da un sistema ideale per le rispettive query e costituiscono la base di normalizzazione fondamentale per calcoalre il punteggio normalizzato finale _NDCG_. \
Calcoliamo i punteggi medi di _ICG_ e _IDCG_ su un intero insieme di query di test. Analogamente a quanto visto per le curve standard, i punteggi medi del guadagno cumulato ideale, $overline(I C G)[i]$, e del guadagno cumulato scontato ideale, $overline(I D C G)[i]$, per ciascuna posizione $i$ si ottengono mediando i valori corrispondenti di tutte le $N_q$ query:
$
overline(I C G)[i] &= sum_(j=1)^(N_q)(I C G_j[i])/(N_q) \
overline(I D C G)[i] &= sum_(j=1)^(N_q) (I D C G_j[i])/(N_q)
$
==== DCG Normalizzato
Sfruttando le metriche ideali calcolate in precedenza per normalizzare i punteggi delle nostre query d'esempio $q_1$ e $q_2$, si ottengono i vettori normalizzati di guadagno cumulato _NCG_ e di guadagno cumulato scontato normalizzato _NDCG_.
$
N C G &= (0.17, 0.09, 0.27, 0.24, 0.21, 0.33, 0.32, 0.35, 0.33, 0.40, 0.40, 0.40, 0.40, 0.40, 0.64) \
N D C G &= (0.17, 0.09, 0.21, 0.20, 0.29, 0.25, 0.25, 0.26, 0.26, 0.29, 0.29, 0.29, 0.29, 0.29, 0.38)
$
L'area sottotesa alle curve _NCG_ e _NDCG_ rappresenta direttametne la qualità complessiva dell'algoritmo di ranking. Più grande è l'area sottotesa, migliori sono i risultati restituiti dal sistema. Di conseguenza, grazie a questa normalizzazione in scala, i valori ottenuti possono essere impiegati efficacemente per confrontare in modo rigoroso due distinti algoritmi di recupero dell'informazione. \
Possiamo definire formalmente _NCG_ e _NDCG_ come segue:
$
N C G[i] &= C G[i] / I C G[i] \
N D C G[i] &= D C G[i] / I D C G[i]
$
Ogni valore di _NCG_ e _NDCG_ si trova nel range $[0, 1]$.
== Coefficienti di correlazione dei ranking
Sebbene precisione e copertura consentano di confrontare la rilevanza dei risultati prodotti da due funzioni di ranking differenti, esistono scenari applicativi in cui non è possibile misurare direttamente la rilevanza. \
In molti casi, l'obiettivo principale consiste nel determinare in che modo una funzione di ranking vari rispetto a una seconda funzione di cui conosciamo il comportamento. In queste circostanze, l'interesse si spostas interamente sul confronto dell'ordinamento relativo generato dai due diversi ranking. \
Per raggiungere questo scopo si utilizzano apposite funzioni statistiche denominate proprio *coefficienti di correlazione dei ranking*. \
Le caratteristiche principali di un coefficiente di correlazione $C(R_1, R_2)$, calcolato tra due diversi ordinamenti $R_1$ ed $R_2$ sono i seguenti.
- *Intervallo di valori*: il coefficiente oscilla sempre tra -1 ed 1.
- *Accordo perfetto*: se $C(R_1, R_2) = 1$ l'accordo tra i due ranking è perfetto, il che significa che le due graduatorie sono identiche.
- *Disaccordo perfetto*: Se $C(R_1, R_2) = -1$, il disaccordo è totale, ovvero i due ordinamenti risultano l'uno inverso dell'altro.
- *Indipendenza*: Se $C(R_1, R_2) = 0$, le due classifiche sono completamente indipendenti l'una dall'altra.
- *Trend di concordanza*: valori crescenti del coefficiente indicano un livello progressivamente maggiore di accordo e somiglianza tra i due ranking.
=== Coefficiente di Spearman
Il coefficiente di Spearman è probabilmente la metrica di correlazione dei ranking più utilizzata in assoluto. Si basa sul calcolo delle differenze tra le posizioni occupate da uno stesso documento all'interno di due diverse classifiche. \
Definiamo le seguenti variabili:
- sia $s_(1, j)$ la posizione di un documento $d_j$ nel primo ranking $R_1$
- sia $s_(2, j)$ la posizione dello stesso documento $d_j$ nel secondo ranking $R_2$.
Questo valore costituisce la base empirica per misurare quanto i due ordinamenti concordino o divergano in base allo scostamento di posizione dei singoli documenti.
#esempio[
Consideriamo il seguente risultato:
#let rows = (
  (123, 1, 2, "-1", 1),
  (84, 2, 3, "-1", 1),
  (56, 3, 1, "+2", 4),
  (6, 4, 5, "-1", 1),
  (8, 5, 4, "+1", 1),
  (9, 6, 7, "-1", 1),
  (511, 7, 8, "-1", 1),
  (129, 8, 10, "-2", 4),
  (187, 9, 6, "+3", 9),
  (25, 10, 9, "+1", 1),
)

#align(center)[
  #table(
    columns: 5,
    align: center + horizon,
    inset: (x: 12pt, y: 5pt),
    stroke: 0.5pt,
    table.header(
      [documents],
      [$s_(1,j)$],
      [$s_(2,j)$],
      [$s_(i,j) - s_(2,j)$],
      [$(s_(1,j) - s_(2,j))^2$],
    ),
    table.hline(stroke: 1.5pt),
    ..rows
      .map(r => (
        [$d_(#r.at(0))$],
        [#r.at(1)],
        [#r.at(2)],
        [#r.at(3)],
        [#r.at(4)],
      ))
      .flatten(),
    table.hline(stroke: 1.5pt),
    table.cell(colspan: 4)[Sum of Square Distances],
    [24],
  )
]
Per ciascun documento $d_j$ la tabella evidenzaia:
- la posizione occupata nel primo ordinamento;
- la posizione occupata nel secondo ordinamento;
- la differenza di posizione tra i due ranking;
- il quadrato della differenza di posizione, che penalizza maggiormente gli scostamenti più ampi.
Sommando i valori al quadrato ottenuti per tutti e dieci i documenti, si calcola la *Sum of Square Distances*, che in questo esempio è pari a 24. \
Questo valore rappresenta l'input fondamentale per la formula matematica finale del coefficiente di Spearman, permettendo di quantificare in modo preciso il grado di correlazione (o discordanza) tra le due graduatorie.
]
Per produrre una valutazione quantitativa di questa correlazione, sommiamo i quadrati delle differenze di posizione per ciascuna coppia di ranking. \
Se consideriamo $K$ documenti classificati, il valore massimo possibile per la somma dei quadrati delle differenze di ranking è dato dalla formula:
$
(K times (K^2 - 1))/(3)
$
In caso di *accordo perfetto* tra le due graduatorie, la somma delle differenze sarebbe pari a 0. In caso di *totale disaccordo*, la somma delle differenze sarebbe pari al valore calcolato tramite la formula precedente. \
Analizziamo la frazione di normalizzazione che mette a rapporto lo scostamento osservato e il limite massimo teorico:
$
(sum_(j=1)^K (s_(1, j) - s_(2, j))^2)/((K times (K^2 - 1))/(3))
$
Il suo valore è 0 quando i due ranking si trovano in perfetto accordo (numeratore pari a 0). Il suo valore è pari a 1 quando i due ranking sono in totale disaccordo. \
Per mappare questo rapporto nell'intervallo standard dei coefficienti di correlazione, si applicano due passaggi algebrici:
+ moltiplicando la frazione per 2, l'intervallo dei valori si sposta nel range [0, +2]
+ sottraendo il risultato ottenuto da 1, il valore finale si sposta nell'intervallo definitivo $[-1, +1]$, definendo così la formula completa del coefficiente di Spearman. Analizziamo la formula definitiva e completa del *coefficiente di correlazione per ranghi di Spearman*:
$
S(R_1, R_2) = 1 - (6 times sum_(j=1)^K(s_(1, j) - s_(2, j))^2)/(K times (K^2 - 1))
$
ove $S(R_1, R_2)$ è il coefficiente di correlazione di Spearman e $K$ la dimnesione dei set posizionati e confrontati.
=== Coefficiente Tau di Kendall
Spesso risulta difficile assegnare un'interpretazione operativa e immediata al coefficente di Spearman. Una valida alternativa è rappresentata dall'utilizzo di un coefficiente dotato di un'interpretazione molto più naturale e intuitiva, il *coefficiente Tau di Kendall*.  \
Per comprendere la metrica, si considerano due documenti distinti, $d_j$ e $d_k$, e le rispettive posizioni all'interno dei due ordinamenti $R_1$ ed $R_2$. Si valutano le differenze di posizione per questa coppia di documenti in ciascun ranking, ovvero $s_(2, l) - s_(1, j)$ nel primo e $s_(2, k) - s_(2, j)$ nel secondo. Se queste differenze presentano lo *stesso segno*, significa che i due documenti mantengono lo stesso ordine relativo in entrambe le classifiche; di conseguenza, la coppia $[d_k, d_j]$ viene definita *concordante*. Se invece le differenze hanno segno diverso, significa che l'ordine relativo dei due documenti risulta invertito tra un ranking e l'altro; in questo caso, la coppia viene definita *discordante*.
#esempio[
Consideriamo i primi 5 documenti nei due ranking $R_1$ ed $R_2$:
#let rows = (
  (123, 1, 2, "-1"),
  (84, 2, 3, "-1"),
  (56, 3, 1, "+2"),
  (6, 4, 5, "-1"),
  (8, 5, 4, "+1"),
)

#align(center)[
  #table(
    columns: 4,
    align: center + horizon,
    inset: (x: 12pt, y: 5pt),
    stroke: 0.5pt,
    table.header(
      [documents],
      [$s_(1,j)$],
      [$s_(2,j)$],
      [$s_(i,j) - s_(2,j)$],
    ),
    table.hline(stroke: 1.5pt),
    ..rows
      .map(r => (
        [$d_(#r.at(0))$],
        [#r.at(1)],
        [#r.at(2)],
        [#r.at(3)],
      ))
      .flatten(),
  )
]
Tutte le possibili coppie ordinate di documenti che si pososno formare a partire dal primo ranking sono:
$
  & [d_123, d_84], quad [d_123, d_56], quad [d_123, d_6], quad [d_123, d_8], \
  & [d_84, d_56], quad [d_84, d_6], quad [d_84, d_8], \
  & [d_56, d_6], quad [d_56, d_8], \
  & [d_6, d_8]
$
per un totale di $1/2 times 5 times 4$ di coppie ordinate. \
Per $R_2$, le coppie ordinate sono:
$
  & [d_56, d_123], quad [d_56, d_84], quad [d_56, d_8], quad [d_56, d_6], \
  & [d_123, d_84], quad [d_123, d_8], quad [d_123, d_6], \
  & [d_84, d_8], quad [d_84, d_6], \
  & [d_8, d_6]
$
Marchiamo con $C$ le coppie concordanti e con $D$ quelle discordanti. Per $R_1$ abbiamo:
$
  & C, D, C, C, \
  & D, C, C, \
  & C, C, \
  & D
$
Per $R_2$:
$
  & D, D, C, C, \
  & C, C, C, \
  & C, C, \
  & D
$
Ci sono un totale di 20 ($K(K - 1)$) coppie ordinate. Tra queste, 14 sono concordanti e 6 sono discordanti.
]
Il coefficiente Tau di Kendall è definito come:
$
tau(R_1, R_2) = P(R_1 = R_2) - P(R_1 != R_2)
$
Nel nostro esempio:
$
tau(R_1, R_2) = 14/20 - 6/20 = 0.4
$
Analizziamo la formulazione probabilistica e la formula definitiva per il calcolo dell'indice Definiamo le componenti di coppia:
- $Delta(R_1, R_2)$ rappresenta il numero di *coppie di documenti discordanti* tra i ranking.
- $K(K-1) - Delta(R_1, R_2)$ rappresenta il numero di *coppie di documenti concordanti* nei due ranking.
La probabilità $P(R_1 = R_2)$ esprime la proporzione di coppie concordanti sul totale delle coppie ordinate $K(K-1)$.
$
P(R_1 = R_2) = (K(K-1)-Delta(R_1, R_2))/(K(K-1))
$
La probabilità complementare $P(R_1 != R_2)$ esprime la proporzione di coppie discordanti:
$
P(R_1 != R_2) = (Delta(R_1, R_2))/(K(K-1))
$
Combinando queste proporzioni e normalizzando il risultato per mappare i valori nell'intervallo $[-1, +1]$, si ottiene l'espressione conclusiva:
$
tau(R_1, R_2) = 1 - (2 times Delta(R_1, R_2))/(K(K-1))
$
= Link analysis e PageRank
== PageRank
L'*idea centrale* è che una pagina web è considerata più importante se riceve un numero maggiore di link. La domanda chiave iniziale distingue tra link in entrata e link in uscita. \
Considerando i link in entrata alla stregua di voti di preferenza, si osserva che un sito come `www.stanford.edu` vanta ben 23.400 link in entrata, mentre un sito meno noto come `www.joe-schmoe.com` ne possiede appena 1. Ci si chiede quindi se tutti i link in entrata abbiano lo stesso peso. La risposta logica è che i *link provenienti da pagine importanti contano di più*. Questo principio introduce una definizione circolare e *ricorsiva*, poichè l'importanza di una pagina dipende dall'importanza delle pagine che la linkano, ponendo le basi per algoritmi iterativi celebri come il PageRank.
=== Semplice formulazione ricorsiva
Il voto espresso da ciascun link è direttamente proporzionale all'importanza della pagina sorgente da cui parte. Se una pagina $j$ un livello di importanza $r_j$ e possiede $n$ link in uscita, ciascuno di questi link trasmette un valore di voto pari a $r_j / n$. L'importanza complessiva di una pagina $j$ è data esattamente dalla somma dei voti ricevuti attraverso tutti i suoi link in entrata.
#esempio[
Consideriamo il seguente schema:
#figure(
image("images/page_rank.png", width: 70%)
)
Se la pagina $j$ riceve link da pagine come $i$ (che ha 3 link in uscita e importanza $r_i$) e $k$ (che ha 4 link in uscita e importanza $r_k$), la sua importanza si calcola come:
$
r_j = r_i / 3 + r_k / 4
$
]
=== Modello di Flusso di PageRank
I principi chiave di questo modello sono i seguenti:
- un voto proveniente da una pagina importante vale di più;
- una pagina è importante se è puntata da altre pagine importanti
Viene definito un punteggio di importanza _rank_ $r_j$ per ciascuna pagina $j$. La formula generale che esprime questo flusso ricorsivo è:
$
r_j = sum_(i arrow j)r_i/d_i
$
dove $d_i$ rappresenta il grado di uscita, ovvero il numero totale di link uscenti dalla pagina sorgente $i$.
#esempio[
Consideriamo il seguente schema:
#figure(
image("images/page_rank2.png", width: 20%)
)
Le equazioni di flusso sono:
$
r_y &= r_y / 2 + r_a / 2 \
r_a &= r_y / 2 + r_m \
r_m &= r_a / 2
$
Quindi si ottiene un sistema composto da 3 equazioni e 3 incognite senza termini noti. QUesto comporta l'assenza di un'unica soluzione determinata. Tutte le possibili soluzioni sono equivalenti tra loro a meno di un fattore di scala. Per imporre un'unica soluzione valida, si aggiunge il vincolo di normalizzazione secondo cui la somma dei ranghi deve essere pari a 1:
$
r_y + r_a + r_m = 1
$
] <es:page_rank>
Il metodo di eliminazione di Gauss funzione bene per esempi di piccole dimensioni, ma risulta inefficiente e inadeguato per grafi di grandi dimensioni paragonabili all'intero Web. Per questo motivo, si rende necessaria una formulazione matematica rinnovata, basata sul calcolo matriciale e su metodi iterativi (come le catene di Markov e il metodo delle potenze).
=== Matrice di adiacenza stocastica
Data una pagina $i$ che possiede $d_i$ link in uscita, la matrice viene definita in questo modo:
- se esiste un link dalla pagina $i$ alla pagina $j$ ($i arrow j$), l'elemento della matrice $M_(j i)$ è pari a $1/d_i$.
- altrimenti, se non c'è alcun collegamento diretto, l'elemento $M_(j i) = 0$
Per costruzione, $M$ è una *matrice stocastica per colonne*, il che significa che la som a degli elementi di ciascuna colonna è rigorosamente pari a 1, riflettendo la conservazione del "flusso" di voti tra le pagine del web.
#esempio[
Continuando l'*@es:page_rank* la matrice di adiacenza $M$ è la seguente:
#align(center)[
  #table(
    columns: (auto, 2.5em, 2.5em, 2.5em),
    rows: 2.5em,
    align: center + horizon,
    inset: 6pt,
    // borders only around the 3x3 inner grid, not around the labels
    stroke: (x, y) => if x >= 1 and y >= 1 { 0.5pt } else { none },
    [], [*y*], [*a*], [*m*],
    [*y*], [$1/2$], [$1/2$], [0],
    [*a*], [$1/2$], [0], [1],
    [*m*], [0], [$1/2$], [0],
  )
]
]
Definiamo il *vettore di rank r*, che è un vettore colonna che contiene un'entrata per ciascuna pagina del web:
- ciascun elemento $r_i$ rappresenta il punteggio d'importanza della pagina $i$
- vale il vincolo di noramlizzazione globale per cui la somma di tutte le entrate del vettore è pari a 1.
Partendo dalle equazioni scalari in cui l'importanza $r_j$ di una pagina è data dalla somma dei contributi ricevuti dalle pagine entranti ($r_j = sum_(i arrow j)r_i/d_i$), il sistema può essere espresso elegantemente tramite il prodotto tra la matrice stocastica di adiacenza $M$ e il vettore di rank *r*.
$
bold(r) = M dot.c bold(r)
$
Analizziamo la *formulazione agli autovettori* (_eigenvector_). Poichè le equazioni di flusso possono essere scritte nella forma $bold(r) = M dot.c bold(r)$, il vettore di rank $bold(r)$ risulta essere un autovettore della matrice stocastica del web $M$. Più in dettaglio, $bold(r)$ è il primo autovettore associato all'autovalore $lambda = 1$. L'autovalore più grande di $M$ è proprio 1, poichè $M$ è una matrice stocastica per colonne. \
Grazie a questa impostazione è possibile calcolare il vettore $bold(r)$ in modo efficiente per grafi di grandi dimensioni utilizzando un algoritmo iterativo noto come *Power iteration* (_metodo delle potenze_).
#esempio[
Consideriamo il seguente schema:
#figure(
image("images/page_rank2.png", width: 20%)
)
Le equazioni di flusso sono:
$
r_y &= r_y / 2 + r_a / 2 \
r_a &= r_y / 2 + r_m \
r_m &= r_a / 2
$
La matrice di adiacenza stocastica è la seguente:
#align(center)[
  #table(
    columns: (auto, 2.5em, 2.5em, 2.5em),
    rows: 2.5em,
    align: center + horizon,
    inset: 6pt,
    // borders only around the 3x3 inner grid, not around the labels
    stroke: (x, y) => if x >= 1 and y >= 1 { 0.5pt } else { none },
    [], [*y*], [*a*], [*m*],
    [*y*], [½], [½], [0],
    [*a*], [½], [0], [1],
    [*m*], [0], [½], [0],
  )
]
Possiamo esprimere l'intero sistema nella forma compatta agli autovettori $bold(r) = M dot.c bold(r)$, per essere risolto tramite il metodo iterativo delle potenze.
$
  (mat(delim: #none, "y"; "a"; "m")) =
  (mat(delim: #none, 1/2, 1/2, 0; 1/2, 0, 1; 0, 1/2, 0))
  (mat(delim: #none, "y"; "a"; "m"))
$
]
=== Metodo delle potenze
Il *metodo delle potenze*, _power iteration_, è un algoritmo iterativo efficiente per determinare il vettore di importanza su grandi grafi. \
- *Modello di partenza*: grafo web composto da $N$ nodi (pagine) e archi (collegamenti ipertestuali).
- *Fase di inizializzazione*: si assegna un valore iniziale uniforme a tutte le pagine ponendo il vettore di rank iniziale $bold(r)^((0)) = [1 \/ N, dots, 1 \/ N]^T$
- *Processo iterativo*: ad ogni passo si aggiorna il vettore applicando la matrice di transizione, ovvero $bold(r)^((t + 1)) = M dot.c bold(r)^((t))$, che corrisponde alla forma scalare in cui il nuovo rank $r_j^((t + 1))$ si calcola sommando i contributi dei nodi collegati:
$
r_j^((t+1)) = sum_(i arrow j)(r_i^((t)))/(d_i)
$
$quad$ dove $d_i$ è il grado di uscita del nodo sorgente $i$.
- *Condizione d'arresto*: le iterazioni proseguono finchè la differenza tra due vettori successivi diventa inferiore a una soglia di tolleranza $epsilon$, misurata tipicamente tramite la norma $L_1(abs(bold(r)^((t+1)) - bold(r)^((t)))_1 < epsilon)$ o mediante altre norme vettoriali come quella euclidea.
#esempio[
Consideriamo il seguente schema:
#figure(
image("images/page_rank2.png", width: 20%)
)
Le equazioni di flusso sono:
$
r_y &= r_y / 2 + r_a / 2 \
r_a &= r_y / 2 + r_m \
r_m &= r_a / 2
$
La matrice di adiacenza stocastica è la seguente:
#align(center)[
  #table(
    columns: (auto, 2.5em, 2.5em, 2.5em),
    rows: 2.5em,
    align: center + horizon,
    inset: 6pt,
    // borders only around the 3x3 inner grid, not around the labels
    stroke: (x, y) => if x >= 1 and y >= 1 { 0.5pt } else { none },
    [], [*y*], [*a*], [*m*],
    [*y*], [½], [½], [0],
    [*a*], [½], [0], [1],
    [*m*], [0], [½], [0],
  )
]
Il metodo delle potenze prevede i seguenti passi:
+ Poni $r_j = 1 / N$
+ $r'_j = sum_(i arrow j) r_i / d_i$
+ $r = r'$
+ se non converge torna al passo 2.
#align(center)[
  #table(
    columns: 8,
    stroke: none,
    align: center + horizon,
    inset: (x: 9pt, y: 5pt),
    table.cell(rowspan: 3)[$mat(r_y; r_a; r_m)$],
    table.cell(rowspan: 3)[$=$],
    $1/3$, $1/3$, $5/12$, $9/24$, [], $6/15$,
    $1/3$, $3/6$, $1/3$, $11/24$, $dots$, $6/15$,
    $1/3$, $1/6$, $3/12$, $1/6$, [], $3/15$,
    [], [],
    [Iterazione 0,], [1,], [2,], [3,], [$dots$], [],
  )
]
]
=== Random Walk Interpretation
Immaginiamo un navigatore casuale, detto _random web surfer_, ovvero un utente che naviga sul Web in modo casuale. In un qualsiasi istante di tempo $t$, il navigatore si trova su una certa pagina $i$. All'istante successivo $t+1$, l'utente sceglie di seguire uno dei link in uscita dalla pagina $i$ in modo uniformemente casuale. Di conseguenza, il navigatore arriva su una nuova pagina $j$ che risulta collegata a $i$. Questo processo si ripete idenfinitamente. \
Diamone una *formalizzazione stocastica* con il vettore $bold(p)(t)$. Sia $bold(p)(t)$ un vettore in cui la $i$-esima coordinata rappresenta la probabilità che il navigatore si trovi sulla pagina $i$ al tempo $t$. Per questa ragione, $bold(p)(t)$ costituisce a tutti gli effetti una *distribuzione di probabilità* sulle pagine del web.
==== Distribuzione stazionaria
Per determinare dove si trovi il navigatore casuale al tempo successivo $t + 1$, sapendo che segue un link in modo uniformemente casuale, l'equazione di transizione si esprime moltiplicando la matrice stocastica $M$ per il vettore di probabilità corrente:
$
bold(p)(t + 1) = M dot.c bold(p)(t)
$
Se la passeggiata casuale raggiunge uno stato di equilibrio in cui la distribuzione di probabilità non cambia più nel corso del tempo, ovvero:
$
bold(p)(t + 1) = M dot.c bold(p)(t) = bold(p)(t)
$
allora il vettore $bold(p)(t)$ prende il nome di *distribuzione stazionaria* della passeggiata casuale. \
Poichè il vettore di rank originario $bold(r)$ soddisfa esattametne la medesima relazione algebrica:
$
bold(r) = M dot.c bold(r)
$
Ne consegue che *r rappresenta la distribuzione stazionaria* della passeggiata casuale sul grafo del web, fornendo così una potente interpretazione intuitiva e probabilistica del punteggio di importanza delle pagine.
==== Esistenza e unicità
Proseguendo nell'analisi della passeggiata casuale e dei processi di Markov, introduciamo un risultato teorico fondamentale noto come *Esistenza e unicità*.
#teorema(title: "Esistenza e unicità")[
PEr i grafi che soddisfano *determinate condizioni*, la *distribuzione stazionaria è unica*. Questa distribuzione viene inevitabilmente raggiunta nel corso del tempo, indipendentemente da quale sia stata la distribuzione di probabilità iniziale al tempo $t=0$.
]
=== PageRank: la formualzione di Google
Ci poniamo tre interrogativi cruciali sulla convergenza e sulla correttezza matematica del modello iterativo appena descritto:
- *Questo processo converge*? Ci si chiede se il metodo iterativo basato sul calcolo matriciale e sul metodo delle potenze raggiunga effettivametne un limite stabile senza oscillare all'infinito.
- *Convergono verso ciò che si desidera?* Anche in caso di convergenza, è necessario verificare che il risultato corrisponda all'unica distribuzione stazionaria corretta e significativa per il grafo.
- *I risultati sono ragionevoli?* Si analizza se i punteggi di importanza assegnati alle pagine rispecchino fedelmente il principio dei link come voti o se emergano anomalie strutturali che richiedono la formulazione correttiva di Google.
==== Problema della convergenza
Analizziamo il *problema dello spider trap*. Uno spider trap si verifica quando un gruppo di pagine possiede link interni che puntano esclusivamente tra loro, senza alcuna via d'uscita verso il resto del grafo. Di conseguenza, un navigatore casuale che entra in questo gruppo finisce per rimanervi intrappolato indefinitamente, assorbendo tutto il flusso o l'importanza del grafo.
#esempio(title: "Spider trap")[
Consideriamo il seguente schema:
#figure(
image("images/spider_trap.png", width: 20%),
caption: [Problema dello spider trap]
)
#align(center)[
  #table(
    columns: 6,
    stroke: none,
    align: center + horizon,
    inset: (x: 10pt, y: 5pt),
    [$r_a$], table.cell(rowspan: 2)[$=$], [1], [0], [1], [0],
    [$r_b$], [0], [1], [0], [1],
    [], [], table.cell(colspan: 4)[Iteration 0, 1, 2, $dots$],
  )
]
In questo caso il PageRank non converge.
]
Analizziamo un'ulteriore problema, il problema del *dead end*. Il dead end si verifica quando una pagina possiede dei link in entrata ma nessun link in uscita verso il resto del grafo. Quando il navigatore casuale raggiunge una pagina di questo tipo, la probabilità vi si accumulano senza poter essere ridistribuiti, provocando la dispersione o l'annullamento progressivo del flusso complessivo di importanza.
#esempio(title: "Dead end")[
Consideriamo il seguente schema:
#figure(
image("images/dead_end.png", width: 20%),
caption: [Problema del dead end]
)
#align(center)[
  #table(
    columns: 6,
    stroke: none,
    align: center + horizon,
    inset: (x: 10pt, y: 5pt),
    [$r_a$], table.cell(rowspan: 2)[$=$], [1], [0], [0], [0],
    [$r_b$], [0], [1], [0], [0],
    [], [], table.cell(colspan: 4)[Iteration 0, 1, 2, $dots$],
  )
]
In questo caso il PageRank non converge.
]
=== Problemi del PageRank
Analizziamo i *due problemi principali* che compromettono la convergenza e la corretteza del modello di flusso di base sul Web reale:
+ *Dead ends*: alcune pagine sono prive di link in uscita. La presenza di tali pagine fa sì che il punteggio di importanza si disperda o fuoriesca dal sistema durante le iterazioni.
+ *Spider traps*: si verificano quando tutti i link rimangono confinati all'interno di un gruppo chiuso di pagine. Con il passare del tempo, queste strutture finiscono per intrappolare e assorbire tutta l'importanza del grafo.
==== Soluzione mediante teletrasporti casuali
La soluzione di Google per le spider traps è la seguente: ad ogni passo temporale, il navigatore casuale ha a disposizione *due opzioni*:
- con una probabilità $beta$, sceglie di seguire un link a caso della pagina corrente;
- con una probabilità complementare $1 - beta$, compie un salto (_teleport_) verso una pagina qualsiasi scelta in modo casuale nell'intero grafo.
I valori comunemente impiegati per il parametro $beta$, noto come fattore di smorzamento o _damping factor_, si trovano tipicamente nell'intervallo compreso tra 0.8 e 0.9. Un esempio è mostrato nel seguente schema:
#figure(
image("images/teleport.png", width: 50%),
caption: [Teletrasporti casuali]
)
Nel grafo a sinistra, se si entra nella pagina $m$ si rimane intrappolati, mentre nel secondo ci sono dei salti casuali verso qualsiasi altra pagina. \
La stessa soluzione si può applicare al problema del dead end, come mostrato in figura:
#figure(
image("images/teleport2.png", width: 50%),
caption: [Soluzione al problema del dead end]
)
=== Fare da slide 42 a slide 49 (pdf del PageRank)
