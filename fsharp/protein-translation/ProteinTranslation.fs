module ProteinTranslation

let proteins (rna: string): string list =
    let aminoAcid codon =
        match codon with
        | "AUG"                         -> "Methionine"
        | "UUU" | "UUC"                 -> "Phenylalanine"
        | "UUA" | "UUG"                 -> "Leucine"
        | "UCU" | "UCC" | "UCA" | "UCG" -> "Serine"
        | "UAU" | "UAC"                 -> "Tyrosine"
        | "UGU" | "UGC"                 -> "Cysteine"
        | "UGG"                         -> "Tryptophan"
        | "UAA" | "UAG" | "UGA" | ""    -> "STOP"
        | _ -> failwith "Invalid codon"
    
    let rec processRNA (rna:string) accum: string list =
        let translation = aminoAcid (rna[0..2])
        match translation with
        | "STOP" -> List.rev accum
        | _ -> processRNA (rna[3..]) (translation :: accum)
        
    processRNA rna []
        