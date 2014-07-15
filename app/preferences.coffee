@open_preferences = ->
  debugger
  with_mixin [
      VIEWS_STRUCTURAL
      VIEWS_RECORD_EDIT
      xml:    RECORDS["app"]
      schema: SCHEMAS["app"]
      desc:   "Einstellungen"
      ignore: ["navigation"]
    ], ->
      make_containment().append_nested render_record()
