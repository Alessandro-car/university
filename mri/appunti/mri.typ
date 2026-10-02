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
