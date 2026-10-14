#import "@preview/lovelace:0.3.0": *

// --- Palette Colori Classica & Accademica ---
#let c-thm  = rgb("#1b365d") // Blu navy profondo (Teoremi, Proposizioni, Corollari)
#let c-def  = rgb("#1e4d2b") // Verde bosco scuro (Definizioni)
#let c-ex   = rgb("#6b2d26") // Borgogna/Terracotta scuro (Esempi)
#let c-exer = rgb("#3d454d") // Grigio ardesia (Esercizi, Note)

// Colori per l'ambiente Pseudocodice / Algoritmo
#let c-algo-border  = rgb("#2b4c7e") // Blu acciaio
#let c-algo-header  = rgb("#eef3f8") // Azzurro polvere chiarissimo (header)
#let c-algo-bg      = rgb("#f9fbfd") // Bianco freddo appena azzurrato (corpo)
#let c-algo-kw      = rgb("#1a3e72") // Blu per keyword
#let c-algo-lit     = rgb("#8b2635") // Rosso scuro per letterali/tipi
#let c-algo-comment = rgb("#6e7781") // Grigio per numeri di riga e commenti

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

  // ------------------------------------------------------------------
  // 6. Configurazione dei blocchi di codice (Nativa Typst)
  // ------------------------------------------------------------------

  show raw.where(block: true): set par(leading: 0.6em)

  // Applica il tema stile-LaTeX personalizzato
  set raw(theme: "custom_code.tmTheme")

  // Configurazioni specifiche per il tab-size per vari linguaggi
  show raw.where(lang: "java"): set raw(tab-size: 4)
  show raw.where(lang: "cpp"): set raw(tab-size: 2)
  show raw.where(lang: "ml"): set raw(tab-size: 2)
  show raw.where(lang: "ada"): set raw(tab-size: 3)
  show raw.where(lang: "pascal"): set raw(tab-size: 2)
  // Default per tutti gli altri
  set raw(tab-size: 4)

  // Stile grafico del blocco di codice reale
  show raw.where(block: true): it => block(
    fill: luma(248),
    stroke: (left: 2pt + luma(150)),
    inset: (left: 10pt, top: 10pt, bottom: 10pt, right: 10pt),
    width: 100%,
    breakable: true,
    text(
      size: 9pt,
      font: ("Fira Code", "Menlo", "Consolas", "Courier New")
    )[
      // Questa regola aggiunge il numero a sinistra di ogni riga
      #show raw.line: l => {
        box(width: 1.5em, align(right)[#text(fill: luma(150))[#l.number]])
        h(1em)
        l.body
      }
      #it
    ]
  )

  // Il codice inline (es. `variabile`)
  show raw.where(block: false): it => box(
    fill: luma(248),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
    text(
      size: 10pt,
      font: ("Fira Code", "Menlo", "Consolas", "Courier New"),
      it
    )
  )

  // ------------------------------------------------------------------
  // 3. Sistema automatico di referenze per nome
  // ------------------------------------------------------------------

  show figure: set block(breakable: true)
  show figure.where(kind: "theorem"): it => it.body
  show figure.where(kind: "definition"): it => it.body
  show figure.where(kind: "example"): it => it.body
  show figure.where(kind: "exercise"): it => it.body
  show figure.where(kind: "code"): it => it.body
  show figure.where(kind: "algorithm"): it => it.body
  show figure.where(kind: "proposition"): it => it.body

  show ref: it => {
    let el = it.element
    if el != none and el.func() == figure and el.caption != none and (
      el.kind == "theorem" or el.kind == "definition" or el.kind == "example" or el.kind == "exercise" or el.kind == "algorithm" or el.kind == "code" or el.kind == "proposition"
    ) {
      link(it.target)[#el.caption.body]
    } else {
      it
    }
  }

  // ------------------------------------------------------------------
  // 4. Title Page Generator
  // ------------------------------------------------------------------
  if title != none {
    align(center)[
      #v(20%)
      #text(size: 20pt, weight: "regular", smallcaps(title)) \
      #v(1.5em)
      #text(size: 12pt, style: "italic")[#author]
    ]
    pagebreak()
  }

  // ------------------------------------------------------------------
  // 5. Classic Table of Contents (Index)
  // ------------------------------------------------------------------
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

// ==================================================================
// AMBIENTI CLASSICI ED ELEGANTI (Filetto laterale sobrio, zero box)
// ==================================================================

#let classic-env(
  label-text,
  title: none,
  accent: black,
  italic-body: false,
  body
) = block(
  width: 100%,
  above: 1.6em,
  below: 1.6em,
  stroke: (left: 0.85pt + accent),
  inset: (left: 12pt, top: 2pt, bottom: 2pt),
  breakable: true,
)[
  #set align(start)
  #set par(first-line-indent: 0pt)
  #text(weight: "bold", fill: accent, smallcaps(label-text))#if title != none [
    #text(weight: "regular", style: "italic", fill: luma(60))[ (#title)]
  ]#text(weight: "bold", fill: accent)[.]
  #h(0.35em)
  #if italic-body {
    emph(body)
  } else {
    body
  }
]

#let teorema(title: none, body) = figure(
  kind: "theorem",
  supplement: "Teorema",
  numbering: "1",
  caption: title,
  classic-env(
    [Teorema #context counter(figure.where(kind: "theorem")).display()],
    title: title,
    accent: c-thm,
    italic-body: true,
    body
  )
)

#let proposizione(title: none, body) = figure(
  kind: "proposition",
  supplement: "Proposizione",
  numbering: "1",
  caption: title,
  classic-env(
    [Proposizione #context counter(figure.where(kind: "proposition")).display()],
    title: title,
    accent: c-thm,
    italic-body: true,
    body
  )
)

#let corollario(title: none, body) = figure(
  kind: "theorem",
  supplement: "Corollario",
  numbering: "1",
  caption: title,
  classic-env(
    [Corollario #context counter(figure.where(kind: "theorem")).display()],
    title: title,
    accent: c-thm,
    italic-body: true,
    body
  )
)

#let definizione(title: none, body) = figure(
  kind: "definition",
  supplement: "Definizione",
  numbering: "1",
  caption: title,
  classic-env(
    [Definizione #context counter(figure.where(kind: "definition")).display()],
    title: title,
    accent: c-def,
    italic-body: false,
    body
  )
)

#let esempio(title: none, body) = figure(
  kind: "example",
  supplement: "Esempio",
  numbering: "1",
  caption: title,
  classic-env(
    [Esempio #context counter(figure.where(kind: "example")).display()],
    title: title,
    accent: c-ex,
    italic-body: false,
    body
  )
)

#let esercizio(title: none, body) = figure(
  kind: "exercise",
  supplement: "Esercizio",
  numbering: "1",
  caption: title,
  classic-env(
    [Esercizio #context counter(figure.where(kind: "exercise")).display()],
    title: title,
    accent: c-exer,
    italic-body: false,
    body
  )
)

// Classic Proof Environment (Unnumbered)
#let dimostrazione(body) = block(
  width: 100%,
  above: 1.2em,
  below: 1.6em,
  inset: (left: 12pt),
  breakable: true
)[
  #set align(start)
  #set par(first-line-indent: 0pt)
  #text(style: "italic", weight: "bold", fill: luma(70))[Dimostrazione.]
  #h(0.35em)
  #body
  #h(1fr) $square$
]

// Simple Note Environment (Unnumbered)
#let nota(body) = classic-env(
  [Nota],
  accent: luma(140),
  italic-body: false,
  body
)

#let codice(title: none, body) = figure(
  kind: "code",
  supplement: "Codice",
  numbering: none,
  caption: title,
  block(
    width: 100%,
    spacing: 1.5em,
    breakable: true
  )[
    #text(weight: "bold", fill: c-algo-border, smallcaps[Codice])
    #if title != none [ (#title) ]
    #v(0.5em)
    #body
  ]
)

// ==================================================================
// AMBIENTE ALGORITMO / PSEUDOCODICE (Compatibile con #pseudocode-list)
// ==================================================================

// Impostazioni globali di lovelace per armonizzarsi col template
#let pseudocode-list = pseudocode-list.with(
  line-numbering: n => text(fill: c-algo-comment, size: 8.5pt)[#n:],
  indentation: 1.2em,
  stroke: 0.5pt + c-algo-border.lighten(60%),
  booktabs: false,
)

#let algoritmo(title: none, body) = figure(
  kind: "algorithm",
  supplement: "Algoritmo",
  numbering: "1.1",
  caption: title,
  block(
    width: 100%,
    above: 1.8em,
    below: 1.8em,
    breakable: true,
    stroke: (
      top: 1.2pt + c-algo-border,
      bottom: 1.2pt + c-algo-border,
      left: 0.4pt + c-algo-border.lighten(50%),
      right: 0.4pt + c-algo-border.lighten(50%),
    ),
    radius: 2pt,
    clip: true,
  )[
    #set align(start)
    #set par(first-line-indent: 0pt)

    // Intestazione dell'algoritmo
    #block(
      width: 100%,
      fill: c-algo-header,
      inset: (x: 12pt, y: 7pt),
      stroke: (bottom: 0.6pt + c-algo-border.lighten(40%)),
    )[
      #text(weight: "bold", fill: c-algo-border, smallcaps[
        Algoritmo #context counter(figure.where(kind: "algorithm")).display()
      ])#if title != none [
        #text(weight: "bold", fill: c-algo-border)[ --- ]
        #text(weight: "medium", style: "italic", fill: c-algo-border.darken(20%))[#title]
      ]
    ]

    // Corpo dello pseudocodice
    #block(
      width: 100%,
      fill: c-algo-bg,
      inset: (x: 12pt, y: 10pt),
      breakable: true,
    )[
      #set text(font: ("Fira Code", "Menlo", "Consolas", "Courier New"), size: 9.2pt)
      #set par(leading: 0.65em)

      // Colora in blu tutte le keyword messe in grassetto (*procedure*, *if*, *for*...)
      #show strong: set text(fill: c-algo-kw)

      // Evidenziazione automatica per eventuali keyword non in grassetto
      #show regex("\b(function|procedure|begin|end|if|then|else|elif|elseif|while|do|for|each|in|to|downto|repeat|until|return|Input|Output|Local|input|output|require|ensure|let|set|select|from|where|and|or|not|assumable|ask|tell)\b"): it => text(weight: "bold", fill: c-algo-kw, it)

      // Evidenziazione automatica di tipi e costanti booleane
      #show regex("\b(true|false|yes|no|nil|null|none|empty|boolean|integer)\b"): it => text(weight: "semibold", fill: c-algo-lit, it)

      #body
    ]
  ]
)
