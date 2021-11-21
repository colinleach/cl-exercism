module ReverseString

let rec reverseHelper(forwardString: string, reverseString: string): string =
    match forwardString with
    | "" -> reverseString
    | _ -> reverseHelper(forwardString.[0..forwardString.Length-2],
                         reverseString + forwardString.Substring(forwardString.Length-1))
let reverse (input: string): string =
    reverseHelper(input, "")