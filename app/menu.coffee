@menu_open = (action) ->
  ($ ".arena").slideUp 200, ->
    ($ ".arena").empty()
    action()
    ($ ".arena").slideDown 200

MENUITEMS = [
  ["clients", "Kunden", open_clients]
  ["groups", "Gruppen", open_groups]
#  ["menu_preferences", "Einstellungen",   open_preferences]
  ["clipboard", "update_clipboard_button()", open_clipboard]
]

make_menu_button = (cls, name, fun) ->
  ((($ "<button>").text name).addClass "menubutton_" + cls).click -> menu_open fun

@init_menu = ->
  ($ ".menu").empty()
  ($ ".menu").append (make_menu_button c, n, f for [c, n, f] in MENUITEMS),
                     (($ "<button>").text "Änderungen übernehmen").click post_records
  MENUITEMS[0][2]()
