###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

open_preferences = () ->
  ($ ".arena").slideUp 400,
                       () ->
                         xml = if ($ ".current_xml > app").length
                                 $ "app"
                               else
                                 $ "<app>"
                         ($ "form").empty()
                         button = (($ "<button>").text "Magic").click (x) ->
                                                                        alert ($ ".current_xml")[0].innerHTML
                                                                        x.preventDefault()
                         ($ "form").append button, create_form xml, RECORD_INFOS.app
                         unless ($ ".current_xml > app").length > 0
                           ($ ".current_xml").empty().append xml
                         ($ ".arena").slideDown 800
