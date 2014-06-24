tell_its_not_there_yet = () ->
  alert "Sorry. Noch nix da."

MENUITEMS = [
  ["Home",            tell_its_not_there_yet]
  ["App–Verwaltung",  tell_its_not_there_yet]
  ["Navigation",      tell_its_not_there_yet]
  ["Einstellungen",   open_preferences]
]

make_menu_bar = () ->
  ($ ".menu").append (($ "<button>").text n).click f for [n, f] in MENUITEMS
