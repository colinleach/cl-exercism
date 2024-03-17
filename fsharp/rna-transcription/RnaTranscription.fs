module RnaTranscription

let toRna (dna: string): string =
    let complement b =
        match b with
        | 'G' -> 'C'
        | 'C' -> 'G'
        | 'T' -> 'A'
        | 'A' -> 'U'
        | _ -> raise (System.ArgumentException("Invalid base"))
    
    String.map complement dna
    