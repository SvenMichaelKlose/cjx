upload_form = ->
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
      files = ($ data).find "file"
      for x in files
        x = $ x
        d = new Date().valueOf()
        (xml_root "library").append $ "<file>", {src: (x.attr "src"), date: d}
      if files.length
        post_file "library"
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
  xroot = xml_root "library"
  with_mixin [
      VIEWS_LIST_EDIT
      records: xroot.children()
      parent:  xroot
      schema:  SCHEMAS["library"]
      desc:    "Bibliothek"
    ], -> [
      upload_form()
      filelist()
    ]

update_library_button = ->
  ($ ".menubutton_library").text "Bibliothek (#{(xml_root "library").children().length})"

@init_library = ->
  (xml_root "library").bind "DOMSubtreeModified", update_library_button
  update_library_button()
