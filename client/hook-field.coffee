###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

hook_field = (n, {attr, name}, elm) ->
  h = (x) ->
        v = ($ x.target).val()
        if attr
          n.attr name, v
        else
          n.text v
  elm.change h
  elm.blur h
