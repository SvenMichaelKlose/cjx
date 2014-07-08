CONTAINMENT_COUNTER = 0

make_containment = ->
  ($ "<form>").addClass "containment#{++CONTAINMENT_COUNTER}"

make_new_form = (options) ->
  ($ ".arena").append options["containment"] = form = make_containment()
  make_form options
  list_selecting_button form
  form

make_client_form = ->
  form = make_new_form (
    parent: RECORDS["clients"],
    schema: "client",
    desc:   "Kunden"
  )
  form.append (($ "<button>").text "Auswahl in Ablage übernehmen"). click (x) ->
    x.preventDefault()
    alert "Nix passiert."

make_group_form = ->
  make_new_form (
    parent: RECORDS["groups"],
    schema: "group",
    desc:   "Gruppen"
  )

@open_clients = ->
  menu_slide ->
    ($ ".arena form").remove()
    make_client_form()
    make_group_form()
