@RECORDS = {}

@init_records = (name) ->
  ($ ".db").append RECORDS[name] = ($ "<#{name}>")
