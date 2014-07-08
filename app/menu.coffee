@menu_slide = (action) ->
  ($ ".arena").slideUp 200, ->
    ($ ".arena").empty()
    action()
    ($ ".arena").slideDown 200

MENUITEMS = [
  ["App–Verwaltung",  open_clients]
#  ["Einstellungen",   open_preferences]
  ["Ablage",          open_clipboard]
]

@make_menu_bar = ->
  ($ ".menu").append (($ "<button>").text n).click f for [n, f] in MENUITEMS
  ($ ".menu").append (($ "<button>").text "Änderungen übernehmen").click post_records
