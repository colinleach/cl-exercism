module Isogram

let isIsogram (str: string) =
    let chars =
        str.ToLower()
        |> Seq.toList
        |> List.filter (fun c -> System.Char.IsLetter(c))
    chars.Length = List.distinct(chars).Length
