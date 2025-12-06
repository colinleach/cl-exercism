fun nucleotideCounts (strand: string): {a: int, c: int, g: int, t: int} =
  let
    val bases = explode strand
    fun count (bs, (a, c, g, t)) =
      case bs of
        [] => (a, c, g, t)
      | #"A"::rest => count(rest, (a+1, c, g, t))
      | #"C"::rest => count(rest, (a, c+1, g, t))
      | #"G"::rest => count(rest, (a, c, g+1, t))
      | #"T"::rest => count(rest, (a, c, g, t+1))
      | _ => raise Fail "Invalid nucleotide in strand"
    val (a, c, g, t) = count(bases, (0, 0, 0, 0))
  in
    {a=a, c=c, g=g, t=t}
  end
