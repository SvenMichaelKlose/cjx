group = (record) ->
  record()

@open_groups = ->
  with_mixin [
      schema: "group"
      parent: RECORDS["groups"]
      desc:   "Gruppen"
      VIEWS_TABLE
      VIEWS_TABLE_EDIT
    ], ->
      with_mixin [
          ignore: ["clients"]
          record:  (do (record) -> -> group record)
          records: parent.children()
        ], ->
          ($ ".arena").append make_containment().append list()
