module Bob

open System.Text.RegularExpressions

let isEmpty (input: string): bool = 
    if input = "" then true
    else not (Regex.IsMatch(input, "\S"))

let isUpper (input: string): bool = 
    Regex.IsMatch(input, "[A-Z]") && not (Regex.IsMatch(input, "[a-z]"))

let isQuestion (input: string): bool = 
    Regex.IsMatch(input, "\?\s*$")

let response (input: string): string = 
    let empty = isEmpty input
    let yell = not empty && isUpper input
    let question = not empty && isQuestion input

    match (yell, question) with
    | (true, true)  -> "Calm down, I know what I'm doing!"
    | (true, false) -> "Whoa, chill out!"
    | (false, true) -> "Sure."
    | (false, false) -> 
            if empty then "Fine. Be that way!"
            else "Whatever."
