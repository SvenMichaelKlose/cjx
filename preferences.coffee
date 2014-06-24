###                                                                                                            
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

open_preferences = () ->
  ($ ".arena").slideUp 400,
                       () ->
                         ($ "form").empty().append create_form RECORD_INFOS.app
                         ($ ".arena").slideDown 800
