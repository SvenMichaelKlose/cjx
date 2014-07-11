@ID_CLIENT = "pixel"

$ ->
  ($ "body").append ($ "<div class='rev'>").text "Revision " + REVISION
  init_records "clients"
  init_records "groups"
  get_records ["clients", "groups"]
  init_clipboard()
  set_mixins [VIEWS_RECORD, VIEWS_RECORD_DISPLAY, VIEWS_STRUCTURAL, VIEWS_XREF]
  init_menu()
