###
    Copyright (c) 2014 Sven Michael Klose <pixel@copei.de>
###

overlay = (dst, src) ->
  for i in src
    if dst[i]
      if dst[i].type is "struct"
        overlay dst[i].data src[i].data
      else
        $.extend dst[i], src[i]
