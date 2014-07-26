@open_preferences = ->
  with_mixin [
      VIEWS_RECORD_EDIT
      xml:    xml_root "app"
      schema: SCHEMAS["app"]
      desc:   "Einstellungen"
      ignore: ["navigation"]
    ], render_record
