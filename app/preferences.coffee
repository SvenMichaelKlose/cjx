#($ ".current_xml").append APPS = [generate_xml_from_schema "app"]

@open_preferences = ->
  menu_slide ->
    ($ ".arena").append form().addClass "prefform"
    ($ ".prefform").append create_form ($ "app"), SCHEMAS.app
