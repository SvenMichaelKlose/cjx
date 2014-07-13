@ID_CLIENT = "pixel"

$ ->
  ($ "body").append ($ "<div class='rev'>").text "Revision " + REVISION
  init_records "clients"
  init_records "groups"
  ($ ".db").append RECORDS["app"] = generate_xml_from_schema "app"
  get_records ["clients", "groups"]
  set_mixins [VIEWS_RECORD, VIEWS_RECORD_DISPLAY, VIEWS_STRUCTURAL, VIEWS_XREF]
  init_menu()
  init_clipboard()
