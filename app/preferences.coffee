#($ ".db").append APPS = [generate_xml_from_schema "app"]

@open_preferences = ->
  menu_slide ->
    ($ ".arena").append form().addClass "prefform"
    ($ ".prefform").append render_record {}, ($ "app"), SCHEMAS.app
