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
+ *Analyzing result (Interpretazione e valutazione)*. L'ultima fase in cui i pattern estratti vengono analizzati e interpretati per estrarre il vero e proprio "valore" o "conoscenza". Questa fase prevede un *meccanismo di feedback*. L'interpretazione dei risultati può portare a rivalutare e modifcare i parametri di qualsiasi delle fasi precedenti per migliorare l'output finale.
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
