// Import everything from the template file
#import "../../typst_templates/classic_template.typ": *

#set heading(numbering: "1.1")

// Disattiva esplicitamente la numerazione per il livello 4 in poi
#show heading.where(level: 4): set heading(numbering: none)
#show heading.where(level: 5): set heading(numbering: none)
#show heading.where(level: 6): set heading(numbering: none)
// Apply the classic configuration
#show: doc => conf(
  title: "Interazione uomo-macchina",
  index: true,
  doc,
)

= Sistemi interattivi e interfacce d'uso
== Sistemi e interfacce
L'essere umano, nella sua storia, si è sempre dotato di _strumenti_ che gli permettessero di svolgere compiti che con il solo impiego delle sue doti di natura sarebbero stati impossibili, come, ad esempio, gli utensili gli hanno permesso di vivere con i proventi della caccia, dell'allevamento e della coltivazione della terra.
Negli ultimi secoli, l'evoluzione della tecnologia hanno cambiato questo scenario in quanto sono stati progettati strumenti capaci di svolgere compiti sempre più complessi, e, soprattutto, capaci di operare in modo *autonomo*. \
L'informatica ha permesso di dotare questi sistemi non solo di autonomia, ma anche di _intelligenza_, attraverso una componente software che, negli anni, è diventata sempre più evoluta e pervasiva. \
L'utilizzo di questi sistemi non richiede più l'acquisizione di abilità manuali specifiche, ma avviene attraverso la mediazione di _interfacce d'uso_ appositamente progettate, che permettono un'interazione anche molto stretta con il suo utilizzatore. Il governi di questi sistemi da parte dell'uono prende sempre più la forma di un _dialogo_ fra due partner intelligenti, come mostrato nella seguente figura.
#figure(
image("images/interfaccia_uso.png", width: 70%),
caption: [L'interfaccia d'uso]
)

Per _sistema interattivo_ intendiamo qualsiasi "combinazione di componenti hardware e software che ricevono input da un utente umano, e gli forniscono un output, allo scopo di supportare l'effetuazione di un _compito_".\
Per _interfaccia d'uso_, o _interfaccia utente (user interface)_, intendiamo l'insieme di "tutti i componenti di un sistema interattivo che forniscono all'utente informazioni e comandi per permettergli di effettuare specifici compiti attraverso il sistema". \
Con il termine _compito_ si intende infine qualsiasi "insieme di attività richieste per raggiungere un risultato". \
L'ISO 9241 preferisce usare il termine _dialogo_ definendolo come "l'interazione fra un utente e un sistema interattivo, intesa come una sequenza di azioni compiute dall'utente (input) e di risposte dal sistema (output)".
#figure(
image("images/dialogo_utente_sistema.png", width: 70%),
caption: [Il dialogo utente-sistema]
)

Il dialogo fra un utente e un sistema interattivo può essere realizzato attraverso svariati _dispositivi d'interazione_. Da un lato, il sistema può utilizzare una varietà di _dispositivi di output_, i cui messaggi sono raccolti dai sensi dell'utente (vista, udito, tatto). Dall'altro, l'utente può governare il sistema utilizzando vari _dispositivi di input_: digitando i tasi su tastiere o utilizzando dispositivi di manipolazione di vario tipo, la sua voce, o, più raramente, lo sguardo o la postura del suo corpo.
#figure(
image("images/dispositivi_interazione.png", width: 70%),
caption: [Alcuni dispositivi di interazione]
)

== Le dimensioni della complessità
Si è detto più volte che i sistemi interattivi oggi possono essere molto complessi. È ora opportuno precisare questo concetto. Un sistema può essere considerato complesso per aspetti diversi: perchè composto da molti componenti che interagiscono fra loro in modo complicato, oppure perchè è destinato a supportare numerose attività. \
Per il primo caso, possiamo usare il termine di _complessità interna_ o _strutturale_, per il secondo quello di _complessità esterna_ o _funzionale_. \
Queste due dimensioni della complessità dei sistemi non sono necessariamente fra loro correlate: esistemo sistemi internamente semplici ma funzionalmente complessi, ed esistono sistemi internamente complessi ma funzionalmente semplici, come, ad esempio, un orologio da parete. D'altro canto, la complessità interna genera spesso una certa complessità funzionale. Infatti, se un oggetto è internamente complesso, potrebbero verificarsi molti possibili malfunzionamenti di diverso tipo. Mettiamo a confronto la complessità funzionale e strutturale con la seguente figura.
#figure(
image("images/complessita.png", width: 70%),
caption: [Complessità funzionale e strutturale a confronto]
)
Le moderne applicazioni software possono raggiungere complessità strutturali e funzionali elevatissime. Per misurarle, sono state definite varie metriche. Tipicamente, la complessità strutturale può essere misurata contando linee di codice sorgente. Per misurarne la complessità funzionale è stato definito il concetto di _punto funzione_, unità di misura delle funzionalità visibili all'utente.\
Consideriamo ora la _complessità d'uso_ di un sistema, cioè la maggiore o minore facilità con cui siamo in grado di utilizzarlo. \
Complessità funzionale e complessità d'uso sono concetti diversi. Un sistema può realizzare molte funzioni, ma essere facile da usare. D'altro canto, esistono sistemi funzionalmente semplici che creano grosse difficiltà a chi li usa.
#figure(
image("images/complessita_uso.png", width: 70%),
caption: [Complessità funzionale e d'uso a confronto]
)

In sintesi, quindi, esistono tre dimensioni della complessità di un sistema:
+ complessità strutturale;
+ complessità funzionale;
+ complessità d'uso.
== Il ruolo dell'interfaccia utente
L'interfaccia d'uso dei sistemi riverse un ruolo fondamentale. Essa ha il compito di "filtrare" la complessità presentando all'utente un'immagine semplificata del prodotto. Una buona interfaccia riduce la complessità funzionale, mettendo a disposizione dell'utente funzioni di più alto livello. Per esempio, i primi word processoro non avevano funzioni di controllo ortografico. I word processor odierni realizzano un ulteriore livello di semplificazione: il controllo ortografico può essere effettuato automaticamente dal sistema, durante la digitazione del testo, senza che l'utente lo debba richiedere esplicitamente. \
#figure(
image("images/interfaccia_filtro.png", width: 70%),
caption: [L'interfaccia utente come filtro semplificatore]
)

== La velocità del cambiamento
L'ambiente della nostra esistenza quotidiana si fa sempre più complesso. Nel lavoro e nel tempo libero dobbiamo interagire con prodotti sempre più sofisticati, il cui uso richiede spesso capacità e competenze non banali. La figura seguente mostra tre gruppi di strumenti tipici, del lavoro e del tempo libero.
#figure(
image("images/velocita_cambiamento.png", width: 70%),
caption: [Accelerazione dell'evoluzione degli strumenti quotidiani]
)

Le cause di questa accelerazione sono molteplici. Innanzitutto, i bisogni degli utenti fanno nascere nuovi prodotti, i quali a loro volta inducono nuovi bisogni: l'esperienza d'uso ne suggerisce sempre delle modifiche migliorative. Infine, i prodotti dell'informatica e delle telecomunicazioni costituiscono un vero e proprio _ecosistema_. L'evoluzione di un prodotto produce la necessità di cambiamento nei prodotti a esso correlati, che devono adattarsi alle sue nuove caratteristiche, in un complesso sistema di condizionamenti reciproci. \
Questa tendenza all'evoluzione accelerata dei prodotti software e all'iperfunzionalismo potrebbe ridursi, almeno in parte, con la trasformazione, in atto da tempo, del software da prodotto a servizio, erogato attraverso la rete.
== Iperfunzionalismo e altri problemi
Il complesso sistema di cicli di feedback ha generato tradizionalmente una forte tendenza all'_iperfunzionalismo_ dei prodotti tecnologici. Questa tendenza è particolarmente visibile nei prodotti software che sono i manufatti evolutivi per eccellenza: modificare il software non richiede modifiche a impianti di produzione, e le nuove versioni possono essere distribuite, attraverso la rete a costi sostanzialmente nulli.\
Nella prima fase di vita di ogni prodotto le sue prestazioni sono inadeguate rispetto ai bisogni deglu utenti. In questa fase il prodotto è ancora immaturo. In seguito all'evoluzione del prodotto, esso raggiunge il "punto di pareggio", nel quale le prestazioni eguagliano i bisogni del suo utente tipico, quello a cui si rivolte prioritariamente. In seguito a ulteriori evoluzioni, il prodotto entrerà in una fase in cui le prestazioni eccedono i bisogni di questo utente, perchè cercherà via via di soddisfare le esigenze di tutti i possibili utenti. \
Questa ricchezza funzionale può portare a diversi svantaggi. L'utente, selezionando un certo prodotto, sa che il suo ciclo di vita sarà breve. Sarà quindi forzato ad acquistare nuove versioni del prodtto e ciò lo costringe a imparare di nuovo. \
A questo si aggiunge anche il rischio di instabilità del prodotto: la crescita della complessità strutturale aumenta inevitabilmente la probabilità di errori nel software.
== Complessità d'uso e divario digitale
Il cosidetto _divario digitale_ che separa chi può accedere alle tecnologie utili e ai conseguenti vantaggi da chi non può farlo, ha molte cause e molte facce. Oltre a coloro che hanno difficoltà nell'accesso alle tecnologie per motivi economici, di età o di istruzione, occorre considerare coloro che soffrono particolari disabilità che possono in qualche modo impedirne l'utilizzo: sordità, ipovisione, daltonismo, cecità e cosi via.
== La Human Computer Interaction
Questo nuovo ruolo dell'interfaccia assume importanza rilevante con la diffusione dei prodotti tecnologici sui mercati di massa. Nel 1981 l'IBM lancia sul mercato il suo personal computer. I nuovi prodotti che sono sviluppati in quegli anni non si rivolgono piùa un mercato di specialisti. Proprio in quegli anni nasce allora una disciplina nuova, subito denominata _Human-Computer Interaction (HCI)_.
$
"HCI è una disciplina che si occupa della progettazione, valutazione e realizzazione di sistemi interattivi basati su computer destinati all'uso umano e dello studio dei principali fenomeni che li circondano.
L'HCI nel suo complesso è un'area interdisciplinare. Sta emergendo una specializzazione all'interno di parecchie discipline, con enfasi differenti: la scienza dei computer (la progettazione delle applicazioni e l'ingegnerizzazione delle interfacce umane), la psicologia (l'applicazione delle teorie dei processi cognitivi e l'analisi empricia dei comportamenti degli utenti), la sociologia e l'antropologia (le interazioni fra la tecnologia, il lavoro e l'organizzazione), e l'industrial design (i prodotti interattivi).
"
$
Inizialmente, l'ergonomia (dalle parole greche ergon, lavoor e nomos, legge) studiava le compatibilità fra le caratteristiche fisiche dell'uomo e della macchina, studiando la disposizione ottimale dell'ambiente e delle apparecchiature di lavoro in funzione dei compiti da svolgere, come mostrato nella figura seguente.
#figure(
image("images/hci.png", width: 70%),
caption: [Postura ergonomica al posto di lavoro]
)
Oggi, gli argomenti principali considerati dalla disciplina della HCI, sono i seguenti:
- metodologie e processi per la progettazione delle interfacce;
- tecniche per l'implementazione delle interfacce, come algoritmi, strumenti e librerie software;
- tecniche per valute e confrontare le interfacce;
- sviluppo di nuove interfacce e di nuove tecniche di interazione;
- sviluppo di modelli descrittivi e previsionali, e di teorie dell'interazione.
