module RotationalCipher

open System
open System.Text

let rec rotate shiftKey text =
    let a = int 'a'
    let A = int 'A'
    let rotate_char (c: char): char =
        let ord = int c
        match c with
        | _ when Char.IsUpper c -> char (A + ((ord - A + shiftKey) % 26))
        | _ when Char.IsLower c -> char (a + ((ord - a + shiftKey) % 26))
        | _ -> c
        
    if shiftKey % 26 = 0 then text else text |> String.map rotate_char 
