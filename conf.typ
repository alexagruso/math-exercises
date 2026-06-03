#import "@preview/ctheorems:1.1.3": *

#let conf(title: none, chapter: 0, doc) = {
  set text(12pt)
  set par(justify: true)

  set linebreak(justify: true)
  set math.cases(gap: 0.5em)

  set page(numbering: "1")

  set enum(indent: 1em, spacing: 1em)
  show enum: it => [#v(0em) #it] // HACK: not sure why #v(0em) is necessary

  show heading: it => [#smallcaps(it)]

  // For references to theorems
  show link: it => [*#smallcaps(it)*]

  // Fix spacing with ellipses
  show sym.dots: $#h(0.1em) dots #h(0.05em)$
  show sym.dots.c: $#h(0.15em) dots.c #h(0.15em)$

  // Black square QED symbol for ctheorems
  show: thmrules.with(qed-symbol: $square.filled$)

  show ref: it => {
    let el = it.element

    if el != none and el.func() == math.equation {
      link(
        el.location(),
        numbering(
          "(1)",
          ..counter(math.equation).at(el.location()),
        ),
      )
    } else {
      it
    }
  }

  counter(heading).update(chapter)

  // Display document elements
  let chapter = smallcaps([Chapter #chapter])
  let title = smallcaps([#title])
  align(center)[#text(chapter, size: 24pt) #h(1fr) #text(title, size: 24pt)]
  line(length: 100%)

  doc
}

// Text aliases
#let Ann = "Ann"
#let Arg = "Arg"
#let char = "char"
#let Gal = "Gal"
#let Hom = "Hom"
#let Im = "Im"
#let Re = "Re"
#let Tor = "Tor"

// Empty set symbol fix
#let emptyset = $text(#scale(x: -100%)[$#move(dy: -2pt, $nothing.rev$)$])$

// TODO: figure out what is causing this error (probably the typst extension)
// Character fixes
#let mapsto = "\u{21a6}"
#let inter = "\u{2229}"

// Functions
#let boldsmallcaps(text) = [*#smallcaps(text)*]
#let ol(text) = $overline(text)$
#let ul(text) = $underline(text)$

#let numeq(content) = math.equation(block: true, numbering: "(1)", content)

#let boldenv(identifier, head, ..) = thmplain(
  identifier,
  head,
  titlefmt: boldsmallcaps,
  padding: (top: 0.75em),
)

#let plainenv(identifier, head, ..) = thmplain(
  identifier,
  head,
  titlefmt: smallcaps,
)

#let proofenv(identifier, head, ..) = thmproof(
  identifier,
  head,
  titlefmt: smallcaps,
)

#let theorem = boldenv("theorem", "Theorem")
#let lemma = boldenv("theorem", "Lemma")
#let proposition = boldenv("theorem", "Proposition")

#let corollary = boldenv(
  "corollary",
  "Corollary",
).with(numbering: none)
#let definition = boldenv(
  "definition",
  "Definition",
).with(numbering: none)
#let example = boldenv(
  "example",
  "Example",
).with(numbering: none)

#let proof = proofenv("proof", "Proof")
#let solution = plainenv("solution", "Solution").with(numbering: none)
#let exercise = boldenv("exercise", "Exercise")
