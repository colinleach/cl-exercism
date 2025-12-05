type nucleotide = A | C | G | T

let hamming_distance strand1 strand2 =
  if (List.length strand1) <> (List.length strand2) then Error "strands must be of equal length"
  else
    let pairs = List.combine strand1 strand2 in
    let mismatches = List.filter (fun (b1, b2) -> b1 <> b2) pairs in
    Ok (List.length mismatches)
