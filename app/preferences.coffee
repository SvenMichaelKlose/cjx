form  = ->
  debugger
  with_mixin [
      VIEWS_STRUCTURAL
      VIEWS_RECORD_EDIT
      xml:    RECORDS["app"]
      schema: SCHEMAS["app"]
      desc:   "Einstellungen"
      ignore: ["navigation"]
    ], render_record

@open_preferences = ->
  $(".arena").append make_containment().append_nested form
