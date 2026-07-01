{
  add: (timestamp) ->
    any_date = parse_date timestamp
    os.date('%x', any_date + 1e9)
}
