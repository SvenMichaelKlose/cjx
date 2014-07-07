make_client_form = ->
  form = $ ".clientform"
  make_form (
    containment: form
    parent:      RECORDS["clients"],
    schema:      "client",
    desc:        "Kunden"
  )
  list_selecting_button form
  form.append (($ "<button>").text "Auswahl in Ablage übernehmen"). click (x) ->
    x.preventDefault()
    alert "Nix passiert."

make_group_form = ->
  make_form (
    containment: ($ ".groupform"),
    parent:      RECORDS["groups"],
    schema:      "group",
    desc:        "Gruppen"
  )
  list_selecting_button ($ ".groupform")

@open_clients = ->
  menu_slide ->
    ($ ".clientform").remove()
    ($ ".groupform").remove()
    ($ ".arena").append form().addClass "clientform"
    ($ ".arena").append form().addClass "groupform"
    make_client_form()
    make_group_form()
