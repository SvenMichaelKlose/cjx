button_add = ->
  f = $ "<form>"
        action: ""
        enctype: "multipart/form-data"
  i = $ "<input>"
        type: "file"
        name: "file"
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
      f = $ "<file>"
            src: (($ data).find "file").attr "src"
      ($ ".db library").append f
      post_file ($ ".db library"), "library"
      ($ ".arena").empty()
      open_library()
  f

file = ->
  (div().addClass "record").append button_remove(),
                                   img().attr {src: (xml.attr "src"), width: "10%"}

filelist = ->
  with_mixin {xml: ($ x)}, file for x in records

@open_library = ->
  with_mixin [
      VIEWS_LIST_EDIT
      records: RECORDS["library"].children()
      parent:  RECORDS["library"]
      schema:  SCHEMAS["library"]
      desc:    "Bibliothek"
      button_add: button_add
    ], -> [
      button_add()
      filelist()
    ]

update_library_button = ->
  ($ ".menubutton_library").text "Bibliothek (#{($ ".db library > *").length})"

@init_library = ->
  $(".db library").bind "DOMSubtreeModified", update_library_button
  update_library_button()
