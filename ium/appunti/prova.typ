Lo standard ISO 9241-110 definisce uno standard per la realizzazione di sistemi error-tollerant, ovvero, sistemi che permettono all'utente di raggiungere gli obiettivi desiderati nonostante gli errori compiuti. Il progettista deve predisporre tutti gli accorgimenti per evitare che l'utente commetta errori oppure di gestirli nel modo più corretto.

= Errore umano

Anche l'utente più esperto commette errori. Il progettista deve innanzitutto comprendere che l'utente che sbaglia non è un utente sbagliato, ed evitare di colpevolizzarlo, o pretendere da lui un'impossibile perfezione. Deve accettare il fatto che l'utente sbaglia perché il sistema gli consente di sbagliare e questo è un difetto ascrivibile a cattiva progettazione. Il progettista deve allora predisporre tutti gli accorgimenti per evitare questa eventualità o gestirla nel modo più corretto quando si verifica.

_Errore_ significa anche:

$ "atto e effetto di allontanarsi dalla verità o dalla norma convenuta" $

Questo è un termine troppo generico. In modo più specifico:

#definizione[
  L'errore è un termine generico per comprendere tutti quei casi in cui una sequenza pianificata di attività fisiche o mentali fallisce il suo scopo, e quando questo fallimento non possa essere attribuito all'intervento di qualche agente casuale.
]

#figure(
  image("Pasted image 20261116151526.png"),
)

Lo schema sopra è considerato corretto quando si verificano tre condizioni:
- l'utente aveva l'intenzione di agire;
- l'azione è proceduta come desiderato;
- l'azione ha ottenuto il suo scopo.

Se non si verificano tutte queste tre condizioni, si hanno quattro fondamentali tipi di errori:
- _azione intenzionale ma errata_ (_mistake_): si verifica quando l'utente ha agito con intenzione, l'azione si è svolta come pianificato, ma non ha ottenuto lo scopo prefissato.
- _azione non intenzionale_ (_slip_ o lapsus): si ha un lapsus quando, parlando o scrivendo, si sostituisce involontariamente una parola con un'altra. Generalizzando, sostituzione di azioni o comportamenti al posto di altri.
- _azione spontanea_: l'azione è compiuta intenzionalmente, ma senza che l'utente avesse precedentemente l'intenzione di agire.
- _azione involontaria_: l'azione è del tutto non intenzionale.

Le strategie che il progettista attua per limitare la possibilità e le conseguenze dell'errore umano sono riassunte nella figura seguente:

#figure(
  image("Pasted image 20261116152226.png"),
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

Serve a prevenire i lapsus. Si tratta di fare in modo che le azioni che l'utente deve eseguire per effettuare compiti diversi siano ben diversificate, in modo da minimizzare la probabilità che l'utente ne esegua inavvertitamente una al posto dell'altra.

=== Evitare comportamenti modali

Chiamiamo _modale_ un sistema che, a fronte di una stessa azione dell'utente, si comporta diversamente a seconda dello stato in cui si trova, e questo stato non è facilmente riconoscibile dall'utente. Se l'utente non conosce lo stato, non può prevedere come il sistema risponderà alle sue azioni.
- Es: funzione di riconoscimento della password (minuscole considerate diverse dalle maiuscole).
- Quando eseguo _copy_ o _cut_, l'oggetto copiato o tagliato viene inserito nella clipboard, ma non è visibile: cambia stato ma l'utente non lo vede.

#figure(
  image("Pasted image 20261116152915.png"),
)

=== Usare funzioni obbliganti

Viene definita _obbligante_ una funzione in cui le azioni dell'utente sono vincolate in modo tale che la mancata esecuzione di un passaggio impedisce il successivo. In tal modo egli è obbligato a compiere le azioni nella sequenza corretta. Si tratta di una tecnica molto efficace di prevenzione degli errori.

_Esempio._ In un sistema desktop quale delle seguenti due soluzioni è preferibile?
- opzione 1:
  - selezione azione
  - selezione oggetto
- opzione 2:
  - selezione oggetto
  - selezione azione

È preferibile l'opzione 2: selezionando l'oggetto desiderato il sistema disabilita tutte le voci di menu che corrispondono ad azioni che non hanno senso su tale oggetto.

=== Imporre input vincolati

Questa tecnica, che generalizza quella delle funzioni obbliganti, consiste nel permettere all'utente di fornire solo valori di input corretti, ovvero azioni lecite nel contesto corrente.

_Esempio._

#figure(
  image("Pasted image 20261116153349.png"),
)

=== Non sovraccaricare la memoria a breve termine

Dialoghi che sovraccaricano la memoria a breve termine risultano faticosi per l'utente e aumentano la probabilità che egli commetta degli errori. Tipico è il caso dei messaggi pre-registrati dei call-center.

_Esempio._ "Per informazioni sulle nuove offerte, premi 1: per informazioni sulle tariffe e così via; premi 2: se sei interessato a conoscere i nuovi servizi e così via; premi 3: se desideri comunicare furto o smarrimento del tuo telefono o per assistenza specifica; premi 4: se desideri ricevere informazioni sul credito; premi 5: se desideri parlare con un operatore premi 0."

=== Richiedere conferme

Il sistema dovrebbe sempre avvertire l'utente quando questi richiede l'esecuzione di azioni irreversibili o comunque potenzialmente pericolose, e domandare conferma. Le richieste di conferma devono essere formulate in modo semplice e non ambiguo. Il sistema non deve costringere l'utente a conferme troppo complicate come quella che segue:

#figure(
  image("Pasted image 20261116154216.png"),
)

=== Usare default inoffensivi

Questa tecnica consiste nell'usare valori di default inoffensivi. Il sistema, in altre parole, non dovrebbe mai intraprendere per default l'azione più pericolosa tra quelle possibili in un determinato contesto.

_Esempio._ La richiesta di stampa di un documento Microsoft Word 2007 ha come default l'opzione _Pagine da stampare = tutte_. Non viene richiesta alcuna conferma, nemmeno nel caso di documenti lunghi.

= Diagnosi

Anche se il progettista adotta le tecniche di prevenzione più appropriate, resterà sempre la possibilità che l'utente commetta un errore. Pertanto, il sistema deve sempre controllare l'input e, nel caso si riveli scorretto, dovrà fornire all'utente una spiegazione adeguata, che gli permetta di recuperare la situazione in modo rapido, senza incertezze e senza stress.

Sono tre le funzioni che un messaggio di errore ben progettato deve svolgere:
- _allertare_: segnalare qualcosa che non va;
- _identificare_: indicare che cosa non va, e perché;
- _dirigere_: spiegare all'utente i passi che deve compiere per ripristinare una situazione corretta.

#figure(
  image("Pasted image 20261116154436.png"),
)

== Messaggi di errore: linee guida

- spiegare esplicitamente che cosa non va;
- dare indicazioni costruttive su come risolvere il problema;
- nel linguaggio dell'utente ed in modo educato, esauriente e preciso.

== Linee guida per il web

- i messaggi di errore siano chiaramente visibili ed espressi in un linguaggio chiaro, comprensibile a tutti;
- preservare, per quanto possibile, il lavoro già fatto dall'utente;
- ridurre al massimo il lavoro necessario per correggere l'errore.

_Esempio._

#figure(
  image("Pasted image 20261116154729.png"),
)

Tutti gli esempi discussi si riferiscono a singoli errori. Sono frequenti tuttavia situazioni più complesse, in cui l'utente compie più di uno sbaglio.

#figure(
  image("Pasted image 20261116155146.png", width: 437pt),
)

In questo caso risulta difficile per l'utente leggere tutti gli errori: egli è costretto a prendere appunti sulle correzioni da effettuare. La soluzione di gran lunga più corretta è quella esemplificata successivamente, in cui la segnalazione di errore è visualizzata immediatamente sopra il campo errato.

#figure(
  image("Pasted image 20261116155318.png", width: 408pt),
)

La spiegazione dell'errore e di come fare per correggerlo dovrebbe essere particolarmente dettagliata e chiara quando il sistema si rivolge a utenti poco esperti.

#figure(
  image("Pasted image 20261116155402.png"),
)

Per evitare una verbosità eccessiva, può convenire esprimere il messaggio in forma sintetica, permettendo però all'utente di richiedere spiegazioni più dettagliate.

== Progettare per l'errore: temi

#figure(
  image("Pasted image 20261116155620.png", width: 574pt),
)

= Correzione (error recovery, ripristino)

Quando l'utente commette un errore, deve essere possibile correggerlo. Questo processo può essere attuato, secondo i casi, dall'utente o dal sistema o da entrambi, in modo cooperativo. Le situazioni possibili sono schematizzate nella figura sotto: a partire da uno stato iniziale del sistema, l'utente compie un'azione. Se l'azione è corretta, il sistema si porta nello stato desiderato, indicato in figura come _stato finale_. Se l'azione non è corretta, il sistema si porta in uno _stato di errore_.

#figure(
  image("Pasted image 20261116155844.png"),
)

A partire da questo stato, il processo di correzione può avvenire con due strategie diverse, a seconda della situazione.

== Backward recovery

Si tratta di annullare le conseguenze negative dell'errore commesso e riportare il sistema nello stato iniziale, dal quale l'utente potrà compiere, questa volta in modo corretto, l'azione che aveva sbagliato. Il processo per riportare il sistema nello stato iniziale si chiama _ripristino_. Nel caso elementare della data sbagliata, la backward recovery consisterà semplicemente nel cancellare dal campo di input il valore scorretto. Questo compito può venir fatto dall'utente o dal sistema.

La backward recovery può essere considerata un modo di tornare indietro nel tempo. Il modo più semplice di farlo è quello di utilizzare una funzione di _undo_, che annulli le conseguenze dell'ultima azione. I sistemi più evoluti permettono di annullare le ultime $n$ azioni dell'utente, con $n$ anche molto grande.

== Forward recovery

Esistono situazioni in cui la correzione dell'errore avviene con un processo diverso. Invece di tornare allo stato iniziale e da lì ripetere l'azione, si cerca di raggiungere lo stato finale direttamente dallo stato di errore, senza prima tornare indietro. Può essere effettuato automaticamente dal sistema o richiedere l'intervento dell'utente. Un sistema che attua sistematicamente strategie di forward recovery si dice _error tolerant_. Di seguito si mostra il comportamento di Google quando l'utente compie un errore di battitura:

#figure(
  image("Pasted image 20261116160855.png"),
)

L'esempio sopra mostra come in molti casi la recovery sia imperfetta: si può solo arrivare a un'approssimazione dello stato desiderato. Un piatto aggiustato con la colla non è mica un piatto nuovo!

#figure(
  image("Pasted image 20261116160727.png", width: 555pt),
)

In ogni caso, che si tratti di recovery avanti o indietro, sarà bene che il progettista ricordi le raccomandazioni seguenti:
- _minimo sforzo di correzione_: i passi richiesti all'utente per correggere l'errore dovrebbero essere il più possibile semplici;
- _correzione differibile_: l'utente dovrebbe poter rimandare la correzione dell'errore a un momento successivo;
- _correzione automatica modificabile_: il sistema dovrebbe avvisare l'utente della correzione e dargli la possibilità di correggerla.

= Tolleranza verso gli errori

Un dialogo è _tollerante_ verso l'errore quando, a dispetto di evidenti errori nell'input, i risultati desiderati possono essere ottenuti senza azioni correttive.

== Conclusione

Il progettista non deve concepire una semplice dicotomia fra errori e comportamento corretto: al contrario, tutta l'interazione uomo-macchina deve essere trattata come una procedura cooperativa fra i due, dove gli equivoci possono nascere da ambo le parti.
