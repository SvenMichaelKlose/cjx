#($ ".db").append APPS = [generate_xml_from_schema "app"]

@open_preferences = ->
  ($ ".arena").append form().addClass "prefform"
  ($ ".prefform").append render_record {}, ($ "app"), SCHEMAS.app
