open_preferences = () ->
  ($ "form").empty().append create_form RECORD_INFOS.client
