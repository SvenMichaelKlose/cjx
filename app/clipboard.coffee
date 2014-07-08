@open_clipboard = ->
  menu_slide ->
    ($ ".arena form").remove()
    make_new_form
      parent: RECORDS["clipboard"]
      schema: "clipboard"
      desc:   "Ablage"
