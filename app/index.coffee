@ID_CLIENT = "pixel"

$ ->
  ($ "body").append ($ "<div class='rev'>").text "Revision " + REVISION
  init_xml_doc "clients"
  init_xml_doc "groups"
  init_xml_doc "library"
  set_xml_doc "app", generate_xml_from_schema "app"
  get_records ["clients", "groups", "app", "library"]
  set_mixins [{field: null}, VIEWS_RECORD, VIEWS_RECORD_DISPLAY, VIEWS_STRUCTURAL, VIEWS_TABLE, VIEWS_XREF]
  init_menu()
  init_clipboard()
  init_library()
