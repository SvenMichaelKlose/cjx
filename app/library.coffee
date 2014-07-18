button_add = ->
  f = $ "<form>"
        action: ""
        enctype: "multipart/form-data"
  i = $ "<input>"
        type: "file"
        name: "file[]"
        multiple: "multiple"
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
      alert "done"
      debugger
      for x in ($ data).find "file"
        x = $ x
        d = new Date().valueOf()
        ($ ".db library").append $ "<file>", {src: (x.attr "src"), date: d}
      post_file ($ ".db library"), "library"
      menu_reopen()
    a.error (data, status) ->
      alert "Error: " + status
      debugger
  f

file = ->
  path = xml.attr "src"
  (div().addClass "record").append button_remove(),
                                   (img().attr {src: path, width: "10%"}),
                                   label().text (path_filename path) + " vom " + human_readable_datetime xml.attr "date"

filelist = ->
  with_mixin {xml: ($ x)}, file for x in records

@open_library = ->
  with_mixin [
      VIEWS_LIST_EDIT
      records: RECORDS["library"].children()
      parent:  RECORDS["library"]
      schema:  SCHEMAS["library"]
      desc:    "Bibliothek"
    ], -> [
      button_add()
      filelist()
    ]

update_library_button = ->
  ($ ".menubutton_library").text "Bibliothek (#{($ ".db library > *").length})"

@init_library = ->
  $(".db library").bind "DOMSubtreeModified", update_library_button
  update_library_button()
