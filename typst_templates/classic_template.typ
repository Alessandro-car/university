// --- The Main Template Function ---
#let conf(
  title: none,
  author: "Alessandro Carella",
  index: true,
  doc,
) = {
  // 1. Page & Typography Configuration
  set page(
    paper: "a4",
    margin: (x: 3.5cm, y: 4cm),
    numbering: "1",
  )

  set text(
    font: "New Computer Modern",
    size: 11pt,
    lang: "it",
    hyphenate: true
  )

  set par(justify: true, leading: 0.7em, first-line-indent: 1.5em)

  // 2. Elegant, Classic Headings
  set heading(numbering: "1.")

  show heading.where(level: 1): it => block(
    align(center)[
      #v(2em)
      #text(size: 14pt, weight: "regular", smallcaps(it.body))
      #v(1.5em)
    ]
  )

  show heading.where(level: 2): it => block(
    align(left)[
      #v(1em)
      #text(size: 12pt, weight: "bold", it)
      #v(0.5em)
    ]
  )

	// 6. Configurazione dei blocchi di codice (Stile Text Editor con numeri di riga)
  show raw.where(block: true): it => block(
    fill: luma(248),
    stroke: (left: 2pt + luma(150)),
    inset: (left: 10pt, top: 10pt, bottom: 10pt, right: 10pt),
    width: 100%,
    breakable: true,
    text(size: 7.5pt)[
      // Questa regola aggiunge il numero a sinistra di ogni riga
      #show raw.line: l => {
        // Box per il numero (allineato a destra, grigio chiaro per non distrarre)
        box(width: 1.5em, align(right)[#text(fill: luma(150))[#l.number]])
        // Spazio tra il numero e il codice
        h(1em)
        // Il testo effettivo del codice
        l.body
      }
      #it
    ]
  )

  // Il codice inline (es. `variabile`) rimane invariato e senza numeri
  show raw.where(block: false): it => box(
    fill: luma(248),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
    text(size: 10pt, it)
  )

  // 3. Sistema automatico di referenze per nome (e nascondi didascalie default)

  // Mostra solo il corpo (il nostro blocco) e nasconde la caption di default di Typst
  show figure.where(kind: "theorem"): it => it.body
  show figure.where(kind: "definition"): it => it.body
	show figure.where(kind: "example"): it => it.body
	show figure.where(kind: "exercise"): it => it.body
	show figure.where(kind: "code"): it => it.body
	show figure.where(kind: "algorithm"): it => it.body

  // Intercetta la @label e stampa il titolo
  show ref: it => {
    let el = it.element
    if el != none and el.func() == figure and el.caption != none and (el.kind == "theorem" or el.kind == "definition" or el.kind == "example" or el.kind == "exercise" or el.kind == "algorithm" or el.kind == "code") {
      link(it.target)[#el.caption.body]
    } else {
      it
    }
  }

  // 4. Title Page Generator
  if title != none {
    align(center)[
      #v(20%)
      #text(size: 20pt, weight: "regular", smallcaps(title)) \
      #v(1.5em)
      #text(size: 12pt, style: "italic")[#author]
    ]
    pagebreak()
  }

  // 5. Classic Table of Contents (Index)
  if index {
    outline(
      title: "Indice",
      indent: auto,
      depth: 3
    )
    pagebreak()
  }

  // Insert the actual document content
  doc
}


// --- Classic Theorem Environments (Auto-referencing by title) ---

#let teorema(title: none, body) = figure(
  kind: "theorem",
  supplement: "Teorema",
  numbering: "1",
  caption: title,
  block(
    width: 100%,
    spacing: 1.5em,
    breakable: true
  )[
    #text(weight: "bold")[Teorema #context counter(figure.where(kind: "theorem")).display().]
    #if title != none [ (#title) ]
    #text(style: "italic")[#body]
  ]
)

#let corollario(title: none, body) = figure(
  kind: "theorem",
  supplement: "Corollario",
  numbering: "1",
  caption: title,
  block(
    width: 100%,
    spacing: 1.5em,
    breakable: true
  )[
    #text(weight: "bold")[Corollario #context counter(figure.where(kind: "theorem")).display().]
    #if title != none [ (#title) ]
    #text(style: "italic")[#body]
  ]
)

#let definizione(title: none, body) = figure(
  kind: "definition",
  supplement: "Definizione",
  numbering: "1",
  caption: title,
  block(
    width: 100%,
    spacing: 1.5em,
    breakable: true
  )[
		#set align(start)
    #text(weight: "bold")[Definizione #context counter(figure.where(kind: "definition")).display().]
    #if title != none [ (#title) ]
    #body
  ]
)

// Classic Proof Environment (Unnumbered)
#let dimostrazione(body) = block(
  width: 100%,
  spacing: 1.5em,
  breakable: true
)[
  #text(style: "italic")[Dimostrazione.]
  #body
  #h(1fr) $square$
]

// Simple Note Environment (Unnumbered)
#let nota(body) = block(
  width: 100%,
  spacing: 1.5em,
  breakable: true
)[
  #text(style: "italic")[Nota.]
  #body
]

#let esempio(title: none, body) = figure(
	kind: "example",
  supplement: "Esempio",
  numbering: "1",
  caption: title,
  block(
    width: 100%,
    spacing: 1.5em,
    breakable: true
  )[
		#set align(start)
    #text(weight: "bold")[Esempio #context counter(figure.where(kind: "example")).display().]
    #if title != none [ (#title) ]
    #body
  ]
)

// Classic Exercise Environment
#let esercizio(title: none, body) = figure(
  kind: "exercise",
  supplement: "Esercizio",
  numbering: "1",
  caption: title,
  block(
    width: 100%,
    spacing: 1.5em,
    breakable: true
  )[
		#set align(start)
    #text(weight: "bold")[Esercizio #context counter(figure.where(kind: "exercise")).display().]
    #if title != none [ (#title) ]
    #body
  ]
)

#let codice(title: none, body) = figure(
  kind: "code",
  supplement: "Codice",
  numbering: none, // <-- Disabilita la numerazione
  caption: title,
  block(
    width: 100%,
    spacing: 1.5em,
    breakable: true
  )[
    #text(weight: "bold")[Codice] // <-- Rimosso il contatore
    #if title != none [ (#title) ]
    #v(0.5em)
    #body
  ]
)

// Ambiente per Algoritmi/Pseudocodice
#let algoritmo(title: none, body) = figure(
  kind: "algorithm",
  supplement: "Algoritmo",
  numbering: "1.1",
  caption: title,
  block(width: 100%, breakable: true)[
    // Titolo centrato
    #align(center)[
      #text(weight: "bold")[Algoritmo #context counter(figure.where(kind: "algorithm")).display():]
      #if title != none [ #title ]
    ]
    #v(0.5em)
    #line(length: 100%, stroke: 0.5pt + black)
    #v(0.5em)
    // Corpo dell'algoritmo
    #block(
      width: 100%,
      fill: luma(250), // Sfondo quasi invisibile, molto accademico
      inset: (left: 0pt, right: 10pt, top: 5pt, bottom: 5pt),
    )[
      #set align(start)
      #set text(font: "New Computer Modern Mono", size: 9.5pt)
      // Stile per le righe: trasforma la lista numerata in numeri di riga grigi
      #set enum(
        numbering: n => text(fill: luma(150), size: 8pt)[#n],
        indent: 10pt,
        body-indent: 1em
      )
      #body
    ]
  ]
)
