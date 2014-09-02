make_element = (name, v) ->
  e = $ "<#{name}>"
  e.append v

# Make HTML element constructors of the same names as the elements.
for n in [# Root element
          "html",
          # Document metadata
          "head", "title", "base", "link", "meta", "style",
          # Scripting
          "script", "noscript", "template",
          # Sections
          "body", "section", "nav", "article", "aside",
          "h1", "h2", "h3", "h4", "h5", "h6",
          "header", "footer", "address", "main",
          # Grouping content
          "p", "hr", "pre", "blockquote", "ol", "ul", "li", "dl",
          "dt", "dd", "figure", "figcaption", "div",
          # Text-level semantics
          "a", "em", "strong", "small", "s", "cite", "q", "dfn",
          "abbr", "data", "time", "code", #"var",
          "samp", "kdb", "sub", "sup", "i", "b", "u", "mark",
          "ruby", "rt", "rp", "bdi", "bdo", "span", "br", "wbr",
          # Edit
          "ins", "del",
          # Embedded content
          "img", "iframe", "embed", "object", "param", "video",
          "audio", "source", "track", "canvas", "map", "area",
          "svg", "math",
          # Tabular data
          "table", "caption", "colgroup", "col", "tbody", "thead",
          "tfoot", "tr", "td", "th",
          # Forms
          "form", "fieldset", "legend", "label", "input", "button",
          "select", "datalist", "optgroup", "option", "textarea",
          "keygen", "output", "progress", "meter",
          # Interactive elements.
          "details", "summary", "meuitem", "menu"]
  @[n] = do (n) -> (v) -> make_element n, v
