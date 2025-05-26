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

Example:

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

Diagrams can be added with your favorite Markdown-compatible diagram language,
such as [Pikchr][], that adds inline SVG to the document. My
[Pikchr command-line tool][pikchr-cmd] is intended for Unix pipeline-style
workflows. Image references can also be added if that's more convenient.

    $ awk -f mdsection.awk mdslides.md.in | pikchr | md2html --github > mdslides.html

<img src="pipeline.svg" />

See [mdslides.html](mdslides.html) for a rendered presentation about this
presentation toolset. Its source is [`mdslides.md.in`](mdslides.md.in).

The CSS slide technique was inspired by
"[Creating a Slide Deck with Just HTML and CSS][knowler]" by Nathan Knowler
on Codepen.


  [repo]: https://github.com/zenomt/mdslides
  [Pikchr]: https://pikchr.org/
  [pikchr-cmd]: https://github.com/zenomt/pikchr-cmd
  [knowler]: https://codepen.io/knowler/pen/eYGRwyb
