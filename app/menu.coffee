@menu_slide = (action) ->
  ($ ".arena").slideUp 200, ->
    ($ ".arena").empty()
    action()
    ($ ".arena").slideDown 200

MENUITEMS = [
  ["clients", "App–Verwaltung", open_clients]
#  ["menu_preferences", "Einstellungen",   open_preferences]
  ["clipboard", "update_clipboard_button()", open_clipboard]
]

make_menu_button = (cls, name, fun) ->
  ((($ "<button>").text name).addClass "menubutton_" + cls).click fun

@make_menu_bar = ->
  ($ ".menu").append make_menu_button c, n, f for [c, n, f] in MENUITEMS
  ($ ".menu").append (($ "<button>").text "Änderungen übernehmen").click post_records
