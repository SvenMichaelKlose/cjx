magic = (x) ->
  alert ($ ".current_xml")[0].innerHTML
  x.preventDefault()

@magic_button = () -> (($ "<button>").text "Magic").click magic
