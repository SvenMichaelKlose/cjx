CONTAINMENT_COUNTER = 0

@make_containment = ->
  ($ "<form>").addClass "containment#{++CONTAINMENT_COUNTER}"

@make_new_form = (options) ->
  ($ ".arena").append options["containment"] = form = make_containment()
  make_form options, options.parent.children()
  list_selecting_button form
  form
