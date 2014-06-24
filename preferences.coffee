open_preferences = () ->
  ($ ".arena").slideUp 400,
                       () ->
                         ($ "form").empty().append create_form RECORD_INFOS.app
                         ($ ".arena").slideDown 600
