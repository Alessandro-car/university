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
== Pianificazione e impostazione della raccolta dati
=== La natura dei dati
I dati possono essere quantitativi o qualitativi. Per esempio, il tempo necessario per trovare un'informazione su una pagina web e il numero dei clic necessari per arrivare a quell'informazione su una pagina web e il numero dei clic necessari per arrivare a quell'informazione sono dati quantitativi, quello che l'utente dice a proposito di una pagina web è un dato qualitativo. Analizziamo alcune tecniche per la raccolta di dati che vengono usate normalmente nelle attività di Interaction Design. In particolare, la raccolta dei dati è una parte centrale nella scoperta dei requisiti e nella valutazione. Nell'attività di scoperta dei requisiti, si raccolgono dati per disporre di dati sufficienti, accurati e pertinenti per procedere nella progettazione. Nella fase di valutazione, si acquisicono le reazioni degli utenti e i dati relativi alle loro prestazioni con un sistema o un prototipo. \
Le tecniche principali per la raccolta dei dati sono le interviste, i questionari e l'osservazione. Nelle interviste, un intervistatore pone a una o più persone un gruppo di domande, che possono essere fortemente strutturate o non strutturate; le interviste di solito sono sincrone e spesso faccia a faccia ma non è strettamente necessario che lo siano. I questionari sono una serie di domande predisposte in modo da consentire una risposta asincrona, cioè senza la presenza del ricercatore. I questionari possono essere somministrati su carta oppure online. L'osservazione può essere diretta o indiretta. L'osservazione diretta comporta trascorrere del tempo con le persone, osservandone l'attività nel loro svolgimento. \
L'osservazione indiretta comporta una registrazione dell'attività dell'utente nel momento in cui si verifica, per poterla studiare in seguito.  \
Esistono differenze importanti fra dai grezzi, informazioni e conclusioni. I dati sono quelli che si raccolgono; poi vengono analizzati e interpretati e se ne traggono conclusioni. Le informazioni si acquisicono dall'analisi e dall'interpretzione dei dati, le conclusioni rappresentano le azioni da intraprendere sulla base di quelle informazioni. \
Per esempio, supponiamo che si conduca uno stidio per stabilire se un layout delle schermate per un centro sportivo locale abbia migliorato o meno l'esperienza degli utenti nella prenotazione di una lezione di nuoto. In questo caso, fra i dati raccolti possono esserci i tempi registrati per il completamento della prenotazione, commenti degli utenti, ecc. Le informazioni sono quelle che emergono quando questi dati grezzi vengono analizzati e si interpretano i risultati. Per esempio, l'analisi può indicare che il nuovo layout fa impiegare più tempo per fare una prenotazione. Una conclusione che si potrebbe trarre è che sia necessario un sistema di prenotazione più efficace.
=== Cinque aspetti fondamentali per preparare lo studio
Bisogna prestare attenzione a cinque aspetti fondamentali per portare a termine con successo qualsiasi sessione di raccolta dati: la definizione degli obiettivi, l'identificazione dei partecipanti, la relazione fra chi raccoglie i dati e chi li fornisce, la triangolazione e gli studi pilota.
==== Definizione degli obiettivi
Il motivo principale per raccogliere dati è acquisire informazioni sugli utenti, il loro comportamento o le loro reazioni alla tecnologia, per esempio per capire come la tecnlogia si inserisce nella vita di una famiglia, quali icone sono più facili da usare, ecc. \
Esistono motivi diversi per raccogliere dati e, prima di iniziare, è importante fissare obiettivi specifici. Questi obiettivi incideranno sulla natura delle sessioni di raccolta dei dati, sulle tecniche di raccolta dei dati da utilizzare sull'analisi da condurre. \
Gli obiettivi possono essere espressi in modo più o meno formale, per esempio con qualche formato strutturato o anche di tipo matematico. Indipendentemente dal formato, la descrizione degli obiettivi deve essere chiara e concisa.
==== Identificazione dei partecipanti
Gli obiettivi formulati per la sessione di raccolta di dati indicheranno anche i tipi di persone da cui devono essere ottenuti i dati. Le persone che corrispondono al profilo costituiscono la  _popolazione dello studio_. In qualche caso le persone da cui raccogliere i dati possono essere chiaramente identificabili, magari perchè si tratta di un piccolo gruppo di utenti ed è facile accedere a ciascuno di essi. È più probabile però che i partecipanti debbano essere scelti, e questa attività prende il nome di _campionamento_. La situazione in cui tutti i membri della popolazione target sono accessibili prende il nome di _campionamento di saturazione_, ma si tratta di una condizione molto rara. Ipotizzando che solo una parte della popolazione sarà coinvolta nella raccolta di dati, esistono due possibilità: il campionamento probabilistico o non probabilistico. Nel primo caso, i metodi di uso più comune sono il campionamento casuale e quello stratificato; nel secondo caso, il campionamento di comodo o i gruppi volontari. \
Il _campionamento casuale_ avviene con l'uso di un generatore di numeri casuali oppure la scelta di una persona ogni _n_ in un elenco. \
Il _campionamento stratificato_ si basa sulla possibilità di dividere la popolazione in gruppi, a cui applicare poi il campionamento casuale. Sia il campionamento di comodo che i gruppi volontari si basano meno sulla scelta dei partecipanti e più sul fatto che i partecipanti siano disposti a collaborare. Si parla di _campionamento di comodo_ quando il campione include le persone disponibili e non quelle selezionate. Un'altra forma di campionamento di comodo è quello _a valanga_, in cui i partecipanti correnti trovano altri partecipanti, che poi ne trovano a loro volta altri e così via. \
La differenza fondamentale fra metodi probabilistici e non è che nei primi si possono applicare test statistici e operare generalizzazioni all'intera popolazione, mentre nei secondi queste generalizzazioni non sono molto robuste. \
In uno studio più sono i partecipanti e meglio è, perchè le interpretazioni dei risultati dei test statistici possono essere formulate con una maggiore fiducia. Esistono modi per stabilire quanti partecipanti siano necessari. Quattro di questi sono la saturazione, l'analisi dei costi e della fattibilità, le linee guida e l'analisi di potenza prospettica. \
Nel caso della saturazione, si raccolgono dati fino a che non emergono nuove informazioni rilevanti. Non è possibile sapere in anticipo con quale numero di partecipanti si raggiunga il punto di saturazione. \
Scegliere il numero dei partecipanti in base a vincoli di costi e fattibilità è un metodo pratico giustificabile; questo tipo di decisione pragmatica è comune per i progetti industriali, ma è raro nella ricerca accademica. \
Le linee guida possono derivare da esperti o da "standard locali", per esempio da una norma accettata nel campo. \
L'analisi di potenza prospettica è un metodo rigoroso utilizzato in statistica che si basa sui dati quantitativi relativi a un argomento; nell'Interaction Desgin spesso questi dati non sono disponibili, il che rende inapplicabile questa impostazione.
==== Relazione con i partecipanti
Un aspetto significativo è la relazione fra chi effettua la raccolta e chi fornisce i dati. Assicurarsi che questa relazione sia chiara e professionale contribuirà a chiarire la natura dello studio. Il risultato può variare, a seconda dei paesi e dei contesti. Negli Stati Uniti e nel Regno Unito, ad esempio, si chiede ai partecipanti di formare un modulo di consenso informato, mentre nei paesi scandinavi il modulo non è richiesto. I dettagli variano, ma di solito il modulo chiede ai partecipanti di confermare che sono stati spiegati loro l'obiettivo della raccolta dei dati e il modo in cui i dati verranno utilizzati, e che è loro intenzione continuare. Di solito spiega che i dati saranno riservati e tenuti in luogo sicuro; spiega anche che i partecipanti possano ritirarsi in qualunque momento e che in tal caso i loro dati non saranno inclusi nello stidio. Chi raccoglie i dati vuole essere sicuro di poter usare nella propria analisi i dati che acquisisce, di poterli presentare alle parti interessate e di poterli pubblicare. Chi fornisce i dati vuole essere rassicurato che le informazioni acquisite non verranno utilizzate per altri fini o in qualche contesto che possa avere effetti negativi, ad esempio che dettagli personli non vengano resi pubblici. Questo vale nel caso in cui vengano intervistati persone con disabilità o minori. Nel caso di minori, il modulo rassicura i genitori che ai loro figli non verranno poste domande minacciose, inappropriate o imbarazzanti. In questi casi, il modulo deve essere firmato dai genitori. \
Questo tipo di consenso non è richiesto, quando si raccolgono dati sui requisiti per una società commerciale, dove di solito esiste già un contratto fra chi raccoglie i dati chi li fornisce. I dipendenti dell'azienda saranno gli utenti del sistema e il consulente si aspetta di avere successo ai dipendenti per raccogliere i dati sull'attività in questione; l'azienda da parte sua si aspetta che i dipendenti cooperino alla raccolta delle informazioni. \
La cosa importante è considerare la situazione e valutare sulla base delle circostanze specifiche e valutare sulla base delle circostenze specifiche. Sempre più spesso i progetti e le organizzazioni che raccolgono dati personali devono dimostrare che saranno protetti da accessi non autorizzati. \
È possibile che sia necessario offrire incentivi per la partecipazione alla raccolta di dati. Per esempio, se per i partecipanti non esiste un vantaggio chiaro, gli incentivi possono indurli a partecipare comunque. In altri casi, è possibile che vedano la partecipazione come un dovere legato al loro lavoro, o, nel caso di studenti, come un requisito per il superamento di un corso.
==== Triangolazione
_Triangolazione_ è il termine che si usa per indicare lo studio di un fenomeno da almeno due prospettive diverse. Sono stati definiti quattro tipi di triangolazione.
- _Triangolazione dei dati_: i dati sono tratti da fonti diverse in momenti diversi, in luoghi diversi o da persone diverse.
- _Triangolazione dei ricercatori_: nella raccolta e nell'interpretazione dei dati sono coinvolti ricercatori diversi.
- _Triangolazione delle teorie_: vengono usati quadri di riferimento teorico differenti nell'esame dei dati o dei risultati.
- _Triangolazione metodologica_: vengono utilizzate tecniche diverse di raccolta dei dati.
L'ultima è la forma più comune di triangolazione: si convalidano i risultati di qualche ricerca evidenziando risultati simili ottenuti da prospettive diverse. Una validazione attraverso una vera triangolazione, però, è difficile Metodi di raccolta diversi danno come risultati tipi di dati diversi, che possono essere compatibili, ma anche non esserlo. L'uso di più di una tecnica di raccolta di dati e di più di un approccio all'analisi dei dati è una buona pratica perchè le diverse impostazioni possono portare nuove idee, anche se non si ottiene una vera triangolazione. \
A volte la triangolazione è stata usata per compensare i limiti di un altro tipo di raccolta dei dati. In questi caso la motivazione è diversa rispetto all'idea originale, che riguardava invece la verifica e l'affidabilità dei dati. Una forma di traingolazione viene usata in studi che coinvolgono grandi quantità di dati, per verificare che i dati raccolti dallo studio originale siano reali e affdidabili: si parla in questo caso di verifica della verità di base.
==== Studi pilota
Uno studio pilota è uno studio iniziale, con un piccolo numero di partecipanti, allo scopo di verificare che il metodo proposto sia percorribile, prima di avviare lo studio vero e proprio. Per esempio, si possono controllare in questo modo apparecchiature e istruzioni, si possono mettere alla prova le domande per un'intervista o di un questionario, per verificare se effettivamente chiare, e si può confermare la bontà di una procedura sperimentale. In questo modo si possono individuare in anticipo potenziali problemi. \
Se è difficile trovare partecipanti o l'accesso ai partecipanti è limitato, chiedere a colleghi o pari di partecipare può essere un'alternativa a uno studio pilota.
=== Metodi di registrazione dei dati
Acquisire i dati è necessario, in modo che i risultati della sessione di raccolta possono essere analizzati e condivisi. Alcune formule di raccolta dei dati, come questionari, registri delle interazioni, diari, ecc., sono auto-documentanti e non è necessaria un'ulteriore registrazione. Per altre tecniche, invece, bisogna scegliere quale metodo di registrazione utilizzare: i più comuni sono appunti scritti, fotografie o registrazioni audio o video. \
Spesso si usano insieme più metodi: ad esempio, un'intervista può essere audioregistrata e, per aiutare l'intervistatore nella successiva analisi, si può scattare una fotografia dell'intervistato per ricordare il contesto della discussione. \
Quali metodi vengano utilizzati dipende dall'obiettivo dello studio e dal modo in cui verranno usati i dati, dal contesto, dal tempo e dalle risorse disponibili e dall'eventuale delicatezza delal situazione; la scelta inciderà sul livello di dettagli che potrà essere raccolto e su quanto intrusivo sarà l'apparato di raccolta.
==== Appunti e fotografie
Prendere appunti è la forma di registrazione dei dati meno tecnica e più flessibile. Gli appunti manoscritti poi possono essere trascritti, totalmente o parzialmente, e di solito è il primo passo dell'analisi e dà a chi la conduce una buona panoramica della qualità e dei contenuti dei dati raccolti. Esistono strumenti a supporto della raccolta e dell'analisi dei dati, ma gli appunti manoscritti hanno alcuni vantaggi: l'uso di carta e penna può essere meno intrusivo dello scrivere a una tastiera ed è più flessibile poichè consente, di disegnare facilmente diagrammi e schizzi della configurazione del lavoro. Inoltre, i ricercatori sostengono che scrivere appunti a mano li aiuta a concentrarsi su quello che è importante e a pensare a quello che i dati dicono loro. Gli svantaggi sono che può essere difficile cogliere i veri punti salienti e può essere stancante scrivere e allo stesso tempo ascoltare o osservare. È facile perdere la concentrazione, la calligrafia può essere difficile da decifrare e la velocità di scruttura è limitata. \
Se è appropriato, fotografie o brevi video di oggetti, eventi e dell'ambiente possono essere di complemento agli appunti e agli schizzi disegnati a mano, purchè si sia ottenuta l'autorizzazione a raccogliere dati con questi metodi.
==== Audio e fotografie
La registrazione audio è un'alternativa utile agli appunti manoscritti ed è meno intrusiva del video. Durante l'osservazione, consente agli osservatori di concentrarsi sull'attività invece di tentare di catturare ogni parola detta. In un'intervista, consente all'interivstatore di prestare più attenzione all'intervistato, senza dover prendere appunti mentre ascolta. Non è sempre necessario trascrivere tutti i dati raccolti. Molto studi non richiedono un livello di grande dettaglio e le registrazioni sono utilizzate soprattutto come promemoria e come fonte di aneddoti da citare. Se la registrazione audio è la principale, o l'unica tecnica di raccolta dei dati, la qualità deve essere buona: la conduzione di interviste da remoto può essere compromessa da connessioni traballanti e una cattiva acustica. A complemento delle registrazioni audio spesso si scattano fotografie.
==== Video
Per acquisire brevi video delle attività si può usare uno smartphone. Esistono però occasioni in cui è necessario registrare un video per lunghi periodi di tempo o quando tenere in mano il telefono è scomodo, ad esempio quando si deve registrare come i designer collaborano in un workshop. Per questi tipi di occasioi, sono più adeguate apparecchiature video professionali in grado di registrare chiaramente dati sia video sia audio. Vengono utilizzati anche altri modo per registrare le espressioni faccilai insieme con i commenti verbaili, come _GoToMeeting_. L'uso di questi sistemi può generare altri problemi di pianificazione, che vanno affrontati per ridurre l'intrusitività della registrazione, verificando che la qualità dei dati sia buona. È bene considerare i seguenti aspetti quando si vuole utilizzare una videocamera.
- _Decidere se usare una videocamera fissa oppure una mobile_. Questo dipende dall'attività che si vuole registrare e dalla finalità dei dati video.
- _Decidere dove puntare la videocamera per cattuarare quello che serve_. Alcuni ricercatori suggeriscono di svolgere lavoro sul campo per un breve periodo di tempo prima di iniziare a videoregistrare, per acquisire familiarità con l'ambiente e identificare le posizioni più adatte per la registrazione. Anche coinvolgere i partecipanti nel decidere cosa e dove registrare può contribuire ad acquisire le azioni più pertinenti.
- _Comprendere l'impatto della registrazione sui partecipanti_. Spesso si dà per scotnato che la registrazione video incida sui partecipanti e sui loro comportamenti. Vale la pena di assumere un atteggiamento empirico in proposito ed esaminare i dati stessi per vedere se vi siano indicazioni di cambiamento nel comportamento, per esempio se i partecipanti tendano a rivolgersi verso la videocamera.
== Tecniche di esplorazione e raccolta dei dati
=== Interviste individuali
La tecnica normalmente più usata è quella delle _interivste individuali_ con il committente e i principali stakeholder del prodotto, perchè permette di analizzare i singoli problemi in profondità. Gli intervistatori formulano le loro domande in colloqui individuali con ciascuno stakeholder, e raccolgono risposte, annotando esigenze, suggerimenti, desideri e lamentele. Per ottenere la massima sincerità, di solito si garantisce agli intervistati che le loro opinioni verranno riportate solo in forma anonima. \
La scelta di chi intervistare va fatta con cura. Occorre prevedere un numero di interviste compatibile con le risorse e il tempo disponibili, ma senza tralasciare nessuna persona che possa avere qualcosa d'importante da dire sul prodotto in progettazione. Poichè il committente è il referente principale del progetto, le sue indicazioni dovranno avere la massima attenzione. Sarà lui che stabilirà gli obiettivi principali, i tempi di realizzazione e il budget. Sarà lui che indicherà le persone da intervistare e sarà lui che revisionerà e approverà il documento dei requisiti finale. In caso di conflitto fra proposte alternative, sarà lui a decidere quale dovrà essere preferita. \
Esistono quattro tipi di interviste: aperte o non strutturate, strutturate, semistrutturate e interviste di gruppo. Il nome dei primi tre tipi indica quanto controllo esercita l'intervistatore sulla conversazione, seguendo o meno un insieme prestabilito di domande; il quarto tipo che di solito va sotto il nome di _focus group_, coinvolge un piccolo gruppo di persone guidato da facilitatore, e anche la facilitazione può essere molto informale o seguire un formato strutturato.
==== Interviste non strutturate
Le _interivste non strutturate_ sono di carattere esplorativo, e assomigliano a delle conversazioni su argomenti d'interesse. \
Le domande poste all'intervistatore sono aperte, nel senso che non ci sono aspettative particolari sul formato o il contenuto delle risposta. Per esempio, la prima domanda che viene posta a tutti i partecipanti potrebbe essere: "Quali sono i pro e i contro dell'avere un dispositivo indossabile?". Qui, l'intervistato è libero di rispondere in modo conciso o esteso, e sia l'intervistatore che l'intervistato possono orientare l'intervista. Per esempio, spesso l'intervistatore può dire: "Può dirmi qualcosa di più a proposito di $dots$". Questa forma di sollecitazione viene definita *probing*. \
Nonostante queste interviste non siano strutturate, l'intervistatore deve avere un programma dei tempi principali da affrontare, in modo da assicurarsi che tutti vengano rpesi considerazione. Non bisogna confondere l'essere aperti a nuove idee con l'affrontare un'intervista senza un programma: una delle abilità necessarie per condurre bene un'intervista non strutturata è quella di saper trovre il giusto equilibrio fra ottenere risposte a domande pertinenti ed essere preparati a seguire linee di indagine impreviste. \
Un vantaggio delle interviste non strutturate è che generano molti dati che spesso sono interrelati e complessi e possono consentire una comprensione profonda dell'argomento. Gli intervistati, inoltre, possono citare aspetti che l'intervistatore non aveva preso in considerazione. Vengono generati molti dati non struttrati e le interviste non saranno omogenee, perchè prenderanno una forma diversa a seconda dell'intervistato. L'analisi di queste interviste può richiedere molto tempo, ma può anche fornire molte idee. Si possono identificare i temi rilevanti medainte tecniche come la grounded theory e altri approcci analitici.
==== Interviste strutturate
Le _interviste strutturate_ prevedono, invece, un insieme di domande predefinite, come avviene nei questionari, le stessse per ogni partecipante, cosicchè lo studio è standardizzato. Le domande eveono essere brevi e formulate in modo chiaro e sono in genere domande chiuse, cioè comportano che la risposta sia tratta da un insieme prestabilito di alternative (di cui può far parte anche un'opzione _altro_). Le domande chiuse funzionano bene se il ventaglio delle risposte possibili è noto o se i partecipanti non hanno molto tempo. Le interviste strutturate sono utili solo se gli obiettivi sono compresi molto chiaramente e si possono identificare domande specifiche. Le domande in un'intervista strutturata sono formulate nello stesso modo per tutti i partecipanti e vengono poste sempre nello stesso ordine.
==== Interviste semi-strutturate
Le interviste semi-strutturate uniscono alcune caratteristiche di quelle strutturate e di quelle non strutturate e usano sia domande chiuse che domande aperte. L'intervistatore ha un copione di base che segue, in modo da affrontare gli stessi argomenti con tutti gli intervistati. Inizia con domande predefinite, poi sonda l'intervistato perchè dica di più, finchè non emergono più nuove informazioni pertinenti.
#figure(
image("images/es_int_semistrut.png", width: 70%),
caption: [Esempio intervista semi-strutturate]
)
È importante non formulare una domanda in modo da far capire che ci si aspetta una determinata risposta. Ad esempio, "Sembra che le piaccia questo uso del colore ...", pressuppone che le cose stiano così e potrebbe spingere l'intervistato a dire che è vero. I bambini sono particolarmente inclini a comportarsi in questo modo. Il linguaggio del corpo dell'intervistatore può avere una forte influenza sul fatto che l'intervistato sia d'accordo con una certa domanda e l'intervistato deve avere il tempo di rispondere e non sentirsi spinto a fare in fretta. \
Le domande sonda sono utili per ottenere maggiori informazioni, in particolare se formulate in modo neutro come "Vuole dirmi qualche altra cosa?" e qualche suggerimento che rinfreschi la memoria dell'intervistato se non gli vengono in mente termini o nomi può aiutare a far procedere l'intervista. Le interviste semi-strutturate devono essere ampiamente replicabili, perciò doamnde sonda e suggerimenti devono far procedere l'intervista senza introdurre distorsioni. \
Gli utenti possono essere molto diversi a seconda dell'età, livello di istruzione, tipo di vita, esperienze culturali e abilità fisiche e cognitive. Per esempio, i bambini pensano e reagiscono in maniera diversa dagli adulti; perciò, se nelle sessioni di raccolta di dati devono essere inclusi dei bambini, bisogna utilizzare metodi opportuni per farli setnire a loro agio. Per i bambini, che non sanno leggere o incominciano appena a imparare a leggere, bisogna usare immagini e conversazioni. I ricercatori hanno sviluppato gruppi di smilery, perchè i bambini possano selezionare quello che rappresenta meglio i loro sentimenti.
#figure(
image("images/smiley.png", width: 70%),
caption: [Uno smiley metro]
)
=== Focus group
Spesso le interviste vengono condotte da un intervistatore con un intervistato, ma succede spesso che vengano intervistati gruppi di persona. Una forma di intervista di gruppo usata a volte nelle attività di Interaction Design è il focus group. Normalmente vengono coinvolte da tre a dieci persone e la discussione è condotta da un facilitatore esperto. \
I partecipanti vengono selezionti in modo da costituire un campione rappresentativo della popolazione target. \
Il vantaggio è che consente di sollevare argomenti diversi o particolarmente delicati che altrimenti potrebbero sfuggire. I focus group consentono alle persone di esporre le proprie prospettive. Viene sviluppato un programma prestabilito che guidi la discussione, ma si lascia abbastanza flessibilità perchè il facilitatore guida a stimolare la discussione, incoraggiando le persone a partecipare. La discussione di solito viene registrata per essere poi sottoposta ad analisi e i partecipanti possono essere invitati a sviluppare ulteriormente i loro commenti in un secondo momento.
=== Pianificazione e conduzione di un'intervista
La pianificazione di un'intervistsa comporta lo sviluppo di una serie di domande o di temi da coprire, la raccolta dell'eventuale documentazione da consegnare all'intervistato, la verifica del corretto funzionamento delle apparecchiature di registrazione, la strutturazione dell'intervista e l'organizzazione di un momento o di una sede opportuna per l'incontro.
==== Sviluppo delle domande per l'intervista
Le domande possono essere aperte o chiuse. Quelle aperte sono più adatte quando l'obiettivo della sessione è esplorativo; quelle chiuse sono più adatte se si conoscono già in anticipo le risposte possibili. Un'intervista non strutturata è costituita principalmente da domande aperte; un'intervista strutturata da domande chiuse. La semi-strutturata può usarle entrambe. \
Ci sono delle linee guida per formulare le domande:
- domande lunghe o composte possono essere difficili da ricordare o possono creare confusione, perciò è opportuno dividerle in domande distinte;
- gli intervistati possono non comprendere il gergo tecnico o un linguaggio complesso e potrebbero vergognarsi di ammetterlo, perciò è bene spiegare le cose in modo semplice;
- cercare di formulare le domande in modo neutro.
Quando si raccolgono le risposte a domande chiuse, è utile elencare le risposte possibili con caselle da spuntare.
==== Conduzione dell'intervista
Prima di iniziare, è bene assicurarsi che gli obiettivi dell'intervista siano stati spiegati all'intervistato e che questi acconsenta a procedere. Sapere quaclosa dell'intervistato e del suo ambiente prima dell'intervista renderà più facile metterlo a suo agio, in particolare se l'intervista si svolge in un contesto che non è familiare. \
Nel corso dell'intervista, è meglio ascoltare, rispondere con simpatia ma senza influenzare, e dare l'imprensione di apprezzare l'intervista. \
La sequenza tipica di un'intervista è la seguente:
- un'introduzione, in cui l'intervistatore si presenta e spiega perchè conduce l'intervista, rassicura l'intervistato in merito a eventuali preoccupazioni di ordine etico e chiede se all'intervistato da fastidio essere registrato;
- una prima parte di riscaldamento, in cui vengono poste domande facili, che non possono incutere timore;
- una parte principale, in cui le domande vengono presentate in una sequenza logica, con quelle più approfondite alla fine. In un'intervista semi-strutturata, l'ordine delle domande può variare da partecipante a partecipante, a seconda dell'andamento della conversazione, da quante domande sonda vengono poste e da quello che sembra più naturale;
- una parte di raffreddamento, costituita da poche domande facili;
- una parte finale, in cui l'intervistatore ringrazia l'intervistato, spegne il registratore o ripone il blocco degli appunti, segnalando che l'intervista è conclusa.
==== Altre forme di intervista
Condurre interviste e focus group in presenza può essere complicato, si può usare però, Skype, Zoom e altri sistemi. \
Si svilgono in modo simile a quelle faccia a faccia, ma connessioni scadenti e una cattiva acustica possono provocare problemi diversi e i partecipanti possono essere tentati di fare anche altro, invece di concentrarsi sulla sessione in corso. Tra i vantaggi dei focus group e delle interviste da remoto, in particolare quando si svolgono su canali solo audio, rientrano i seguenti principi:
- i partecipanti sono nel proprio ambiente e sono più rilassati;
- i partecipanti non devono spostarsi;
- i partecipanti non devono preoccuparsi degli abiti che indossano;
- per le interviste che riguardano argomenti delicati, gli intervistati possono rimanere anonimi.
I partecipanti, inoltre, possono abbandonare la conversazione in qualsiasi momento vogliano, semplicemente troncando la connessione, il che aumenta il senso di sicurezza. \
Le interviste retrospettive, cioè le interviste che riflettono su un'attività o una sessione di raccolta dati avvenute nel passato recente, possono consentire di verificare se l'intervistatore ha compreso correttamente quello che è successo. Questa pratica prende il nome di _member checking_.
==== Arricchire l'esperienza dell'intervista
Le interviste faccia  a faccia spesso si svolgono in una sede neutra, lontano dal normale ambiente dell'intervistato. Questo crea un contesto artificiale, che può rendere più difficile agli intervistati dare risposte complete alle domande. Per ovviare a questo problema, le interviste possono essere arricchite utilizzando strumenti di appoggio. Questi strumenti di appoggio possono essere utilizzati per fornire contesto agli intervistati e per aiutare a fondare i dati in un contesto reale.
=== Questionari
Sono una tecnica consolidata per raccogliere dati demografici e le opinioni degli utenti. Sono simili alle interviste, in quanto hanno domande chiuse o aperte, ma, una volta che un questionario è stato predisposto, può essere distribuito a un gran numero di partecipanti senza richiedere ulteriori risorse per la raccolta di dati. \
Spesso ai potenziali partecipanti viene spedito un messaggio che li rinvia a un questionario online. \
I questionari ben progettati sono adatti per ottenere risposte a domande specifiche da un gruppo ampio di persone. \
Le domande del questionario e le domande di un'intervista strutturata sono simili, ma è bene capire in quali casi e perchè bisogna scegliere una tecnica piuttosto che un'altra. \
Essenzialmente, la differenza sta nella motivazione del partecipanti a rispondere alle domande. Se la sua motivazione è abbastanza forte da completare un questionario senza che altri siano presenti, un questionario sarà appropriato. \
Se bisogna esercitare un po' di persuasione sul partecipante perchè risponda alle domande, può essere meglio il formato dell'intervista strutturata. \
È più difficile sviluppare buone domande per un questionario, anzichè per un'intervista strutturata, perchè l'intervistatore non sarà presente per spiegarle o per chiarire le ambiguità. È importante che le domane siano specifiche, ponendo domande chiuse o offrendo una serie di risposte, comprendendo un'opzione "nessuna opinione" o "nessuna di queste". Inoltre, alcuni progettisti di questionari, usano deliberatamente una combinazione di domande negative e positive, perchè questo li aiuta a verificare le intenzioni degli utenti.
==== Struttura di un questionario
Molti questionari iniziano chiedendo informazioni demografiche di base (genere, età, luogo di nascita, ecc.) e dettagli sulle esperienza pertinenti (il numero di ore trascorso ogni giorni a effettuare ricerche su Internet, il livello di conoscenza del campo dello studio, ecc). \
Queste informazioni sono utili per collocare nel contesto le risposte. Devono essere raccolte solo informazioni di contesto che siano pertinenti per l'obiettivo dello studio.
Successivamente vengono fatte domande che contribuiscono all'obiettivo di raccolta dei dati. Se il questionario è lungo, le domande possono essre suddivise per temi, in modo  da rendere più facile più logica la compilazione. \
In seguito un'idea su come strutturare il questionario.
- Pensare all'ordine delle domande. L'impatto di una domanda può essere influenzato dalla posizione in cui si trova fra le altre domande.
- Valutare se siano necessarie versioni diverse del questionario per popolazioni diverse.
- Fornire istruzioni chiare su come compilare il questionario, per esempio se si possono saltare delle domande, per rispondervi in seguito. Mirare a una formulazione attenta e a una buona prestazione tipografica.
- Tenere presente la lunghezza del questionario ed evitare di inserire le domande che non sono pertinenti per gli obiettivi dello studio.
- Se il questionario è molto lungo, è bene valutare le possibilità di consentire ai partecipanti di abbandonarlo in fasi diverse. Di solito è meglio avere le risposte ad alcune sezioni solamente, piuttosto che non avere alcuna risposta perchè il partecipante ha rinunciato.
- Pensare all'impaginazione del questionario e al ritmo: per esempio, trovare un equilibrio fra l'uso degli spazi bianchi, e la necessità di mantenere il questionario il più compatto possibile.
==== Somministrazione di questionari
Due problemi importanti, quando si usano i questionari, sono raggiungere un campione rappresentativo di partecipanti e assicurarsi un tasso di risposta ragionevole. \
Di solito vengono scegli meno di 20 utenti, con questo campione di piccole dimensioni si ottengono spesso tassi di completamento dell'ordine del cento per cento, mentre in casi di popolazioni grandi, diventa problematico ottenere questionari completati.\
Un ritorno del 40 per cento in generale è accettabile per molte indagini. \
I questionari sono spesso online, ma in alcune situazioni quelli cartacei possono essere più convenienti, per esempio se i partecipanti non hanno accesso a internet. \
Ogni tanto un breve questionario può essere inviato nel corpo di un'email, ma più spesso i vantaggi della compilazione automatica dei dati e una analisi parziale o totale rendono attraenti i questionari online, che sono interattivi e  possono comprendere caselle di spunta, caselle di selezione, menu a discesa e a comparsa, schermate di aiuto grafica o video. \
Il problema principale dei questionari online è la difficoltà di ottenere un campione casuale: si basano di solito su campionamenti di convenienza e perciò i loro risultati non si possono generalizzare. \
I passi per la preparazione di un questionario online sono i seguenti:
+ pianificate la tempistica dell'indagine. Se c'è una scadenza, procedete a ritroso dalla scadenza e programmate quello che deve essere fatto, su base settimanale
+ Progettate il questionario offline. Un documento di puro testo è utile, perchè poi può essere copiato più facilmente nello strumento per le indagini online
+ Programmate l'indagine online. Quanto tempo richiederà dipende dalla complessità del design
+ Effettuare un test, sia per essere sicuri che lo strumento si comporti come previsto, sia per verificare le domande stesse. Questo comprende anche ottenere feedback da esperti di contenuti, esperti di indagini statistiche e potenziali partecipanti
+ Reclutate i partecipanti. Possono avere motivi diversi per prendere parte all'indagine.
Dei siti utili per la creazione di questonari sono *questionpro.com* oppure *surveymonkey.com*.
=== Formato di domanda e risposta
Si possono scegliere, per domande e risposte, formati diversi. Nel caso di una domanda chiusa, può essere appropriato indicare una sola risposta, oppure indicarne diverse. A volte è meglio chiedere agli utenti di dare una risposta che si collochi all'interno diun certo intervallo. La scelta del formato più adatto per domande e risposta rende più facile ai partecipanti rispondere chiaramente. \
Ci sono diversi formati:
- Caselle di spunta e intervalli;
- scale di valutazione:
	- scale Likert;
	- scale del differenziale semantico.
==== Caselle di spunta e intervalli
L'intervallo delle risposte a domande di carattere demografico è prevedibile. per la nazionalità, esiste un numero finito di alternative, e chiedere ai partecipanti di scegliere una risposta da un elenco predefinito ha senso per raccogliere questa informazione. \
In intervalli come l'età, spesso ci si riferisce con intervalli, come 15-20, 20-24. scrivere gli intervalli in questo modo è sbagliato, chi ha 20 anni quale delle due caselle barra? per questo si fanno intervalli che non comprendono numeri uguali, per es: 15-20, 21-25. \
Gli intervalli non devono avere sempre numeri predefiniti; supponiamo di fare un sistema che controlli le idee politiche dei partecipanti, saranno necessari intervalli di età almeno ogni 10 anni. supponiamo di avere un sito per l'assicurazione sulla vita, è probabile che qui ci siano persone di età compresa fra i 21 e 65 anni, per questo possono venir creati solo 3 intervalli.
==== Scale di valutazione
Esistono vari tipi di scale di valutazione, ciascuna delle quali ha il proprio scopo. Due scale di uso comune sono le Likert e quelle del differenziale semantico. Il loro scopo è sollecitare risposte a una domanda che possano essere messe a confronto. Vanno bene per invitare le persone a dare un giudizio, per esempio su quanto facile, quanto usabile e simili. \
Le scale Likert si basano sulla scelta di un insieme di affermazioni che rappresentano un ventaglio di possibili opinioni, mentre le scale del differenziale semantico si basano sulla scelta di coppie di parole che rappresentino il ventaglio delle opinioni possibili. Le scale Likert si usano più spesso, perchè identificare affermazioni che i partecipanti possano comprendere in modo coerente è più facile che identificare coppie semantiche che i partecipanti interpretino nel modo previsto.
==== Scale Likert
Sono usate per misurare opinioni, atteggiamenti e convinzioni e di conseguenza sono ampiamente impiegate per valutare la soddisfazione degli utenti nei confronti del prodotto. Ad esempio, le opinioni degli utenti sull'uso dei colori in un sito web potrebbero essere valutate con una scala Likert che usi una serie di numeri

+ L'uso del colore è eccellente
#figure(
image("images/likert.png", width: 70%),
caption: [Esempio di utilizzo della scala Likert]
)
In entrambi i casi, ai partecipanti si deve chiedere di scegliere la casella, il numero o la frase opportuna. I passi per progettare una scala likert sono i seguenti:
+ Raccogliere una serie di brevi affermazioni sul tema da indagare. es: Questo pannello di controllo è chiaro
+ Decidere la scala. Qui ci sono tre aspetti da considerare. Quanti punti servono sulla scala? Deve essere una scala discreta o continua? Come può essere rappresentata la scala?
+ Selezionate le voci per il questionario finale, e riformulare le frasi quanto serve per renderle chiare.
Non esiste un modo giusto o sbagliato di ordinare i numeri; i ricercatori preferiscono disporre le scale in senso contrario, con 1 come livello minimo a sinistra e 5 come massimo a destra
==== Scale del differenziale semantico
Le scale del differenziale semantico esplorano una serie di atteggiamenti bipolari relativamente a un particolare elemento, ciascuno rappresentato da una coppia di aggettivi.
Al partecipante viene chiesto di scegliere un punto fra i due estremi per indicare quanto è d'accordo o meno con i due poli. \
Il punteggio per l'indagine si calcola sommando i punteggi per ciascuna coppia bipolare. Poi i punteggi vengono calcolati per gruppi di partecipanti.
#figure(
image("images/diff_semantico.png", width: 70%),
caption: [Scala del differenziale semantico]
)
Quali scale usare: tre, cinque, sette punti o più? \
Fra gli aspetti da affrontare quando si progettano scale Likert e di differenziale semantico rientrano anche il numero di punti necessari sulla scala, il modo in cui devono essere presenti e in quale forma.\
Molti questionari usano scale a sette o cinque punti, ed esistono anche scale a tre soli punti; alcune addirittura ne usano nove. Vi sono buoni argomenti a favore di ciascuna posizione. I sostenitori delle scale lunghe sostengono che aiutano a discriminare meglio.  \
Un altro aspetto da considerare è se dare alla scala un numero pari o dispari di punti. Un numero dispari presenta un punto centrale chiaro, mentre un numero pari costringe i partecipanti a prendere una decisione e sbilanciarsi. \
Le linee guida che proponiamo noi sono le seguenti.
- Quanti punti sulla scala?
	Usate un piccolo numero di punti, tre per esempio, quando le possibilità sono molto limitate, come nelle risposte del tipo Sì/No.
#figure(
image("images/diff_semantico2.png", width: 70%),
)
=== Osservazioni
L'osservazione è utile in qualsiasi fase dello sviluppo di un prodotto. Nelle fasi iniziali del design, l'osservazione aiuta i designer a comprendere contesti, attività e obiettivi degli utenti. \
Gli utenti possono essere osservati direttamente dal ricercatore mentre svolgono le loro attività, oppure indirettamente attraverso registrazioni delle attività, che vengono studiate in un secondo tempo.
==== Osservazioni sul campo
L'osservazione sul campo può aiutare a completare i dettagli di come gli utenti si comportano e come usano la tecnologia, e permette di cogliere sfumature che non si riescono ad apprezzare con altre forme di indagine. La conoscenza del contesto offre informazioni importanti per capire perchè le attività si svolgano proprio in quel determinato modo. Potrebbe risultare difficile svolgerla, e può produrre una quantitò molto elevata di dati. \
Ogni raccolta di dati deve avere un obiettivo ben definito, ma è importante che una sessione di osservazione sia ben focalizzata, perchè le cose che succedono sono davvero molte. Nell'osservazione, va sempre rispettato un equilibrio attento fra farsi guidare dagli obiettivi ed essere aperti alla possibilità di modificare, in funzione di quello che si apprende in merito alla situazione.
==== Strutturazione di quadri di riferimento per l'osservazione sul campo
Nel corso di un'osservazione, gli eventi possono essere complessi e mutare rapidamente. Gli osservatori hanno molte cose a cui pensare, perciò molti esperti hanno un quadro di riferimento che permette di strutturare e focalizzare l'osservazione. Questo quadro può essere molto semplice. Per esempio, segue un quadro di riferimento da usare negli studi id valutazione:
- la persona: chi usa la tecnologia in ogni dato istante?
- il luogo: dove viene utilizzata?
- la cosa: che cosa fanno le persone con la tecnologia?
Gli osservatori esperti possono preferire un sistema più dettagliato:
- spazio: qual è lo spazio fisico, come è configurato?
- attori: quali sono i nomi e i dettagli pertinenti delle persone coinvolte?
- attività: che cosa fanno gli attori?
- oggetti: quali oggetti fisici sono presenti?
- atti: quali sono le singole azioni specifiche?
- eventi: quello che si osserva fa parte di un evento speciale?
- tempo: qual è la successione degli eventi?
- obiettivi: che cosa cercano di realizzare gli attori?
- stato d'animo: qual è l'umore del gruppo e dei singoli?
Questo sistema è generale, nel contesto dell'interaction design, deve essere leggermente modificato.

==== Grado di partecipazione
A seconda del tipo, il grado di partecipazione nell'ambiente dello studio varia, lungo uno spettro che va dall'interno a un estremo fino all'esterno all'estremo opposto. \
Dove ricada lungo questo spettro un particolare studio dipende dagli obiettivi e dai problemi. \
Un osservatore che adotti un approccio proprio all'estremo "esterno" dello spettro è un osservatore passivo e non avrà alcuna parte nell'ambito dello studio.
Un osservatore che adotti un approccio all'altro estremo dello spettro, come "Interno" è un osservatore partecipante. È un ruolo difficile, dato che essere osservatori richiede anche un certo livello di distacco, mentre per essere partecipanti bisogna assumere un ruolo diverso. Per un osservatore partecipante è importante mantenere i due ruoli separati, in modo che gli appunti dell'osservazione siano oggettivi, pur mantenendo la partecipazione.
==== Pianificazione e conduzione di osservazioni sul campo
La scelta di un quadro di riferimento è importante, ma ci sono altre decisioni da prendere, fra cui il livello di partecipazione da adottare, come registrare i dati, come farsi accettare nel gruppo sotto studio, come gestire aspetti delicati come differenze culturali o l'accesos a spazi privati e come garantire che lo studio usi prospettive diverse. \
Un modo per soddisfare a quest'ultimo requisito è lavorare in team, che può avere benefici.
- Ciascuna persona può concentrarsi su persone diverse o su parti diverse del contesto, comprendo così un terreno più ampio.
- Osservazione e riflessione si possono intrecciare più facilmente, se gli osservatori sono più di 1.
- È probabile che si generino dati più affidabili.
Una volta che si è nel bel mezzo di un'osservazione, sorgono altri problemi che bisogna prendere in considerazione. \
L'osservazione è anche un'attività stancante, ma alla fine di ogni giornata è importante controllare appunti e registrazioni e riesaminare osservazioni ed esperienze. Se non lo si fa, si potrebbero perdere informazioni importanti quando gli eventi del giorno successivo tenderanno a cancellare il ricordo di quelli del giorno prima.
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
= I prototipi

== Processo human-centred design ISO 9241-210

La norma ISO 9241-210, «Human-centred design process for interactive systems», descrive il processo di progettazione centrato sull'utente. Dopo una fase iniziale di pianificazione del processo, il progetto si sviluppa attraverso quattro attività:

+ comprendere e specificare il contesto d'uso;
+ specificare i requisiti dell'utente e di business;
+ produrre le soluzioni di progettazione (design);
+ valutare il progetto rispetto ai requisiti.

Il processo è iterativo: se la valutazione mostra che la soluzione non soddisfa i requisiti, si torna a una delle attività precedenti (il contesto d'uso, i requisiti o la produzione delle soluzioni) e il ciclo si ripete. Il processo si conclude quando la soluzione progettuale soddisfa tutti i requisiti. I prototipi sono lo strumento principale con cui le soluzioni di progetto vengono prodotte e valutate. \
Per produrre soluzioni di progetto efficaci occorre:

- capire gli utenti e i loro compiti, sulla base del contesto d'uso e dei problemi riscontrati con i sistemi correnti;
- usare le conoscenze esistenti, cioè standard e linee guida (per esempio la serie ISO 9241);
- produrre mock-up e prototipi, su carta o con tecniche di prototipazione rapida;
- valutare.

Si lavora dunque con un ciclo rapido: capire, progettare, valutare. Ogni prototipo viene costruito proprio per essere valutato.

== Che cos'è un prototipo

Un prototipo è una rappresentazione di un prodotto o di un sistema, o di una sua parte, che, anche se in qualche modo limitata, può essere utilizzata a scopo di valutazione. \
Lo scopo principale dei prototipi è quello di coinvolgere gli utenti in tutte le fasi del progetto. I benefici di questo approccio sono molteplici. Secondo l'ISO 9241-210:

- rende le decisioni di progetto più esplicite, permettendo, tra l'altro, ai progettisti di comunicare meglio fin dall'inizio del processo;
- consente ai progettisti di esplorare numerosi design concept prima della scelta finale;
- permette di incorporare nel progetto i feedback degli utenti;
- rende possibile valutare numerose varianti del progetto e progetti alternativi;
- migliora la qualità e completezza delle specifiche del progetto.

Un esempio di come un prototipo si evolve nel tempo è lo sviluppo dell'iPhone. Si parte da un primo sketch di Jony Ive, un semplice disegno che esplora la forma e le proporzioni del dispositivo. Si passa poi a un primo modello renderizzato in alluminio, che permette di valutare l'aspetto fisico e le dimensioni dell'oggetto. Infine si realizza un prototipo (il «Proto 399») con icone «finte», cioè simulate, sullo schermo, che permette di valutare l'aspetto della schermata. Ogni passaggio aumenta la fedeltà rispetto al prodotto finale e risponde a uno scopo diverso: esplorare, comunicare, valutare.

=== Palm Pilot e Knowledge Navigator

Due esempi storici mostrano che un prototipo non deve per forza essere un sistema funzionante. Per valutare il Palm Pilot, Jeff Hawkins usava un semplice blocco di legno, delle dimensioni del dispositivo, che portava con sé e simulava di usare con una penna, per capire quale posto avrebbe avuto nella vita quotidiana dell'utente. Il Knowledge Navigator, presentato da Apple nel 1987, è invece un video concept: mostra un tablet con un assistente digitale e ne illustra l'uso senza che esista alcun sistema reale.

== Tipi di prototipi

Un prototipo è un modello approssimato o parziale del sistema che vogliamo sviluppare, realizzato allo scopo di valutarne determinate caratteristiche. Poiché i gruppi di progetto per i sistemi interattivi sono spesso multidisciplinari, coinvolgono persone con professionalità e priorità diverse, il termine stesso di prototipo viene usato in modo non univoco. La tabella di seguito mostra una possibile classificazione dei prototipi, sulla base del loro scopo, delle loro modalità d'uso, fedeltà, completezza funzionale e durata della loro vita.

#table(
  columns: (7.5em, 8em, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  // horizontal line above every row, vertical lines between columns
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [*Scopo*], [Ruolo], [Serve a valutare il ruolo del prodotto nella vita del suo utente],
  [], [Interfaccia], [Serve a valutare le modalità d'interazione fra utente e prodotto],
  [], [Implementazione], [Serve a valutare aspetti tecnici relativi alla realizzazione tecnica del prodotto],

  [*Modo d'uso*], [Statico], [È una rappresentazione statica del prodotto (es. storyboard, diagrammi di vario tipo)],
  [], [Dinamico], [È una rappresentazione dinamica (ma non interattiva) del prodotto, es.: video],
  [], [Interattivo], [Permette agli utenti di effettuare prove d'uso del prodotto, anche se semplificate e approssimate],

  [*Fedeltà*], [Alta fedeltà], [Assomiglia in tutti gli aspetti al prodotto finale],
  [], [Bassa fedeltà], [Assomiglia alla lontana al prodotto finale],

  [*Completezza funzionale*], [Orizzontale], [Fornisce tutte le funzioni del prodotto finale, anche se in versione semplificata o limitata],
  [], [Verticale], [Fornisce solo alcune funzioni, realizzate in dettaglio],

  [*Durata*], [Usa e getta], [Non viene conservato dopo l'uso],
  [], [Evolutivo], [Viene fatto evolvere fino al prodotto finale],

  table.hline(),
)

Dal punto di vista del loro scopo, possiamo classificare i prototipi in tre grandi categorie:

- prototipi che servono a valutare il ruolo del prodotto nella vita del suo utente (_role prototype_);
- prototipi che servono a valutare l'interfaccia del prodotto, intesa come l'insieme delle modalità di interazione fra utenti e prodotto (_look & feel prototype_);
- prototipi che servono a valutare aspetti tecnici relativi all'implementazione del prodotto.

Questa distinzione raramente può essere netta, poiché spesso un prototipo presenta contemporaneamente più aspetti. Ruolo, interfaccia e implementazione possono quindi essere considerati come le tre dimensioni dello "spazio" nel quale possiamo collocare ogni prototipo. Per esempio, il Knowledge Navigator di cui si è parlato più sopra può considerarsi essenzialmente un prototipo di ruolo, con qualche aspetto, sia pure non approfondito, d'interfaccia, ma senza alcun aspetto implementativo. Pertanto, in figura, dovrebbe essere collocato nell'area indicata del cerchio. Questa rappresentazione è dovuta a Houde e Hill (1997). Per leggerla vale una regola semplice: più un prototipo è vicino a un vertice del triangolo, più si concentra su quell'aspetto; al centro si trovano i prototipi che li integrano tutti. Il blocco di legno del Palm Pilot si colloca vicino al vertice del ruolo; un prototipo Figma cliccabile (look & feel e flusso) vicino al vertice dell'interfaccia; uno spike tecnico, come la misura della latenza di un'API, vicino al vertice dell'implementazione; un prototipo integrato, come un'app pilota con codice reale, al centro.

#figure(
	image("images/spazio_prototipi.png", width: 70%),
	caption: [Palm Pilot]
)

Un'altra possibile classificazione dei prototipi è relativa alla loro modalità d'uso: un prototipo può essere allora statico, dinamico o interattivo. Consisterà semplicemente in una rappresentazione statica del prodotto: una serie d'immagini, per esempio; il funzionamento dinamico del prodotto potrà essere mostrato mediante un video, come nell'esempio del Knowledge Navigator. I prototipi più utili per convalidare l'usabilità di un sistema saranno di solito quelli interattivi, che consentono agli utilizzatori di interagire col sistema in corso di progettazione, per sperimentarne l'uso e individuarne, così, pregi e difetti. Un prototipo interattivo aiuta a chiarire i requisiti di progetto, che spesso sono espressi in forma vaga. Permette di osservare le reazioni dell'utente durante l'uso del sistema e di sperimentare soluzioni alternative, a costi contenuti. \
Nella pratica corrente, a volte ci si accontenta di realizzare prototipi dinamici, consistenti in una semplice sequenza di immagini che il progettista mostra all'utente in sequenza simulando scenari d'uso tipici. Questo approccio però non permette di valutare la usabilità di un sistema, e non dovrebbe mai sostituire l'interazione vera. \
I prototipi possono essere ulteriormente classificati in base alla loro fedeltà al prodotto finale, alla loro durata e alla loro completezza:

- *fedeltà al prodotto finale*: i prototipi che assomigliano in tutti gli aspetti al sistema finale si dicono ad alta fedeltà. Quelli che gli assomigliano poco, a bassa fedeltà. I prototipi a bassa fedeltà sono normalmente oggetti semplici, economici e molto facili da realizzare;
- *completezza funzionale*: un prototipo orizzontale fornisce molte funzionalità, ma realizzate in modo schematico. Un prototipo verticale, al contrario, realizza compiutamente un insieme limitato di funzionalità. Con un prototipo orizzontale, se interattivo, si può provare l'intera interfaccia, anche se in modo approssimativo. Infatti, l'utente non potrà utilizzare nessuna funzionalità per intero: di ciascuna esisterà, per così dire, solo l'involucro esterno o una bozza rudimentale;
- *durata*: anche la durata di vita del prototipo è importante. Se il prototipo, dopo la sperimentazione, non viene conservato, esso si dice usa e getta. Se invece viene conservato e viene fatto evolvere o comunque integrato nel prodotto finale, si dice prototipo evolutivo. I prototipi a bassa fedeltà solitamente sono usa e getta. I prototipi ad alta fedeltà invece spesso vengono fatti evolvere nel prodotto finale;
- *incrementale*: viene realizzato una serie di prototipi separati, ciascuno dedicato a una parte del sistema, che alla fine vengono integrati nel prodotto finale.

== Schizzi, storyboard e diagrammi

La definizione dello standard ISO 9241-210 considera prototipi anche le rappresentazioni del sistema sulla carta. Sarebbe meglio considerare come prototipi solo quelle rappresentazioni che permettono di provare l'interattività del sistema e non soltanto di descriverla.

=== Schizzi

Nei gruppi di progetto che coinvolgono più persone, spesso questi schizzi sono realizzati su lavagne di grandi dimensioni, in sessioni di brainstorming, durante le quali i partecipanti suggeriscono, discutono e modificano, in modo totalmente libero, soluzioni diverse. La proposta finale, condivisa, servirà come base per la realizzazione di un prototipo vero e proprio nel processo iterativo di progettazione.

=== Storyboard

La tecnica dello storyboarding consiste nel realizzare una serie di disegni che illustrano, inquadratura per inquadratura, ciò che verrà girato sul set di ripresa. Accanto ai disegni possono essere indicati i movimenti della macchina da presa, o brani del dialogo, o altre annotazioni.

#figure(
image("images/storyboard.png", width: 80%),
caption: [Esempio di uno storyboard]
)

La tecnica dello storyboarding può essere adottata anche nell'interaction design, per rappresentare una storia d'uso: la sequenza degli stati del sistema durante una particolare interazione con l'utente. Lo storyboard risulta utile solo in alcuni casi, soprattutto in fase di definizione dei requisiti.

=== Diagrammi per macchine a stati

Per rappresentare adeguatamente sulla carta l'interazione con l'utente, ci servono strumenti più espressivi che ci permettano di rappresentare tutte le possibili sequenze d'interazione. Per questo sono state sviluppate svariate notazioni, che fanno uso di diagrammi bidimensionali, ovvero i diagrammi per macchine a stati, detti anche _statechart_. Si tratta di diagrammi proposti da David Harel come strumento di modellazione di sistemi complessi e in seguito adottati nel linguaggio UML come uno degli strumenti di base. A differenza di altri diagrammi a stati, essi permettono di descrivere un sistema in modo gerarchico, cioè per livelli di astrazione successivi. \
I diagrammi per macchine a stati sono strumenti semplici ma flessibili e potenti, che servono a descrivere il comportamento di sistemi di ogni tipo. Uno statechart è costituito da nodi e da archi:

- ogni nodo rappresenta uno stato del sistema: nel nostro caso uno stato del dialogo con l'utente;
- ogni arco (orientato) rappresenta una transizione da uno stato all'altro.

La transizione è innescata da un evento che normalmente corrisponde a un'azione dell'utente e può causare l'esecuzione di un'azione del sistema. La transizione può essere subordinata al verificarsi di una condizione. Ogni nodo è rappresentato con un rettangolo dai bordi arrotondati, contenente il nome dello stato che rappresenta. Ogni arco è etichettato con il nome dell'evento, della condizione e dell'azione associata.

#figure(
	image("images/statechart.png", width: 80%),
	caption: [Gli elementi di base degli statechart]
)

Di solito gli eventi sono azioni dell'utente: per esempio la pressione di un pulsante.

#figure(
	image("images/es_statechart.png", width: 80%),
	caption: [Statechart che definisce l'interazione con un distributore di bevande]
)

Un grosso vantaggio degli statechart è che permettono di rappresentare il sistema per livelli di astrazione successivi. Questo consente di rappresentare il dialogo nei dettagli, usando dei diagrammi di dimensioni contenute: basterà definire un diagramma separato per ogni caso d'uso individuato nei requisiti. Nel corso del progetto i prototipi si costruiscono in tre momenti successivi. I prototipi iniziali (su carta, wireframe, mago di Oz) servono a esplorare rapidamente le idee. I prototipi intermedi permettono di provare aspetti specifici del prodotto con le tecnologie finali. I prototipi finali corrispondono a un sistema sostanzialmente completo. Procedendo nel tempo, la fedeltà, la completezza e il costo dei prototipi crescono.

== Prototipi iniziali

Nelle prime fasi del progetto è utile esplorare più soluzioni, prima di scegliere quale sarà sviluppata nel dettaglio. I prototipi iniziali servono proprio a questo, e sono quindi molto importanti. Essi saranno quasi sempre di tipo usa e getta ed è opportuno che siano realizzabili molto velocemente e a costi contenuti.

#set par(justify: true)

#emph[
  Gli utenti possono essere coinvolti molto presto nel progetto, mediante l'uso di modelli statici realizzati sulla carta. È possibile presentare agli utenti le bozze delle schermate o una rappresentazione del prodotto, chiedendo loro di provarli in un contesto realistico. In tal modo si possono valutare rapidamente ed economicamente aspetti del progetto (per esempio, quanto sia facile navigare attraverso una gerarchia di menu). Per i prodotti hardware, analoghi benefici possono essere ottenuti con l'uso di modelli tridimensionali statici, costruiti con materiali semplici. Nelle fasi iniziali, anche i prototipi più rudimentali possono risultare preziosi, per esplorare soluzioni alternative. Anche se può essere utile presentare le soluzioni di progetto nel modo più realistico possibile, è consigliabile evitare di investire troppo tempo o denaro nella loro realizzazione, anche perché ciò potrebbe produrre una resistenza alle modifiche da parte dei progettisti. In un approccio human-centred, un prototipo non è semplicemente una demo per mostrare un'anteprima del prodotto agli utenti. Esso serve a raccogliere le loro reazioni, per poi utilizzarle nell'orientare le attività di progettazione successive. Quando non fosse consigliabile mostrare i prototipi agli utenti all'inizio del processo di progettazione (per esempio, per ragioni di riservatezza), le valutazioni potranno essere condotte da esperti. Queste possono essere utili e poco costose, e complementare i test con l'utente. In ogni caso, in un processo di progettazione human-centred, almeno i test finali dovrebbero essere condotti con utenti reali.#super[115]
]
=== Prototipi di carta

I prototipi più semplici che permettono di provare l'interazione con l'utente sono i prototipi di carta. L'interfaccia del sistema viene disegnata a bassa fedeltà su fogli di carta che vengono usati per effettuare una simulazione manuale del sistema. Durante la simulazione, il progettista presenta all'utente la prima schermata, e l'utente interagisce con essa simulando l'interazione. Il progettista risponderà in funzione delle azioni dell'utente, presentando il cartoncino con la schermata successiva e così via.

*Perché si usa.* Sarebbe utile sapere che cosa vogliono gli utenti prima di iniziare la programmazione. I prototipi su carta permettono proprio questo, anche se può non essere intuitivo testare un'interfaccia utente senza l'uso di un computer: consentono di massimizzare il feedback minimizzando lo sforzo. Bastano alcuni test di usabilità con prototipi su carta per avere abbastanza informazioni da capire se ciò che si implementerà è la cosa giusta.

#figure(
	image("images/prot_carta.png", width: 80%),
	caption: [Prototipi di carta]
)

I prototipi di carta non vengono usati molto, perché i progettisti non li prendono seriamente. Spesso però conviene realizzarli come primo passo, subito dopo aver adeguatamente schematizzato i vari percorsi dell'interazione con l'uso dei diagrammi di interazione: i prototipi di carta sono veloci e riutilizzabili, e permettono di correggere facilmente i problemi (interfaccia poco _user friendly_). \
Un prototipo su carta non deve essere molto curato. In pratica:

- si possono fare anche interfacce miste (carta sopra un'interfaccia reale), anche se in genere non sono necessarie;
- linee dritte o testo stampato: è sufficiente che l'utente legga una scritta; se non è chiara non bisogna spiegarla, ma sostituirla;
- immagini e icone: meglio le parole, per esempio «logo azienda» al posto dell'immagine;
- colori: meglio fare schizzi con un pennarello nero, i colori possono essere aggiunti dopo;
- dimensioni: sono importanti solo per interfacce molto dense; se l'utente è confuso sulle dimensioni, meglio dare spiegazioni.

Molto spesso dopo il primo test di usabilità si scoprono problemi inattesi e si fanno molte modifiche. Conviene quindi non spendere molto tempo in prototipi che sembrano belli prima di provarli: è sufficiente che siano abbastanza leggibili.

*Carta e prototipi digitali.* I prototipi cartacei hanno alcuni vantaggi rispetto a quelli creati con applicazioni come HTML, Figma, Penpot o Framer:

- _non si scrive codice_: creare velocemente dei mock-up è possibile, ma fare in modo che l'interfaccia risponda correttamente alle azioni dell'utente costa tempo;
- _si evitano feedback inutili_: interfacce chiare e pulite incoraggiano un tipo sbagliato di feedback, come «non mi piace il verde del bordo di quel pulsante» o «queste caselle di testo non sono allineate!», quando invece si vuole essere sicuri di fornire il giusto contenuto;
- _si incoraggia la creatività_: la mente è più creativa vedendo cose «non finite» e gli utenti, in particolare quelli non esperti, si intimidiscono di fronte alle applicazioni.

*Pro e contro.* Il paper prototyping permette di valutare:

- _concetti e terminologia_: sono comprensibili all'utente finale?
- _flusso di navigazione_: la sequenza di passi è quella che gli utenti si aspettano? Devono spostarsi tra le schermate? L'interfaccia chiede informazioni che l'utente non ha o non vuole dare?
- _contenuto_: l'interfaccia permette agli utenti di prendere decisioni? Ha più informazioni del necessario o presenta informazioni inutili?
- _layout di pagina_: anche se poco definito, può dare informazioni utili;
- _funzionalità_: si può scoprire che è necessario inserire funzionalità non previste o che ne sono state previste di inutili.

Ha però dei limiti:

- _fattibilità tecnica_: si possono creare prototipi che non possono essere implementati; per evitarlo deve esserci almeno una persona in grado di capire i vincoli tecnici di una soluzione;
- _tempi di risposta_: poiché è una persona a simulare il comportamento del sistema, non è possibile valutarli;
- _scrolling_: il suo uso, in particolare per le pagine web, è da evitare, così anche per i prototipi su carta;
- _colori e caratteri_: con la carta è molto difficile far vedere l'interfaccia come si vedrebbe su uno schermo. È una buona idea coinvolgere un designer nel prototipo cartaceo, perché potrebbe fare osservazioni che influenzano il progetto.

=== La tecnica del mago di Oz

Questa tecnica consiste nel realizzare un prototipo interattivo, in cui le risposte siano fornite, se possibile all'insaputa dell'utente, da parte di un essere umano che operi dietro le quinte. Per esempio, nel prototipo di un sistema di query, l'utente potrebbe formulare un'interrogazione e un esperto nascosto (il mago di Oz) potrebbe riscrivere l'interrogazione in una forma normalizzata e presentarla all'utente per la sua approvazione e quindi fornire la risposta richiesta, simulando l'accesso a una base di dati ancora inesistente. \
Affinché il prototipo risulti realistico, le risposte del mago devono essere consistenti per quanto riguarda i contenuti e i tempi di reazione. In particolare: situazioni simili devono provocare le stesse risposte, e queste devono essere conformi alle aspettative dell'utente. Per esempio, se il mago fosse troppo lento a rispondere, l'utente potrebbe pensare di aver fornito una richiesta scorretta o che il sistema è sovraccarico.

=== Prototipi wire-frame

I prototipi wire-frame prendono il nome dai modelli _wire frame_ della grafica computerizzata. Sono prototipi interattivi a bassa fedeltà, di solito usa e getta, nei quali la grafica è estremamente semplificata, e mostra solo i contorni degli oggetti. Permettono di sperimentare le modalità principali di interazione, prima che i dettagli della grafica siano definiti.

=== Pagine ipertestuali

Un'altra tecnica utile per costruire prototipi iniziali fa uso di strumenti per la costruzione di ipertesti. In questo caso, il prototipo è costituito da una serie di immagini che rappresentano l'aspetto del prodotto in corso di progettazione. Le varie snapshot sono legate fra loro da link ipertestuali, cliccando i quali l'utente passa da una snapshot all'altra, simulando così l'interazione con il prodotto. Possono essere realizzati facilmente, a costi molto limitati. Quelli più usati sono i programmi per la costruzione di presentazioni (PowerPoint); in questo caso:

- ogni snapshot del prodotto viene rappresentata su una slide;
- su ogni snapshot vengono realizzate aree cliccabili di forma opportuna con link ad altre slide;
- cliccando su queste aree, l'utente naviga nell'ipertesto, simulando l'interazione con il prodotto.

#figure(
	image("images/prot_powerpoint.png", width: 60%),
	caption: [Prototipo PowerPoint del cellulare da polso]
)

Si tratta della slide iniziale dell'ipertesto, sulla quale sono state definite diverse aree cliccabili, corrispondenti ai vari bottoni virtuali dell'orologio. Cliccando sull'area inferiore, comparirà una serie di icone associate ai casi d'uso principali, disegnati su una seconda slide.

*Vantaggi:* i prototipi sono facili da realizzare e da modificare e l'interazione risulta più realistica e fluida.

*Svantaggi:* permettono solo interazioni semplici, di tipo point & click. Interazioni più complesse non hanno più un costo ragionevole e devono venir simulate in modo approssimato. Ci sono dei limiti pratici alla complessità degli ipertesti realizzabili, superati i quali il prototipo diventa poco gestibile da chi lo sviluppa. La soglia di ingestibilità è intorno alle 150 slide. Per questo conviene spezzare i prototipi più complessi in ipertesti separati, ciascuno dedicato a uno specifico aspetto del sistema. Altri strumenti per costruire ipertesti sono i generatori di pagine HTML come Dreamweaver. In ogni caso, è bene evitare di usare strumenti di prototipazione che creino difficoltà tecniche, o che il progettista non padroneggi completamente. \
\
Per costruire più rapidamente i prototipi digitali, senza disegnare ogni elemento da zero, si usano i _design stencil_ e le librerie preconfezionate: raccolte di componenti d'interfaccia già pronti (pulsanti, menu, barre, icone, ecc.) da inserire nel prototipo. Usare i componenti ufficiali di una piattaforma rende il prototipo più realistico. Alcune risorse utili, tutte disponibili in Figma:

- gli UI kit ufficiali di Apple (Apple Design Resources) per iOS e iPadOS 27 e per macOS 27;
- il Material 3 Design Kit di Google, con componenti e stili del Material Design 3;
- le librerie e i template gratuiti modificabili della Figma Community.

== Prototipi intermedi

I prototipi iniziali, come abbiamo visto, sono spesso usa e getta: si costruiscono con le tecnologie più semplici, allo scopo di avere dei rapidi feedback sulle idee iniziali della progettazione. Quando il design concept è definito, potrà iniziare la realizzazione effettiva del sistema, attraverso un numero adeguato di iterazioni. Da questo momento in poi, almeno per quanto riguarda i prodotti software, si cercherà di sviluppare i prototipi utilizzando le tecnologie finali. \
Le strategie che guidano il processo dovranno essere definite di volta in volta, a seconda del particolare tipo di sistema. Per esempio, nei siti web si prevedono due prototipi intermedi: il prototipo di comunicazione (forma finale della grafica) e il prototipo funzionale (funzioni interattive).
I prototipi intermedi permettono di provare specifici aspetti del prodotto, ma non ancora le sue funzioni complessive, che potranno essere esercitate soltanto alla fine del processo. Sviluppando i prototipi con le tecnologie finali, se tutto procede per il meglio il sistema evolve per ampliamenti successivi e per modesti rifacimenti a partire da una base di codice iniziale.

== Prototipi finali

Nelle prove d'uso dei prototipi finali non dovrebbero quindi esserci troppe sorprese. Le prove finali però sono molto importanti, perché è solo quando il sistema è sostanzialmente finito che si potranno condurre prove complete per i compiti per i quali è stato costruito.
\
Nel caso per esempio di un sito web, il prototipo finale è il sito completo, con i suoi contenuti definitivi, le funzionalità collaudate e con una base di dati reali o comunque significativi. Su questo sito si potranno fare prove sofisticate, in scenari d'uso completi e di notevole complessità.

= Principi e linee guida
Per aiutare il progettista di sistemi interattivi usabili, è utile fornirgli delle indicazioni che si siano dimostrate valide in progetti simili al suo. Le indicazioni possono essere più o meno _generali_ (alcune applicabili in ogni situazione, altre in casi specifici) o più o meno _coercitive_ (alcune sono semplici suggerimenti, che possono essere seguiti a discrezione del progettista, altre sono vincolanti, e devono essere seguite obbligatoriamente). \
Queste indicazioni possono essere classificate in quattro grandi categorie, in funzione del loro livello di generalità e coercitività, come mostrato nella seguente figura.

#let W = 9cm
#let H = 4.5cm
#let x0 = 1.4cm        // left edge of the dashed grid
#let y0 = 0.8cm        // top edge of the dashed grid
#let ox = 1.0cm        // x of the vertical axis
#let oy = y0 + H + 0.25cm  // y of the horizontal axis
#let dashed = (thickness: 0.5pt, dash: "dashed")

#let arrow-head(angle) = rotate(angle, origin: center + horizon, polygon.regular(size: 0.28cm, vertices: 3, fill: black))

#let vlabel(txt, cy) = place(
  top + left,
  dx: 0.45cm - 0.7cm,
  dy: cy - 0.25cm,
  rotate(-90deg, origin: center + horizon, box(width: 1.4cm, height: 0.5cm, align(center + horizon, txt))),
)

#figure(
  box(width: W + 3.8cm, height: H + 2.2cm)[
    // dashed grid: outer rectangle and the two midlines
    #place(top + left, dx: x0, dy: y0, rect(width: W, height: H, stroke: dashed))
    #place(top + left, dx: x0 + W / 2, dy: y0, line(length: H, angle: 90deg, stroke: dashed))
    #place(top + left, dx: x0, dy: y0 + H / 2, line(length: W, stroke: dashed))

    // axes
    #place(top + left, dx: ox, dy: oy, line(start: (0cm, 0cm), end: (0cm, -(oy - 0.45cm)), stroke: 1pt))
    #place(top + left, dx: ox - 0.14cm, dy: 0.28cm, arrow-head(0deg))
    #place(top + left, dx: ox, dy: oy, line(start: (0cm, 0cm), end: (x0 + W + 0.5cm - ox, 0cm), stroke: 1pt))
    #place(top + left, dx: x0 + W + 0.38cm, dy: oy - 0.14cm, arrow-head(90deg))

    // axis titles
    #place(top + left, dx: 0cm, dy: 0cm, [*generalità*])
    #place(top + left, dx: x0 + W + 0.7cm, dy: oy - 0.2cm, [*coercitività*])

    // axis value labels
    #vlabel("alta", y0 + H / 4)
    #vlabel("bassa", y0 + 3 * H / 4)
    #place(top + left, dx: x0, dy: oy + 0.2cm, box(width: W / 2, align(center)[bassa]))
    #place(top + left, dx: x0 + W / 2, dy: oy + 0.2cm, box(width: W / 2, align(center)[alta]))

    // quadrant labels
    #place(top + left, dx: x0, dy: y0, box(width: W / 2, height: H / 2, align(center + horizon)[*principi*]))
    #place(top + left, dx: x0 + W / 2, dy: y0, box(width: W / 2, height: H / 2, align(center + horizon)[*standard*]))
    #place(top + left, dx: x0, dy: y0 + H / 2, box(width: W / 2, height: H / 2, align(center + horizon)[*linee \ guida*]))
    #place(top + left, dx: x0 + W / 2, dy: y0 + H / 2, box(width: W / 2, height: H / 2, align(center + horizon)[*regole \ di progetto*]))
  ],
  caption: [Classificazione delle indicazioni per il progettista],
)
- _Regole di progetto_ \
	Sono le regole che *devono* essere applicate nell'ambito di uno specifico progetto. Hanno bassa generalità, ma alta coercitività: sono imposte dal committente, e vincolanti per il progettista. Di solito sono regole piuttosto dettagliate, che specificano le modalità d'interazione con un certo sistema, per esempio per renderlo consistente con altri sistemi della stessa organizzazione. Esempi tipici sono le regole che definiscono l'apparenza grafica dell'interfaccia con l'utente: i fonti usati, i formati ammessi per i campi di input, ecc.
- _Standard_ \
	Sono norme di tipo generale, emesse da organismi internazionali, che definiscono le regole da applicare nei progetti di determinate classi di sistemi. Sono vincolanti per tutti i progetti che dichiarano di essere conformi allo standard. Sono emessi da enti di standardizzazione, come ISO, o das altri enti dipendenti, che hanno l'obiettivo di definire delle raccomandazioni da seguire per certe categorie di sistemi. Le raccomandazioni definiscono degli _standard di fatto_. La conformità ad uno standard deve essere valutabile in modo preciso, e quindi gli standard devono essere formulati con estrema cura, per evitare ambiguità. Gli standard sono meno specifici delle regole di progetto perchè devono essere applicabili a intere classi di sistemi.
- _Linee guida_ \
	Sono delle raccomandazioni per il design dell'interazione di specifiche classi di sistemi, espresse in modo più o meno generale, a seconda dei casi. Sono spesso corredate di esempi e motivazioni. Non sono vincolanti, sta al progettista decidere sull'opportunità di applicarle caso per caso. Sono importanti le linee guida per l'interfaccia utente di applicazioni relative a una specifica piattaforma, come Apple, Windows, e così via. Il loro scopo è quello di garantire un'elevata uniformità della user experience di tutte le applicazioni sviluppate per la specifica piattaforma. Altre sono indipendenti dalla piattaforma, dette _cross-platform guidelines_.
- _Principi_ \
	Sono indicazioni generali per la progettazione di interfacce utente usabili, basate su evidenze scientifiche o sul generale consenso. Derivano dalla conoscenza degli aspetti fisiologici, psicologici e sociali degli utenti e dall'esperienza accumulata nella pratica della progettazione dei sistemi usabili. Sono indipendenti dalla tecnlogia, e sono espressi spesso in forma molto generale. I principi del diagolo con i sistemi interattivi descritti nel documenti ISO 9241-110 sono particolarmente importanti.
== Gli standard della human-system interaction
L'ente principale della progettazione degli standard è l'ISO (_International Standard Organization_). I prodotti principali dell'ISO sono dei documenti chiamati _International Standard (IS)_, che vengono redatti da appositi commitati tecnici (_Technical Commitee, TC_) rappresentativi degli interessi delle parti coinvolte. \
Gli standard principali che riguardano l'usabilità sono:
- ISO 13407 \
	Si intitola _Human-cetred design processes for interactive systems_, ed ha lo scopo di aiutare coloro che hanno la responsabilità di gestire i processi di progettazione hardware e software a pianificare in modo adeguato le attività di progettazione human-centred.
- ISO 9241 \
	Si tratta dello standard principale relativo alla human-computer interaction. È molto ampio, ed è composto da numerosi documenti separati, in evoluzione da una ventina d'anni.  \
	Inizialmente, questo standard trattava gli aspetti ergonomici dei terminali video utilizzati per il lavoro di ufficio, e si intitolava _Ergonomic requirements for office work with visual display terminals (VDTs)_. Adesso, tratta problematiche di usabilità dei sistemi interattivi in generale. Pertanto, è stato rinominato come _Ergonomics of Human System Interaction_. Alcuni documenti pubblicati dell'ISO 9241 sono i seguenti:
	#figure(
  block(
    stroke: 0.5pt,
    inset: 10pt,
    width: 100%,
    align(left)[
      #set text(size: 8pt)
      #set par(leading: 0.5em)
      Part 1: General introduction \
      Part 2: Guidance on task requirements \
      Part 4: Keyboard requirements \
      Part 5: Workstation layout and postural requirements \
      Part 6: Guidance on the work environment \
      Part 9: Requirements for non-keyboard input devices \
      Part 11: Guidance on usability \
      Part 12: Presentation of information \
      Part 13: User guidance \
      Part 14: Menu dialogues \
      Part 15: Command dialogues \
      Part 16: Direct manipulation dialogues \
      Part 17: Form filling dialogues \
      Part 20: Accessibility guidelines for ICT equipment and services \
      Part 100: Introduction to standards related to software ergonomics \
      Part 110: Dialogue principles \
      Part 129: (DIS) Guidance on software individualization \
      Part 151: Guidance on World Wide Web user interfaces \
      Part 171: Guidance on software accessibility \
      Part 210: Human-centred design for interactive systems \
      Part 300: Introduction to electronic visual display requirements \
      Part 302: Terminology for electronic visual displays \
      Part 303: Requirements for electronic visual displays \
      Part 304: User performance test methods for electronic visual displays \
      Part 305: Optical laboratory test methods for electronic visual displays \
      Part 306: Field assessment methods for electronic visual displays \
      Part 307: Analysis and compliance test methods for electronic visual displays \
      Part 308: Surface-conduction electron-emitter displays (SED) \
      Part 309: Organic light-emitting diode (OLED) displays \
      Part 400: Principles and requirements for physical input devices \
      Part 410: Design criteria for physical input devices \
      Part 420: (DIS) Selection procedures for physical input devices \
      Part 910: (DIS) Framework for tactile and haptic interaction \
      Part 920: Guidance on tactile and haptic interactions
    ],
  ),
  caption: [Alcuni documenti dell'ISO 9241],
)
- ISO 14915 \
	Si intitola _Software ergonomics for muiltimedia user-interfaces_, ed è composto da tre documenti.
	+ _Design principles and framework_;
	+ _Multimedia navigation and control_;
	+ _Media selection and combination_
	Questo standard descrive principi e raccomandazioni per la progettazione di sistemi multimediali. In particolare tratta l'interfaccia utente di applicazioni che incorporano, integrano e sincronizzano media differenti, statici (testo, immagini e così via) o dinamici (audio, animazioni e così via).
Esistono diverse tipologie di standard. Gli _standard di processo_ definiscono le caratteristiche di determinati processi di lavoro (come nel caso dell'ISO 13407). Altri sono _standard di protodotto_ che specificano le caratteristiche devono possedere determinate categorie di prodotti (come vari documenti dell'ISO 9241). Molto documenti, inoltre, hanno lo scopo di _definire la terminologia_ da usarsi in un determinato ambito. Questo è un compito importante che permette ai vari operatori di utilizzare un linguaggio comune in modo non ambiguo.
== I principi del dialogo secondo la ISO 9241-110
Descriviamo la parte 110 dell'ISO 9241, intitolata _Dialogue principles_. Si tratta di un documento breve, ma importante, destinato a:
- coloro che si occupano di analisi dei requisiti (di mercato, degli utenti e di sistema);
- progettisti degli strumenti e della "guida di stile" necessari per la progettazione e lo sviluppo delle interfacce utente;
- progettisti che utilizzano tale normativa come guida durante il processo di sviluppo;
- valutatori che hanno la possibilità, grazie a tale guida, di garantire che i prodotti soddisfino le raccomandazioni generali di progettazione contenute nel documento normativo stesso;
- gli acquirenti, come riferimento per la stesura dei contratti di acquisto dei prodotti.
Il documento descrive sette _principi del dialogo_, ovvero sette caratteristiche che ogni dialogo fra un utente e un sistema interattivo dovrebbe possedere. Il dialogo è inteso come sequenza di azioni dell'utente (input) e di risposte del sistema (output) per raggiungere un obiettivo. I sette principi del dialogo sono i seguenti.
- _Adeguatezza al compito_ \
	Un sistema interattivo è adeguato al compito se suipporta l'utente nel completamento del compito, cioè quando le funzionalità del sistema e il dialogo sono basati sulle caratteristiche del compito, piuttosto che sulla tecnlogia scelta.
- _Auto-descrizione_ \
	Un dialogo è auto-descrittivo se agli utenti risulta evidente, in qualsiasi momento, in che dialogo si trovano, a che punto si trovano all'interno del dialogo, quali azioni possono compiere e come possono essere eseguite.
- _Conformità delle aspettative dell'utente_ \
	Un dialogo è conforme alle aspettative dell'utente se corrisponde alle necessità dell'utente, prevedibili in base al contesto e a convenzioni comunemente accettate.
- _Adeguatezza all'apprendimento_ \
	Un dialogo è adeguato all'apprendimento se supporta e guida l'utente nell'apprendimento del sistema.
- _Controllabilità_ \
	Un dialogo è controllabile se l'utente è in grado di iniziare e tenere sotto controllo la direzione e i tempo dell'interazione fino al raggiungimento dell'obiettivo.
- _Tolleranza verso gli errori_ \
	Un dialogo tollera gli errori se, nonostante gli errori negli input, i risultati desiderati possono essere ottenuti senza o con minime azioni correttive. La tolleranza per gli errori si ottiene attraverso:
	+ il controllo degli errori;
	+ la correzione degli errori;
	+ la gestione degli errori, per fronteggiare gli errori occorsi.
- _Adeguatezza all'individualizzazione_ \
	Un dialogo è adeguato all'individualizzazione se l'utente può modificare l'interazione e la presentazione dell'informazione per adattarle alle proprie necessità e capacità individuali.
Per ciascuno di questi principi, lo standard ISO 9241-110 fornisce una lista di raccomandazioni che dovrebbero essere tenute in considerazione nella progettazione di un sistema. Le raccomandazioni non sono fra loro indipendenti, e ci sono diverse sovrapposizioni.
=== Adeguatezza al compito
Questo principio afferma che le funzionalità e le modalità d'interazione del sistema devono essere modellate sulle caratteristiche del compito che l'utente deve compiere con il supporto del sistema, e non sulla tecnologia o delle caratteristiche del sistema stesso. In pratica, il dialogo dovrà essere progettato a partire dai casi d'uso identificati nell'analisi dei requisiti. Per ogni caso d'uso, dovrà permettere all'utente di svolgere i compiti e le azioni necessarie nella sequenza più naturale per lui, e non per il software. \
Alcune linee guida sono le seguenti.
- Dialogo adeguato al compito. \
	I passi del dialogo dovrebbero essere adeguati al compito: dovrebbero essere inclusi tutti i passi necessari ed evitati quelli non necessari. Il dialogo dovrebbe assegnare al sistema tutte le operazioni che possono essere automatizzate. Le operazioni assegnate all'utente dovrebbero essere eseguite con facilità.
- Informazione adeguata al compito. \
	Questa linea guida è un caso particolare della precedente, e richiede che il sistema presenti all'utente tutte le informazioni utili per lo svolgimento del compito. Le soluzioni migliori sono quelle in cui l'informativa all'utente varia in funzione del contesto. In questo modo, si trasmettono all'utente solo le informazioni utili nello svolgimento di un particolare passo del dialogo.
- Dialogo essenziale. \
	Il sistema dovrebbe evitare di presentare all'utente informazioni ridondanti. La comunicazione dovrebbe esere breve, diretta ed essenziale. Occorre sempre evitare di duplicare l'informazione. Ogni duplicazione genera dubbi nell'utente e ne distoglie l'attenszione dal compito principale.
- Dispositivi di input e output adeguati al compito. \
	La tecnlogia mette a disposizione molti dispositivi di input e di output per realizzare il dialogo con l'utente. Quelli utilizzati dovrebbero essere scelti in funzione del compito specifico, e non viceversa. A volte il compito può richiedere, per una migliore efficienza, l'utilizzo contemporaneo di più dispositivi.
- Formati di input e output adeguati al compito. \
	I formati dei dati di input e output dovrebbero essere adeguati al compito. Per esempio, un programma finanziario dovrebbe accettare valori con non più di due decimali. Un altro esempio significativo è costituito dai numeri di telefono.
- Default tipici. \
	Una corretta impostazione dei valori di default può semplificare molto il dialogo. Essi dovrebbero essere impostati in modo da riflettere le scelte più comuni. Per esempio, in un distributore di biglietti ferroviari, la stazione di partenza di default potrebbe essere quella in cui ci si rova. Un'adeguata impostazione dei valori di default è particolarmente importante in quelle funzionalità che richiedono all'utente di specificare molti parametri, come per esempio nei programmi di frafica più sofisticati. In questo caso un utente poco esperto potrebbe affidarsi ai valori di default quando non ne conosce il significato.
- Compatibilità con i documenti. \
	Questa indicazione è particolarmente importante nel progetto di sistemi informativi aziendali. Essa si applica quando un documento cartaceo è la fonte dei dati che devono essere immessi nel sistema, o quando né è la destinazione. In entrambi i casi conviene che il layout delle informazioni sul video e sul documento siano congruenti. Nel primo caso, per rendere più scorrevoli le operazioni di immissione dei dati. Nel secondo caso, per evitare all'utente la complessità di gestire gli stessi dati visualizzati in modo diverso.
=== Auto-descrizione
Questo principio richiede che il sistema comunichi all'utente, in ogni momento, che cosa può fare e come, e che cosa sta accadendo, con lo scopo di ridurre il _golfo dell'esecuzione_ e il _golfo della valutazione_. Nella maggior parte dei casi, questa comunicazione utilizza il canale visivo, con informazioni testuali o grafiche. Possono però essere utilizzati anche altri canali, per esempio quello auditivo. \
Alcune linee guida da seguire nella progettazione di un dialogo autodescrittivo sono le seguenti.
- Guida per l'utente. \
	Ogni passo del dialogo dovrebbe fornire all'utente tutte le informazioni utili per proseguire. Le informazioni sono sostanzialmente di tre tipi: istruzioni operative (cosa può fare l'utente), informazioni sullo stato del sistema (cosa sta facendo il sistema) e informazioni di feedback (l'output conseguente all'input dell'utente). La guida all'utente non dovrebbe essere eccessivamente vincolante: egli dovrebbe essere sempre libero di modificare lo svolgimento del dialogo secondo le sue esigenze, in modo flessibile. La flessibilità è importante e l'ISO 9241 la sancisce dedicandole uno dei sette principi di base.
- Interazione evidente. \
	Questa linea guida raccomanda che i dialoghi siano progettati in modo che l'interazione con il sistema risulti evidente.
	#figure(
		image("images/interazione.png", width: 70%),
		caption: [Home page di un vecchio sito della Mulino Bianco]
	)
	L'home page in figura ha un'interazione non evidente. La parte centrale della pagina, destinata a contenere il menu principale, è muta, ma passando il mouse su ciascuna delle tree aree appaiono le voci di un menu. Per conoscere lo scopo del sito è necessario esplorare la pagina col mouse.
- Descrizione dell'input atteso. \
	Anche questa raccomandazione è un caso particolare della prima. Ogni volta che il sistema richiede un input all'utente, dovrebbe fornirgli informazioni adeguate su ciò che si aspetta, e sul suo formato. Quindi, sono da evitare dialoghi che contengono campi liberi, come il seguente:
	#align(center)[DATA DI NASCITA: #box(width: 6cm, line(length: 100%, stroke: 0.5pt))]
	che andrebbero sostituiti con input guidati, per esempio:
	#align(center)[
		DATA DI NASCITA: #box(width: 1cm, line(length: 100%, stroke: 0.5pt))/#box(width: 1cm, line(length: 100%, stroke: 0.5pt))/#box(width: 2cm, line(length: 100%, stroke: 0.5pt)) (gg/mm/aaaa)
	]
- Stato visibile. \
	Questa è una delle raccomandazioni più importanti. L'utente dovrebbe essere sempre informato sullo stato del sistema, sia quando questo è in attesa di input, sia quando ha elaborato l'input che gli è stato appena fornito. Se l'utente non conosce lo stato in cui si trova il sistema, non può prevedere come risponderà alle sue azioni. Un sistema muto, genera incertezza e stress, anche quando va tutto bene.
- Formati descritti. \
	Il sistema dovbrebbe fornire all'utente ogni informazione sui formati e sulle unità di misura utilizzati.
- Manualistica minima. \
	Durante l'interazione, si dovrebbe minimizzare la necessità di consultare manuali d'uso o altre informaszioni presenti fuori dal sistema. Tutta l'informazione necessaria dovrebbe essere consultabile in linea, senza uscire dal sistema, preferibilmente con sistemi di help.
=== Conformità alle aspettative
Questo principio afferma che il dialogo dovrebbe essere conforme a ciò che l'utente si aspetta, in relazione allo specifico contesto d'uso del sistema, e alle convenzioni comunemente adottate. Si tratta di un principio generale, che può essere applicato a situazioni diverse. Le implicazioni sono tante e ne analizzeremo alcune.
- Linguaggio familiare. \
	Il sisteam dovrebbe utilizzare un linguaggio che l'utente conosce bene. Questa raccomandazione è importante, perchè la maggiuor parte dei dialoghi con i sistemi interattivi avviene attraverso il linguaggio. Un suo uso improprio può compromottere l'usabilità.
- Aderenza alle convenzioni. \
	Il dialogo dovrebbe seguire le convenzioni comunemente adottate nello specifico contesto. Ad esempio, in un sito web di un paese occidentale, il menu di navigazione orizzontale è allineato a sinistra, leggendolo da sinistra a destra. In un sito arabo, i menu sono allineati a destra.
- Organizzazione abituale. \
    La struttura del dialogo e l'organizzazione dei dati dovrebbero permettere all'utente di effettuare le operazioni secondo le modalità a lui consuete. Per esempio, nel caso delle pagine web, lo studio empirico di Bernard (2001) mostra dove gli utenti si aspettano abitualmente di trovare i diversi componenti funzionali (link interni al sito a sinistra, link esterni a destra, link alla home page in alto a sinistra, motore di ricerca interno in alto al centro, e funzionalità come login/registrazione, carrello e help in alto a destra). Per seguire questa indicazione, il progettista deve tenere presente che le abitudini degli utenti si formano e modificano rapidamente, e spesso in modo inconsapevole.- Dialogo consistente. \
	Le aspettative dell'utente si formano anche nell'ambito di uno stesso sistema. Se questi si comporta in un certo modo in una data situazione, l'utente si aspetterà un comportamento analogo in situazioni simili. Pertanto, tutti i dialoghi realizzati da uno stesso sistema dovrebbero avere aspetto e comportamenti consistenti.
- Feedback conforme alle aspettative. \
	È utile che il feedback sia ben comprensibile e specifico: l'utente dovrebbe essere in grado di interpretarlo senza fatica. Meglio ancora, dovrebbe essere formulato nel modo che l'utente si aspetta. Importante è la sua tempestività. Tempi di risposta fino a 0.1 secondi sono percepiti come immediati. Tempi di risposta da 0.1 a 1 secondo non sono percepiti come immediati, ma non sono sufficientemente lunghi da compromettere la continuità cognitiva  del compito che l'utente sta svolgendo. Invece, 10 secondi costituiscono il limite massimo per mantenere l'attenzione dell'utente focalizzata sul compito in corso. Per tempi più lunghi, l'utente desidererà probabilmente dedicarsi ad altri compiti.
- Tempi di risposta conformi alle aspettative. \
	L'utente si forma delle aspettative sul tempo di esecuzione delle elaborazioni richieste. Se questo dovesse deviare sensibilmente da queste aspettative, dovrebbe esserne preventivamente informato. Se la risposta del sistema tarda troppo, o se il sistema rimane muto, può sorgere il dubbio che si sia bloccato per qualche errore. Le operazioni che richiedono tempi lunghi sono critiche, e il sistema dovrebbe sempre indicare chiaramente cosa sta facendo, e quanto manca al completamento.
- Messaggi adeguati al contesto. \
	La lunghezza e il tipo dei messaggi prodotti dal sistema dovrebbero essere adeguati al contesto. Non tutti i messaggi sono adatti a ogni situazione, anche se il loro contenuto è pertinente.
- Messaggi in posizione appropriata. \
	I messaggi di feedback e le spiegazioni fornite all'utente dovrebbero apparrire dove si trova il focus dell'; attenzione dell'utente, per non interrompere il flusso dell'interazione. Per esempio, in un sistema controllato per mezzo di un telecomando, i messaggi di feedback dovrebbero apparire dove l'utente dirige il telecomando stesso, poiché è lì che guarda.
- Input in posizione attesa. \
	Il sistema dovrebbe richieder l'input all'utente nella posizione in cui questi si aspetta di doverlo fornire. Questa indicazione è simile alla precedente, e si riferisce soprattuto ai dialoghi in cui l'utente deve fornire input ripetuti. Per esempio, durante il controllo ortografico di un testo, il word processor presenta via via all'utente le frasi da correggere, chiedendogli di accettare la correzione proposta o di confermare il testo senza modifiche. Per permettere all'utente di eseguire il compito con la massima efficienza, i bottoni per la conferma o la sostituzione dovrebbero apparire sempre nella stessa posizione.
- Stile coerente dei messaggi. \
	Lo stile dei messaggi prodotti dal sistema è importante. L'utente si aspetta essi siano espresei in una forma coerente con il contesto e con le convenzioni correnti. In particolare, essi dovrebbero essere formulati in modo oggettivo e costruttivo, evitando qualunque connotazione negativa o enfatica. Questa raccomandazione è importante nel caso dei messaggi di errore, che non dovrebbero mai rimproverare l'utente, anche se in modo implicito, per ciò che ha fatto.
=== Adeguatezza all'apprendimento
Questo principio si riferisce alla _learnability_. Esso auspica che il dialogo sia organizzato in modo tale da aiutare e guidare l'utente nell'apprendimento del sistema. Alcune linee guida sono le seguenti.
- Bassa soglia di apprendimento. \
	Ogni sistema dovrebbe essere utilizzabile, sia pure in modo elementare, anche con un livello di apprendimento minimo. L'utente inesperto dovrebbe essere comunque in grado di usare le funzioni di base con un addestramento molto limitato, o meglio ancora, senza alcun addestramento. Di fronte a un nuovo sistema, gli utenti preferiranno provarlo direttamente, esplorandone subito almeno le funzioni più semplici. Il sistema dovrebbe facilitare questa esplorazione, e fornir loro, le informazioni necessarie per un utilizzo più avanzato. Molto importanti, per facilitare l'accesso iniziale al sistema, sono i valori di default dei principali parametri che dovranno essere scelti in accordo alle modalità d'uso più comuni degli utenti inesperti.
- Aiuto alla familiarizzazione. \
	Il sistema dovrebbe aiutare l'utente a prendere familiarità con il dialogo, fornendo tutti gli aiuti necessari.
- Aiuto online. \
	Nel punto precedente, è il sistema che suggerisce all'utente le azioni per prendere familiarità con le diverse funzioni. Tuttavia, è necessariuo anche dare all'utente la possibilità di chiedere aiuto quando è lui che lo desidera. Questo è lo scopo dei vari sistemi di _help online_, tradizionalmente disponibili nei prodotti software. In molti casi, ci si può limitare alla tecnica, molto più semplice, delle _FAQ (Frequently Asked Question)_, presenti in quasi tutti i servizi online.
- Feedback intermedi. \
	Il diagolo dovrebbe fornire dei feedback sui risultati intermedi e finali di un compito, in modo che l'utente possa imparare dai compiti portati a termine con successo. Questa tecnica è utilizzata di frequente per le transazinoi che avvengono sul Web. Per esempio, quando si acquista un prodotto, l'utente riceve delle indicazioni che gli permettono di comprendere quali fasi del dialogo ha superato e quali informazioni dovrà ancora fornire per concludere la transazione.
- Modello concettuale evidente. \
	Il sistema dovrebbe aiutare l'utente a costruirsi un modello concettuale appropriato del sistema. Il sitema dovrebbe mostrare chiaramente una propria logica interna, il più possibile semplice e coerente. Lo scopo è di permettere all'utente di orientarsi, con facilità anche per l'esecuzione di compiti che richiedono funzioni non ancora utilizzate. La tecnica più frequente è quella di fornire un modello gerarchico delle funzini del sistema, attraverso un sistema di menu. Questa tecnica, però, è inadeguata per sistemi che hanno un numero di funzionalità molto elevato. In tali casi, le funzionalità sono rappresentate in forma iconica, come le applicazioni Office.
- Sperimentazione sicura. \
	Il modo più naturale di imparare a usare un sistema è di sperimentarne l'uso. Un sistema ben progettato dovrebbe permettere all'utente di provarne le funzioni, senza che ciò produca conseguenze negative. Questo si può ottenere mettendo a disposizione dell'utente una funzione di _undo_, che consenta di annullare le conseguenze indesiderate delle sue azioni. Le azioni che non potranno essere annullate dovrebbero essere preventivamente segnalate all'utente in modo chiaro, per esempio con un messaggio di avvertimento e una richiesta di conferma.
- Riapprendimento facilitato. \
	In tutti i sistemi eesistono funzioni che sono usate raramente. Per esempio, in un sistema di contabilità aziendale le funzioni relative alla compilazione del bilancio sono eseguite una solta volta l'anno. Può accadere che l'utente dimentichi come utilizzare queste funzionalità, e le debba apprendere di nuovo. Il sistema dovrebbe fornire un aiuto per questo riapprendimento, trattando le funzioni di uso non frequente in modo particolare. Questo è importante nel caso di funzionalità di utilizzo raro ma di elevata criticità. Ad esempio, in un sistema di sorveglianza domestica, le funzioni che permettono all'utente di intervenire in caso di allarme sono usate molto di rado. Quindi è facile che l'utente si dimentichi come interagire col sistema in caso di allarme, il sistema dovrà ricordargli in modo chiaro, e rapidamente, come intervenire.
=== Controllabilità
Questo principio afferma che è l'utente che deve guidare il sistema. Ciò significa che egli nno deve essere costretto a seguire una sequenza rigidamente di passi d'interazione: egli dovrebe poter decidere di sospondere il dialogo quando lo desidera, per riprenderlo successivamente, e di fornire le informazioni richieste dal sistema nell'ordine che gli è più congeniale. Dovrebbe poter cambiare idea durante l'interazione, e modificare gli input da lui già forniti. Quindi, l'interazione deve essere controllata dall'utente, e non dal sistema. Per raggiungere questo obiettivo è importante seguire le linee guida seguenti.
- Tempi dell'interazione controllati dall'utente. \
	L'utente dovrebbe poter impiegare tutto il tempo che desidera per effettuare i vari passi del dialogo, senza che il sistema gli ponga dei vincoli. I time-out imposti dal sistema, andrebbero introdotti solo in casi di effettiva necessità. Questa raccomandazione può essere in conflitto con esigenze di sicurezza, come avviene in alcune transazioni sul Web. Per esempio, durante l'acccesso ad una banca online, dopo un periodo d'inattività da parte dell'utente l'applicazione chiude automaticamente la sessione per evitare che utenti non autorizzati possano subentrare ed effettuare transazioni illecite. Questa indicazioni si applicano anche ai messaggi inviati dal sistema. È pratica socorretta far sì che i messaggi restino visibili per un tempo limitato, e poi siano automaticamente rimossi.
- Proseguimento del dialogo controllato dall'utente. \
	L'utente dovrebbe poter decidere come proseguire nel dialogo, senza che il sistema imponga vincoli rigidi. A volte può essere opportuno permettergli di effettuare uno o più compiti secondari durante l'esecuzione del compito principale.
- Punto di ripartenza controllato dall'utente. \
	Se il dialogo è stato interrotto per qualche motivo, l'utente dovrebbe poter scegliere il punto dal quale riprenderlo, se ciò è compatibile con il compito. Per esempio, se l'utente deve interrompere la compilazione di un SMS per rispondere a una chiamata, il sistema dovrebbe archiviarlo automaticamente in bozza, per consentirgli di riprendere da dove era stato interrotto.  Spesso il dialogo viene interrotto perchè l'utente si accorge di dover modificare qualche input da lui fornito in precedenza. Anche in quetso caso, il sistema dovrebbe permettergli di ripartire dal punto desiderato, senza ripartire da capo.
- Reversibilita delle operazioni. \
	Se le operazioni sono reversibili e se il contesto d'uso lo permette, dovrebbe essere sempre possibile annullare almeno il passo più recente del dialogo. La disponibilità di una funzionalità di _undo_ (e _redo_) migliora l'usabilità di un sistema, perchè permette di eliminare le conseguenze di azioni errate, ed elimina l'ansia causata dal timore di commettere errori.
- Modalità di visualizzazione dei dati controllata dall'utente. \
	È utile che l'utente possa tenere sotto controllo non soltanto la sequenza dei passi del dialogo, ma anche le modalità di visualizzazione dei dati necessari al compito. Questo è importante nel caso in cui essi siano numerosi: l'utente dovrebbe essere in gardo di controllare quali e quanti dati gli vengono mostrati.
- Dispositivo d'interazione scelto dall'utente. \
	All'utente dovrebbe essere permesse di scegliere uno dei qualsiasi dispositivi di input o output disponibili, se compatbili con il compito.
- Personalizzazione dei valori di default. \
	L'utente dovrebbe essere in grado di definire nuovi valori di default in accordo alle proprie personali esigenze, se compatibili con il compito.
- Disponibilità dei dati originali.  \
	Dopo la loro modifica, i dati originali dovrebbero rimanere disponibili all'utente, se necessari per il compito.
=== Tolleranza verso l'errore
Nell'interazione con il sistema, anche l'utente più esperto commette inevitabilmente degli errori. È compito dei progettisti concepire sistemi che riducano al minimo la possibilità che questi errori avvengano, e la gravità delle loro conseguenze. Un dialogo si dice _tollerante verso gli errori_ quando fornisce i risultati desiderati anche in presenza di errori dell'utente, senza (o con minime) azioni correttive da parte sua. \
Questa proprietà si ottiene mediatne accorgimenti dviersi, che permettano di prevenire gli errori quando è possibile, di segnalarli con chiarezza quando avvengono, suggerendo o effettuando automaticamente le azioni correttive appropriate. \
Le raccomandazioni contenute nell'ISO 9241 sono le seguenti.
- Assistenza all'utente. \
	Il sistema dovrebbe aiutare l'utente a evitare di commettere errori negli input da lui forniti, e a scoprire quelli che comunque vengono commessi.
- Verifica e convalida dei dati. \
	Prima di procedere all'elaborazione dell'input, il sistema dovrebbe verificarlo e convalidarlo.
- Prevenzione di azioni non lecite. \
	Il sistema dovrebbe evitare che un'azione dell'utente possa causare una caduta o uno stato indefinito del sistema.
- Richieste di conferma. \
	Prima di eseguire azioni che possano produrre conseguenze gravi e non annullabili, il sistema dovrebbe chiedere conferma all'utente.
- Spiegazione dell'errore. \
	Quando l'utente commette un errore, il sistema dovrebbe fornirgli una spiegazione adeguata, indicandone la causa dell'errore e la modalità di correzione.
- Spiegazioni aggiuntive. \
	Il sistema dovrebbe fornire all'utente, su sua richiesta, informazioni aggiuntive sulla natura dell'errore e sulla sua correzione.
- Assistenza per il recupero. \
	Quando l'utente commette un errore, il sistema dovrebbe fornirgli un supporto attivo per permettergli di ristabilire la situazione corretta.
- Minimo sforzo di correzione. \
	I passi necessari per correggere un errore dovrebbero essere semplificati al massimo.
- Correzione differibile. \
	L'utente dovrebbe poter rimandare la correzione dell'errore a un momento successivo, a meno che ciò non sia necessario per proseguire nel dialogo.
- Correzione automatica modificabile. \
	Quando il sistema è in grado di correggere automaticamente un errore commesso dall'utente, dovrebbe avvisarlo della correzione effettuta e permettergli di modificarla.
=== Adeguatezza all'individualizzazione
L'usabilità di un sistema è relativa a uno specifico utente, compito e contesto d'uso. È quindi utile che un sistema permetta all'utente di adattarne il comportamento alle proprie specifiche esigenze e capacità. Si dice allora che il sistema è _personalizzabile_ o, nel linguaggio dell'ISO 9241-110, _individualizzabile_.  \
La personalizzazione può riguardare aspetti diversi, come la lingua, le preferenze in relazione ai compiti da effettuare, le modalità di rappresentazione dei dati, e così via. Alcune linee guida da tenere presenti in relazione a questo principio sono le seguenti.
- Adattamento al profilo dell'utente. \
    Il sistema dovrebbe consentire di adattare l'interazione e la presentazione delle informazioni alle caratteristiche e alle preferenze specifiche del profilo del singolo utente.
- Scelta di rappresentazioni alternative. \
	Il sistema dovrebbe permettere all'utente di scegliere fra varie forme di rappresentazione, adatte alle diverse necessità individuali. Ad esempio, la seguente figura, mostra come l'utente possa scegliere il sistema di misura, la valuta, e la rappresentazione di ora, data e numeri presenti nel sistema operativo MacOS della Apple.
	#figure(
	image("images/individualizzazione.png", width: 70%)
	)
	Particolarmente importanti sono le possibilità di scelta di rappresentazioni alternative che rendano il sistema accessibile a utenti con disabilità (visive, auditive o di altro tipo).
- Scelta dei formati dei dati input e output. \
	L'utente dovrebbe poter scegliere le rappresentazioni più appropriate per il formato dei dati elaborati nello specifico contesto applicativo.
- Vocabolario personalizzabile. \
	In molti casi, è utile poter arricchire il vocabolario usato dal sistema, per aggiungere eventuali termini utilizzati nel contesto specifico.
- Scelta del livello delle spiegazioni. \
	Il livello di dettaglio e/ola forma delle spiegazioni dovrebbe essere modificabile in funzione del livello di conoscenza dell'utente.
- Personalizzazione dei tempi di risposta. \
	L'utente dovrebbe poter modificare i parametri relativi ai tempi di risposta dei dispositivi di input e di output, per adattarli alle proprie personali esigenze. Ad esempio, i sistemi operativi permettono di impostare vari parametri, come sensibilità del mouse e l'intervallo temporale accettato dal sistema per il \"doppio clic\", e altri, in funzione delle preferenze dell'utente.
- Scelta del metodo d'interazione. \
	Quando appropriato, l'utente dovrebbe poter scegliere fra diverse tecniche di dialogo metodi d'interazione. Per esempio, un word processor permette di salvare un documento selezionando la voce di un menu, o cliccando su un'icona, o digitando una combinazione di tasti.
- Personalizzazione del dialogo. \
	Se appropriato, l'utente dovrebbe poter modificare alcune componenti del dialogo, per adattarlo a specifiche necessità nell'effettuazione dei compiti. La personalizzazione può essere più o meno spinta. Per esempio, in un word processor l'utente può scegliere quali _toolbar_ debbano essere visualizzate. In questo modo, se l'utente non ha necessità di utilzizare strumenti di composizione grafica, potrà evitare di affollare il video con comandi che non gli servono.
- Ripristinabilità dei valori precedenti.
	I sistemi interattivi più evoluti forniscono di solito ampie possibilità di personalizzazione. Questo può creare delle difficoltà all'utente, che potrebbe dimenticare quali personalizzazioni ha attivato. È quindi importante che il sistema presenti un quadro chiaro del valore dei parametri, e che l'utente possa ripristinare facilmente le impostazioni di default o quelle da lui stesso definite precedentemente. Nel caso di sistemi utilizzati da più utenti, ciascuno di essi dovrebbe poter memorizzare i parametri di personalizzazione in un proprio profilo, per poter attivare velocemente la propria configurazione.
== Sintesi delle linee guida
Riassumendo le linee guida illustrate dall'ISO 9241-110 sono le seguenti.
- Adeguatezza al compito.
	- Dialogo adeguato al compito.
	- Informazione adeguata al compito.
	- Dialogo essenziale.
	- Dispositivi di I/O adeguati al compito.
	- Formati di I/O adeguati al compito.
	- Default tipici.
	- Compatibilità con i documenti.
- Auto-descrizione.
	- Guida per l'utente.
	- Interazione evidente.
	- Descrizione dell'input atteso.
	- Stato visibile.
	- Formati descritti.
	- Manualistica minima.
- Conformità alle aspettative dell'utente.
	- Linguaggio familiare.
	- Aderenza alle convenzioni.
	- Organizzazione abituale.
	- Dialogo consistente.
	- Feedback conforme alle aspettative.
	- Tempi di risposta conformi alle aspettative.
	- Messaggi adeguati al contesto.
	- Input in posizione attesa.
	- Stile coerente dei messaggi.
- Adeguatezza all'apprendimento.
	- Adattamento al profilo dell'utente.
	- Bassa soglia di apprendimento.
	- Aiuto alla familiarizzazione.
	- Aiuto online.
	- Feedback intermedi.
	- Modello concettuale evidente.
	- Sperimentazione sicura.
	- Riapprendimento facilitato.
- Controllabilità.
	- Tempi dell'interazione controllati dall'utente.
	- Proseguimento del dialogo controllato dall'utente.
	- Punto di ripartenza controllato dall'utente.
	- Reversibiltià delle operazioni.
	- Modalità di visualizzazione dei dati controllata dall'utente.
	- Dipsositivo d'interazione scelto dall'utente.
	- Personalizzazione dei valori di default.
	- Disponibilità dei dati originali.
- Tolleranza verso l'errore.
	- Assistenza all'utente.
	- Verifica e convalida dei dati.
	- Prevenzione di azioni non lecite.
	- Richieste di conferma.
	- Spiegazione dell'errore.
	- Spiegazioni aggiuntive.
	- Assistenza per il recupero.
	- Minimo sforzo di recupero.
	- Recupero differibile.
	- Recupero automatico modificabile.
- Adeguatezza all'individualizzazione.
	- Scelta di rappresentazioni alternative.
	-	Scelta dei formati di I/O.
	- Vocabolario personalizzabile.
	- Scelta del livello delle spiegazioni.
	- Scelta dle metodo d'interazione.
	- Personalizzazione del dialogo.
	- Ripristinabilità dei valori precedenti.
	- Personalizzazione dei tempi di risposta.
= Progettare per l'errore
Lo standard ISO 9241-110 definisce uno standard per la realizzazione di sistemi error-tollerant, ovvero, sistemi che permettono all'utente di raggiungere gli obiettivi desiderati nonostante gli errori compiuti. Il progettista deve predisporre tutti gli accorgimenti per evitare che l'utente commetta errori oppure di gestirli nel modo più corretto.

== Errore umano

Anche l'utente più esperto commette errori. Il progettista deve innanzitutto comprendere che l'utente che sbaglia non è un utente sbagliato, ed evitare di colpevolizzarlo, o pretendere da lui un'impossibile perfezione. Deve accettare il fatto che l'utente sbaglia perché il sistema gli consente di sbagliare e questo è un difetto ascrivibile a cattiva progettazione. Il progettista deve allora predisporre tutti gli accorgimenti per evitare questa eventualità o gestirla nel modo più corretto quando si verifica.

_Errore_ significa anche:

$ "atto e effetto di allontanarsi dalla verità o dalla norma convenuta" $

Questo è un termine troppo generico. In modo più specifico:

#definizione(title: "Errore")[
  L'errore è un termine generico per comprendere tutti quei casi in cui una sequenza pianificata di attività fisiche o mentali fallisce il suo scopo, e quando questo fallimento non possa essere attribuito all'intervento di qualche agente casuale.
]

#figure(
  image("images/errore_umano.png", width: 70%),
caption: [Classificazione degli errori]
)

Lo schema sopra è considerato corretto quando si verificano tre condizioni:
+ l'utente aveva l'intenzione di agire;
+ l'azione è proceduta come desiderato;
+ l'azione ha ottenuto il suo scopo.

Se non si verificano tutte queste tre condizioni, si hanno quattro fondamentali tipi di errori:
- _azione intenzionale ma errata_ (_mistake_): si verifica quando l'utente ha agito con intenzione, l'azione si è svolta come pianificato, ma non ha ottenuto lo scopo prefissato.
- _azione non intenzionale_ (_slip_ o lapsus): si ha un lapsus quando, parlando o scrivendo, si sostituisce involontariamente una parola con un'altra. Generalizzando, sostituzione di azioni o comportamenti al posto di altri.
- _azione spontanea_: l'azione è compiuta intenzionalmente, ma senza che l'utente avesse precedentemente l'intenzione di agire.
- _azione involontaria_: l'azione è del tutto non intenzionale.

Le strategie che il progettista attua per limitare la possibilità e le conseguenze dell'errore umano sono riassunte nella figura seguente:

#figure(
  image("images/strategie_errore.png", width: 70%),
	caption: [Progettare per l'errore]
)

== Prevenzione

Prevenire è meglio che curare. Prevenire l'errore significa progettare il sistema in modo che la possibilità di errori dei suoi utenti sia minima. Alcune tecniche molto diffuse per prevenire gli errori sono le seguenti:
+ diversificare le azioni dell'utente
+ evitare comportamenti "modali"
+ usare "funzioni obbliganti"
+ imporre input vincolati
+ non sovraccaricare la memoria a breve termine dell'utente
+ richiedere conferme
+ usare default inoffensivi
+ fornire alternative sicure

=== Diversificare le azioni dell'utente

Serve a prevenire i lapsus. Si tratta di fare in modo che le azioni che l'utente deve eseguire per effettuare compiti diversi siano ben diversificate, in modo da minimizzare la probabilità che l'utente ne esegua inavvertitamente una al posto dell'altra. \
A volte questa indicazione è in conflitto con quella, altrettanto corretta, di raggruppare fra loro i comandi semanticamente corretti. La seguente figura mostra un esempio tipico di questa situazione di conflitto. Il programma Outlook della Microsoft, associa a ogni messaggio che si trova nella mailbox di input lo stato di _Read_ o _Unread_. Nel menu _Edit_ ci sono due comandi (_Mark as Read_ e _Mark as Unread_) che permettono di modificare questi stati. Il sistema fornisce anche un comando _Mark All as Read_, che pone tutti i messaggi presenti nella mailbox di input nello stato di _Read_. Il comando è posto sotto gli altri due, e può accadere di selezionarlo innavertitamente al posto del contiguo _Mark as Unread_, con esiti fastidiosi perchè il sistema non consente di annullarne gli effetti. Il problema potrebbe essere evitato, allontanando il comando pericolosa dagli altri due, oppure lasciandolo dove si trova ma chiedendo conferma all'utente prima di eseguirlo.
#figure(
image("images/lapsus.png", width: 70%),
caption: [Un menu pericoloso]
)

=== Evitare comportamenti modali

Chiamiamo _modale_ un sistema che, a fronte di una stessa azione dell'utente, si comporta diversamente a seconda dello stato in cui si trova, e questo stato non è facilmente riconoscibile dall'utente. Se l'utente non conosce lo stato, non può prevedere come il sistema risponderà alle sue azioni. Ad esempio:
- funzione di riconoscimento della password. Se una funzione contiene minuscole e viene digitata con il _Caps Lock_, viene rifiutata. Se lo stato di _Caps Lock_ non è visibile l'utente potrebbe provare a reinserirla più volte e sbagliare.
- Quando eseguo _copy_ o _cut_, l'oggetto copiato o tagliato viene inserito nella clipboard, ma non è visibile: cambia stato ma l'utente non lo vede.

#figure(
  image("images/sistema_modale.jpg", width: 70%),
)

=== Usare funzioni obbliganti

Viene definita _obbligante_ una funzione in cui le azioni dell'utente sono vincolate in modo tale che la mancata esecuzione di un passaggio impedisce il successivo. In tal modo egli è obbligato a compiere le azioni nella sequenza corretta. Si tratta di una tecnica molto efficace di prevenzione degli errori.

#esempio[
In un sistema desktop quale delle seguenti due soluzioni è preferibile?
- opzione 1:
  - selezione azione
  - selezione oggetto
- opzione 2:
  - selezione oggetto
  - selezione azione

È preferibile l'opzione 2: selezionando l'oggetto desiderato il sistema disabilita tutte le voci di menu che corrispondono ad azioni che non hanno senso su tale oggetto.
]
=== Imporre input vincolati

Questa tecnica, che generalizza quella delle funzioni obbliganti, consiste nel permettere all'utente di fornire solo valori di input corretti, ovvero azioni lecite nel contesto corrente.

#figure(
  image("images/input_vincolanti.png", width: 70%),
	caption: [Esempi di input vincolanti]
)

=== Non sovraccaricare la memoria a breve termine

Dialoghi che sovraccaricano la memoria a breve termine risultano faticosi per l'utente e aumentano la probabilità che egli commetta degli errori. Tipico è il caso dei messaggi pre-registrati dei call-center.

#esempio[
"Per informazioni sulle nuove offerte, premi 1: per informazioni sulle tariffe e così via; premi 2: se sei interessato a conoscere i nuovi servizi e così via; premi 3: se desideri comunicare furto o smarrimento del tuo telefono o per assistenza specifica; premi 4: se desideri ricevere informazioni sul credito; premi 5: se desideri parlare con un operatore premi 0."
]
=== Richiedere conferme

Il sistema dovrebbe sempre avvertire l'utente quando questi richiede l'esecuzione di azioni irreversibili o comunque potenzialmente pericolose, e domandare conferma. Le richieste di conferma devono essere formulate in modo semplice e non ambiguo. Il sistema non deve costringere l'utente a conferme troppo complicate come quella che segue:

#figure(
  image("images/richiedere_conferme.png", width: 70%),
	caption: [Alcuni sistemi di conferma]
)

=== Usare default inoffensivi

Questa tecnica consiste nell'usare valori di default inoffensivi. Il sistema, in altre parole, non dovrebbe mai intraprendere per default l'azione più pericolosa tra quelle possibili in un determinato contesto.

_Esempio._ La richiesta di stampa di un documento Microsoft Word 2007 ha come default l'opzione _Pagine da stampare = tutte_. Non viene richiesta alcuna conferma, nemmeno nel caso di documenti lunghi.

== Diagnosi

Anche se il progettista adotta le tecniche di prevenzione più appropriate, resterà sempre la possibilità che l'utente commetta un errore. Pertanto, il sistema deve sempre controllare l'input e, nel caso si riveli scorretto, dovrà fornire all'utente una spiegazione adeguata, che gli permetta di recuperare la situazione in modo rapido, senza incertezze e senza stress. \
Sono tre le funzioni che un messaggio di errore ben progettato deve svolgere:
- _allertare_: segnalare qualcosa che non va;
- _identificare_: indicare che cosa non va, e perché;
- _dirigere_: spiegare all'utente i passi che deve compiere per ripristinare una situazione corretta.

#figure(
  image("images/diagnosi.jpg", width: 70%),
)

=== Messaggi di errore: linee guida

- spiegare esplicitamente che cosa non va;
- dare indicazioni costruttive su come risolvere il problema;
- nel linguaggio dell'utente ed in modo educato, esauriente e preciso.

=== Linee guida per il web

- i messaggi di errore siano chiaramente visibili ed espressi in un linguaggio chiaro, comprensibile a tutti;
- preservare, per quanto possibile, il lavoro già fatto dall'utente;
- ridurre al massimo il lavoro necessario per correggere l'errore.

#figure(
  image("images/linee_guida.png", width: 70%),
	caption: [Messaggi di errore]
)

Tutti gli esempi discussi si riferiscono a singoli errori. Sono frequenti tuttavia situazioni più complesse, in cui l'utente compie più di uno sbaglio.

#figure(
  image("images/errori_mul.png", width: 70%),
	caption: [Messaggi di errore multipli]
)

In questo caso risulta difficile per l'utente leggere tutti gli errori: egli è costretto a prendere appunti sulle correzioni da effettuare. La soluzione di gran lunga più corretta è quella esemplificata successivamente, in cui la segnalazione di errore è visualizzata immediatamente sopra il campo errato.

#figure(
  image("images/errori_mul2.png", width: 70%),
	caption: [Tecnica corretta per la segnalazione di errori]
)

La spiegazione dell'errore e di come fare per correggerlo dovrebbe essere particolarmente dettagliata e chiara quando il sistema si rivolge a utenti poco esperti.

#figure(
  image("images/errore_verboso.png", width: 70%),
)

Per evitare una verbosità eccessiva, può convenire esprimere il messaggio in forma sintetica, permettendo però all'utente di richiedere spiegazioni più dettagliate.

=== Progettare per l'errore: temi

#figure(
  image("images/error_recovery.png", width: 70%),
)

== Correzione (error recovery, ripristino)

Quando l'utente commette un errore, deve essere possibile correggerlo. Questo processo può essere attuato, secondo i casi, dall'utente o dal sistema o da entrambi, in modo cooperativo. Le situazioni possibili sono schematizzate nella figura sotto: a partire da uno stato iniziale del sistema, l'utente compie un'azione. Se l'azione è corretta, il sistema si porta nello stato desiderato, indicato in figura come _stato finale_. Se l'azione non è corretta, il sistema si porta in uno _stato di errore_.

#figure(
  image("images/correzione.png", width: 70%),
	caption: [Ripristino dell'errore]
)

A partire da questo stato, il processo di correzione può avvenire con due strategie diverse, a seconda della situazione.

=== Backward recovery

Si tratta di annullare le conseguenze negative dell'errore commesso e riportare il sistema nello stato iniziale, dal quale l'utente potrà compiere, questa volta in modo corretto, l'azione che aveva sbagliato. Il processo per riportare il sistema nello stato iniziale si chiama _ripristino_. Nel caso elementare della data sbagliata, la backward recovery consisterà semplicemente nel cancellare dal campo di input il valore scorretto. Questo compito può venir fatto dall'utente o dal sistema.

La backward recovery può essere considerata un modo di tornare indietro nel tempo. Il modo più semplice di farlo è quello di utilizzare una funzione di _undo_, che annulli le conseguenze dell'ultima azione. I sistemi più evoluti permettono di annullare le ultime $n$ azioni dell'utente, con $n$ anche molto grande.

=== Forward recovery

Esistono situazioni in cui la correzione dell'errore avviene con un processo diverso. Invece di tornare allo stato iniziale e da lì ripetere l'azione, si cerca di raggiungere lo stato finale direttamente dallo stato di errore, senza prima tornare indietro. Può essere effettuato automaticamente dal sistema o richiedere l'intervento dell'utente. Un sistema che attua sistematicamente strategie di forward recovery si dice _error tolerant_. Di seguito si mostra il comportamento di Google quando l'utente compie un errore di battitura:

#figure(
  image("images/esempio_recovery.png", width: 70%),
)

L'esempio sopra mostra come in molti casi la recovery sia imperfetta: si può solo arrivare a un'approssimazione dello stato desiderato. Un piatto aggiustato con la colla non è mica un piatto nuovo!

#figure(
  image("images/forward_recovery.png", width: 70%),
)

In ogni caso, che si tratti di recovery avanti o indietro, sarà bene che il progettista ricordi le raccomandazioni seguenti:
- _minimo sforzo di correzione_: i passi richiesti all'utente per correggere l'errore dovrebbero essere il più possibile semplici;
- _correzione differibile_: l'utente dovrebbe poter rimandare la correzione dell'errore a un momento successivo;
- _correzione automatica modificabile_: il sistema dovrebbe avvisare l'utente della correzione e dargli la possibilità di correggerla.

== Tolleranza verso gli errori

Un dialogo è _tollerante_ verso l'errore quando, a dispetto di evidenti errori nell'input, i risultati desiderati possono essere ottenuti senza azioni correttive.

== Conclusione

Il progettista non deve concepire una semplice dicotomia fra errori e comportamento corretto: al contrario, tutta l'interazione uomo-macchina deve essere trattata come una procedura cooperativa fra i due, dove gli equivoci possono nascere da ambo le parti.

= Interaction design
== Design dell'interazione e comunicazione visiva
La comunicazione visiva ha un ruolo fondamentale nell'interazione uomo-macchina: la maggior parte delle informazioni che un sistema trasmette al suo utente sono veicolate da display video di varia forma e dimensione, dai grandi monitor che tappezzano le pareti delle control room dei grandi impianti di processo, fino ai piccoli display dei telefoni cellurari o degli altri dispositivi mobili in circolazione. \
A seguito della pubblicazione del libro _Designing Web Usability_ di Jacob Nielson, ci fu un ampio dibattito fra i fautori dell'usabilità dei siti web, da un lato, e dalla libertà espressiva, dall'altro. I primi rimpoveravano ai secondi di perseguire una creatività libera da ogni vincolo, spesso a discapito della facilità d'uso. I secondi obiettavano che l'usabilità perseguita ad ogni costo avrebbe, in ultima analisi, limitato la libertà di comunicazione che la rete permetteva. \
Citando le parole dello standard ISO 9241-12, \"_la presentazione dell'informazione visiva dovrebbe abilitare l'utente a eseguire i compiti percettivi (per esempio, la ricerca d'informazioni sullo schermo) in modo efficace, efficiente e con soddisfazione._\". Per raggiungere questo obiettivo, prosegue lo standard, è importante che, nel progettare l'informazione visiva, si considerino le seguenti caratteristiche:
- *Chiarezza*: il contenuto informativo è veicolato velocemente e accuratamente;
- *Discriminabilità*: l'informazione visualizzata può essere distinta con accuratezza;
- *Concisione*: agli utenti viene fornita solo l'informazione necessaria per eseguire il compito;
- *Consistenza*: la medesima informazione è presentata nello stesso modo all'interno del sistema, conformemente alle aspettative dell'utente;
- *Scopribilità*: l'attenzione dell'utente è diretta verso l'informazione necessaria;
- *Leggibilità*: l'informazione è facile da leggere;
- *Comprensibilità*: il significato è chiaramente comprensibile, non ambiguo, interpretabile e riconoscibile.
== Le leggi della Gestalt
La _psicologia della Gestalt_, detta anche _psicologia della forma_, è una corrente psicologica che si sviluppò tra gli anni '10 e gli anni '30 del secolo scorso. I suoi esponenti si focalizzarono soprattutto sugli studi della percezione e del problem-solving. \
L'idea portante della psicologia della Gestalt è che non è corretto dividere l'esperienza umana nelle sue componenti elementari, da analizzare separatamente, perchè _un insieme è più della somma delle sue parti_. In particolare, questo avviene nella percezione visiva: gli elementi che ci si prensentano nel campo visivo interagiscono fra loro in modo complesso, e noi percepiamo qualcosa che è diverso dalla loro somma. Per esempio, quando osserviamo una fila di lampadine che si accendono e si spengono in sequenza con una certa cadenza temporale, noi percepiamo delle luci in movimento, anche se nulla si muove. \
La seguente figura illustra in modo suggestivo questo principio. Si tratta di un dipinto di Salvador Dalì, che rappresenta una stanza contenente un divano, due quadri alla parete, un caminetto che regge un orologio, vista da una grande porta incorniciata da tende. L'effetto complessivo è però diverso; l'osservatore percepisce innanzitutto un viso di donna che assomiglia all'attrice Mae West.
#figure(
image("images/salvador_dali.png", width: 70%),
caption: [\"Viso di Mae West in forma di appartamento\"]
)
Gli psicologi della Gestalt hanno cercato di individuare le leggi elementari che governano questi fenomeni. Max Wertheimer descrisse le _leggi dell'organizzazione figurale_, in base alle quali elementi presenti nel campo visivo tendono a organizzarsi in unità, secondo la loro forma e posizione relativa. Esse sono chiamate legge della vicinanza, della somiglianza, della chisura, della continuità di direzione, della buona forma e dell'esperienza passata, e sono descritte di seguito.
- *Legge della vicinanza*: a parità di tutte le altre condizioni, gli elementi del campo visivo che sono fra loro più vicini tendono a essere raccolti in unità. \
	Nella seguente figura è composta da quattro raggruppamenti di piccoli cerchi. Nella figura (a) vediamo relativamente pochi raggrupppamenti. Nella figura (b), (c) e (d) le configurazioni appaiono infatti molto stabili e univoche. Nella prima vediamo tre colonne verticali, nella seconda tre righe orizzontali, e nella terza quattro gruppi di forma quadrata. I raggruppamenti, quindi, sono determinati dalla distanza relativa fra gli elementi.
	#figure(
		image("images/vicinanza.png", width: 70%),
		caption: [Legge della vicinanza]
	)
- *Legge della somiglianza*: a parità di tutte le altre condizioni, gli elementi del campo visivo che sono tra loro simili tendono a essere raccolti in unità. Consideriamo la seguente figura.
	#figure(
		image("images/somiglianza.png", width: 70%),
		caption: [Legge della somiglianza]
	)
	Nella figura (a) e (b) percepiamo due gruppi ben distinti di elementi. Se invece di modificare il colore, modifichiamo la forma, il risultato è lo stesso: gli elementi si raccolgono in gruppi di analoga forma. A parità di tutte le altre condizioni, quindi, tendono a raggrupparsi quegli elementi che hanno qualche tipo di _somiglianza_. Il fenomeno descritto dalla legge della somiglianza può anche essere utilizzato per porre in evidenza alcuni elementi, per _diversità_ o _contrasto_. Nella figura (d), l'elemento grigio spicca chiaramente nel contesto degi altri elementi, tutti neri. La legge della somiglianza fa sì che esso venga isolato da tutti gli altri.
- *Legge della chiusura*: a parità di tutte le altre condizioni, le linee delimitanti una superficie chiusa si percepiscono come unità più facilmente di quelle che non si chiudono. Consideriamo la seguente figura. Consideriamo la seguente figura.
	#figure(
		image("images/chiusura.png", width: 70%),
		caption: [Legge della chiusura]
	)

	Nella figura (a), per la legge della vicinanza vediamo qauttro coppie di linee verticali. Tuttavia se aggiungiamo i tratti orizzontali che uniscono le linee verticali come nella figura (b), la segmentazione del campo visivo cambia, e vediamo tre rettangoli chiusi con duee linee verticali ai lati. La chiusura è più forte della vicinanza, come mostrato nella seguente figura.
	#figure(
		image("images/chiusura2.png", width: 70%),
		caption: [Conflitto fra chiusura e vicinanza]
	)

	Nella figura (a), anche se le parentesi quadre (\][) sono molto vicine, vengono associate diversamente e vengono visti tre rettangoli chiusi. Se vengono eliminate le parentesi quadre ai due lati estremi della figura, come nella figura (b), la segmentazione diventa piuttosto instabile: a volte vediamo tre coppie di parentesi accostate, altre volte vediamo due rettangoli e due parentesi ai lati.
- *Legge della continuità di direzione* (dette anche della _curva buona_): a parità di tutte le altre condizioni, le linee che vanno nella stessa direzione si costituiscono in unità più facilmente delle altre. In sostanza, il sistema visivo sembra funzionare in modo che un segmento rettilineo tenda a evitare bruschi cambiamenti di direzione e quindi, a un incrocio con altri segmenti, si unifiac di preferenza con quello che continua nella medesima direzione. Consideriamo la seguente figura:
	#figure(
		image("images/direzione.png", width: 70%),
		caption: [Legge della continuità di direzione]
	)

	Nella figura (a) i quattro segmenti obliqui si unificano in unico segmento che sembra disposto dietro i tre gruppi di linee verticali, unificati per la legge della vicinanza. Anche le linee curve tendono a mantenere il proprio andamento e, dopo un incrocio con altre linee, a proseguire nelle linee che meno si discostano da esso. Ad esempio, nella figura (b), vediamo le due linee 1-2 e 3-4, e non le altre possibili.
- *Legge della buona forma*: a parità di tutte le altre condizioni, il campo percettivo si segmenta in modo che risultino entità per quanto possibile equilibrate, armoniche, costituite secondo un medesimo principio in tutte le loro parti. \
	Questo principio, detto anche _principio di pregnanza_ o della _coerenza strutturale_, non è definibile con precisione, per questo ne vediamo un esempio. Consideriamo la seguente figura.
	#figure(
		image("images/buona_forma.png", width: 70%),
		caption: [Legge della buona forma]
	)
	Nella figura (a), in virtù della legge della chiusura, vediamo due figure chiuse distinte, ciascuna con una propria forma definita. NElla figura (b), gli elementi si raggruppano in modo completamente diverso. Le due figure si trasformano e diventa impossibile vedere le due configurazioni di partenza. Le linee si collegano fra loro in un modo strutturalmente più coerenti: i segmenti si uniscono ad altri segmenti lineari, mentre le linee curve a formare una figura tondeggiante. La tendenza alla coerenza strutturale e alla continuità di direzione ci permettono di vedere la figura in un solo modo, eliminando tutte le possibili segmentazioni, fra le quali anche quella della figura (c).

- *Legge dell'esperienza passata*: a parità di tutte le altre condizioni, gli elementi del campo visivo che danno origine a una figura familiare o dotata di significato tendono a formare un'unità. Consideriamo la seguente figura.
	#figure(
	image("images/esperienza_passata.png", width: 70%),
	caption: [Legge dell'esperienza passata]
	)
	Nella figura (a), riconosciamo la lettera E, anche se molti tratti sono mancanti. La figura (b) contiene un'altra configurazione di tratti appartenente alla lettera E, nella quale il riconoscimento è più problematico, anche se il numero di tratti è lo stesso. \ \

Se invece gli elementi presenti nel campo visivo sono irregolari nella forma e nella distribuzione spaziale, senza simmetrie o continuità, abbiamo difficoltà riconoscerne il senso, come mostrato nella seguente figura.
#figure(
image("images/no_gestalt.png", width: 70%),
caption: [Figure prive di Gestalt]
)
Nella prima l'assenza di linee chiuse e la somiglianza delle numerose chiazze nere presenti sullo sfondo bianco ci impediscono di vedere ciò che la figura rappresenta: un cane di razza dalmata visto da dietro, che annusa il terreno. Nella seconda, per gli stessi motivi, risulta difficile riconoscere il viso barbuto che la figura rappresenta. \
La conoscenza delle leggi della Gestalt è di grande utilità per il progettista di interfacce grafiche. Egli potrà sfruttare questi meccanismi, per far sì che il sistema visivo dell'utente gli mostri le immagini presentate sullo schermo nel modo desiderato.
== Vicinanza
Il principio della vicinanza della Gestalt ci dice che elementi vicini verranno percepiti come appartenenti a uno stesso gruppo. Questo ci suggerisce di porre uno vicino all'altro gli elementi grafici che, dal punto di vista funzionale, sono fra loro correlati. E anche, ovviamente, di tenere lontani elementi che non hanno fra loro alcun rapporto. In questo modo il progettista frutta la legge della vicinanza a proprio vantaggio, facendo sì che i meccanismi della visione rafforzino la percezione dello stretto legame che unisce gli oggetti dell'interfaccia fra loro semanticamente o funzionalmente correlati. Consideriamo il seguente form:
#figure(
image("images/form_destrutturato.png", width: 70%),
caption: [Forma di un'applicazione alberghiera]
) <fig:form_destrutturato>
Questo form contiene numerosi campi, per l'immisione dei dati degli ospiti dell'albergo. Esiste una certa correlazione fra campi vicini: le informazioni relative alla camera occupata sono raggruppate in basso, i dati per il pagamento sono al centro, e così via. Ma non c'è alcun ordine visivo, le correlazioni sono quasi impossibili da individuare. La seguente figura mostra gli stessi campi, riorganizzati su due form.
#figure(
image("images/app_alberghiera.png", width: 70%),
caption: [Form ristrutturato di un'applicazione alberghiera]
) <fig:form_strutturato>
I campi sono stati chiaramente divisi in quattro gruppi di significato omogenoo: il gruppo con le informazioni riguardanti la prenotazione della camera, quello con i dati anagrafici dell'ospite e, nel secondo form, un gruppo con i dati per il pagamento e uno con i dati per la fatturazione. \
I meccanismi della visione possono facilitare la comprensione di un'immagine, ma possono anche creare difficoltà. Il pannello rappresentato nella seguente figura, che permette di definire le tabulazioni dei testi, risulta incomprensibile. Il titolo _Allineamento_, che si riferisce ai quattro check-box, è visivamente contiguo al grande campo bianco sulla sinistra, e gli viene quindi associato. Quest'ultimo dovrebbe essere associato al titolo _Tabulazioni da cancellare_ il quale però, è spostato sulla destra, e si trova quindi contiguo al titolo _Tabulazioni predefinite_, con cui fa gruppo.
#figure(
image("images/tabulazioni.png", width: 70%),
)
== Somiglianza
Possiamo utilizzare a nostro vantaggio la legge della somiglianza dando forma o colore simili a quegli elementi grafici che sono funzionalmente o semanticamente correlati. \
Nel menu _a_, ad ogni singola voce è associata una piccola icona colorata. In questo caso, le icone non servono a spiegare il significato della voce: le etichette sono chiare, e non c'è bisogno di spiegazioni aggiuntive; d'altra parte le figure sono piccole e non sempre riconoscibili. La loro funzione è un'altra: associare a ogni voce di menu un pattern visivo ben riconoscibile. In questo modo, per la legge della somiglianza, tutte le voci vengono raccolte in un gruppo, ben differenziato dagli altri gruppi presenti sulla pagina. Nel menu _b_, le icone sono utili nonostante la scarsa comprensibilità delle immagini. Nel menu _c_, le icone hanno dimensioni maggiori, e contengono figure ben riconoscibili. In questo caso, a differenza degli altri due esempi, costituiscono una vera alternativa al testo.
#figure(
image("images/menu_yahoo.png", width: 70%),
caption: [Menu di yahoo]
)
== Chiusura
Una tecnica molto efficace per associare visivamente più elementi consiste nel racchiuderli all'interno di una cornice chiusa. La seguente figura mostra tre versioni di uno stesso menu a tendina.
+ Nella prima (a), le verie voci sono elencate in un ordine logico, ma nessun accorgimento grafico mette in evidenza questi raggruppamenti.
+ Nella seconda (b), è stata inserita una spaziatura per distinguere i tre gruppi, sfruttando la legge della vicinanza.
+ Nella terza (c) è stata inserita una linea di separazione fra un gruppo e l'altro. Ogni gruppo risulta all'interno di un rettangolo, che lo isola dagli altri, sottolineando le relazioni fra le voci di ciascun gruppo.
#figure(
image("images/menu_tendina.png", width: 70%),
caption: [L'effetto dei separatori in un menu a tendina]
)
Quando si abbia la necessità di mostrare sul monitor una grande quantità di elementi, come avviene spesso sul Web, l'uso delle corinici è spesso la tecnica più conveniente per orientare l'utente nella lettura corretta della pagina. \
La seguente figura mostra la home page del sito di due compagnie aeree. In entrambe, il form di prenotazione voli è posta in grande evidenza dal riquadro che la isola, anche cromaticamente dagli altri elementi.
#figure(
image("images/form_prenotazione.png", width: 70%)
)
Queste due pagine web hanno una grafica semplice e funzionale, senza soluzioni a effetto risultano molto chiare e leggibili: le informazioni sono ben organizzate in gruppi logici facilmente individuabili. \
La seguente figura, invece, mostra un sito progettato male. Le informazioni sono inserite in numerosi riquadri, che affollano la pagina. La sensazione che trasmette è di confusione. Ciò che spicca, per legge della somiglianza, è il gruppo delle immagini, che rappresentano prevalentemente automobili. Nemmeno i titoli dei riquadri aiutano a comprendere la pagina, perchè spesso sono di corpo inferiore a quello dei testi. I quadratini accanto ai titoli sono troppo piccolo e di un colore che non li mette in risalto (giallo).
#figure(
image("images/sito_brutto.png", width: 70%)
)
== Allineamento
L'allineamento degli elementi visivi è una delle tecniche più importanti usate dai grafici per dare all'immagine una struttura immediatamente percepibile. Una pagina i cui elementi siano disallineati ci trasmette un'impressione di complessità che può essere molto ridotta con un maggior ordine visivo. Per ottenerlo, gli elementi dovrebbero essere inseriti in una griglia logica ben definita. Consideriamo il form della @fig:form_destrutturato con la sua riorganizzazione nella @fig:form_strutturato. L'immediata comprensibilità di quest'ultima non è solo il risultato della vicinanza dei campi semanticamente correlati e delle cornici che racchiudono i diversi gruppi di informazioni. Anche l'allineamento delle etichette e dei campi all'interno dei riquadri e, nel form di destra, dei riquadri stessi, contribuisce a trasmettere una sensazione di ordine e di semplicità. Infine, l'allineamento rende gli elementi più simili, e quindi anche la legge della somiglianza è all'opera per facilitare ulteriormente l'identificazione dei diversi gruppi. \
Nella seguente figura, l'immagine è confusa e non se ne percepisce la logica: gli elementi sembrano disposti in modo casuale. Inoltre, il gruppo di elementi che maggiormente spicca è quello dei campi di input, unificati dalla somiglianza di colore e di forma. Anche in questo caso, l'organizzazione visiva degli elementi impedisce di leggerla in modo corretto.
#figure(
image("images/form_disordinato.png", width: 70%)
)
== Colore
Il colore, se usato bene, può essere di grande aiuto alla comprensione di un'interfaccia. Quando è usato male può creare difficoltà. I colori andrebbero impiegati non tanto per rendere gradevoli le schermate, quanto soprattutto per distinguere meglio fra loro contenuti di natura diversa. Possiamo sfruttare la legge della somiglianza, utilizzando gli stessi color per associare visivamente elementi fra loro correlati, o colori diversi e contrastanti per dissociare elementi semanticamente o funzionalmente lontani. \
La seguente figura mostra la mappa in tempo reale dei mercati finanziari. I riquadri rappresentano le principali aziende quotate in borsa, raggruppati per settori mercelogici. L'area di ogni riquadro è proporzionale alla capitalizzazione dell'azienda, e il colore del riquadro rappresenta la variazione del valore del tipo a partire da una data scelta dell'utente. In rosso sono indicate le variazioni negative, in verde quelle positive. La luminosità del colore è proporzionale all'entità della variazione (rosso vivo indica una perdita consistente, rosso scuro una perdita lieve e così via). Infine, la disposizione spaziale regolare, realizzata ricercando i migliori allineamenti fra i riquadri e collocandoli all'interno di aree anch'esse rettangolari e per quando è possibile allineate, contribuisce a dare un'impressione di semplicità, nonostante la grande quantità di informazioni visualizzate.
#figure(
image("images/smartmoney.png", width: 70%)
)
I colori possono anche essere usati per indirizzare l'attenzione dell'utente su elementi di particolare importanza. Per questo sono particolarmente indicati i colori saturi e caldi, meglio se su sfondi insaturi e freddi. Nella seguente figura, il menu principale è messo in grande evidenza dal colore rosso vivo, anche nel contesto di pagine molto ricche di banner e di elementi colorati.
#figure(
image("images/mediaworld.png", width: 70%)
)
Nella figura precedente, la voce corrente è segnalata da una freccia nera, ben visibile anche se molto piccola. I menu di secondo livello sono invece grigio pallido che li separa bene dal menu principale. \
Il colore può essere usato per potenziare l'effetto della legge della chiusura, colorando i riquadri che identificano le diverse aree funzionalmente differenti di una schermata. A questo scopo si usano sfondi di colori insaturi, per non risultare stancanti, e rendere i testi ben leggibili. \
L'uso del colore non deve mai eccedere. È consigliabile usare pochi colori contemporaneamente, evitando pagine piene di colori. Infine, troppa informazione equivale a nessuna informazione, e pagine troppo ricche di colori diversi tendono a sembrare complesse. \
Un altro aspetto che richiede attenzione è l'uso di colori che sono associati a particolari significati. Per esempio, nei paesi occidentali il colore rosso è usato per segnalare pericolo, mentre il verde è associato a emssaggi di via liberi. Un cartello di TSTOP di colore verde risulterebbe ambiguo. \
La seguetne figura mostra un esempio di scelta criticabile dei colori. Nelle pagine del catalogo dei prodotti in vendita, i codi colore scelti per segnalarne la disponibilità non seguono le normali convenzioni. Le associazioni sono innaturali da richiedere uno sforzo cognitivo abbastanza rilevante.
#figure(
image("images/colori_brutti.png", width: 70%)
)
Un altro prolema da tenere in considerazione nella scelta dei colori è quello della cecità cromatica (daltonismo). I disturbi più frequenti riguardano l'incapacità di distinguere il rosso dal verde, ma ci sono altri tipi di disturbi meno diffusi. È quindi opportuno che nell'interfaccia non ci siano informazioni importanti identificabili esclusivamente attraverso il colore. In particolare, non dobbiamo mai supporre che l'utente sia in grado di distinguere il rosso dal verde.
== Percorsi visivi
È abbastanza diffusa la convinzione che, quando si esamina una schermata, i nostri occhi seguano un percorso regolare, iniziando dalla posizione di home e procedendo da sinistra a destra e dall'alto in basso, come quando si legge un testo scritto. Questa convizione non ha alcun fondamento. In realtà la situazione è molto più complessa, e può essere analizzata usando sistemi di eye tracking. Questi dispositivi mostrano che il movimento dei nostri occhi è molto irregolare: lo sguardo si fissa per un certo tempo su un determinato punto, per acquisire l'informazione visiva (_fissazione_), e quindi sposta l'asse visivo su un altro punto, con un movimento rapidissimo (chiamato _saccade_) durante il quale non viene acquisita alcuna informazione visiva. \
Gli studi effettuati con queste apparecchiature mostrano che il percorso dello sguardo è molto variabile, e dipende non solo dalle caratteristiche dell'immagine stessa, ma anche dagli obiettivi di chi guarda. \
La seguente figura mostra lo scanpath di una persona nell'esame di una pagina ewb. Lo sguardo percorre la pagina irregolarmente, fissandosi sui diversi menu, sui titoli, secondo una logica che dipende dagli obiettivi dell'utente.
#figure(
image("images/scampath.png",width: 70%),
caption: [Scanpath di una pagina web]
)
Gli esperimenti condotti confermanto che una pagina web non viene esaminata sempre nello stesso modo, lo scanpath è quasi sempre molto irregolare. \
Sommando gli snapath percorsi da numerosi utenti è possibile costruire le _heat-map_, che mostrano le aree della pagina sulle quali gli sguardi si sono, in media, maggiormente soffermati.
#figure(
image("images/heatmap.jpg", width: 70%),
caption: [Heat-map di tre pagine web]
)
Analisi di questo tipo possono fornire informazioni molto utili per migliorare l'usabilità dei siti web. Studiando i cammini percorsi dallo sguardo dei diversi utenti sulle pagine, e correlandoli agli obiettivi che essi hanno nel condurre questo esame, possiamo ricavare utili informazioni per migliorarne il layout. Queste sono analisi complesse, tutt'oggi utilizzate solo in casi molto particolari.
= Valutare l'usabilità
== Perché e quando si valuta
La valutazione è un passo essenziale in una progettazione *human-centred*, e non è un'attività da fare una volta sola alla fine: il suo scopo cambia a seconda del momento del ciclo di sviluppo.

- *All'inizio del progetto* l'obiettivo principale è raccogliere indicazioni per orientare le attività di progettazione successive.
- *Nelle fasi più avanzate*, quando sono disponibili prototipi più completi, diventa possibile _quantificare_ il livello di raggiungimento degli obiettivi dell'utente e dell'organizzazione.
- *Dopo il rilascio* del sistema si può monitorare la sua adeguatezza ai nuovi contesti di utilizzo.

La valutazione ha molte dimensioni; qui ci si concentra sulla *valutazione dell'usabilità*, rimandando per gli altri aspetti all'ampia letteratura esistente sul testing in generale. Per valutare l'usabilità si possono impiegare diverse tecniche, che rientrano in due grandi famiglie: le *ispezioni* e i metodi *user-based*.

== Le due famiglie di metodi

#table(
  columns: (7.5em, 1fr, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [], [*Ispezioni*], [*User-based*],
  [*Chi valuta*], [Valutatori esperti di usabilità], [Valutatori che osservano utenti reali (o loro rappresentanti)],
  [*Ruolo dell'utente*], [Nessun coinvolgimento], [Centrale: svolge compiti veri],
  [*Cosa si fa*], [Si ispeziona l'interfaccia per trovare possibili problemi di usabilità, fornendo giudizi basati sulla conoscenza degli esperti], [Si valutano le proprietà dell'usabilità osservando come il sistema, o un suo prototipo, viene usato],
  [*Pregi*], [Economiche e semplici da organizzare], [Molto affidabili (se fatte bene)],
  [*Limiti*], [Soggettive, con forte dipendenza dall'esperienza del valutatore; difficili da standardizzare], [Dispendiose; difficile trovare un campione "veramente" rappresentativo; difficile far eseguire task complessi dopo un breve training],
  [*Esempi*], [Valutazione euristica, cognitive walkthrough], [Osservazione, thinking aloud, interviste, questionari, focus group, esperimenti controllati],
  table.hline(),
)

=== Le ispezioni
Le ispezioni sono valutazioni effettuate *da esperti di usabilità, senza alcun coinvolgimento dell'utente*. Sono economiche e semplici da organizzare, ma proprio per questo hanno dei limiti: sono *soggettive* (dipendono molto dall'esperienza di chi valuta) e *difficili da standardizzare*. \
A volte non si possono coinvolgere gli utenti in una valutazione: non sono disponibili, il tempo non basta o è difficile trovare le persone giuste. In queste circostanze altri esperti, cioè persone che conoscono l'interaction design e i bisogni e il comportamento tipico degli utenti, possono fornire un feedback. Fra i metodi di ispezione rientrano le *valutazioni euristiche* (le più note) e i *walk-through*: in entrambi i casi i ricercatori esaminano l'interfaccia di un prodotto interattivo, spesso assumendo il ruolo degli utenti tipici, e individuano i problemi che gli utenti con tutta probabilità incontrerebbero interagendo con il prodotto.

=== I metodi user-based
Nei metodi user-based le proprietà dell'usabilità vengono valutate osservando *utenti reali, o loro rappresentanti, che svolgono compiti veri* con il sistema o con un suo prototipo. Se ben condotti sono molto affidabili, ma:

- è difficile selezionare un campione davvero rappresentativo degli utenti reali;
- è difficile far eseguire agli utenti task complessi dopo un breve training;
- sono metodi dispendiosi.

Si dividono in tre gruppi:

#table(
  columns: (9em, 8em, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [*Gruppo*], [*Tecnica*], [*In cosa consiste*],
  [*Metodi basati sull'osservazione*], [Osservazione diretta], [Uno o più valutatori osservano gli utenti mentre svolgono i loro compiti nel loro ambiente di lavoro],
  [], [Thinking aloud], [Il valutatore chiede all'utente di pensare ad alta voce mentre usa il sistema],
  [*Tecniche di survey*], [Interviste], [Gli sperimentatori raccolgono esperienze, opinioni e motivazioni sul comportamento dell'utente],
  [], [Questionari], [Anche personale inesperto può distribuirli, per raccogliere informazioni sulla situazione attuale e ottenere risposte specifiche],
  [], [Focus group], [Discussione moderata da un esperto di Human-Computer Interaction],
  [*Metodi sperimentali*], [Esperimenti controllati], [Esperimenti di laboratorio rigorosi (vedi @sec:altre_tecniche)],
  table.hline(),
)

== Stili di valutazione
Una valutazione può svolgersi in due luoghi:

- in *laboratori di usabilità*;
- *nell'ambiente di lavoro* in cui gli utenti reali utilizzeranno il sistema;

e può essere condotta *da esperti* oppure *in collaborazione con utenti reali*.

=== Studi di laboratorio
Gli studi di laboratorio, condotti con metodologie rigorose su campioni rappresentativi di utenti, sono oggi uno strumento importante per far avanzare le conoscenze sull'usabilità e sui principi dell'interazione human-centred in generale. I loro punti caratteristici sono:

- *offrono attrezzatura sofisticata* che non può essere riprodotta nell'ambiente di lavoro (ad esempio computer molto potenti, specchi bilaterali, ecc.);
- *manipolano il contesto* al fine di individuare problemi o procedure meno usate;
- *non sempre simulano situazioni del mondo reale* (ad esempio nel caso delle tecnologie mobili).

=== Studi sul campo
Gli studi sul campo hanno il vantaggio opposto: *consentono di osservare interazioni tra sistema e utente che si sarebbero perse in un laboratorio di usabilità*. Il prezzo da pagare è che gli *alti livelli di rumore ambientale* rendono difficile l'osservazione.

#table(
  columns: (6.5em, 1fr, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [], [*Studi di laboratorio*], [*Studi sul campo*],
  [*Vantaggi*], [Attrezzatura sofisticata; contesto manipolabile per far emergere problemi o procedure poco usate], [Si osservano interazioni che in laboratorio si perderebbero],
  [*Svantaggi*], [Non sempre simulano il mondo reale (es. tecnologie mobili)], [Rumore ambientale elevato, osservazione difficile],
  table.hline(),
)

== Come scegliere il metodo di valutazione
Non esiste un metodo migliore in assoluto: la scelta dipende da quattro fattori.

+ *Fase del ciclo di sviluppo del sistema* --- progetto vs implementazione.
+ *Stile di valutazione* --- laboratorio di usabilità vs ambiente di lavoro.
+ *Tipo di misure* --- misure qualitative vs misure quantitative.
+ *Risorse richieste* --- tempo, persone, denaro e attrezzatura a disposizione.

== La valutazione euristica
=== Che cos'è
Nell'ingegneria dell'usabilità il termine _euristico_ indica quelle valutazioni effettuate *da esperti*, che analizzano sistematicamente il comportamento di un sistema e ne verificano la *conformità a specifiche "regole d'oro"* (appunto le _euristiche_), derivanti da principi e linee guida generalmente accettati. \
In pratica l'esperto considera *una euristica alla volta* ed esamina nel dettaglio le funzioni del sistema per verificarne la conformità, esaminando le singole schermate ed eseguendo alcuni *task rappresentativi*. L'ispezione riguarda sia le componenti *statiche* sia quelle *dinamiche* dell'interfaccia. \
Le euristiche possono essere molto diverse, più o meno dettagliate. Si *preferiscono* euristiche costituite da _pochi principi molto generali_, piuttosto che linee guida dettagliate, di difficile utilizzo. Tra tutte, sono le più usate quelle di *Nielsen*, dieci regole che permettono al valutatore di inquadrare i problemi rilevati in categorie ben individuate. \
La valutazione euristica è considerata un *"discount usability method"*: un metodo molto efficiente, con un alto rapporto benefici/costi (Nielsen, 1993). Il rovescio della medaglia è che fornisce risultati piuttosto *soggettivi*.

=== Le 10 euristiche di Nielsen (1994)

#table(
  columns: (2.2em, 10em, 1fr),
  align: (center + horizon, left + horizon, left + horizon),
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [*\#*], [*Euristica*], [*Cosa richiede*],
  [1], [*Visibilità dello stato del sistema*], [Il sistema dovrebbe sempre informare gli utenti su ciò che sta accadendo, mediante feedback appropriati in un tempo ragionevole.],
  [2], [*Corrispondenza fra il mondo reale e il sistema*], [Il sistema dovrebbe parlare il linguaggio dell'utente, con parole, frasi e concetti familiari, piuttosto che termini orientati al sistema. Seguire le convenzioni del mondo reale, facendo apparire le informazioni secondo un ordine logico e naturale.],
  [3], [*Libertà e controllo da parte degli utenti*], [Gli utenti spesso selezionano funzioni per errore e hanno bisogno di una "uscita di emergenza" segnalata con chiarezza, per uscire da uno stato non desiderato senza dover passare attraverso un lungo dialogo. Fornire le funzioni di _undo_ e _redo_.],
  [4], [*Consistenza e standard*], [Gli utenti non dovrebbero doversi chiedere se parole, situazioni o azioni differenti hanno lo stesso significato.],
  [5], [*Prevenzione degli errori*], [Ancora meglio di buoni messaggi di errore è un'attenta progettazione che eviti in primo luogo l'insorgere del problema. Eliminare le situazioni che possono provocare errori e chiedere conferma prima di eseguire le azioni richieste.],
  [6], [*Riconoscere piuttosto che ricordare*], [Minimizzare il ricorso alla memoria dell'utente, rendendo visibili oggetti, azioni e opzioni: non dovrebbe aver bisogno di ricordare informazioni nel passare da una fase del dialogo a un'altra. Le istruzioni d'uso dovrebbero essere visibili o facilmente recuperabili quando servono.],
  [7], [*Flessibilità ed efficienza d'uso*], [Gli _acceleratori_ --- invisibili all'utente novizio --- possono rendere veloce l'interazione dell'utente esperto, così che il sistema soddisfi sia l'esperto sia l'inesperto. Permettere all'utente di personalizzare le azioni frequenti.],
  [8], [*Design minimalista ed estetico*], [I dialoghi non dovrebbero contenere informazioni irrilevanti o necessarie solo di rado: ogni informazione aggiuntiva compete con quelle rilevanti e ne diminuisce la visibilità relativa.],
  [9], [*Aiutare gli utenti a riconoscere gli errori, diagnosticarli e correggerli*], [I messaggi di errore dovrebbero essere espressi in linguaggio semplice (senza codici), indicare il problema con precisione e suggerire una soluzione in modo costruttivo.],
  [10], [*Guida e documentazione*], [Anche se è preferibile che il sistema sia utilizzabile senza documentazione, può essere necessario fornire aiuto. Ogni informazione di questo tipo dovrebbe essere facilmente raggiungibile, focalizzata sul compito dell'utente, elencare i passi concreti da fare e non essere troppo ampia.],
  table.hline(),
)

=== Confronto con i principi del dialogo (ISO 9241)
Le euristiche di Nielsen si possono mettere in relazione con i *principi del dialogo* della norma ISO 9241:

#table(
  columns: (11em, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x == 1 { 0.5pt },
  ),
  [*Principi del dialogo (ISO 9241)*], [*Euristiche di Nielsen corrispondenti*],
  [Adeguatezza al compito], [Riconoscere piuttosto che ricordare $dot.c$ Flessibilità ed efficienza d'uso],
  [Autodescrizione], [Visibilità dello stato del sistema],
  [Conformità alle aspettative], [Corrispondenza fra mondo reale e sistema $dot.c$ Consistenza e standard],
  [Adeguatezza all'apprendimento], [Guida e documentazione],
  [Controllabilità], [Libertà e controllo da parte degli utenti],
  [Tolleranza verso gli errori], [Prevenzione degli errori $dot.c$ Aiutare gli utenti a riconoscere gli errori...],
  [Adeguatezza alla individualizzazione], [_(nessuna euristica corrispondente)_],
  [_(nessun principio corrispondente)_], [Design minimalista ed estetico],
  table.hline(),
)

=== Altre euristiche: la versione di Giorgio Brajnik
Esistono revisioni delle euristiche di Nielsen. Una è quella di *Giorgio Brajnik* (disponibile su web.archive.org con il titolo _"Euristiche di Nielsen"_): è una versione rivista e leggermente annotata rispetto all'originale, che include *domande specifiche* per favorire un'analisi più approfondita dei problemi. Il valutatore deve comunque integrare la propria valutazione con altre domande specifiche per il caso in esame.

=== Quanti valutatori servono
Una singola valutazione è *un'opinione* e va trattata come tale: *persone diverse trovano problemi diversi* (Nielsen e Landauer, 1993). La curva "proporzione di problemi trovati / numero di valutatori" cresce rapidamente con i primi valutatori (un singolo valutatore ne trova solo una frazione, intorno a un terzo) e poi si appiattisce. \
Per questo si ottengono buoni risultati solo impiegando *più valutatori (3--5) sullo stesso progetto*, che analizzino il sistema *separatamente, senza comunicare tra loro*, e combinando poi i risultati.

=== Procedura

#figure(
  block(
    stroke: 0.5pt,
    inset: 10pt,
    width: 100%,
    align(center)[
      #set text(size: 9pt)
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr),
        align: horizon + center,
        column-gutter: 6pt,
        box(stroke: 0.5pt, inset: 6pt, width: 100%)[*1. Fase di progettazione*\ team di valutazione e compiti],
        [$arrow.r$],
        box(stroke: 0.5pt, inset: 6pt, width: 100%)[*2. Fase di esecuzione*\ ispezione individuale],
        [$arrow.r$],
        box(stroke: 0.5pt, inset: 6pt, width: 100%)[*3. Fase di analisi dei problemi*\ riunione e tabella finale],
      )
    ]
  ),
  caption: [Fasi della valutazione euristica]
)

*1. Fase di progettazione*
- Definizione del *team di valutazione*.
- Definizione dei *compiti* che l'ispettore deve eseguire durante la valutazione euristica.

*2. Fase di esecuzione*
- Ciascun ispettore esegue i compiti *in modo individuale*, per identificare le criticità del sistema o prototipo ispezionato.
- Ciascun ispettore compila la *tabella di valutazione*.

*3. Fase di analisi dei problemi*
- Il team si riunisce per *discutere i problemi* rilevati da ciascun ispettore.
- Il team stila la *tabella di valutazione finale*, contenente i problemi di usabilità _unici_, ai quali è assegnato un *"grado di severità"*.

=== Conduzione di una valutazione euristica
L'esecuzione si articola in tre momenti.

*a) Sessione di briefing.* I ricercatori vengono informati sull'obiettivo della valutazione. Se sono più di uno si può usare un copione prestabilito, in modo che tutti ricevano lo stesso briefing.

*b) Periodo di valutazione.* I ricercatori dedicano normalmente *1 o 2 ore* a ispezionare il prodotto in modo indipendente, usando le euristiche come guida. Normalmente fanno *almeno due passate* di esplorazione dell'interfaccia:
- la *prima* permette di farsi un'idea del flusso dell'interazione e della portata del prodotto;
- la *seconda* consente di concentrarsi su elementi specifici dell'interfaccia e di identificare i potenziali problemi di usabilità.

L'approccio va adattato alle circostanze:
- se la valutazione riguarda un *prodotto funzionante*, i ricercatori hanno di solito in mente qualche attività specifica degli utenti e l'esplorazione è quindi focalizzata;
- se la valutazione avviene *presto nella progettazione*, quando esistono solo mockup di schermate o una specifica, un secondo ricercatore può prendere nota dei problemi identificati mentre il primo pensa ad alta voce e può essere videoregistrato.

*c) Sessione di debriefing.* I ricercatori si riuniscono con i designer per discutere ciò che hanno scoperto, assegnare una priorità ai problemi individuati e suggerire possibili soluzioni.

#nota[
  *Accessibilità.* Quando si progettano e si valutano pagine web, app e altri prodotti, è importante considerare anche la loro *accessibilità a un ampio spettro di utenti*: persone con difficoltà di vista, di udito e di mobilità.
]

=== Valutare la gravità dei problemi (problem rating)
Il vantaggio di avere più valutatori arriva quando si *combinano le 3--5 valutazioni in un unico elenco più ampio, rimuovendo i duplicati*. Poi:

+ dopo l'unione, si chiede a ciascun valutatore di assegnare un *punteggio a ogni problema*, sia a quelli che ha trovato personalmente sia a quelli individuati dagli altri;
+ si usa di solito una *scala a 5 punti*: *0* = "Non penso che sia un problema"; *4* = "catastrofe di usabilità"; i problemi meno gravi ricevono valori intermedi;
+ si calcola il *punteggio medio* per ogni problema e si osserva quali emergono come i più gravi;
+ se tutti i valutatori concordano che qualcosa è una catastrofe, quel problema va *in cima alla lista delle correzioni*; gli altri vengono classificati più in basso e affrontati compatibilmente con tempo e risorse.

In questo modo una valutazione euristica non si limita a *individuare* i problemi, ma aiuta anche a *stabilire le priorità* su cui concentrarsi in seguito.

=== Esempio di report di ispezione
Il risultato di un'ispezione è una tabella che elenca, per ogni problema, dove si trova, in cosa consiste, quale principio viola e come si può risolvere. Dopo la valutazione è auspicabile un incontro con i progettisti per discutere le soluzioni proposte.

#table(
  columns: (2.2em, 6.5em, 1fr, 8em, 1fr),
  align: (center + horizon, left + horizon, left + horizon, left + horizon, left + horizon),
  inset: (x: 6pt, y: 6pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x > 0 { 0.5pt },
  ),
  [*N.*], [*Locazione*], [*Problema*], [*Principio violato*], [*Possibile soluzione*],
  [1], [Homepage], [Il nome della compagnia non è sempre presente perché animato.], [Minimizzare il carico di memoria dell'utente], [Il nome dovrebbe essere sempre presente insieme al logo e non animato.],
  [2], [Homepage], [Il nome della compagnia, essendo quello della famiglia, non dà l'idea di cosa si occupa e di cosa offre il sito.], [Minimizzare il carico di memoria dell'utente], [Aggiungere una linea esplicativa che faccia capire di cosa si occupa senza costringere a navigare per conoscere il sito.],
  [3], [Lato destro homepage], [La pubblicità sul lato destro distrae l'utente: è animata, per la sua posizione sembra un item importante e l'utente crede sia cliccabile, mentre non lo è.], [Prevedibilità], [Inserirla in un luogo meno attraente rispetto agli item di più alta priorità.],
  table.hline(),
)

=== Limiti della valutazione euristica
I principali inconvenienti sono tre.

*L'esperienza del valutatore influisce sulla qualità* della valutazione (Nielsen, 1994):

#table(
  columns: (11em, 6.5em, 1fr),
  align: (left + horizon, center + horizon, left + horizon),
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [*Tipo di valutatore*], [*Problemi trovati*], [*Rispetto al livello precedente*],
  [Novizi], [$tilde 22\%$], [--- ("valutatori scarsi")],
  [Esperti di usabilità], [$tilde 41\%$], [1,8 volte meglio dei novizi],
  [_Double experts_ (usabilità + dominio)], [$tilde 60\%$], [1,5 volte meglio degli esperti di usabilità],
  table.hline(),
)

*Le euristiche sono troppo generali e poco operative*: non riescono a guidare i valutatori durante l'ispezione (Doubleday et al., 1997). \
*Il supporto all'uso di una terminologia precisa è limitato*: di conseguenza i report dei problemi risultano troppo vaghi.

== Il cognitive walkthrough
=== Idea e fondamenti teorici
Il cognitive walkthrough è un metodo di *ispezione* focalizzato sulla valutazione di un progetto rispetto alla *facilità di apprendimento* (è particolarmente utile per il WWW). La sua origine è il _code walkthrough_ dell'ingegneria del software, in cui i revisori esaminano il codice per controllare certe caratteristiche. \
Si basa sulla teoria dell'*exploratory learning* (Polson e Lewis, 1990): nella soluzione di problemi gli utenti non amano consultare i manuali, ma preferiscono *esplorare le funzionalità del sistema*. Il comportamento tipico segue quattro passi, che il valutatore deve simulare:

#figure(
  block(
    stroke: 0.5pt,
    inset: 10pt,
    width: 100%,
    align(center)[
      #set text(size: 8.5pt)
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr),
        align: horizon + center,
        column-gutter: 4pt,
        box(stroke: 0.5pt, inset: 5pt, width: 100%)[*Obiettivo*\ descrizione grossolana del compito],
        [$arrow.r$],
        box(stroke: 0.5pt, inset: 5pt, width: 100%)[*Esplorazione*\ dell'interfaccia e scelta delle azioni],
        [$arrow.r$],
        box(stroke: 0.5pt, inset: 5pt, width: 100%)[*Osservazione*\ della reazione dell'interfaccia],
        [$arrow.r$],
        box(stroke: 0.5pt, inset: 5pt, width: 100%)[*Azioni successive*\ (ritorno all'esplorazione)],
      )
    ]
  ),
  caption: [Ciclo dell'exploratory learning nel cognitive walkthrough]
)

+ l'utente parte da una *descrizione grossolana del compito* che vuole effettuare;
+ *esplora l'interfaccia* e sceglie le azioni che ritiene possano portare a termine il compito (o una parte di esso);
+ *osserva le reazioni dell'interfaccia* per capire se le sue azioni hanno avuto l'effetto desiderato;
+ *determina quali azioni effettuare successivamente*.

=== Che cosa serve in ingresso
Per effettuare un cognitive walkthrough bisogna sapere quattro cose:

#table(
  columns: (9.5em, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x == 1 { 0.5pt },
  ),
  [*Input*], [*Dettagli*],
  [*Chi sono gli utenti*], [Esperienze, caratteristiche (anche fisiche) e conoscenze che il valutatore deve assumere che abbiano (cfr. _personas_)],
  [*Cosa deve eseguire l'utente*], [Un compito significativo che le tipologie di utenti definite effettueranno; si scelgono i soli task _problematici_, individuati tramite studi di mercato, analisi dei bisogni, test di prototipi, analisi dei requisiti],
  [*Lista scritta completa delle azioni* necessarie per completare il task], [Esempi: "effettua il login nel sistema"; "trova l'impiegato più vecchio che non è ancora andato in pensione"; "programmare un videoregistratore con il telecomando"],
  [*Descrizione del prototipo*], [Non deve essere necessariamente completa, ma abbastanza dettagliata],
  table.hline(),
)

=== Esecuzione e domande guida
Il valutatore analizza la *sequenza di azioni* (obiettivo $arrow.r$ esplorazione $arrow.r$ osservazione $arrow.r$ azioni successive, secondo le strategie di problem solving di Polson e Lewis, 1990) e, per _ogni azione_, cerca di rispondere a quattro domande.

+ *L'utente, in base alle sue esperienze e conoscenze, è in grado di individuare con facilità l'azione corretta da eseguire?*
  #esempio[
    Se per stampare un documento bisogna prima selezionare la stampante, l'utente è in grado di capirlo?
  ]
+ *L'utente è in grado di notare che l'azione corretta è disponibile?*
  #esempio[
    Se l'azione è esplicita in una voce di menù, nessun problema; se bisogna fare un triplo click sull'icona della stampante, forse non ci penserà mai.
  ]
+ *L'utente può interpretare correttamente la risposta del sistema*, cioè capire di aver scelto l'azione giusta o quella sbagliata?
+ *L'utente può valutare i risultati in modo appropriato*, cioè determinare se soddisfano il suo obiettivo iniziale?

=== Procedura
Il metodo può essere applicato *solo dopo aver progettato in dettaglio l'interfaccia* (anche su carta). Si può svolgere in due modi:

- *Individuale*: utile per valutare un progetto personale.
- *In gruppo*: il designer propone l'interfaccia a un gruppo di pari (anche con altre competenze). I ruoli sono definiti: uno *prende appunti*, un altro fa da *moderatore*, gli altri partecipano alla valutazione. I feedback raccolti saranno usati per modificare la versione successiva dell'interfaccia.

=== Risultati
Il metodo mira a trovare:

- *incongruenze tra la concettualizzazione del task del progettista e quella dell'utente*;
- *problemi nel progetto dei widget* dell'interfaccia (menu, icone, bottoni...);
- *problemi nel feedback delle azioni*.

È utile preparare *moduli standard di valutazione* che riportino: le domande guida, data e ora del walkthrough, nome(i) di chi valuta. Inoltre, *per ogni azione* si compila una tabella a parte per rispondere a ciascuna domanda, e *per ogni risposta negativa* si compila un foglio a parte con il problema di usabilità, la sua severità e un'eventuale descrizione della soluzione.

== Il test di usabilità
=== Definizione
Nel test di usabilità *utenti campione usano il sistema in un ambiente controllato*, sotto l'osservazione di *esperti di usabilità* che raccolgono i dati, li analizzano e traggono conclusioni. Ci sono quindi sempre due ruoli: l'*osservato* (l'utente al lavoro) e l'*osservatore* (l'esperto che lo guarda).

=== Due tipi di test

#table(
  columns: (8.5em, 1fr, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [], [*Test di compito*], [*Test di scenario*],
  [*Cosa si chiede all'utente*], [Di svolgere *compiti specifici*, scelti per esercitare le funzioni principali del sistema], [Di raggiungere un *obiettivo* attraverso una serie di compiti elementari, *senza indicarli esplicitamente*],
  [*Strategia d'azione*], [Guidata dai compiti assegnati], [L'utente deve impostare una *propria strategia*],
  table.hline(),
)

#esempio(title: "Test di compito (sito di e-commerce)")[
  + Registrarsi
  + Verificare se si può pagare con Visa e qual è l'importo minimo di un ordine
  + Verificare quali sono i tempi di consegna
  + Acquistare una scatola da 500 gr di tonno sott'olio
  + Cercare una confezione di sciroppo di acero
  + Verificare lo stato degli ordini effettuati
  + Verificare se esistono offerte speciali di pasta
]

#esempio(title: "Test di scenario (sito di e-commerce)")[
  _Scenario 1:_ Domani sera hai due amici a cena, ma non hai tempo di andare al supermercato. Decidi di fare la spesa on-line, pagando con la tua Visa. Collegati al sito e ordina gli ingredienti per una cena veloce e poco costosa, ma simpatica.
]

=== Logistica: due filosofie
Dal punto di vista organizzativo ci sono due approcci opposti, che differiscono soprattutto per il costo.

#table(
  columns: (6.5em, 1fr, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [], [*Usability lab*], [*Organizzazione informale*],
  [*Costi*], [Alti], [Bassi],
  [*Setup*], [Sala di osservazione e sala delle prove separate da uno specchio bilaterale, con telecamera], [Utente, osservatore e facilitatore intorno al sistema in prova, con istruzioni e appunti],
  table.hline(),
)

*Usability lab.* Il laboratorio è diviso in una _sala delle prove_, dove l'utente lavora al sistema ed è ripreso da una telecamera, e una _sala di osservazione_, da cui i valutatori seguono la sessione.

#figure(
  block(
    stroke: 0.5pt,
    inset: 10pt,
    width: 100%,
    align(center)[
      #set text(size: 9pt)
      #grid(
        columns: (1fr, auto, 1fr),
        align: horizon + center,
        column-gutter: 8pt,
        box(stroke: 0.5pt, inset: 8pt, width: 100%)[
          *Sala di osservazione*\
          Valutatori / osservatori\
          Apparecchiature di registrazione
        ],
        [--- _specchio bilaterale_ ---],
        box(stroke: 0.5pt, inset: 8pt, width: 100%)[
          *Sala delle prove*\
          Utente al sistema in prova\
          Telecamera
        ],
      )
    ]
  ),
  caption: [Configurazione di un usability lab]
)

*Organizzazione informale.* Bastano tre figure intorno al sistema in prova:
- l'*utente*, che pensa ad alta voce (_think aloud_) mentre svolge i compiti seguendo le istruzioni;
- l'*osservatore*, che prende appunti;
- il *facilitatore*, che conduce la sessione (vedi @sec:esecuzione_test).

Per documentare la sessione si usano strumenti economici: un *software di screen recording*, una *webcam* e un *microfono*. La registrazione risultante combina lo schermo dell'utente con l'immagine del suo volto; lo stesso approccio può essere applicato a siti web e ad applicazioni mobile (anche partendo da prototipi su carta), con il compito corrente mostrato in sovraimpressione.

=== Il thinking aloud
Nel _thinking aloud_ si chiede all'utente di *esprimere ad alta voce ciò a cui sta pensando*:
- che cosa sta cercando di fare;
- che cosa vede sullo schermo;
- come pensa di dover proseguire;
- quali dubbi e difficoltà sta provando.

È una delle tecniche osservative più usate nei test, perché rende visibili i processi mentali che altrimenti l'osservatore dovrebbe solo intuire dal comportamento.

=== Organizzare un test di usabilità
Il processo si articola in quattro fasi, a partire da un *piano di test* definito a inizio progetto, e si conclude con un *rapporto di valutazione*.

#figure(
  block(
    stroke: 0.5pt,
    inset: 10pt,
    width: 100%,
    align(center)[
      #set text(size: 8.5pt)
      #grid(
        columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr),
        align: horizon + center,
        column-gutter: 4pt,
        box(stroke: 0.5pt, inset: 5pt, width: 100%)[*Pianificazione*\ (a inizio progetto)],
        [$arrow.r$],
        box(stroke: 0.5pt, inset: 5pt, width: 100%)[*Preparazione*\ (Requisiti + Piano)],
        [$arrow.r$],
        box(stroke: 0.5pt, inset: 5pt, width: 100%)[*Esecuzione*\ (Utenti)],
        [$arrow.r$],
        box(stroke: 0.5pt, inset: 5pt, width: 100%)[*Analisi e proposte*\ $arrow.r$ Rapporto],
      )
    ]
  ),
  caption: [Fasi di organizzazione di un test di usabilità]
)

#table(
  columns: (7.5em, 8em, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [*Fase*], [*Ingressi*], [*Prodotti*],
  [*Preparazione*], [Requisiti, piano di test], [Modulo per le informazioni anagrafiche $dot.c$ descrizione di compiti/scenari $dot.c$ modulo per la raccolta di annotazioni e misure $dot.c$ questionario per l'intervista finale $dot.c$ stazione di test],
  [*Esecuzione*], [Utenti], [Appunti, misure e registrazioni $dot.c$ interviste finali],
  [*Analisi e proposte*], [Dati raccolti], [Rapporto di valutazione],
  table.hline(),
)

==== Preparazione del test
La preparazione richiede cinque attività:

+ definire *obiettivi*, *tipo di test* e *misure* da raccogliere;
+ definire *numero e tipologia degli utenti* campione;
+ definire *compiti e/o scenari d'uso*;
+ *individuare* gli utenti campione;
+ preparare *materiali e ambiente di prova*.

==== Quanti utenti?
Dipende dagli obiettivi del test e dalla complessità del sistema. Per un sito web, tipicamente:

#table(
  columns: (8em, 1fr, 1fr),
  align: (left + horizon, center + horizon, center + horizon),
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x in (1, 2) { 0.5pt },
  ),
  [], [*Check-up rapido, durante lo sviluppo*], [*Valutazione approfondita di un sito complesso*],
  [Utenti], [5--7], [10--15],
  [Compiti], [5--7 ciascuno], [---],
  [Durata per utente], [20--40 minuti], [1--1,5 ore],
  table.hline(),
)

*La regola di Nielsen.* La curva dei problemi trovati in funzione del numero di utenti campione sale molto in fretta e poi si appiattisce: *con 5 utenti si scopre circa l'85% dei problemi di usabilità*. Nelle parole di Jakob Nielsen:

$ "Dopo il quinto utente, sprecherete il vostro tempo osservando più volte gli stessi risultati, senza imparare molto di nuovo. Dopo avere osservato 5 utenti, eliminate i problemi individuati, e provate di nuovo con 5 utenti." $

#nota[
  *Approfondimento (non presente nelle slide).* La curva deriva dal modello di Nielsen e Landauer: la quota di problemi trovati con $n$ utenti è $1 - (1 - lambda)^n$, dove $lambda$ è la probabilità media (circa $31\%$) che un singolo utente incontri un dato problema. Con $n = 5$ si ottiene circa l'$85\%$.
]

*L'effetto mascheramento.* Perché conviene ripetere piccoli test iterativi invece di un unico grande test? Perché i problemi più gravi incontrati _nascondono_ gli altri: se un utente resta bloccato in un punto, non riesce a vedere (e quindi a segnalare) i problemi che stanno più avanti. Ad ogni iterazione ($n, n+1, dots$) i problemi incontrati impediscono di vederne altri; eliminandoli e ripetendo il test, emergono quelli che prima erano mascherati.

==== Quali misure raccogliere
Tipicamente si misurano:
- il *tempo* richiesto da un determinato compito;
- la percentuale di compiti portati a termine con successo (*tasso di successo*);
- la *soddisfazione* dell'utente.

#esempio(title: "Calcolo del tasso di successo")[
  Esito di 4 utenti su 6 compiti (*S* = successo, *F* = fallimento, *P* = successo parziale):

  #table(
    columns: (6.5em, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
    inset: (x: 5pt, y: 6pt),
    stroke: (x, y) => (
      top: 0.5pt,
      left: if x > 0 { 0.5pt },
    ),
    [], [*Compito 1*], [*Compito 2*], [*Compito 3*], [*Compito 4*], [*Compito 5*], [*Compito 6*],
    [Utente 1], [F], [F], [S], [F], [F], [S],
    [Utente 2], [F], [F], [P], [F], [P], [F],
    [Utente 3], [S], [F], [S], [S], [P], [S],
    [Utente 4], [S], [F], [S], [F], [P], [S],
    table.hline(),
  )

  Il successo parziale conta *metà* di un successo pieno:

  $ "Tasso di successo" = ("successi" + "parziali" times 0,5) / "numero di prove" = (9 + 4 times 0,5) / 24 approx 46% $
]

==== Materiali e ambiente di prova
Servono quattro materiali:
- la *scheda utente* (esperienza, conoscenza del sistema, ...);
- la *descrizione scritta dei compiti/scenari*, da dare agli utenti;
- il *modulo di raccolta di misure e osservazioni* per l'osservatore (uno per ogni utente e compito/scenario);
- le *domande per l'intervista finale* agli utenti.

#esempio(title: "Scheda utente")[
  + *Dati personali*: nome, età, titolo di studio, professione.
  + *Livello di conoscenza di Internet*: esperienza d'uso del web (scarsa -- media -- buona -- ottima); ore settimanali di utilizzo (meno di 1 -- tra 1 e 5 -- più di 5 -- più di 10); partecipazione a forum o chat (sì/no).
  + *Livello di conoscenza del sito*: ha già utilizzato il sito in esame? (no -- sì, meno di 3 volte -- sì, più di 3 volte -- sì, più di 10 volte); se sì, quali operazioni ha effettuato; ha mai utilizzato siti simili? (no -- sì, qualche volta -- sì, spesso); se sì, quali.
]

=== Esecuzione del test <sec:esecuzione_test>
L'esecuzione prevede tre momenti: il *briefing agli utenti*, la *conduzione del test* e l'*intervista individuale o focus group finale*.

*Briefing agli utenti.* Serve a:
- mettere gli utenti *a proprio agio*, per ridurre al massimo lo stress da esame;
- spiegare che lo scopo è *provare il sistema, non l'utente*;
- spiegare *quali registrazioni* verranno fatte e la *politica sulla privacy*;
- fornire agli utenti l'*elenco scritto dei compiti/scenari*.

*Il ruolo del facilitatore.* Durante il thinking aloud il facilitatore deve incoraggiare l'utente a parlare senza influenzarne il comportamento:

#table(
  columns: (1fr, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x == 1 { 0.5pt },
  ),
  [*Sì*], [*No*],
  ["A che cosa stai pensando?"], ["A che cosa serve quel bottone?"],
  ["Continua a parlare"], ["Perché hai cliccato lì?"],
  ["Non scoraggiarti, tenta ancora"], [],
  table.hline(),
)

#nota[
  *NB.* Le domande della colonna "No" provocano *interferenza cognitiva del think-aloud*: spingono l'utente a ragionare su ciò che sta facendo in modo diverso da come farebbe spontaneamente, alterando il comportamento osservato.
]

*Intervista o focus group finale.* Si discutono i *punti di forza e di debolezza* dell'applicazione, gli *aspetti da migliorare* e quelli *graditi e sgraditi*. È utile predisporre un questionario ad uso dell'intervistatore.

=== Analisi dei risultati e proposte finali
Dopo il test si procede con:

+ l'*analisi dettagliata* dei dati e della registrazione;
+ l'*elenco dei singoli problemi* e della loro gravità (ad esempio _bloccanti / bypassabili / lievi_);
+ l'*elenco degli interventi suggeriti* e delle loro priorità;
+ la *stesura del rapporto di valutazione*.

==== Esempio: elenco dei problemi
_Compito: registrazione utente in un sito di e-commerce._ La priorità è indicata con una lettera (legenda non riportata nelle slide: verosimilmente *A* = alta, *M* = media, *B* = bassa).

#table(
  columns: (2.2em, 1fr, 5em),
  align: (center + horizon, left + horizon, center + horizon),
  inset: (x: 8pt, y: 6pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x > 0 { 0.5pt },
  ),
  [*\#*], [*Problema identificato*], [*Priorità*],
  [1], [Se si accede alla registrazione dalla Home Page, nella prima videata viene richiesta "la Verifica del CAP": l'utente non comprende il significato dell'acronimo CAP (ritiene si tratti di un codice personale post-registrazione). Dopo l'intervento del facilitatore per spiegarlo, dichiara di non comprendere l'utilità di tale verifica.], [A],
  [2], [Difficoltà nel comprendere il significato dei campi \[Domanda\] e \[Risposta\]; non viene data alcuna informazione sul motivo di tale richiesta.], [A],
  [3], [Non viene segnalato in alcun modo che il numero di caratteri inseribili in \[Domanda\] e \[Risposta\] è limitato: l'utente non può accorgersi che entrambe le stringhe saranno troncate.], [A],
  [4], [Iniziale smarrimento nella conferma della registrazione: l'utente si aspettava un comando "Invia" e non "Salva i dati password" (etichetta ricavata dal nome dell'immagine `Salva_dati password.gif`).], [B],
  [5], [Viene imposto l'obbligo di inserire due numeri telefonici, creando frustrazione (se non ha un secondo numero utile per gli scopi indicati, l'utente si mostra riluttante).], [A],
  [6], [Nell'inserire i dati per la consegna a una terza persona, trovando reinseriti i propri dati, non si accorge del vero scopo della schermata e aggiunge i suoi dati, lamentandosi inoltre che gli viene richiesto il CAP per la terza volta.], [A],
  [7], [Identifica il simbolo di Page Up `[^]` a piè pagina come indicatore per muoversi sequenzialmente tra le pagine (Forward, Back) anziché come funzione di scrolling nella pagina.], [M],
  [8], [L'utente dimostra di non gradire l'opzione di default "Accetto di essere contattato da SPESACLIC per eventuali ricerche di mercato".], [M],
  [9], [Gli acronimi non vengono sciolti.], [A],
  table.hline(),
)

==== Esempio: elenco degli interventi suggeriti
_Area: carrello -- cassa -- scontrino._ Qui la priorità è numerica (1 = più urgente, 2 = meno urgente).

#table(
  columns: (2.2em, 1fr, 5em),
  align: (center + horizon, left + horizon, center + horizon),
  inset: (x: 8pt, y: 6pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x > 0 { 0.5pt },
  ),
  [*\#*], [*Raccomandazione*], [*Priorità*],
  [1], [Lasciare sempre in vista i contenuti del carrello.], [1],
  [2], [Di fianco a ogni prodotto del carrello inserire il comando "elimina dal carrello" oppure "elimina"; il comando "svuota il carrello" può restare in alto a inizio lista.], [1],
  [3], [I prodotti inseriti nel carrello saranno quelli conteggiati per la spesa: non occorrerà selezionarli.], [1],
  [4], [Cambiare "Totale Spesa" in "Totale Carrello".], [2],
  [5], [Sostituire il termine "conferma l'ordine" con il comando "Invia l'ordine", più chiaro e convenzionale in Internet.], [1],
  [6], [Trovare una modalità più chiara per scegliere data e fascia oraria di consegna; ad esempio sottolineando con un link ogni possibilità di scelta.], [1],
  [7], [Dare informazioni sulle possibili modalità di pagamento e offrire un link verso la pagina con le informazioni di dettaglio.], [1],
  [8], [Indicare i dati riassuntivi della spesa appena effettuata e inviare un messaggio di conferma all'e-mail del cliente.], [1],
  [9], [Rendere possibile la stampa dalla pagina contenente i dati riassuntivi.], [2],
  [10], [Eliminare i termini "scontrino" e "cassa", termini arbitrari perché non corrispondono a funzioni reali e utili per fare la spesa on-line.], [2],
  table.hline(),
)

== Altre tecniche basate sull'utente <sec:altre_tecniche>
*Inchieste (_inquiry_).* Comprendono interviste individuali, questionari on-line e focus group. Sono utili, ma *non possono sostituire i test di usabilità*: raccolgono opinioni dichiarate, non il comportamento osservato durante l'uso. \
*Esperimenti di laboratorio statisticamente significativi.* Servono a rispondere a domande mirate, ad esempio sulla *leggibilità dei testi sul video* (dimensione e tipo di font, colori ottimali...) o sull'*efficacia dei banner pubblicitari* nelle pagine web. Richiedono una *metodologia rigorosa*, che il corso non tratta: scelta del campione, definizione delle ipotesi, conduzione dell'esperimento e analisi dei risultati con i metodi della statistica. \
*Controllo di risposte fisiologiche.* Speciali apparecchiature permettono di condurre test sulle risposte fisiologiche dell'utente durante l'interazione con il sistema. In particolare:
- apparecchiature per il *tracciamento dei movimenti oculari* (eye tracking);
- apparecchiature per il *rilevamento di reazioni emotive*: attività cardiaca, sudorazione, attività elettrica nel cervello, tono muscolare.

== Classificare i problemi trovati
Qualunque sia la tecnica di valutazione utilizzata (ispezione o test con utenti), i problemi individuati vanno *classificati in base alla loro importanza*, per decidere cosa correggere e quando. Un esempio di classificazione:

#table(
  columns: (11em, 1fr),
  align: left + horizon,
  inset: (x: 8pt, y: 8pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x == 1 { 0.5pt },
  ),
  [*Livello*], [*Cosa significa*],
  [*Problema irrilevante*], [Può non essere risolto],
  [*Problema secondario*], [Da risolvere con bassa priorità],
  [*Problema rilevante*], [Da risolvere con alta priorità],
  [*Problema bloccante*], [Deve necessariamente essere risolto *prima che il sistema venga rilasciato*],
  table.hline(),
)

Questa logica è la stessa che ritroviamo nei diversi metodi del modulo: il _grado di severità_ (scala 0--4) della valutazione euristica, la _severità_ nel foglio del cognitive walkthrough, la _gravità e priorità_ (bloccanti / bypassabili / lievi; A--M--B) nel report del test di usabilità.

== Riepilogo dei metodi

#table(
  columns: (8.5em, 6em, 8em, 1fr, 9.5em),
  align: left + horizon,
  inset: (x: 6pt, y: 6pt),
  stroke: (x, y) => (
    top: 0.5pt,
    left: if x > 0 { 0.5pt },
  ),
  [*Metodo*], [*Famiglia*], [*Chi lo svolge*], [*Idea chiave*], [*Limite principale*],
  [*Valutazione euristica*], [Ispezione], [3--5 esperti, in modo indipendente], [Verificare la conformità a poche regole generali (le 10 euristiche di Nielsen) e dare un grado di severità ai problemi], [Soggettività; dipende dall'esperienza del valutatore; report vaghi],
  [*Cognitive walkthrough*], [Ispezione], [Singolo valutatore o gruppo con ruoli definiti], [Simulare l'_exploratory learning_ dell'utente azione per azione con quattro domande guida], [Richiede un'interfaccia già progettata in dettaglio (anche su carta)],
  [*Test di usabilità* (compito / scenario)], [User-based], [Utenti campione osservati da esperti, con un facilitatore], [Osservare utenti reali al lavoro, con thinking aloud e misure (tempo, tasso di successo, soddisfazione)], [Costi; campione rappresentativo difficile da ottenere],
  [*Inchieste* (interviste, questionari, focus group)], [User-based], [Sperimentatori / moderatore esperto di HCI], [Raccogliere esperienze, opinioni e motivazioni], [Non sostituiscono i test di usabilità],
  [*Esperimenti di laboratorio*], [User-based], [Ricercatori, con rigore statistico], [Testare ipotesi mirate (es. leggibilità, banner)], [Metodologia rigorosa e onerosa],
  [*Risposte fisiologiche*], [User-based], [Ricercatori con apparecchiature speciali], [Misurare movimenti oculari e reazioni emotive durante l'uso], [Servono apparecchiature specializzate],
  table.hline(),
)
