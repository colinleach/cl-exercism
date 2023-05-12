fun distance (strand1, strand2) =
  if size strand1 <> size strand2 then
    NONE
  else
    let 
      val pairs = ListPair.zip ((explode strand1), (explode strand2))
      val mismatches = List.filter (fn (a, b) => a <> b) pairs
    in
      SOME (length mismatches)
    end
