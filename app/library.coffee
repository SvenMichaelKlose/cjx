button_add = ->
  f = $ "<form>"
        action: ""
        enctype: "multipart/form-data"
  i = $ "<input>"
        type: "file"
        name: "image[]"
        size: "10"
  s = button().text "Hochladen…"
  f.append (h2().text "Upload"),
           i,
           s
  p = {
    files: i
    iframe: true
  }
  s.click (x) ->
    x.preventDefault()
    a = $.ajax "/pi/admin/upload.php", p
    a.done (data) ->
      alert "complete " + data
  f

@open_library = ->
  with_mixin [
      VIEWS_TABLE
      VIEWS_TABLE_EDIT
      records: RECORDS["library"].children()
      parent: RECORDS["library"]
      schema: SCHEMAS["library"]
      desc:   "Bibliothek"
      button_add: button_add
    ], -> ($ ".arena").append (make_containment().append_nested list()),
