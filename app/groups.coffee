@open_groups = ->
  with_mixin
    parent: RECORDS["groups"]
    schema: "group"
    desc:   "Gruppen"
    ->
      with_mixin [
          VIEWS_TABLE
          VIEWS_TABLE_EDIT
          records: parent.children()
        ], -> ($ ".arena").append make_containment().append list()
