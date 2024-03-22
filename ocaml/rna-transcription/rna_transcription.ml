type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let to_rna dna =
    let complement b =
        match b with
        | `A -> `U
        | `C -> `G
        | `G -> `C
        | `T -> `A
    in
    List.map complement dna
