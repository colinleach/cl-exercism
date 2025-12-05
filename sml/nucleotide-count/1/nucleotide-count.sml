fun nucleotideCounts (strand: string): {a: int, c: int, g: int, t: int} =
  let
    val bases = explode strand
    fun count (bs, counts) =
      case bs of
        [] => counts
      | #"A"::rest => count(rest, {a=(#a counts)+1, c=(#c counts), g=(#g counts), t=(#t counts)})
      | #"C"::rest => count(rest, {a=(#a counts), c=(#c counts)+1, g=(#g counts), t=(#t counts)})
      | #"G"::rest => count(rest, {a=(#a counts), c=(#c counts), g=(#g counts)+1, t=(#t counts)})
      | #"T"::rest => count(rest, {a=(#a counts), c=(#c counts), g=(#g counts), t=(#t counts)+1})
      | _ => raise Fail "Invalid nucleotide in strand"
  in
    count(bases, {a=0, c=0, g=0, t=0})
  end
