@menu_open = (action) ->
  ($ ".arena").slideUp 200, ->
    ($ ".arena").empty()
    action()
    ($ ".arena").slideDown 200

MENUITEMS = [
  ["clients",     open_clients,     "Kunden" ]
  ["groups",      open_groups,      "Gruppen" ]
  ["preferences", open_preferences, "Einstellungen" ]
  ["navigation",  open_navigation,  "Navigation", ]
  ["library",     open_library,     "Bibliothek" ]
  ["clipboard",   open_clipboard,   "update_clipboard_button()" ]
]

make_menu_button = (cls, fun, name) ->
  ((($ "<button>").text name).addClass "menubutton_" + cls).click -> menu_open fun

@init_menu = ->
  ($ ".menu").empty()
  ($ ".menu").append (make_menu_button c, n, f for [c, n, f] in MENUITEMS),
                     (($ "<button>").text "Änderungen übernehmen").click post_records
  MENUITEMS[0][1]()
