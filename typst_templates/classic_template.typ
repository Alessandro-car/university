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

  // 3. Sistema automatico di referenze per nome (e nascondi didascalie default)

  // Mostra solo il corpo (il nostro blocco) e nasconde la caption di default di Typst
  show figure.where(kind: "theorem"): it => it.body
  show figure.where(kind: "definition"): it => it.body

  // Intercetta la @label e stampa il titolo
  show ref: it => {
    let el = it.element
    if el != none and el.func() == figure and el.caption != none and (el.kind == "theorem" or el.kind == "definition") {
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
