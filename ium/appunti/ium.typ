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
Quanto maggiore è la conoscenza dei casi d'uso del sistema, tanto meglio riusciremo a progettarne l'usabilità. Vorremmo poter costruire sistemi che risultino usabili non solo per una specifica persona o gruppo di persone, ma anzi per ogni categoria di utenti. Un sistema universalmente usabile non discrimina e non divide, un mondo di prodotti universalmente usabili sarebbe certamente più equo. \
La progettazione di sistemi universalmente usabili è chiama _progettazione universale_ o più recentemente _design for all_, o ancora, _inclusive design_.
#definizione(title: "Universal design secondo Ron Mace")[
Universal design è la progettazione di prodotti e ambienti usabili da tutte le persone, al massimo grado possibile, senza la necessità di adattamenti o progettazioni speciali.
]
La filosofia del design universale non riguarda solo i sistemi interattivi, e può applicarsi a molti ambiti diversi. In effetti, il concetto non nasce dall'informatica. Alla fine degli anni 90, un grappo di architetti, designer industriali, ingegneri e ricercatori ambientali ha elaborati i seguenti sette principi del design universale:
+ Equità d'uso: il prodotto della progettazione è utile e vendibile a persone con abilità diverse.
+ Flessibilità d'uso: il prodotto della progettazione supporta un ampio spettro di preferenze e abilità individuali.
+ Uso semplice e intuitivo: l'uso del prodotto della progettazione è facile da comprendere, indipendentemente dall'esperienza, conoscenza, capacità linguistica o livello di concentrazione corrente dell'utente.
+ Informazione percepibile: il prodotto della progettazione comunica efficacemente l'informazione necessaria all'utente, indipendentemente dalle condizioni ambientali o dalle abilità sensoriali dell'utente.
+ Tolleranza agli errori: il prodotto della progettazione minimizza i rischi e le conseguenze avverse di azioni accidentali o non intenzionali.
+ Ridotto sforzo fisico: il prodotto della progettazione può essere usato in modo efficace, confortevole e con sforzo minimo.
+ Dimensione e spazio adatti all'uso e all'approccio: vengono forniti dimensioni e spazi appropriati per l'avvicinamento, la manipolazione e l'uso, indipendentemente dalla corporatura, postura o mobilità dell'utente.
Nel caso dei prodtto interattivi, la progettazione universale rappresenta una sfida difficile per il progettista. Le difficoltà derivano da tre ragioni:
+ Diversità delle tecnlogie disponibili ai diversi utenti.
	Gli ecosistemi tecnlogici sono in continuo cambiamento. Ad esempio i personal computer, nonnostante la loro elevatissima stnadardizzazione, sono molto diversi fra loro. Ciò pone enormi problemi di compatibilità fra i sistemi di diversità di prestazioni. Una discriminazione importante riguarda l'accesso alla rete. Gli utenti che dispongono di connessioni a banda larga possono usufruire di servizi che altri utenti non possono utilizzare. Chi dispone di connessioni mobili gode di una flessibilità sconosciuta a chi può accedere alla rete solo da postazioni fisse.
+ Diversità degli individui.
	Le persone sono molto diverse fra loro. Queste differenze rientrano in tre grandi categorie: fisiche, cognitive, socio-cultarali. Le prime sono relative ai parametri che differenziano gli individui dal punto di vista del loro genere, della struttura corporea e delle loro prestazioni fisiche. Le seconde riguardano le capacità cognitive: memoria, attenzione, attitudine al ragionamento logico o analogica, capacità di ragionamenti, ecc. Le diversità socio-cultarali sono legati agli ambienti scoiali e culturali eni quali i vari individui operano e dai quali vengono formati.
+ Diversità nella capacità d'uso della tecnlogia.
	Le persone sono diverse nella loro capacità di relazionarsi con i sistemi tecnlogici. Esiste, inoltre, un forte _gap generazionale_, che differenzia la generazione di chi è entrato in contatto con le tecnlogie digitali fin da bambino e le generazioni precedenti.
Dal punto di vista generale ci sono due strade per produrre un design universale. La prima raprpesenta l'approccio tradizionale che consiste nel definire un utente "medio" del sistema, cioè quale tipo di utente al quale il prodotto prioritariamente s'indirizza. Si analizano i suoi bisogni e i suoi contesti d'uso, e si progetta il sistema per lui. Per gli altri utenti si realizzareanno componenti ad hoc, separati dal sistema, i quali lo adatteranno alle varie situazioni d'interesse. Nel caso di utenti con disabilità, queste interfacce speciali sono chiamate _tecnlogie assistive_. Questa è la strada finora maggiormente seguita per la costruzione di sistemi accessibili a utenti con disabilità. \
Questo approccio pone diversi problemi. Progettando il sistme per l'utente medio, il progettista non è in grado di tenere conto fin dall'inizio delle necessità degli utenti diversi. Gli adattamenti potranno rivelarsi complessi da realizzare. Un altro tipo di difficoltà è dovuto alla necessità di mantenere la compatibilità fra il sistema e le diverse tecnlogie assistive destinate agli utenti speciali. \
A causa di queste difficoltà, ha incominciato a farsi strada una filosofia di progettazione molto diversa. Secondo questo approccio, la progettazione non privilegia l'utente medio, ma tiene in considerazione le necessità di tutte le categorie di utenti. Il sistemi sarà in grado di adattare il proprio funzionamento a ogni specifica classe di utenti, una volta che le informazioni necessarie per questa personalizzazione gli siano satte fornite, per esempio dall'utente stesso in una fase iniziale di configurazione. \
I due approcci sono molto diversi: il primo semplifica l'attività di progettazione, che deve considerare una casistica limitata agli utenti "normali". Il secondo richiede che tutti i problemi siano affrontati e risolti in modo sistematico. \
Esiste una terza possibilità. In questo caso il sistema, oltre ad essere personalizzabile in fase di configurazione è in grado di monitorare con continuità i comportamenti e le modalità d'uso dell'utente e di addatarvisi modificando il proprio comportamento. In sostanza, il sistema impara durante l'uso. Questi sistemi si chiamano _adattivi_ e sono quelli che devono trattare input molto variabili da utente a utente. Questi devono portare a termine una fase di _addestramento iniziale_, per apprendere le caratteristiche comportamentali dello specifico utente. Dopo questa fase, l'addestramento continua durante gli utilizzi successivi, con l'aiuto dell'utente che dovrà correggere il sistema ogni volta che non si comporterà in modo soddisfacente. \
I tre approcci sono complementari e possono essere compresenti in uno stesso sistema. Possiamo definire l'approccio universale come l'approccio secondo il quale i sistemi sono progettati per essere sufficientemente intelligenti da adattarsi alle richieste o alle modalità di utilizzo dei loro diversi utenti o, quando ciò non è possibile, da permettere un facile interfacciamento con adattatori speciali.
== Livello di maturità della progettazione
Il system-centred design e lo human-centred design non dovrebbero essere considerati due approcci alternativi. Lo human-centred design può essere considerato un approccio più maturo, che contiene le problematiche tecniche del system-centred design, ma le inserisce in un contesto più ampio, che ci permette di comprendere in modo più approfondito le finalità del sistema. Possiamo classificare le attività di progettazione in differenti _livelli di maturità_:
+ Primo livello di maturità: il prodotto funziona.
	In questo livello, il progettista si occupa principalmente della risoluzione di problemi di natura tecnologica, e si accontenta che le funzioni previste nel sistema siano operative, e non ci siano errori di funzionamento. Questo è il livello più elementare, in cui si accetta di realizzare un sistema anche rudimentale, purchè permetta di eseguire alcuni compiti ritenuti importanti.
+ Secondo livello di maturità: il prodotto fornisce le funzionalità necessarie.
	A questo livello, il sistema non soltanto funziona, ma realizza tutte le funzionalità ritenute necessarie per gli scopi per cui è concepito. L'attenzione del progettista è posta sulla completezza e sulla qualità delle funzioni del sistema, di cui cura l'affidabilità, le prestazioni, la flessibilità, la modularità. Da parte dell'utente, ci si aspetta che esegua disciplinamente le operazioni specificate nel manuale d'uso.
+ Terzo livello di maturità: il prodotto è facile da usare.
	Questo è il livello della progettazione human-centred. Non solo il prodotto funziona e offre tutte le funzionalità richieste, ma le organizza in modo adeguato rispetto alle tipologie e alle necessità dei suoi utenti, nei diversi contesti d'uso.
+ Quarto livello di maturità: il prodotto è invisibile durante l'uso.
	Questo è il livello al quale ogni bravo progettista dovrebbe tendere. In questo caso il prodotto funziona, fornisce tutte le funzionalità richieste, è usabile e, inoltre, s'integra in modo armonico con i comportamenti del suo utente che questi non si accorge di usarlo.
= Ingegneria dell'usabilità
Il termine _ingegneria dell'usabilità_ viene usato per denotare la disciplina che studia le tecniche, i metodi e i processi che possono essere utilizzati per progettare e sviluppare sistemi usabili.
#definizione(title: "Ingegneria dell'usabilità")[
L'ingegneria dell'usabilità è un processo, basato sull'ingegneria classica, che consiste nello specificare, quantitativamente e in anticipo, quali caratteristiche e in qual misura il prodotto finale da ingegnerizzare dovrà possedere. Questo processo è seguito dall'effettiva realizzazione del prodotto, e dalla dimostrazione che esso effettivamente possiede le caratteristiche pianificate. L'ingegneria non è il processo di costruire un sistema perfetto con risorse infinite. Piuttosto, l'ingegneria è il processo di costruire economicamente un sistema funzionante che soddisfa una necessità. In assenza di specifiche misurabili di usabilità, non c'è alcun modo di determinare le esigenze di usabilità di un prodotto, o di misurare se il prodotto soddisfi o meno tali esigenze. Se non possiamo misurare l'usabilità, non possiamo avere un'ingegneria dell'usabilità.
]
Inizialmente, l'ingegneria dell'usabilità si è focalizzata sul design dell'interfaccia utente dei sistemi software. Oggi questo termine comprende la totalità delle pratiche utilizzate nel processo di progettazione e sviluppo dei sistemi interattivi, a partire dalla raccolta e analisi iniziale dei requisiti. I principi cardine di questa disciplina si possono riassumere nei seguenti punti:
+ Focalizzazione sull'utente, all'inizio e durante tutto il processo di progettazione;
+ Prove con l'utente durante l'intero processo di progettazione, con analisi qualitative e misure quantitative;
+ Modello di progettazione e sviluppo iterativo, per prototipi successivi.
== Il modello "a cascata"
Quandoa la disciplina dell'ingegneria del software era agli esordi, si pensava che per realizzare un progetto di successo fosse necessario procedere per fasi logiche ben sequenziate, ognuna delle quali ponesse le basi per la fase successiva. Si partiva dalla raccolta dei requisiti, poi si definivano le specifiche del sistema da realizzare. Si progettava l'intero sistema su carta e lo si codificava nel linguaggio di programmazione scelto. Lo si collaudava a e infine lo si rilasciava. Si passava alla fase successiva solo quando la precedente era completrata e i suoi prodotti vengono approvati formalmente. \
Per descrivere questo processo si usa la metafora delle cascata.
#figure(
image("images/cascata.png", width: 70%),
caption: [Modello "a cascata"]
)
Ci si accorse ben presto che questo modello non funzionava sempre: nella pratica, in nessun progetto reale, anche se ben gestito, le cose procedevano in maniera semplice e lineare. Si rendeva spesso necessario ritornare sui pacci precedenti, per rivedere e modificare decisioni già prese. \
Le cause potevano essere molteplici: il committente richiedeva delle varianti che modificavanoi le specifiche già approvate. Oppure i progettisti scoprivano difficoltà tecniche inattese. Oppure, nella fase di rilascio del sistema, i primi utenti segnalavano delle difficoltà nell'uso che non erano state previste da nessuno e richiedevano cambiamenti consistenti. \
Con la maturazione della disciplina dell'ingegneria del software si capì che le cose non potevano funzionare così. Dal punto di vista pratico, è difficile prevedere sulla carta tutti gli aspetti di un sistema complesso. \
== Il ciclo compito-artefatto
C'è anche un motivo di natura teorico-concettuale, che fa sì che il modello a cascata non possa funzionare. Questo motivo è racchiuso in un principio generale che possiamo enunciare nel seguentemodo:
$
"Ogni nuovo strumento cambia i bisogni del suo utilizzatore e genera nuovi bisogni, che suggeriscono modifiche non previste allo strumento stesso."
$
Quindi, per soddisfare le nostre necessità, produciamo strumenti che, a loro volta, generano nuovi bisogni. Costruiamo allora nuovi strumenti, o modifichiamo quelli disponibili, in un ciclo evolutivo infinito, al quale è stato dato il nome di _task-artifact cycle_.
#figure(
image("images/compito_artefatto.png", width: 70%),
caption: [Il ciclo compito-artefatto]
)
Quando definiamo i requisiti di un prodotto che non esiste ancora e che vogliamo realizzare, lo facciamo tenendo conto di determinati bisogni insoddisfatti. Per fare ciò, progettiamo il prodotto ipotizzando degli scenari d'uso che ci sembrano plausibili e realizzando quelle funzioni che, nelle nostre ipotesi, ci sembrano necessarie. Potrà capitare, però, che l'interazione fra utente e prodotto faccia nascere nuovi bisogni. Quindi, non è possibile valutare completamente l'adeguatezza dello strumento ai suoi utenti, prima che questi lo usino effettivamente. Ecco perchè il modello a cascata non può funzionare. Esso prevede che gli utenti siano coinvolti nel processo solo in due momenti: all'inizio, per contribuire a requisiti e specifiche e alla fine, dopo il rilascio. Alla fine, se lo strumento si rivelerà inadeguato sarà troppo tardi per intervenire.
== Modelli iterativi
Data l'inadeguatezza del modello a cascata, ci serve un modello diverso, che coinvolga gli utenti fin da subito, non solo nella stesura di requisiti e specifiche, ma anche, per sperimentare l'uso di versioni preliminari del sistema e aiutarci, con le loro reazioni e indicazioni, a correggere il tiro. \
L'idea è di procedere con la realizzazione di una serie di _prototipi_, via via più vicini al sistema finale. Si inizia con un prototipo preliominare, realizzabile a costi ridotti, e lo si sottopone all'utente. Questa prima prova sarà limitata perchè il sistema sarà molto semplificato, però, permette di verificare alcune assunzioni di partenza ed eventualmente di aggiustare il tiro. Si realizza quindi un nuovo prototipo, sempre incompleto, ma somigliante al sistema finale e lo si sottopone alla prova degli utenti, e così via, per approssimazioni successive, fino alla conclusione del progetto. Quindi, le prove d'uso diventano prate integrante del processo di progettazione.
#figure(
image("images/modello_iterativo.png", width: 70%),
caption: [Modello iterativo]
)
Il primo prototipo sarà rudimentale: in molti casi, soltanto un _mock-up_ con il quale effettuare un primo confronto con gli utenti e con il committente. Questo confrontò sarà condotto nella fase di test. In base all'esito del confronto, si apporteranno le necessarie modifiche ai requisiti e al progetto, e si realizzerà un secondo prototipo, più evoluto. All'avanzare del progetto lo sforzo complessivo si sposta progressivamente dalle fasi iniziali del ciclo tradizionale (requisiti e progettazione) alle fasi finali (test e rilascio). \
Tutte le attività rappresentate in figura vengono portate avanti "in parallelo" per tutta la durata del progetto, ma l'impegno dedicato a ciascuna di essa cambia nel tempo. Questa situazione è visualizzata nella seguente figura, che mostra per un progetto ipotetico l'andamento nel tempo dell'impegno di risorse sulle singole attività:
#figure(
image("images/risorse_iterativo.png", width: 70%),
caption: [Allocazione delle risorse secondo il modello iterativo]
)
Questo processo è il modello concettualmente corretto per la realizzazione di sistemi complessi. \
A fronte di questi vantaggi, esiste il rischio che il processo diverga, a causa delle richieste di modifica che nascono durante le attività di valutazione dei prototipi. Per evitare queste difficoltà, per ogni progetto sarà necessario pianificare il processo iterativo di progettazione e sviluppo in modo che, non sfugga di mano. Inoltre è difficile effettuare una stima dei costi a preventivo e la fluidità delle specifiche rende più difficile comunicazione fra le persone coinvolte (team di progetto, committente).
== Comprendere e specificare il contesto d'uso
Il contesto in cui il sistema sarà utilizzato è definito dalle caratteristiche degli utenti, dei compiti e dell'ambiente fisico e organizzativo. È importante identificare e comprendere i dettagli di questo contesto, per orientare le decisioni iniziali del progetto, e per fornire una base per la loro successiva convalida. La descrizione del contesto d'uso del sistema dovrebbe comporndere i seguenti argomenti:
- Le caratteristiche degli utenti.
	Le caratteristiche rilevanti potrebbero essere le competenze, le abilità, le esperienze, la formazione, le carateristiche fisiche, le abitudini, le preferenze. Spesso sarà necessario classificare gli utenti in diverse categorie, per esempio in funzione dei diversi ruoli nei confronti del sistema o dei differenti livello di esperienza.
- I compiti che gli utenti dovranno eseguire.
	Dovrebbero essere anlizzati i compiti che possono influenzare l'usabilità del sistema, per esempio indicandone la frequenza e durata. Si dovranno descrivere eventuali implicazioni riguardanti la salute e alla sicurezza degli utenti.
- L'ambiente nel quale gli utenti utilizzeranno il sistema.
	Si descriveranno le caratteristiche rilevanti dell'ambiente fisico e sociale, includendo l'ambiente di lavoro, le tecnologie utilizzate, gli eventuali standard adottati, il contesto normativo, la struttura organizzativa e le procedure di lavoor, le abitudini consolidate, ecc.
Tutte queste descrizioni dovranno essere raccolte in un documento di lavoro, che sarà revisionato, corretto e ampliato più volte in accordo con la natura iterativa del processo di progettaszione e sviluppo. Dovranno essere sempre verificate e confermate dagli utenti del sistema.
== Specificare i requisiti utente e organizzativi
Nella maggior parte dei processi di progettaziome, esiste un'attività per la specifica dei requisiti del sistema. Nella progettazione human-centred, quest'attività dovrebbe essere ampliata, per descrivere i requisiti in realzione al contesto d'uso più sopra specificato. \
Si dovrebbero considerare i seguenti aspetti:
- le prestazioni richieste al nuovo sistema in relazione agli obiettivi operativi ed economici;
- i requisiti normativi e legislativi rilevanti, compresi quelli relativi alla sicurezza e alla salute;
- la comunicazione e la cooperazione fra gli utenti e gli attori coinvolti;
- le attività degli utenti (inclusa la ripartizioone dei compiti, il benessere e la motivazione degli utenti);
- la ripartizione dei compiti fra esseri umani e sistemi tecnlogici;
- le prestazioni dei diversi compiti;
- la progettazione delle procedure di lavoro e dell'organizzazione;
- la gestione del cambiamento, incluse le attività di addestramento e il personale coinvolto;
- la fattibilità delle diverse operazioni, comprese quelle di manutenzione;
- la progettazione dei posti di lavoro e l'interfaccia uomo-computer.
I requisiti dovrebbero essere organizzati per livello di priorità, e formulati in modo da permettere la loro successiva convalida mediante opportuni test. Dovrebbero essere confermati o aggiornati lungo tutta la durata del progetto.
== Produrre soluzioni di progetto
In questa fase si individuano le possibili soluzioni di progetto, basandosi sullo stato dell'arte, sulle conoscenze ed esperienze dei partecipanti e sui risultati dell'analisi del contesto d'uso. Lo standard identifica le seguenti attività:
- Utilizzare le conoscenze disponibili per sviluppare proposte di progetto con un approccio multi-disciplinare.
	Molte organizzazioni dispongono di linee guida per l'interfaccia utente, conoscenze sul prodotto e sul mercato che possono essere utili nelle fasi inziiali del progetto. Inoltre, esistono linee guida e standard per l'ergonomia e i fattori umani, elaborati dagli enti di standardizzazione.
- Rendere le soluzioni di progetto più concrete, utilizzando simulazioni, modelli e prototipi di vario tipo.
	L'uso di prototipi permette ai progettisti di comunicare più efficacemente con gli utentei, e riduce la necessità di costosi rifacimenti, che possono essere necessari quando il prodotto viene sottoposto a revisione soltanto più tardi nel ciclo di vita.
- Presentare le soluzioni di progetto agli utenti, permettendo loro di eseguire i compiti che il sistema è destinato a supportare.
	Gli utenti possono essere coinvolti molto presto nel progetto. È possibile presentare agli utenti le bozze delle schermate o una rappresentazione del prodotto, chiedendo loro di provarli in un contesto realistico. In tal modo si possono valutare rapidamente ed economicamente aspetti del progetto.
- Modificare il progetto in conseguenza delle reazioni degli utenti, e ripetere questo proceso fino a che gli obiettivi della progettazione non siano raggiunti.
	I commenti dell'utente, o le difficoltà osservate durante l'utilizzo del prototipo, suggeriranno modifiche al progetto, per migliorarne l'usabilità. Questi feedback potranno anche essere di aiuto per raffinare gli obiettivi complessivi del sistema.
- Gestire l'iterazione delle soluzioni di progetto.
	Per controllare i progressi della progettazione iterativa, si dovrebbero registrare i risultati delle attività precedenti. Questa documentazione potrà essere esclusivamente descrittiva. La documentazione descriverà lo scopo dei vari prototipi, le modalità operative del loro utilizzo e i problemi individuati, con le conseguenti modifiche del progetto.
== Valutare il progetto nei confronti dei requisiti.
La valutazione è un passo essenziale in una progettazione human-centred, e dovrebbe essere compiuta in tutte le fasi del ciclo di vita del sistema. Lo standard identifica le seguenti attività:
- Produrre il piano di valutazione
	Il processo di valutazioen dovrebbe essere pianificato, precisando, quali parti del sistema devono essere valutati e come; quali prototipi dovranno essere realizzati e come deve essere eseguita la valutazione e con quali risorse; quali dovranno essere le interazioni con gli utenti e come dovrà essere condotta l'analisi dei risultati. Le tecniche di valutazione variano secondo i casi e la scelta è determinata dalla natura del sistema, dai vincoli economici e di tempo, e dalla fase del ciclo di sviluppo in cui si svolge la valutazione.
- Fornire feedback per la progettazione
	Per influenzare la progettazione, la valutazione dovrebbe essere condotta in ogni fase del ciclo di vita del sistema. La valutazione può essere veloce ed economica, e permette di identificare i problemi maggiori, ma non basta a garantire il successo di un sistema interattivo.
- Verificare se gli obiettivi sono stati raggiunti.
	La valutazione può essere usata per dimostrare che un particolare progetto soddisfa i requisiti human-centred, oppure per verificare la conformità a standard internazionali, nazionali, locali, aziendali o legali. Per ottenere risultati validi, la valutazione dovrebbe utilizzare metodi appropriati, con un campione rappresentativo di utenti che eseguono compiti realistici.
- Validazione sul campo
	Lo scopo delle validazione sul campo è provare il funzionamento del sistema finale durante l'uso effettivo, per assicurare che esso soddisfi i requisiti degli utenti, dei compiti e dell'ambiente. Per fare ciò si possono analizzare dati raccolti dall'help desk, rapporti dal campo, feedback da utenti reali, dati prestazionali, rapporti sull'impatto sulla salute, richieste di miglioramenti e modifiche da parte di utenti.
- Monitoraggio di lungo termine
	Dovrebbe esiste un processo per il monitoraggio di lungo termine dell'uso del prodotto o del sistema, che consiste nel raccogliere input dagli utenti, con modalità differenti, lungo un certo periodo di tempo.
- Documentazione dei risultati
	Allo scopo di gestire il processo di progettazione iterativo, i risultati delle valutazioni dovrebbero essere registrati in modo sistematico. Dovrebbe esistere un'adeguata evidenza che un numero adeguato di utenti abbia partecipato al test e che questi utenti siano rappresentativi delle categorie identificate nei requisiti, che i test siano adeguati a fornire indicazioni attendibili e, infine, che siano stati usati metodi appropriati per il test le la raccolta dei dati.
== UCD Sprint
L'HCD è spesso anche chiamato "User Centred Design (UCD)". Lo UCD Sprint è un processo *passo-dopo-passo* progettato per favorire la generazione costruttiva di idee all'interno del team software. Presenta una struttura chiara con passaggi definiti per ogni parte del processo di progettazione. La metodologia è accessibile a team meno esperti, rendendola adatta alla formazione nel design. Il processo UCD Sprint è stato sviluppato attraverso corsi intensivi di interaction design da ricercatori leader nell'interazione uomo-computer. Per i professionisti che hanno familiarità con i metodi di user-centred desigm, il processo può essere applicato più rapidamente. \
Lo User-Centred Design Sprint è suddiviso in 3 parti. Ogni parte è divisa in processi distinti, pensati per guidare i partecipanti attraverso:
- Un'analisi degli utenti.
- Una sessione di brainstoring e schizzi.
- Un prototipo finale, testing e analisi dei risultati. \
Lo UCD Sprint è un'istanz del modello HCD dell'ISO 9241:210. Come tale, ne ha tutte le caratteristiche. In particolare, l'UCD Sprint è un processo ciclico, e i progettisti possono ripetere le varie fasi liberamente in base alle necessità di progetto.
#figure(
image("images/ucd_sprint.png", width: 70%),
caption: [Fasi dell'UCD Sprint]
)
=== Design Thinking
Il Design Thinkign è un'*ideologia supportata da un processo correlato*. Una definizione completa richiede la comprensione di entrambi.
#definizione(title: "Design thinking")[
L'ideologia del _design thinking_ afferma che un approccio pratico e incentrato sull'utente alla risoluzione dei problemi può portare all'innovazione e l'innovazione può portare alla differenziazione e a un vantaggio competitivo. Questo approccio pratico e incentrato sull'utente è definito dal processo del design thinking e comprende 6 fasi distinte, come definito e illustrato di seguito.
#figure(
	image("images/design_thinking.png", width: 70%),
	caption: [Fasi del design thinking]
)
]
Il Design Thinking è incentrato sull'utente che parte dai dati dell'utente:
- crea artefatti di design che rispondono a esigenze utente reali e non immaginarie
- testa tali artefatti con utenti reali.
Questo processo sfrutta l'esperienza collettiva e stabilisce un linguaggio comune, oltre a un consenso all'interno del team. Incoraggia l'innovazione esplorando molteplici soluzioni per lo stesso problema. Jakob Nielsen afferma che "un'interfaccia meravigliosa che risolve il problema sbagliato fallirà". \
Anaizziamo nel dettaglio le fasi del Design Thinking:
+ *Empatizzare*. In questa fase si conducono ricerche al fine di sviluppare la conoscenza su ciò che i tuoi utenti fanno, dicono, pensano e provano.
+ *Definire*. Combinare tutte le ricerche e osservare dove esistono i problemi dei tuoi utenti. Mentre identifichi le esigenze dei tuoi utenti, inizia a evidenziare le opportunità di innovazione.
+ *Ideare*. Fare brainstorming su una serie di idee folli e creative che rispondano alle esigenze degli utenti insoddisfatte identificate nella fase di definizione.
+ *Prototipare*. Costruire rappresentazioni reali e tangibili per un sottoinsieme delle tue idee. L'obiettivi di questa fase è capire quali componenti delle tue idee funzionano, e quali no.
+ *Testare*. Tornare dai tuoi utenti per ricevere feedback. Bisogna chiedersi se tale soluzione soddisfa le esigenze degli utenti.
+ *Implementare*. Mettere in pratica la visione. Assicurarsi che la soluzione sia materializzata e influenzi la vita dei tuoi utenti finali.
Il Design Thinking è un processo iterativo, come mostrato nella seguente figura.
#figure(
image("images/design_thinking_iterativo.png", width: 70%),
caption: [Iteratività del design thinking]
)
UCD Sprint e Design Thinking sembrano simili proprio perchè sono istanze dello stesso modello HCD. Quindi condividono molti aspetti. La scelta di un processo piuttosto che un altro è spesso legato alle esigenze dei progettisti e alle esigenze dei gruppi di lavoro.
= Raccolta dei dati
== Requisiti di prodotto
Tutti i processi di progettazione bene organizzati dovrebbero iniziare con la stesura di un documento di requisiti. \
Un _requisito_ è una proprietà richiesta, oppure auspicabile del prodotto. Il documento dei requisiti ha allora lo scopo di accogliere in forma organica una descrizione di tutte le proprietà desiderate. Dalla sua formulazione dovrebbe essere chiaro se un requisito esprime una proprietà obbligatoria, oppure soltano suggerita o auspicabile.
#esempio(title: "Sito web")[
Un sito web di commercio elettronico potrebbe avere i seguenti requisiti.
- Il sito *deve* permettere all'utente di inserire nel carrello d'acquisto i prodotti di cui sta valutando l'acquisto. Il carrello *deve* poter contenere almeno 15 prodotti Contemporaneamente.
- Ogni scheda prodotto contenuta nel catalogo *deve* contenere una fotografia a color del prodotto, il suo nome, il nome del produttore, il prezzo e una descrizione sintetica ma completa.
- L'intero processo di acquisto di un prodotto dovrebbe richiedere al massimo 5 minuti.
]
L'uso del vero _dovrebbe_ segnala chiaramente che il requisito è auspicabile, ma non obbligatorio. I requisiti possono essere di vario tipo. Alcuni, detti _requisiti funzionali_, descrivono le funzioni che il sistema deve realizzare. Altri, detti _requisiti non funzionali_, descrivono proprietà che il prodotto dovrà possedere. Lo standard ISO 13407 suggerisce che, per identificare i requisiti rilevanti, in un processo di progettazione human-centred, si considerino i seguenti aspetti:
- le prestazioni richieste al nuovo sistema in relazione agli obiettivi operativi ed economico/finanziari;
- i requisiti normativi o legislativi rilevanti, compresi quelli relativi alla sicurezza e alla salute;
- la comunicazione e la cooperazione fra gli utenti e gli altri attori rilevanti;
- le attività degli utenti, inclusa la ripartizione dei compiti, il loro benessere e le loro motivazioni;
- le prestazioni dei diversi compiti;
- la progettazione dei flussi di lavoro e dell'organizzazione;
- la gestione del cambiamento indotto dal nuovo sistema, incluse le attività di addestramento e il personale coinvolto;
- la fattibilità delle diverse operazioni, comprese quelle di manutenzione;
- la progettaione dei posti di lavoor e la interfaccia uomo-computer.
I requisiti vengono prodotti da persone che lavorano in stretto contatto con il committente per individuarne i bisogni in relazione al sistema da realzizare. \
È importante non confondere l'attività di stesura dei requisiti con l'attività di progettazione. Quando specifichiamo i requisiti di un prodotto, non stiamo progettando, ma siamo ponendo dei vincoli all'attività di progettazione. Lo scopo del documento è di indicare che cosa deve essere realizzato e perchè, non come deve essere realizzato.
== Il processo di definizione dei requisiti
La fase di definizione dei requisiti può essere suddivisa in tre attività fondamentali, che possiamo chiamare _esplorazione, organizzazione_ e _revisione_.
#figure(
image("images/definizione_requisiti.png", width: 70%),
caption: [Il processo di definizione dei requisiti]
) <fig:def_req>
Nell'_esplorazione_, le persone incaricate di produrre il documento dei requisiti raccolgono il maggior numero possibile d'informazione sugli obiettivi e sulle necessità riguardo al sistema da costruire. Viene utilizzato il termine _esplorazione_ per segnalare che spesso questi obiettivi e necessità sono noti allo stesse committente in forma piuttosto vaga.  \
Come indicato nella *@fig:def_req*, le informazioni vengono raccolte da fonti diverse. In primo luogo, dal committente, cioè colui che ha avviato il progetto e che ne costituisce il riferimento principale. In secondo luogo, dalle interviste con gli _stakeholder_ del prodotto, cioè tutti coloro che, hanno qualche interesse nel prodotto, o la cui attività sarà influenzata, direttamente o indirettamente, da esso. Infine, dall'analisi della concorrenza, cioè di quei prodotti con i quali il prodotto in costruzione dovrà confrontarsi e competere. \
Durante quest'attività, vengono raccolti appunti e materiale informativo vario, che dovranno successivamente essere riesaminati, selezionato e organizzati. Questo è lo scopo dell'attività di _organizzazione_. L'obiettivo di questa fase è costruire un _documento di specifica dei requisiti_, condiviso e approvato dal committente. Questo sarà il riferimento principale per tutte le attività successive del progetto. Lo scopo di questo documento è di descrivere, nella forma più completa possibile, le richieste del committente e i vincoli che dovranno essere rispettati nelle fasi successive del progetto. Si analizza il materiale raccolto durante la fase di esplorazione e si produce una prima bozza del documento dei requisiti. \
Nella fase di _revisione e approvazione_, la bozza del documento dei requisiti così prodotta verrà poi presentata al commitente per la sua approvazione. Di solito, sarà necessario effettuare diversi aggiustamenti e revisioni del documento, prima che questo possa essere considerato sufficientemente consolidato e stabilire per procedere alla successiva fase di progettazione. In un processo iterativo, il documento dei requisiti non potrà mai considerarsi finale: in ogni momento successivo alcuni aspetti potranno essere rivisti e modificati, sulla base delle nuove informazioni acquisite in corso di progetto.
=== La fase di esplorazione
La fase di esplorazione, nella quale vengono raccolti i requisiti, presenta spesso notevoli difficoltà. I problemi sono sostanzialmente di tre tipi.
- _Problemi di ambito_. Generalmente, i "contorni" del sistema da progettare non sono ben definiti, ed esiste sempre il rischio di ampliare eccessivamente il campo di esplorazione. D'altro canto, restringendo troppo i temi da approfondire si rischia di tralasciare aspetti che potrebbero rivelarsi importanti nelle fasi successive. Inoltre, nelle consersazioni con gli stakeholder si è spesso tentati di abbozzare delle soluzioni di progetto. Questo è sbagliato perchè in questa fase ci si deve limitare alla sola raccolta dei requisiti.
- _Problemi di comprensione_. Questi avvengono a vari livelli. Da un lato, gli utenti hanno spessom una comprensione solo parziale dei loro bisogni, e una conoscenza piuttosto limitata delle possibilità offerte dalla tecnlogia. Dall'altro, chi raccoglie i requisiti ha spesso una conoscenza limitata del dominio del problema, e utilizza un linguaggio differente da quello degli utenti e degli altri stakeholder. Ogni interlocutore tende a tralasciare gli aspetti che per lui sono ovvi, ma che potrebbero non esserlo per interlocutori differenti.
- _Problemi di conflitto_. Stakeholder diversi possono avere punti di vista diversi sul sistema che dovrà essere progettato. Questi punti di vista potrebbero essere fra loro incompatibili: questi conflitti dovranno essere fatti emergere con chiarezza, e in qualche modo risolti nel documento dei requisiti finale.
- _Problemi di volatilità_. I requisiti evolvono nel tempo. Infatti, il contesto del sistema può mutare anche molto rapidamente e in modo inaspettato. Questi cambiamenti possono riguardare le condizioni di mercato, ricambio del management o ristrutturazioni dell'organizzazione committente, acquisizioni o vendite societarie, evoluzioni della tecnlogie, e così via. Tutto ciò può modificare le priorità dei diversi requisiti, o addirittura modificarli completamente nel corso del progetto.
Le teniche che possono essere utilizzate, nelle fase di esplorazione, per la raccolta dei requisiti sono descritte brevemente nei paragrafi successivi.
==== Interviste individuali
La tecnica normalmente più usata è quella delle _interivste individuali_ con il committente e i principali stakeholder del prodotto, perchè permette di analizzare i singoli problemi in profondità. Gli interivstaroi formulano le loro domande in colloqui individuali con ciascuno stakeholder, e raccolgono risposte, annotando esigenze, suggerimenti, desideri e lamentele. Per ottenere la massima sincerità, di solito si garantisce agli intervistati che le loro opinioni verranno riportate solo in forma anonima. \
La scelta di chi intervistare va fatta con cura. Occorre prevedere un numero di interviste compatibile con le risorse e il tempo disponibili, ma senza tralasciare nessuna persona che possa avere qualcosa d'importante da dire sul prodotto in progettazione. Poichè il committente è il referente principale del progetto, le sue indicazioni dovranno avere la massima attenzione. Sarà lui che stabilirà gli obiettivi principali, i tempi di realizzazione e il budget. Sarà lui che indicherà le persone da intervistare e sarà lui che revisionerà e approverà il documento dei requisiti finale. In caso di conflitto fra proposte alternative, sarà lui a decidere quale dovrà essere preferita. \
Le interviste individuali possono essere più o meno strutturate. Le _interivste non strutturate_ sono di carattere esplorativo, e assomigliano a delle conversazioni su argomenti d'interesse. Le _interviste strutturate_ prevedono, invece, un insieme di domande predefinite, come avviene nei questionari. A differenza dei questionari, esse sono comunque realizzate da un interivistatore, in colloqui individuali con gli intervistati. Le interviste strutturate sono utili quando gli obiettivi del colloquio siano stati bene identificati, e sia possibile definire un insieme di domande molto specifiche, che richiedono risposte specifiche. Le _interviste semi-strutturate_ contengono sia domande libere, con carattere esplorativo, sia domande specifiche. \
Durante un'intervista occorre evitare di influenzare l'interiistato, formulando le domande in modo che non contengano implicitamente la risposta. È necessario concentrarsi sui problemi e non sulle soluzioni. L'intervistatore dovrà evitare di usare termini tecnici, cercando di parlare nel linguaggio dell'intervistato. Può essere conveniente approfittare delle interviste per definire un sintetico _glossario_, cioè una lista di termini più importanti utilizzati nel progetto, con le loro definizioni in relazione allo specifico contesto.
==== Questionari
I _questionari_ permettono di raccogliere informazinoi in forma strutturata, elaborabili con metodi statistici. Essi possono essere distribuiti ai destinatari in vari modi. Per esempio, si possono predisporre di questionari compilabili online. È così possibile raggiungere una popolazione potenzialmente molto ampia di utenti, anche se, di solito, il tasso di risposta è piuttosto basso. Esistono numerosi strumenti software, che permettono, da un lato, di costruire facilmente il questionario e, dall'altro, di elaborare i risultati e produrre una visione di sintesi attraverso grafici e diagrammi. \
Una tecnica molto usata nei questionari destinati a raccogliere le opinioni degli utenti è la scala di Likert. Il questionario è composto da una serie di affermazioni. collegati alle opinioni su cui si vuole indagare, per ciascuna delle quali sono possibili cinque risposte: _completamente d'accordo, d'accordo, incerto, in disaccordo, in completo disaccordo_. A ciscuno è associato un numero compreso tra 1 e 5. Con questi valori si può calcolare la media delle risposte a ciascun gruppo di affermazioni correlate a uno stesso argomento.
==== Focus group
I _focus group_ sono interiviste di gruppo, che hanno lo scopo di mettere a fuoco uno specifico argomento e di far emergere i diversi punti di vista dei partecipanti o, a volte, un punto di vista condiviso fra tutti. Sono normalmente condotti da un animatore che guida la discussione e un osservatore che esamina le dinamiche di relazione del gruppo e prende appunti. La conduzione di un focus group non è compito banale e richiede esperienza. È necessario evitare che il gruppo "sfugga di mano". Quando emergerà il leader naturale, tenderà a monopolizzare la discussione e a trascinare il gruppo sulle sue posizioni. Il conduttore dovrà evitare che l'incontro diventi un'occasione di sfogo di critiche poco attinenti al tema. Occorre fare in modo che tutti possano esprimere le loro idee e che non sorgano conflitti fra conduttori e membri del gruppo, che potrebbero danneggiare lo svolgimento del successivo progetto.
==== Osservazioni sul campo
Non sempre gli utenti sono in graado di spiegare quali sono le modalità di uso desiderate per il prodotto nella loro attività quotidiana. Potrebbero anche avere un'immagine distorta di come si comportano nelle varie situazioni d'uso reali. Questo è normale perchè un utente non è interessato a conoscere la natura e la frequenza dei compiti che svole quotidianamente, li svolge e basta. Uno studio sul campo per apprendere come gli utenti si comportano nella realtà può essere molto istruttivo e riservare alcune sorprese. Questo può essere molto costoso, considerando anche la possibile varietà delle diverse tipologie di utenti.
==== Suggerimenti spontanei degli utenti
Queste informazioni sono preziose per una corretta evoluzione del prodotto e dovrebbero sempre essere sistematicamente raccolte e classificate. Una fonta molto importante d'informazioni di questo tipo è costituita dai _form_ di discussione relativi ai vari prodotti. È possibile, inoltre, attivare un sito sul quale gli utenti segnalano spontaneamente miglioramenti desiderabili e votano i suggerimenti proposti.
==== Analisi della concorrenza e delle best practice
Un'altra attività importante nella fase di esplorazione dei requisiti è l'analisi dei prodotti concorrenti, cioè di quei prodotti con i quali il nostro prodotto dovrà confrontarsi e competere. L'analisi della concorrenza potrà essere più o meno ampia, in funzione del numero e della complessità dei prodotti esaminati e del livello di approfondimento dell'esame. Per certi settori, può essere complessa e costosa. Si dovrà esaminare un certo numero di prodotti, per indivuare le caratteristiche più importanti, i punti di forza e debolezza e ciò permetterà di contraddistinguere il prodotto in costruzione in rapporto ad essi e definire, la sua _value proposition_, cioè il valore specifico e distintivo che dovrà fornire ai suoi utenti. Inoltre, quest'analisi permetterà di individuare le _pratiche migliori_ adottate dai prodotti del settore, dalle quali trarre spunti per la formulazione dei requisiti. È utile effettuare quest'analisi all'inizio del progetto.
==== Scenari d'uso
Una tecnica molto utile per aiutarci a immaginare un nuovo prodotto, e a individuarne correttamente i requisiti, è quella d'ipotizzarne dei possibili _scenari d'uso_.  Uno scenario d'uso è una narrazione, in linguaggio comune, di una possibile storia dell'uso del sistema da parte di uno specifico utente, fittizio ma in qualche modo tipico, e descritto in modo molto realistico.
#esempio[
Segue un esempio di uno scenario d'uso.
#align(center + horizon)[
  #block(width: 85%)[
    #emph[
      "Marco è uno studente universitario. È appassionato di cinema, anche se le sue possibilità economiche sono molto limitate. Sceglie i film da vedere con molta cura e preferisce vederli dalle prime file. Però gli capita spesso che il posto gli sia assegnato d'autorità dal computer della biglietteria, senza possibilità di scelta. Questo succede anche nel multisala vicino a casa sua. Per questo motivo, quando ha saputo che il cinema ha un nuovo sito Internet che permette, agli utenti registrati, di scegliere personalmente il posto, si è subito registrato. Ora, quando vuole andare al cinema, Marco si collega al sito e procede velocemente con l'operazione di prenotazione che è accessibile direttamente dalla home page. Inserisce nome utente e password e il sistema autorizza l'operazione fornendo come risposta le diverse opzioni di scelta. Marco ora può scegliere tra i titoli dei film in programmazione, il giorno della settimana e l'ora. A questo punto gli viene presentata la mappa della sala cinematografica, nella quale sono indicati i posti liberi (in verde) e quelli già prenotati (in rosso). Marco finalmente può scegliere il posto che preferisce facendo clic sulla figura e, dopo averlo confermato, avrà un resoconto dell'operazione, che gli sarà anche inviato con un messaggio di posta elettronica. La sera, almeno 15 minuti prima dell'inizio della proiezione, Marco si presenta alle casse del multisala con un documento d'identità. La cassiera procede a stampare i biglietti prenotati, che Marco paga. A questo punto Marco potrà accomodarsi nella sala cinematografica e vedere la proiezione del film direttamente dalla poltrona prescelta."
    ]
  ]
]
] <es:scenario_uso>
L'impiego degli scenari d'uso è molto utile nella progettazione di un prodotto. Durante la definizione dei requisiti, serve principalmente come mezzo di comunicazione con i diversi stakeholder e, in seguito, con i progettisti e gli sviluppatori. L'ideazione di storie d'uso tipiche e concrete è, infatti, un modo molto efficare per collocare il prodotto, ancora da progettare, nei suoi possibili contesti d'uso reali. Ognuno di noi tende ad assumere dei sistemi di riferimento che considera ovvi e quindi non ritiene necessario esplicitare. Poichè i sistemi di riferimento dei nostri interlocutori non sono necessariamente identici ai nostri, è facile che nascano fraintendimenti che nella fase di progettazione possono essere dannosi. \
Inoltre, quando progettiamo un prodotto, siamo portati inevitabilmente a considerare noi stessi come utenti tipici: tendiamo quindi a modellare il prodotto sui nostri bisogni, abitudini e preferenze. Questo è sbagliato, perchè gli utenti veri del prodotto avranno bisogni, abitudini e preferenze diverse. È molto importante che i protagonisti di uno scenario siano persone concrete che rappresentano in qualche modo gli "utenti archetipi" del sistema. A questi utenti archetipi si da il nome di _personae_. Una persona non dovrebbe essere inventata, ma creata a partire da una ricerca etnografica, come sintesi di varie caratteristiche presenti negli utenti reali, e descritta in un profilo che ne elenca obiettivi, competenze, comportamenti, preferenze, ambiente sociale, stile di vita. \
È opportuno che, nella formulazione di uno scenario d'uso, sia riportata una storia completa, che non si limiti quindi, alla pura interazione con il sistema, ma che ne consideri il contesto complessivo. In questo modo è facile che emergano requisiti impliciti, che potrebbero altrimenti essere trascurati. Considerando l'*@es:scenario_uso*, la storia di Marco ce ne descrive la motivazione principale (la possibilità di scegliere il posto al cinema) e ci mostra le azioni compiute da Marco dopo aver completato la transazione al computer.  \
Naturalmente, la storia deve mettere in scena situazioni tipiche. Durante le interviste, si potrà chiedere agli intervistati d'immaginare gli scenari d'uso che ritengono più tipici. Dall'approfondimento di questi scenari potranno emergere requisiti che altrimenti sarebbero trascurati. \
Gli scenari d'uso possono essere molto utili, ma scegliere quelli realmente significativi da inserire nel documento dei requisiti non è facile. Il rischio maggiore è quello di scadere nell'aneddotica, raccontando storie poco rilevanti per la compresione dei requisiti del prodotto, che quindi non siano di alcuna utilità nelle successive fasi di progettazione. \
Nel caso di prodotti di nuova concezione, destinati a innovare i comportamenti degli utenti, si realizzano a volte desgli scenari d'uso con delle riprese video.
== I casi d'uso
La descrizione dei casi d'uso del sistema costituisce un capitolo molto importante del documento di specifica dei requisiti. Un caso d'uso può essere definito come un insieme di interazioni finalizzate a uno scopo utile, fra uno o più attori e il sistema. Esso ha un nome che, di solito è composto da un verbo, alla terza persona singolare o all'infinito, e ad un complemento, oppure da una frase che descrive sintaticamente lo scopo dell'interazione. Per esempio, in un sito web di e-commerce:
- Acquita prodotto
- Modifica il profilo utente
- Ricercare un prodotto nel catalogo
- Inserire un nuovo prodotto in catalogo
- Modificare i dati di un prodotto.
Un caso d'uso viene invocato da un attore per un particolare scopo e si conlude con successo quando tale scopo è raggiunto. Ogni attore non è una persona concreta, ma rappresenta un particolare ruolo nell'interazione con il sistema. Per esempio, nel sistema di e-commerce, potremmo avere tre attori, denominati `Utente, Utente Registrato, Amministratore del Sistema`. Ciascuno di questi attori invocherà casi d'uso specifici per il suo ruolo. Per esempio, l'`Amministratore del sistema` potrà inserire un nuovo prodotto nel catalogo, mentre l'`Utente` potrà soltanto ricercare un prodotto nel catalogo, senza poterne modificare la descrizione. Se un caso d'uso coinvolge più attori, quello che persegue lo scopo che il caso d'uso deve soddisfare sarà considerato l'_attore principale_. Solitamente, esso è quello che da inizio al caso d'uso con la sua invocazione. \
Nella seguente tabella sono riassunte le principali tecniche di definizione dei requisiti.
#figure(
image("images/tecniche_req.png", width: 70%),
caption: [Le principali tecniche utilizzate nella fase di esplorazione dei requisiti]
)
=== Diagramma dei casi d'uso
Nel documento dei requisiti, è consigliabile aggiungere all'elenco dei casi d'uso un diagramma riassuntivo, detto _diagramma dei casi_ d'uso, che mostra le relazioni fra gli attori e i casi d'uso del sistema. Un esempio di diagramma dei casi d'uso è rappresentato nella seguente figura:
#figure(
image("images/diagramma_caso_uso.png", width: 70%),
caption: [Un diagramma dei casi d'uso]
) <fig:diagramma_uso>
In questi diagrammi, gli attori sono rappresentati con omini stilizzati e i casi d'uso con ellissi. Il nome dell'attore viene indicato sotto l'omino e quello del caso d'uso dentro l'ellissi, come mostrato nella *@fig:diagramma_uso*.\
Gli attori coinvolti in un caso d'uso non devono necessariamente essere umani: possono anche essere dei sistemi con i quali il caso d'uso interagisce, per inviare o ricevere dati, o per richiedere dei servizi. Anche gli attori non umani sono tradizionalmente rappresentati con degli omini stilizzati: per indicare che non si tratta di persone in carne e ossa, nel diagramma dei casi d'uso viene allora convenzionalmente riportata, sotto il nome dell'attore, la dicitura convezionale "sistema". \
L'associazione fra un attore e un caso d'uso è rappresentata da un segmento che li congiunge e può indicare una situazione fra le seguenti:
- l'attore esegue il caso d'uso;
- l'attore fornisce informazioni al caso d'uso;
- l'attore riceve informazioni dal caso d'uso.
A volte, al posto dei segmenti, si utilizzano delle frecce per indicare che l'attore esegue il caso d'uso. Tutto ciò è mostrato nella *@fig:diagramma_uso*. \
La direzione della freccia non specifica la direzione del flusso dei dati. Per evitare possibili fraintendimenti, si consiglia di limitare l'uso delle recce ai soli casi in cui possano sussistere delle ambiguità su chi invoca che cosa. Nel diagramma di *@fig:diagramma_uso*, poichè il caso d'uso `Acquista Prodotto` è associato a due attori, è stata usata la notazione a freccia per indicare che è l'utente umano, e non il sistema, che lo invoca. Negli altri casi, non sussistendo ambiguità, sono stati usati dei segmenti non orientati. \
Un diagramma che rappresenta tutti i casi d'uso si chiama _diagramma di contesto_ del sistema, perchè indica i confini dello setsso e tutti gli attori che lo utilizzto. In questo caso, il sistema si indica con un riquadro che circonda i casi d'uso e ne riporta il nome., come è mostrato nella *@fig:diagramma_uso*.
=== Descrizione dei casi d'uso
Nel documento dei requisiti, a ogni caso d'uso mostrato nel diagramma dovrebbe essere associata una descrizione, per far comprendere al lettore di che cosa si tratta. Essa dovrebbe essere espressa in un linguaggio semplice e informale, comprensibile a chiunque. Infatti, il documento dei requisiti non viene utilizzato solo dai progettisti del sistema, ma anche dagli stakeholder che contribuiscono alla loro stesura. Questi, nella maggior parte dei casi, non hanno le competenze tecniche necessarie per leggere delle descrizioni in linguaggi troppo formalizzati. Si usa quindi il linguaggio naturale, avendo l'accorgimento di utilizzarlo nel modo meno ambiguo possibile. \
Si è consolidata la prassi di descrivere un caso d'uso specificandone i diversi scenari d'uso. Questi scenari non fanno riferimento a utenti concreti, con nome e cognome, che operano in specifici contesti, ma agli attori identificati nel diagramma dei casi d'uso, in situazioni generiche, senza riferimento ad alcun contesto specifico. Si tratta di scenari d'uso astratti e ridotti ai minimi termini, che servono esclusivamente a chiarire il significato che il redattore del documento dei requisiti attribuisce ai vari casi d'uso. Alcuni di questi scenari permettono di raggiungere lo scopo, altri portano alla conclusione del caso d'uso senza che lo scopo sia ragiunto. \
La forma più comune della descrizione di un caso d'uso è esemplificato nella seguente figura, che fa riferimento al solito `Acquista prodotto` del sito web e-commerce. Viene descritto prima lo _scenario principale di successo_, detto anche _corso d'aziona base_, cioè quello che è ritenuto più frequente o importante, e che si conclude con il successo del caso d'uso: l'utente raggiunge il suo scopo. Esso descrive il flusso principale degli eventi d'interazione, espresso come sequenza di _passi_ numerati, ciascuno dei quali corrisponde a un'interazione fra uno o più attori e il sistema.
#figure(
image("images/descrizione_caso_uso.png", width: 70%),
caption: [Descrizione del caso d'uso `Acquista Prodotto`]
)
Seguono poi altri scenari, detti _scenari alternativi_. Essi sono descritti come _estensione_ di quello principale, cioè specificando solo le differenze con esso, senza ripetere tutto, per non appesantire troppo la descrizione. \
Per indicare un'estensione si scrive la _condizione_ che determina il verificarsi di una sequenza d'interazioni alternativa rispetto a quello dello scenario principale, specificandone poi le differenze. Prima di tutto si scrive il numero del passo in cui si può verificare la condizione, con una breve specifica della stessa; quindi si aggiungono dei passi numerati espressi nello stesso stile dello scenario principale. Alla fine si indica da quale passo si rientra nel flusso di eventi base. \
Ognu passo di uno scenario dovrebbe essere espresso con una frase semplice, che faccia capire chi lo sta eseguendo. Non si dovrebbero mai indicare i dettagli delle azioni di un attore. Inoltre, non si dovrebbero mai descrivere i particolari dell'interaccia utente: bisogna sempre ricordare che si stanno specificando i requisiti di un sistema. Il sistema viene visto come una "scatola nera" e il suo funzionamento interno non viene considerato. In sostanza, un caso d'uso specifica _chi_, _che cosa_ e _perchè_, senza entrare nel merito del funzionamento interno del sistema. \
Se un caso d'uso ne richiama un altro, il nome di quest'ultimo viene sottolineato, per suggerire un collegamento ipertestuale. \
L'inclusione puo essere utile per esprimere con un singolo passo una sequenza di passi più elementari, che renderebbe pesante la descrizione dello scenario, oppure, pù spesso, per raccogliere a fattor comune una sequenza di passi che si ripetono più volte nello stesso o in diversi casi d'uso. \
Nella descrizione dei casi d'uso non è mai consigliabile scendere a un livello di dettaglio troppo basso. Nel documento dei requisiti è conveniente mantenersi a un livello piuttosto generale. Ciò che interessa è dare al lettore un'immagine abbastanza chiara dei diversi casi d'uso, che permetta di comprendere con ragionevole precisione e senza ambiguità ciò che il sistema deve fare. Le descrizioni troppo lunghe e dettagliate finicsono per non essere neppure lette, il che le renderebbe poco utili. Nella fase di progettazione i casi d'uso verranno decomposti nei compiti che lo compongono, e questi nelle azioni elementari che l'utente dovrà effettuare. \
Gli scenari d'uso sono diversi dai casi d'uso. Gli scenari d'uso hanno lo scopo di illustrare situazioni tipiche di uso del sistema, per farne comprendere la portata e gli e fare emergere eventuali requisiti impliciti. La descrizione dei casi d'uso costituisce un passo successivo alla creazione degli scenari d'uso. In questo passo, s'identificano tutte le interazioni che, a un certo livello di astrazione e dal punto di vista dei vari attori coinvolti, dovranno avere luogo con il sistema, e li si descrive cercando di tener conto delle principali alternative. La descrizione di un caso d'uso non fa riferimento a personaggi concreti, ma a ruoli astratti incarnati dai vari ttori, e contiene solo informazioni sull'interazione che questi hanno con il sistema, senza alcuna informazione aggiuntiva sul contesto. Serono per fissare gli aspetti principali del flusso dell'interazione con il sistema, che dovranno poi essere ulteriormente sviluppati nella fase di progettazione.
=== Generalizzazione, inclusione, estensione di casi d'uso
Durante l'organizzazione del documento dei requisiti, per effettuare la descrizione dei casi d'uso del sistema conviene partire dalla formulazione di un primo elenco che verrà modificato per raggiungere un livello di dettaglio soddisfacente. Se i casi d'uso sono troppo dettagliati, si passa a un livello di astrazione maggiore; se sono troppo generali, li si decompone ulteriormente. Il criterio è quello di ottenere una descrizione sufficientemente dettagliata da essere utile per far capire di che cosa si parla, ma non così dettagliata da scoraggiarne la lettura. Alcuni casi d'uso possono rivelarsi casi particolari di altri casi d'uso. La generalizzazione può essere rappresentata graficamente nel diagramma mediante una freccia con la punta a triangolo, come raprpesentano nella seguente figura.
#figure(
image("images/generalizzazione.png", width: 70%),
caption: [Generalizzazione fra attori e casi d'uso]
)
La stessa notazione viene usata per rappresentare la relazione di generalizzazione fra attori. \
Quando un caso d'uso ne utilizza un altro, si dice che lo _include_. Se un caso d'uso è incluso più volte, conviene dargli un nome e descriverlo separatamente. L'inclusione viene rappresentata graficamente con una freccia tratteggiata dal caso d'uso includente al caso d'uso incluso, con l'etichetta `<<include>>`.
#figure(
image("images/inclusione.png", width: 70%),
caption: [Rappresentazione grafica dell'inclusione fra casi d'uso]
)
Si dice che un caso d'uso _estende_ un altro caso d'uso quando il suo comportamento *può* essere richiamato all'interno del primo. L'estensione viene rappresentata come segue.
#figure(
image("images/estensione.png", width: 70%),
caption: [Estensione dei casi d'uso]
)
== Il documento dei requisiti
Il documento dei requisiti dovrebbe contenere, prima di ogni requisito specifico relativo al sistema da realizzare, un'approfondita analisi dell'utente e delle sue necessità. In particolare dovrebbe coprire i seguenti temi:
- _Analisi degli utenti_: a quali categorie di utenti è destinato il prodotto, le loro caratteristiche e quali categorie vanno considerate prioritariamente.
- _Analisi dei bisogni_: bisogna identificare quali sono le necessità di ciascuna categoria di utentei e quali sono prioritari.
- _Analisi del contesto d'uso_: bisogna identificare i diversi contesti d'uso del prodotto da parte delle diverse categorie di utenti e quali sono prioritari.
Queste analisi dovrebbero essere corredate dalla descrizione di acluni scenari d'uso tipici. Gli scenari sono particolarmente importanti per i prodotti di nuova concezione, per i quali non esistono esperienze d'uso consolidate. Dopo questa prima parte generale, si dovrebbe inserire il diagramma dei casi d'uso e descrivere ogni singolo caso d'uso. \
Una possibile struttura del documento dei requisiti è presente nella seguente figura.
#figure(
image("images/doc_req.png", width: 70%),
caption: [Una possibile struttura del documento dei requisiti]
)
==== Generalità
- Scopo del prodotto. Descrive la natura del prodotto oggetto del documento di requisiti. Specifica sinteticamente gli obiettivi del prodotto, distinguendo quelli principali da quelli secondari, e stabilendone le priorità.
- Situazione attuale. Specifica se il progetto riguarda un prodotto di nuova realizzazione, o se si tratta di un miglioramento di un prodotto esistente. Nel secondo caso, si elencano i principali punti di forza e di debolezza del prodotto attuale.
- Caratteristiche degli utenti. Specifica a quali categorie di utenti è destinato il prodotto. Descrive il profilo di ciascuna categoria: comptenze, abilità, esperienze, corsi di addestramento, ecc. Specifica gli obiettivi di ciascuna categoria di utenti in rapporto al prodotto e i diversi ruoli rivestiti nei suoi confronti. In questa sezione s'identificano le classi di attori che verranno utilizzate nella successiva descrizione dei casi d'uso.
- Contesti d'uso. Descrive i diversi contesti e ambienti d'uso per le diverse categorie di utenti descritte in precedenza. Questi possono includere eventuali standard adottati, il contesto normativo, le caratteristiche dell'ambiente tecnlogico, l'ambiente organizzativo e le caratteristiche dell'ambiente fisico, se rilevanti.
- Scenari d'uso. Descrive sinteticamente gl scenari d'uso tipici e significativi, che mettano in luce gli aspetti più importanti del prodotto, collocati nel loro contesto.
- Fattibilità tecnlogica. Indica le tecnlogie che dovranno essere utilizzate nella realizzazione del prodotto e che lo rendono fattibile.
==== Posizionamento
- Analisi della concorrenza. Identifica i principali prodotti concorrenti. Per ciascuno, riporta una scheda descrittiva, con la storia, le caratteristiche rilevanti e i principali motivi di successo e d'insuccesso. Include immagini e riferimenti come opportuno. Questa sezione può essere espressa in forma sintetica, allegando eventuale materiale di dettaglio in appendice.
- Posizionamento competitivo. Specifica quali saranno i punti di forza e gli eventuali putni di debolezza del prodotto in rapporto ai prodotti concorrenti.
==== Casi d'uso
- Diagramma dei casi d'uso. Fornisce una visione di sintesi deic asi d'uso del prodotto. Gli attori rappresentati nel diagramma devono corrispondere alle tipologie di utenti descritte nella sezione Generalità.
- Descrizione dei casi d'uso. Descrive ogni caso d'uso in forma verbale, specificando per ciascuno lo scenario principale di successo e gli scenari alternativi.
==== Altri requisiti
- Requisiti per l'esperienza utente. Descrive i requisiti relativi all'interfaccia utente e, più generale, alla _user experience_. Contiene esempi o figure. Specifica come si dovrà valutare, durante il progetto, il soddisfacimento dei requisiti.
- _Requisiti prestazionali_. Esprime i requisiti relativi alle prestazioni del sistema, anche relativamente alla risorse necessarie per il suo utilizzo.
- Altri requisiti. Questa sezione, che può essere estesa o suddivisa in ulteriori sezioni, contiene ogni altro requisito, in funzione della natura del prodotto o servizio in esame.
==== Allegati
- _Glossario_. Definisce gli eventuali termini tecnici o gergali, specifici dell'organizzazione o del prodotto, utilizzati nel documento.
- _Altri allegati_. Come necessario.
- _Riferimento_. Contiene ogni riferimento a pubblicazioni o a materiale di supporto utile per una migliore comprensione del documento.


