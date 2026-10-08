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
= Usabilità
== Un modello dell'interazione
Viviamo quotidianamente le difficoltà nel rapporto con gli oggetti che ci circondano, che percepiamo spesso come difficili da usare. \
Il modello più semplice dell'interazione fra un sistema e il suo utilizzatore è rappresentato dal _ciclo di feedback_, mostrato nella seguente figura.
#figure(
image("images/feedback_loop.png", width: 70%),
caption: [Interazione utente-sistema come ciclo di feedback]
) <fig_interazione_sistema_utente>
L'utente, per raggiungere il proprio scopo, fornisce un input al sistema, e riceve da questo una risposta (_feedback_), che viene interpretata e confrontata con lo scopo iniziale. Il risultato porta alla successiva azione dell'utente, innescando così un nuovo ciclo di stimolo-risposta. Le frecce della figura rappresentano pertanto l'informazione che fluisce da un interlocutore all'altro durante l'interazione.\
Il modello della @fig_interazione_sistema_utente, nella sua semplicità, non permette di comprendere l'origine delle difficoltà che sperimentano nell'interazione con i sistemi. Per analizzare meglio quest'aspetto è molto utile un modello più articolato proposto da Donald Norman nel 1986 e rappresentato nella seguente figura.
#figure(
image("images/norman.png", width: 70%),
caption: [Il modello di Norman]
) <fig_modello_norman>
Questo modello scompone il nostro operare sugli oggetti in sette passi principali:
+ Formare lo scopo: decidiamo quale scopo vogliamo raggiungere.
+ Formare l'intenzione: decidiamo che cosa intendiamo fare per raggiungere lo scopo prefissato.
+ Specificare un'azione: pianifichiamo nel dettaglio le azioni specifiche da compiere.
+ Eseguire l'azione.
+ Percepire lo stato del mondo: osserviamo come sono cambiati il sistema e il mondo circostante dopo le nostre azioni.
+ Interpretare lo stato del mondo: elaboriamo ciò che abbiamo osservato per dargli un senso.
+ Valutare il risultato: decidiamo se lo scopo iniziale è stato raggiungo.
Ciò che interessa, in questo contesto, è il fatto che il modello permette di individuare con grande chiarezza i momenti in cui possono presentarsi dei problemi. Nel percorrere i sette stadi dell'azione è possibile che s'incontrino delle difficoltà. In particolare, ci sono due golfi che possono essere particolarmente difficili da superare:
- il _golfo dell'esecuzione_, che separa lo stadio delle intenzioni da quelle delle azioni, e
- il _golfo della valutazione_, che separa lo stadio della percezione dello stato del mondo da quello della valutazione dei risultati.
Per superare il golfo dell'esecuzione dovrò identificare, fra le azioni che è possibile seguire con il sistema, quelle che mi permetteranno di raggiungere lo scopo. \
Il golfo della valutazione è legato alle difficoltà che l'utente deve superare per interpretare lo stato fisico del sistema dopo le azioni effettuate.
== Affordance e feedback
Con il termine di _affordance_, si denota la proprietà di un oggetto di influenzare, attraverso la sua apparenza visiva, il modo in cui viene usato. Un oggetto che possiede una buona affordance "invita" chi lo guarda a utilizzarlo nel modo corretto. \
Una buona affordance riduce quindi il golfo dell'esecuzione. Per ridurre l'ampiezza del golfo della valutazione, invece, gli oggetti dovranno fornire un feedback facilmente interpretabile, cioè un segnale che indichi chiaramente all'utente quali modifiche le suue azioni abbiano prodotto sullo stato del sistema. Il feedback deve essere ben comprensibile e specifico: l'utente deve essere in grado di interpretarlo senza fatica. Meglio ancora, dovrebbe essere formulato nel modo che l'utente si aspetta. Importante è la sua tempestività: solo cosi l'utente lo può porre facilmente in relazione con l'azione cui si riferisce. Se la distanza temporale fra azione e feedback è significativa, essi possono essere interpretati come eventi tra loro indipendenti: a volte bastano pochi secondi di ritardo per disaccoppiare, nelle percezione dell'utente, i due eventi.
Il progettista deve fare ogni sforzo per ridurre l'ampiezza di questi due golfi. Un aspetto critico si verifica quando ci troviamo di fronte a una "cattiva affordance". Nel mondo reale, esempi classici sono le cosiddette "Porte di Norman" (porte con un maniglione da tirare, ma accompagnate da un cartello "spingere"), connettori simmetrici per inserimenti asimmetrici o porte a vetri prive di segni. Nel mondo digitale, la cattiva affordance si manifesta attraverso pulsanti "flat" privi di rilievi cliccabili, link nascosti nel testo senza sottolineature, finte "X" di chiusura o slider privi di maniglia.
Inoltre, per migliorare il feedback e l'esperienza generale, giocano un ruolo chiave le "micro-interazioni": piccoli dettagli come la resistenza di una manopola fisica, la fluidità di un gesto touch per far apparire un menu o il suono soddisfacente del cestino che viene svuotato.
== La nozione di usabilità
La nozione di facilità d'uso sembra semplice e inuitiva ma, in realtà, è piuttosto articolata. Bisogna quindi definirla nel modo più preciso possibile. A questo scopo, si preferisce usare il termine più specifico di _usabilità_, proprio per segnalare che intendiamo riferirci a un concetto definito in modo preciso. Le definizioni riportate in letteratura sono numerose. Una definizione che fa al caso nostro è quella proposta nello standard ISO 9241, non solo perchè di forma autorevole, ma perchè è ricca d'implicazioni di carattere pratico, e ci permette, come vedremo, di definire delle misure.
#definizione(title: "Usabilità secondo lo standard ISO 9241")[
L'usabilità di un prodotto è il grado con cui esso può essere usato da specifici utenti per raggiungere specificati obiettivi con efficacia, efficenza e soddisfazione in uno specifico contesto d'uso.
] <def:usabilita>
Si tratta di una definizione multidimensionale, che scompone l'usabilità su tre assi: efficacia, efficienza e soddisfazione degli utenti, e il cui valore può in qualche modo essere misurato, come mostrato nella figura seguente.
#figure(
image("images/usabilita_9241.png", width: 70%),
caption: [Le tre dimensioni dell'usabilità secondo la ISO 9241]
)
- L'_efficacia_ viene definita come l'_accuratezza e completezza con cui gli utenti raggiungono specificati obiettivi_. Essa considera il "livello di precisione" con cui l'utente riesce a raggiungere i suoi scopi, misurato in qualche modo numericamente.
- L'_efficienza_ è definita come "la quantità di risorse spese in relazione all'accuratezza e alla completezza con cui gli utenti raggiungono obiettivi". Tali risorse potranno essere di natura differente e potranno anch'esse essere quantificate.
- La _soddisfazione_ è definita come "la libertà del disagio e l'attitudine positiva verso l'uso del prodotto".
Tra gli obiettivi fondamentali dell'usabilità vi è anche la *Sicurezza* nell'interazione, ovvero la protezione dell'utente da condizioni pericolose e situazioni indesiderate. Per garantire un'interazione sicura, il sistema deve:
- *Prevenire errori gravi:* ridurre il rischio di attivazioni involontarie di tasti o pulsanti critici.
- *Fornire vie di ritorno:* mettere a disposizione funzioni di annullamento ("undo") per permettere di correggere gli errori.
- *Utilizzare finestre di conferma:* dare all'utente la possibilità di valutare le conseguenze delle proprie azioni prima dell'esecuzione effettiva.
Applicando questa definizione, potremo "misurare" l'usabilità associandole tre grandezze numeriche che ne quantificano l'efficacia, l'efficienza e la soddisfazione dell'utente. Per quanto riguarda la soddisfazione, la quantificazione sarà normalmente effettuata chiedendo agli utenti, attraverso opportuni questionari, di attribuire dei "voti" a specifiche caratteristiche del sistema. Tutti i valori saranno ovviamente di tipo statistico, e verranno calcolati, per esempio, come media di un insieme significativo di misure.\
Secondo il modello proposto da Jakob Nielsen nel 1993, l'usabilità si inserisce nel concetto più ampio di "Accettabilità del sistema". L'accettabilità globale si divide in "Accettabilità sociale" (conformità a valori, etica e legalità) e "Accettabilità pratica". Quest'ultima include parametri come costo, affidabilità, compatibilità e, soprattutto, l'"Utilità" (Usefulness) globale. L'utilità, a sua volta, è data dalla somma dell'utilità in senso stretto (la capacità di supportare i compiti dell'utente) e, appunto, dell'usabilità.
=== Evoluzione degli standard ISO: dal 9126 alla famiglia 25000
Oltre alla definizione della ISO 9241, la standardizzazione dell'usabilità si è evoluta attraverso diverse norme dedicate alla qualità complessiva del software.
Un primo riferimento è lo standard *ISO 9126-1*, che definiva l'usabilità come la "capacità del prodotto software di essere compreso, appreso, usato e attraente per l'utente, se usato sotto condizioni specificate". Questo modello distingueva le caratteristiche interne (visibili nel codice) dalla "qualità in uso" percepita dall'utente (che comprendeva efficacia, produttività, sicurezza e soddisfazione).

Nel 2011, l'ISO/IEC 9126-1 è stato sostituito dalla famiglia di standard *ISO/IEC 25000*, nota anche come SQuaRE ("Systems and Software Quality Requirements and Evaluation"). Questo standard crea un approccio sinergico, fungendo da strumento di raccordo tra le visioni del committente, del fornitore, del progettista e dell'utente finale. La particolarità dello standard 25000 è che non entra nel merito di "cosa" fa il software (le sue proprietà funzionali), ma valuta "come" opera (le sue proprietà qualitative).

Questo standard definisce tre livelli di valutazione della qualità:
- *Qualità interna:* verificabile attraverso ispezioni o strumenti di analisi statica direttamente sul codice software.
- *Qualità esterna:* verificabile da tecnici specializzati tramite test dinamici, eseguiti esclusivamente in ambienti simulati.
- *Qualità in uso:* verificabile in ambienti reali (o simulati) con la partecipazione diretta degli utenti finali, per definire in modo concreto le difficoltà riscontrate durante l'interazione.

All'interno di questa famiglia, il *Modello di Qualità del Software ISO/IEC 25010* formalizza ulteriormente questi concetti, dividendo la valutazione in due macro-aree:
1. *Qualità del Prodotto:* racchiude otto caratteristiche intrinseche del sistema: l'idoneità funzionale, l'efficienza delle prestazioni, la compatibilità, l'affidabilità, la sicurezza, la manutenibilità, la portabilità e, naturalmente, l'*Usabilità* (che a sua volta include riconoscibilità dell'appropriatezza, apprendibilità, operabilità, protezione dagli errori, estetica dell'interfaccia e accessibilità).
2. *Qualità in Uso:* rappresenta il risultato finale e si divide in efficacia, efficienza, soddisfazione (utilità, fiducia, piacere, comfort), assenza di rischio (mitigazione del rischio economico, per la salute, sicurezza e ambientale) e copertura del contesto (completezza del contesto e flessibilità).
== Apprendibilità e memorabilità
La definizione di usabilità va ulteriormente approfondita. Un sistema che sia facile da imparare si dice dotato di elevata _apprendibiltià_. \
Nella progettazione di un sistema, il progettista ha di fronte a sé diverse scelte possibili:
- considerare come pricipali destinatari del prodotto gli _utenti occasionali_, cioè coloro che non hanno la necessità di utilizzarlo frequentemente, e quindi non sono disposti a investire tanto tempo in attività di apprendimento, oppure
- progettare in primo luogo per gli _utenti continuativi_, cioè per coloro che lo utilizzeranno in modo frequente e continuativo, e pertanto saranno disposti a investire anche una significativa quantità di tempo per imparare ad utilizzarlo con la massima efficacia ed efficienza.
Una terza possibilità è quella di indirizzare il prodtto a entrambi i tipo di utente. In altre parole, il prodotto offrirà funzioni di rapido apprendimento e funzioni di più lento apprendimento, ma che permettano di ottenere gli stessi risultati con maggiore efficienza o efficacia. \
Nel caso degli utenti occasionali, è utile che le modalità d'uso del prodotto siano facili da ricordare o, come si dice, che il prodotto sia dotato di un'elevata _memorizzabilità_. \
Jakon Nielsen definisce l'usabilità come la somma dei cinque attributi seguenti:
- _Apprendibilità_: il sistema dovrebbe essere facile da imparare;
- _Efficienza_: il sistema dovrebbe essere efficiente da usare;
- _Memorabilità_: il sistmea dovrebbe essere facile da ricordare;
- _Errori_: il sistema dovrebbe rendere difficile sbagliare;
- _Soddisfazione_: il sistema dovrebbe essere piacevole da usare.
L'usabilità deve quindi bilanciare apprendibilità e memorabilità nel tempo. Da un lato, il sistema deve permettere all'utente occasionale (che resta un novizio) di tornare a usarlo dopo tempo senza consultare manuali. Dall'altro, deve consentire all'utente continuativo di massimizzare efficienza ed efficacia, accettando un investimento di tempo iniziale. \
Bisogna infatti considerare l'evoluzione dell'utente nel tempo, che attraversa quattro stadi: novizio, principiante, competente ed infine esperto.
== Sussidi all'utente
Un sistema interattivo è normalmente corredato da una serie di _sussidi_, che permettono ai suoi utenti di utilizzarlo agevolmente. Alcuni possono essere integrati nel prodotto stesso, come i sistemi di _help online_, altri possono essere forniti a parte, come i _manuali utente_, costituiti da servizi, forniti dal produttore, come gli _help desk_. \
Questi sussidi hanno lo scopo di assistere l'utente in vari modi. Alcuni lo accompagnano nell'uso iniziale del sistema, quando non lo conosce ancora, come gli _starter kit_ e i _tutorial_. Altri sussidi hanno lo scopo di assistere l'utente durante l'uso successivo. I _manuali utente_ sono testi che descrivono il sistema in modo completo, per tutti quegli aspetti che possono interessarlo: le sue caratteristiche e come usarlo. Sono di solito concepiti per essere letti sequenzialmente, dall'inizio alla fine. I _manuali di riferimento_ sono pensati come strumenti di consultazione, per trovare informazioni specifiche durante l'uso. Le _schede di riferimento_ hanno la stessa funzione, ma sono molto più sintetiche. \
Da molti anni è in atto una _smaterializzazione_ dei sussidi, che sono trasferiti dal supporto cartaceo a quello elettronico. La documentazione in formato elettronico viene poi,  apartire da anni più recenti, sempre più spesso erogata esclusivamente attraverso la rete. Contemporaneamente a questa tendenza è in atto anche da tempo un tendenza all'_integrazione_ degli stesso con il prodotto. L'insieme dei sussidi non è più visto come un insieme di componenti separati dal prodotto, ma come un vero e proprio _sistema di aiuto_ costituito da elementi correlati e strettamente integrati con il prodotto cui si riferiscono. \
In sintesi, l'usabilità di un prodotto va valutata considerando il sistema complessivo dei suoi sussidi, che spesso non sono distinguibili dal prodotto stesso. Gli utenti preferiscono "rischiare" e provare comunque a utilizzare il sistema, anche se non lo conoscono. \
Tuttavia, nella pratica reale, i manuali d'uso non vengono quasi mai letti prima di utilizzare un sistema, ma solo in un secondo momento per risolvere problemi specifici. Gli utenti evitano i manuali per mancanza di tempo, perché non trovano l'informazione necessaria o perché ritengono il testo incomprensibile. A questo proposito, Donald Norman afferma con una regola semplice: "Tutte le volte che trovo indicazioni su come usare qualcosa, si tratta di un oggetto progettato male". I sistemi dovrebbero quindi essere progettati in modo da poterne fare a meno, almeno nelle fasi iniziali dell'interazione.
== Usabilità universale
L'usabilità, come detto in precedenza, è un concetto relativo. Non si può affermare che un prodotto è usabile in assoluto: è necessario specificare per quali utenti, per quali obiettivi e in quali contesti d'uso, come evidenzia la definizione *@def:usabilita*.\
Alcuni prodotti sono destinati a una ristretta categoria di utenti, per un utilizzo in contesti molto particolari. Altri sono destinati a un pubblico molto più ampio, per essere utilizzati in situazioni molto varie. A seconda dei suoi destinatari e contesti d'uso, prodotti destinati a fornire all'utente funzioni simili possono differenziarsi in modo considerevole. \
Per i prodotti e i servizi destinati a un'utenza generica, e che risultano usabili per tutti, in contesti generici, è stato coniato il termine di _usabilità universale_. \
Per raggiungere un'alta usabilità è essenziale comprendere che "non esiste la taglia unica": ciò che funziona perfettamente per i bambini (come quiz interattivi e fumetti) può risultare irritante per un pubblico adulto. È fondamentale anche sfatare i miti sugli utenti anziani. Spesso si presume che vogliano solo interfacce grandi per problemi di vista, ma gli studi dimostrano che molti adulti anziani sanno usare perfettamente interfacce standard e smartphone. La loro eventuale resistenza alle nuove tecnologie deriva spesso dalla volontà di non perdere tempo con distrazioni digitali, non da incapacità. Infine, il contesto d'uso è fortemente influenzato dalle differenze culturali: un banale esempio è il formato delle date, che varia drasticamente tra Stati Uniti (Mese/Giorno/Anno) e Italia (Giorno/Mese/Anno), creando potenziali difficoltà nella compilazione di moduli globali.
== I benefici dell'usabilità
L'inclusione del lavoro sui fattori umani nello sviluppo di sistemi interattivi porta vantaggi misurabili sia a breve che a lungo termine.
- *Benefici a breve termine (durante lo sviluppo):* Risolvere un problema di usabilità durante la definizione dei requisiti ha un costo pari a 1 unità, che sale fino a 6 unità durante lo sviluppo, ma può arrivare a costare tra le 60 e le 100 unità se la modifica deve essere apportata in fase di manutenzione dopo il rilascio.
- *Benefici a lungo termine (dopo il rilascio):* Un'ingegneria dell'usabilità ben fatta comporta un aumento delle vendite, una riduzione dei costi di formazione, un aumento della produttività dell'utente finale e una netta diminuzione delle necessità di supporto e assistenza tecnica.
I benefici dell'usabilità sono particolarmente evidenti nel contesto dell'*Usabilità Web*. Secondo uno studio di Forrester Research su circa 8500 persone riguardante i motivi per cui le persone scelgono un sito web rispetto a un altro, l'usabilità si posiziona al secondo posto per importanza (66%), superata solo da un "buon contenuto" (75%) e seguita dalla velocità di download (58%) e dalla freschezza dei contenuti (54%).
== Dall'Usabilità alla User Experience (UX)
Negli ultimi anni, l'attenzione si è spostata dalla sola usabilità alla "User Experience" (UX). Come afferma Jesse Garrett, la UX "comprende tutti gli aspetti dell'interazione dell'utente finale con l'azienda, i suoi servizi e i suoi prodotti".
Mentre l'usabilità si concentra sulla facilità di apprendimento, sull'efficienza e sulla sicurezza (prevenire errori gravi e fornire vie di ritorno), la UX riguarda anche ciò che le persone provano emotivamente. Secondo Donald Norman, non basta costruire prodotti funzionanti e usabili, ma bisogna progettare anche "gioia ed entusiasmo, piacere e divertimento".

Un aspetto fondamentale è che "non si può progettare un'esperienza", ma si può solo "progettare per un'esperienza", creando caratteristiche che evochino risposte sensoriali o emotive. L'esperienza dell'utente può variare: può essere "veloce" (come scattare una foto istantanea), "ludica" (giocare) o "integrata" (come la visita a un museo).

A tal proposito, il modello dell'esperienza utente di Hassenzahl distingue due categorie di aspetti:
- *Aspetti Pragmatici:* legati a quanto sia semplice e ovvio raggiungere i propri obiettivi.
- *Aspetti Edonici:* legati a quanto l'interazione con l'oggetto sia evocativa e stimolante.
Oltre agli aspetti pragmatici ed edonici, gli aspetti fondamentali che compongono la UX includono l'usabilità stessa, la qualità dei contenuti, le funzionalità, l'estetica (aspetto visivo) e il fascino emotivo (la connessione con l'utente).
A questo proposito, un altro modello rilevante è quello di *McCarthy e Wright* ("Technology as Experience"), che spiega l'esperienza dell'utente unendo filoni sensoriali, cerebrali ed emotivi, basandosi sulla percezione, sulle aspettative e sul senso profondo che la persona attribuisce alle proprie interazioni con la tecnologia. L'obiettivo ultimo della UX è massimizzare gli aspetti desiderabili (rendere il prodotto godibile, coinvolgente, gratificante, creativamente stimolante) e azzerare quelli non desiderabili (evitare che il sistema risulti frustrante, noioso, irritante o che faccia sentire l'utente stupido).
Un esempio perfetto di connubio tra usabilità ed esperienza utente è rappresentato dai lettori musicali iPod introdotti negli anni 2000. Il loro successo non derivava solo dalla semplicità d'uso, ma da un design slanciato, dall'arcobaleno di colori, da nomi memorizzabili e da un fascino emotivo che li rendeva oggetti di moda. Questo approccio si riflette oggi anche negli spazi fisici come gli Apple Store, progettati specificamente per incoraggiare l'interazione e la scoperta, creando un'esperienza totalizzante per l'utente.
= Ingegneria dell'usabilità
== Che cosa significa progettare
Nella lingua italiana, e soprattuto nella pratica dell'informatica, il termine _progettare_ è spesso utilizzato in modo impreciso. È quindi opportuno definirlo con precisione.
#definizione(title: "Progettare")[
_Progettare_ significa immaginare, ideare qualcosa e studiare il modo di attuarla.
]
In sostanza, nell'attività di progettazione si parte da un esame della situazione attuale, per riconoscerne i defetti o i limiti e, sulla base delle possibilità offerte dalla tecnologia, si concepisce e si specifica la situazione futura. Progettazione è quindi un'attività di natura sia intelletuale sia pratica: non basta una "visione" del futuro desiderato, ma occorre definire anche tutti i dettagli che ne permetteranno la realizzazione. \
Progettare è, pertanto, attività completamente diversa dal realizzare.
#definizione(title: "Realizzare")[
_Realizzare_ significa rendere reale qualcosa attuandola praticamente.
]
Realizzare è quindi un'attività molto concreta: si parte da un progetto e lo si attua concretamente. \
Nella pratica corrente, soprattuto in informatica, il termine progettare è spesso usato in modo impreciso, per comprendere non soltanto le attività di progettazione, ma anche la successiva realizzazione. Così, per _progetto_ non si intende solo il risultato della progettazione ma spesso tutte le attività connesse allo sviluppo di un sistema, dalla progettazione alla realizzazione concreta.
== Progettare l'interazione
Il processo di progettazione parte dalla definizione dei suoi _requisiti funzionali_, cioè dall'identificazione delle _funzionalità_ che esso deve fornire al suo utente, che vengono descritte in dettaglio in un documento di _specifiche funzionali_, a partire dal quale il sistema viene progettato e quindi realizzato. In questo approccio, l'utente del sistema ha un ruolo marginale: il progettista concentra la sua attenzione sulle funzionalità, e sugli aspetti tecnici connessi alla loro realizzazione, per arrivare a soddisfare le specifiche con un rapporto costo/qualità accettabile. \
Se l'obiettivo è la progettazione di un sistema usabile. questo approccio non funziona. In questo caso, il progettista dovrà porre la sua attenzione, in primo luogo, sull'utente, e dovrà studiarne le caratteristiche, le abitudini e le necessità in relazione all'uso del sistema. Dovrà preconfigurare i vari contesti in cui il sistema sarà utilizzato, e i suoi diversi casi d'uso: dovrà analizzare in dettaglio i compiti che l'utente svolgerà con il sistema. Tutto questo allo scopo di progettare un sistema che si adatti all'utente. In questo approccio, il compito del progettista non sarà più semplicemente quello di progettare le funzioni del sistema, ma quello di progettare l'interazione fra il sistema e il suo utente. Si parla di _interaction design_ e, per sottolineare che il punto di partenza è l'utente, di *progettazione centrata sull'essere umano, human-centred-design, HCD*.
== Progettazione human-centred
La progettazione centrata sull'essere umano è l'oggetto di un altro standard molto importante, l'ISO 13407: _Human-centred design processes for interactive systems_. Questo documento ha lo scopo "di aiutare chi ha la responsabilità di gestire i processi di progettazione di hardware e software a identificare e pianificare efficaci e tempestive attività di progettazione human-centred. Esso complementa i vari metodi e approcci alla progettazione esistenti". \
La filosofia e le motivazioni della progettazione human-centred sono ben riassunte dalla seguente definizione.
#definizione(title: "Human-centred design")[
La progettazione centrata sull'essere umano è un approccio allo sviluppo dei sistemi interattivi specificatamente orientato alla creazione di sistemi usabili. È un attività multi-disciplinare che incorpora la conoscenza e le tecniche dei fattori umani e dell'ergonomia. L'applicazione dei fattori umani e dell'ergonomia alla progettazione dei sistemi interattivi ne potenzia l'efficacia e l'efficienza, migliora le condizioni del lavoro umano e contrasta i possibili effetti avversi aall'uso sulla saluta, sulla sicurezza e sulle prestazioni. Applicare l'ergonomia alla progettazione dei sistemi richiede che si tenga conto delle capacità, della abilità, delle limitazioni e delle necessità umane. I sistemi human-centred supportano gli utenti e li motivano a imparare. I benefici possono includere una maggiore produttività, una migliore qualità del lavoro, riduzione dei costi di supporto e di addestramento e una migliore soddisfazione dell'utente.
]
La progettazione human-centred non è una specifica metodologia di progettazione, ma un approccio generale, che può essere sviluppato in molto modi, in funzione della natura dei prodotti da realizzare e delle caratteristiche dell'organizzazione che ospita il progetto. A questo proposito, l'ISO 13407 specifica che, quali che siano i processi e ruoli adottati, l'utilizzo di un approccio human-centred è caratterizzato dai seguenti quattro punti:
+ il coinvolgimento attivo degli utenti e una chiara comprensione degli utenti e dei compiti;
+ un'assegnazione appropriata delle funzioni fra utenti e tecnlogia;
+ l'iterazione delle soluzioni di progetto;
+ una progettazione multi-disciplinare.
== I caso d'uso
La nozione di caso d'uso è di grande importanza nella progettazione human-centred, e merita un approfondimento. In termini del tutto generali, un caso d'uso può essere definito come _un'insieme d'interazioni fra l'utente (o più utenti) e il sistema, finalizzate a uno scopo utile per l'utente._ \
Non bisogna confondere i casi d'uso con le funzionalità del sistema. In un caso d'uso, il soggetto è l'utente. Una funzione, invece, è una prestazione realizzata dal sistema. La distinzione è sottile ma fondamentale. Un caso d'uso viene realizzato, di solito, mediante l'esecuzione di più funzioni del sistema; d'altro canto, una funzione del sisetma potrà essere utilizzata da diversi casi d'uso. Un caso d'uso è un insieme d'interazioni, che, considerate nel loro insieme, _producuno un risultato utile dal punto di vista dell'utente_. \
Per indicare un caso d'uso, si può utilizzare un verbo alla terza persona singolare, per sottintendere che il soggetto è l'utente.
#figure(
image("images/casi_uso.png", width: 70%),
caption: [Casi d'uso e funzionalità]
)
Il progettista orientato al sistema si occupa di progettare funzioni, lasciando all'utente il compito di "metterle nella sequenza giusta", per ottenere ciò che gli server. Si accontenta di fornire i mattoni di base. Segue un approccio _bottom-up_. Il progettista orientato all'utente, invece, desidera conoscere perchè l'utilizzatore adopererà il sistema, e vuole permettergli di raggiungere questi obiettivi nel modo più semplice e lineare. Segue un approccio _top-down_: non parte dalle funzioni, ma dagli obiettivi, ciò che abbiamo chiamati casi d'uso e le funzioni saranno definite dopo. \
L'identificazione dei casi d'uso è un'attività condamentale nella progettazione human-centred. Disporre di elenco ben fatto dei caso d'uso del sistema costituisce un primo passo indispensabile per poterlo progettare. Per eseguirlo correttamente, occorre superare diverse difficoltà. Innanzitutto, esiste il rischio di scambiare casi d'uso con funzionalità, e di ricadere nelle tradizionali pratiche della progettazione orientata al sistema. Inoltre, occorre individuare il giusto livello di astrazione. Un caso d'uso è un'insieme d'interazione che _producono un risultato utile per l'utente_. Quindi, non ogni insieme d'interazioni può essere considerato un caso d'uso.
== Progettazione universale
