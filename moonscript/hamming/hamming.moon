distance = (a, b) ->
  if #a ~= #b then error 'strands must be of equal length'

  count = 0
  for i = 1, #a
    count += 1 if a\sub(i, i) != b\sub(i, i)
  count

{ :distance }
