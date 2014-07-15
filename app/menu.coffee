LAST_ACTION = null

@menu_reopen = ->
  ($ ".arena").empty()
  ($ ".arena").append make_containment().append_nested LAST_ACTION()

@menu_open = (action) ->
  LAST_ACTION = action
  menu_reopen()

MENUITEMS = [
  ["clients",     open_clients,     "Kunden" ]
  ["groups",      open_groups,      "Gruppen" ]
  ["preferences", open_preferences, "Einstellungen" ]
  ["navigation",  open_navigation,  "Navigation", ]
  ["library",     open_library,     "Bibliothek" ]
  ["clipboard",   open_clipboard,   "update_clipboard_button()" ]
]

make_menu_button = (id, fun, name) ->
  ((button().text name).addClass "menubutton_" + id).click -> menu_open fun

make_menu_buttons = ->
  make_menu_button c, n, f for [c, n, f] in MENUITEMS

commit_button = ->
  (button().text "Änderungen übernehmen").click post_records

@init_menu = ->
  ($ ".menu").empty()
  ($ ".menu").append make_menu_buttons(),
                     commit_button()
  menu_open MENUITEMS[0][1]
