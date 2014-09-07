$ ->
  $.fn.connectInput = ({type, attr, name}, elm) ->
    xml = this
    if elm instanceof jQuery
      h = (x) ->
        t = $ x.target
        v = if type is "boolean"
              if t.is (":checked") then "true" else "false"
            else
              t.val()
        if attr
          xml.attr name, v
        else
          xml.text v
      elm.change h
      elm.blur h
      elm.click h
    elm
