module Hamming

open System

let mismatch ( (a: Char, b: Char) ) = a <> b
    
let distance (strand1: string) (strand2: string): int option =
    if strand1.Length <> strand2.Length then None
    else
        let pairs: (char * char)[] = Array.zip (strand1.ToCharArray()) (strand2.ToCharArray())
        let mismatches: (char * char)[] = Array.filter ( mismatch ) pairs
        Some mismatches.Length