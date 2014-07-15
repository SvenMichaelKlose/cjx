@open_preferences = ->
  with_mixin [
      VIEWS_STRUCTURAL
      VIEWS_RECORD_EDIT
      xml:    RECORDS["app"]
      schema: SCHEMAS["app"]
      desc:   "Einstellungen"
      ignore: ["navigation"]
    ], render_record
