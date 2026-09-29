// --- Color Definitions ---
#let brickred = rgb(182, 50, 28)
#let darkred = rgb(139, 0, 0)
#let cyan-black = rgb(0, 115, 115)
#let green-black = rgb(0, 115, 0)
#let red-light = rgb(255, 115, 115)
#let yellow-light = rgb(255, 235, 115)
#let brickred-light = rgb(220, 120, 100)

// --- The Main Template Function ---
#let conf(
  title: none,
  author: "Alessandro Carella",
  doc,
) = {
  // Page and Font Setup
  set page(paper: "a4", numbering: "1", margin: (x: 2.5cm, y: 3cm))
  set text(font: "Libertinus Serif", lang: "it", size: 12pt)
  set par(justify: true, leading: 0.65em)
  set heading(numbering: "1.1")

  // Link styling
  show link: set text(fill: darkred)

  // Title Page Generator
  if title != none {
    align(center)[
      #v(20%)
      #text(size: 24pt, weight: "bold")[#title] \
      #v(1em)
      #text(size: 14pt)[#author]
    ]
    pagebreak()
    outline(title: "Indice", depth: 2)
    pagebreak()
  }

  // Insert the actual document content
  doc
}

// --- Base Theorem Environment ---
#let left-bar-box(color, title, content) = block(
  width: 100%,
  stroke: (left: 2.5mm + color),
  inset: (left: 5mm, top: 8pt, bottom: 8pt),
  fill: none,
  breakable: true,
  [
    #if title != none [
      #text(weight: "bold", title) \
    ]
    #content
  ]
)

// --- Specific Environments ---
#let nota(title: none, content) = left-bar-box(red-light, if title != none [Nota: #title] else [Nota], content)
#let esempio(title: none, content) = left-bar-box(yellow-light, if title != none [Esempio: #title] else [Esempio], content)
#let esercizio(title: none, content) = left-bar-box(yellow-light, if title != none [Esercizio: #title] else [Esercizio], content)
#let traccia(title: none, content) = left-bar-box(brickred-light, if title != none [Traccia: #title] else [Traccia], content)
#let corollario(title: none, content) = left-bar-box(cyan-black, if title != none [Corollario: #title] else [Corollario], content)
#let definizione(title: none, content) = left-bar-box(green-black, if title != none [Definizione: #title] else [Definizione], content)
#let teorema(title: none, content) = left-bar-box(cyan-black, if title != none [Teorema: #title] else [Teorema], content)
#let proof(title: none, content) = left-bar-box(cyan-black, if title != none [Dimostrazione: #title] else [Dimostrazione], content)

// Lemma (Full Box style)
#let lemma(title: none, content) = block(
  width: 100%,
  stroke: 1pt + cyan-black,
  radius: 1mm,
  fill: none,
  breakable: true,
)[
  #block(fill: cyan-black, width: 100%, inset: (left: 2mm, top: 2mm, bottom: 2mm), radius: (top: 1mm, bottom: 0mm))[
    #text(fill: white, weight: "bold", if title != none [Lemma: #title] else [Lemma])
  ]
  #block(inset: 2mm)[#content]
]

// --- Custom Math Macros ---
#let wbar(x) = overline(x)
