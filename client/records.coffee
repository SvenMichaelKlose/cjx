@RECORDS = {}

@init_records = (name) ->
  ($ ".current_xml").append RECORDS[name] = ($ "<#{name}>")
