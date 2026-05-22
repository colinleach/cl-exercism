distance = (strand1, strand2) ->
  if #a ~= #b error 'strands must be of equal length'

  count = 0
  for i=1, #a
    if a:byte(i) ~= b:byte(i) count += 1
  count

{ :distance }

    -- if #a ~= #b then return -1 end

    -- local count = 0
    -- for i=1, #a do
    --     if a:byte(i) ~= b:byte(i) then count = count + 1 end
    -- end
    -- return count