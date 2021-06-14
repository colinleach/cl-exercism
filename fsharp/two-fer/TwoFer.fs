module TwoFer

let twoFer (input: string option): string = 
    let p = input |> Option.defaultValue "you"
    "One for " + p + ", one for me."