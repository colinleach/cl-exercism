module MatchingBrackets

let isPaired input =
    let brackets = "(){}[]" |> Seq.toArray
    let cleaned =
        String.collect (fun c -> if Seq.exists((=)c) brackets then string c else "") input
        
    let rec remove_pairs text =
        let start_len = String.length text
        let modified = text.Replace("()", "").Replace("{}", "").Replace("[]", "")
        if String.length modified = start_len then modified else remove_pairs modified
        
    String.length (remove_pairs cleaned) = 0
    