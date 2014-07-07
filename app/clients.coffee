@open_clients = ->
  menu_slide ->
    ($ ".clientform").remove()
    ($ ".groupform").remove()
    ($ ".arena").append form().addClass "clientform"
    ($ ".arena").append form().addClass "groupform"
    make_form (
      containment: ($ ".clientform"),
      parent:      RECORDS["clients"],
      schema:      "client",
      desc:        "Kunden"
    )
    set_all = (x, to) ->
      x.preventDefault()
      ($ ".clientform input[type=checkbox]").prop "checked", to
    all = ($ "<button>")
    ($ ".clientform").append all
    sel = ->
      (all.text "Alle auswählen").click (x) ->
        unsel()
        set_all x, true
    unsel = ->
      (all.text "Alle abwählen").click (x) ->
        sel()
        set_all x, false
    sel()
    ($ ".clientform").append (($ "<button>").text "Auswahl in Ablage übernehmen"). click (x) ->
      x.preventDefault()
      alert "Nix passiert."
    make_form (
      containment: ($ ".groupform"),
      parent:      RECORDS["groups"],
      schema:      "group",
      desc:        "Gruppen"
    )
