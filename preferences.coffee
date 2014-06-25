###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

open_preferences = () ->
  ($ ".arena").slideUp 400,
                       () ->
                         xml = $ "<app>"
                         ($ "form").empty().append create_form xml, RECORD_INFOS.app
                         ($ ".arena").append xml
                         alert xml[0].innerHTML
                         ($ ".arena").slideDown 800
