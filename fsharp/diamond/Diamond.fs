module Diamond

open System

let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

let ord (c:char) = alphabet.IndexOf c
    
let make letter =
    let ordLastLetter = ord letter
    
    let makeLine currLetter =
        if currLetter = 'A' then
            let padding = String(' ', ordLastLetter)
            padding + "A" + padding
        else
            let pos = ord currLetter
            let outer = if currLetter = letter then "" else String(' ', ordLastLetter - pos)
            let inner = String(' ', 2 * pos - 1)
            let letterString = string currLetter
            outer + letterString + inner + letterString + outer
    
    let letters = alphabet.Substring(0, ordLastLetter + 1)
    let topHalf = letters |> Seq.map makeLine |> Seq.toList
    let bottomHalf = List.rev topHalf
    List.append topHalf bottomHalf.Tail |> String.concat "\n"
