CONTAINMENT_COUNTER = 0

@make_containment = ->
  ($ "<form>").addClass "containment#{++CONTAINMENT_COUNTER}"
