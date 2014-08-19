LAST_ACTION = null
DEFERRED_SETUPS = []

@deferred_setup = (x) ->
  DEFERRED_SETUPS.push x

make_containment = ->
  ($ "<form>").addClass "containment"

@menu_append = ->
  ($ ".arena").empty()
  ($ ".arena").append make_containment().append_nested LAST_ACTION()
  i() for i in DEFERRED_SETUPS
  DEFERRED_SETUPS = []

@menu_reopen = ->
  s = ($ window).scrollTop()
  menu_append()
  s = ($ window).scrollTop s

@menu_open = (action) ->
  LAST_ACTION = action
  menu_append()

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
