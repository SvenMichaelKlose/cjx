###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

open_preferences = () ->
  ($ ".arena").slideUp 400,
                       () ->
                         xml = $ "<app>"
                         ($ "form").empty()
                         ($ "form").append (($ "<button>").text "Magic").click () -> alert ($ ".current_xml")[0].innerHTML
                         ($ "form").append create_form xml, RECORD_INFOS.app
                         ($ ".current_xml").empty().append xml
                         ($ ".arena").slideDown 800
