###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

hook_field = (n, {type, attr, name}, elm) ->
  h = (x) ->
        t = $ x.target
        v = if type is "boolean"
              if t.is (":checked") then "true" else "false"
            else
              t.val()
        if attr
          n.attr name, v
        else
          n.text v
  elm.change h
  elm.blur h
