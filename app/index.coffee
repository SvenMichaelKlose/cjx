@ID_CLIENT = "pixel"

$ ->
  ($ "body").append ($ "<div class='rev'>").text "Revision " + REVISION
  init_records "clients"
  init_records "groups"
  init_records "app"
  get_records ["clients", "groups", "app"]
  if not ($ ".db app *").length
    ($ ".db app").replaceWith RECORDS["app"] = generate_xml_from_schema "app"
  set_mixins [VIEWS_RECORD, VIEWS_RECORD_DISPLAY, VIEWS_STRUCTURAL, VIEWS_XREF]
  init_menu()
  init_clipboard()
