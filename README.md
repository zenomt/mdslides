Pure HTML+CSS Slide Presentations in Markdown
=============================================
[This repo][repo] contains a CSS stylesheet and an Awk preprocessor script
to make it easy to write basic HTML-only (no JavaScript) slide presentations
in Markdown, using *any* Markdown formatter.

Add a link to the stylesheet at the top of your Markdown:

    <link rel="stylesheet" href="deck.css" />

The [`deck.css`](deck.css) stylesheet uses `<article>` and `<section>` semantic
markup tags to style the final static HTML into a basic slide presentation
without any JavaScript. The entire presentation is in an `<article>`, and
each slide is a `<section>`. The first slide is the Title Slide and is styled
differently than the rest: the Title Slide has a bigger font and all elements
are centered on the slide. For all other slides, the first element (usually
an `<h1>` heading) is the slide title, and all other content is left-justified
and vertically centered.

Slides are delimited in Markdown with three or more colons (`:::`) on their
own line (no indentation or trailing whitespace). The
[`mdsection.awk`](mdsection.awk) preprocessor script looks for slide delimiters
and adds the `<article>` and `<section>` tags around the slides to work with
the stylesheet.

Example Markdown Source:

    <link rel="stylesheet" href="deck.css" />
    
    :::::::::::::::::::::::::::::::
    
    This Deck is Just HTML and CSS
    ==============================
    And I wrote it in Markdown*
    
    <small><small>(*with a teeny-tiny extension)</small></small>
    
    :::::::::::::::::::::::::::::::
    
    Solution: Static Style-able HTML
    ================================
    
    * Deck is an `<article>`
    * Each slide is a `<section>`
    * First slide is the title slide
    * First element of a `<section>` is the slide’s title
    * Can include SVG, images, even videos
    * Stylesheet turns it into a presentation

For your convenience while authoring a presentation, `mdsection.awk` adds a
hash (fragment) identifier to each `<section>` to facilitate returning directly
to a specific slide; for example, to jump directly to slide 13 when reloading,
add [`#page-13`](mdslides.html#page-13) to the end of the deck's URL in your
browser’s address bar.

Diagrams can be added with your favorite Markdown-compatible diagram language,
such as [Pikchr][], that adds inline SVG to the document. My
[Pikchr command-line tool][pikchr-cmd] is intended for Unix pipeline-style
workflows. Image references can also be added if that's more convenient.

    $ awk -f mdsection.awk mdslides.md.in | pikchr | md2html --github > mdslides.html

<img src="pipeline.svg" />

See [mdslides.html](mdslides.html) for a rendered presentation about this
presentation toolset. Its source is [`mdslides.md.in`](mdslides.md.in). In
this example I use the [`md2html`][md2html] formatter from the
[Markdown for C][MD4C] project, which is CommonMark compliant and supports
GitHub extensions such as tables.

The CSS slide technique was inspired by
"[Creating a Slide Deck with Just HTML and CSS][knowler]" by Nathan Knowler
on Codepen.


  [repo]: https://github.com/zenomt/mdslides
  [Pikchr]: https://pikchr.org/
  [pikchr-cmd]: https://github.com/zenomt/pikchr-cmd
  [knowler]: https://codepen.io/knowler/pen/eYGRwyb
  [md2html]: https://github.com/mity/md4c/tree/master/md2html
  [MD4C]: https://github.com/mity/md4c
