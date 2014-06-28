@menu_slide = (action) ->
  ($ ".arena").slideUp 200, ->
                              ($ ".arena").empty()
                              ($ ".arena").append $ "<form>"
                              action()
                              ($ ".arena").slideDown 200

tell_its_not_there_yet = ->
  ($ ".arena").slideUp 200,
                       ->
                         ($ "form").text "Sorry. Noch nix da."
                         ($ ".arena").slideDown()

MENUITEMS = [
  ["Home",            tell_its_not_there_yet]
  ["App–Verwaltung",  open_clients]
  ["Navigation",      tell_its_not_there_yet]
  ["Einstellungen",   open_preferences]
]

@make_menu_bar = ->
  ($ ".menu").append (($ "<button>").text n).click f for [n, f] in MENUITEMS
