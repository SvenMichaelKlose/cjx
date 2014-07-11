@open_groups = ->
  with_mixin
    parent: RECORDS["groups"]
    schema: "group"
    desc:   "Gruppen"
    make_new_form
