@record_list = (items, schema) ->
  array_nodelist (create_form i, schema for i in items)

($ ".current_xml").append CLIENTS = ($ "<clients>").append generate_xml_from_schema "client"

@open_client = () ->
  menu_slide () ->
               ($ "form").append magic_button(),
                                 create_form ($ "clients client"), SCHEMAS.client

client_listrecord = (x) ->
  (tr "listrecord").append ($ "<input>", type: "checkbox"),
                           (create_form ($ x), SCHEMAS.client),
                           (td "", (button "remove", "entfernen"))

client_list = (x) ->
  table().append $.map ($ "clients client"), client_listrecord

@open_clients = () ->
  menu_slide () ->
               old_widgets = $.extend {}, WIDGETS
               $.extend WIDGETS, LIST_WIDGETS
               ($ ".arena form").append (button "add", "Kunden erstellen"),
                                        (tbody "", client_list())
               @WIDGETS = old_widgets
