module Pangram

let isPangram (input: string): bool =
    let listLower = input.ToLower() |> Seq.toList
    ['a'..'z'] |> List.forall (fun c -> List.contains c listLower)
    