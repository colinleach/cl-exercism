module Allergies

open System

type Allergen =
    | Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats
    
let allergens = [Allergen.Eggs; Allergen.Peanuts; Allergen.Shellfish; Allergen.Strawberries;
                Allergen.Tomatoes; Allergen.Chocolate; Allergen.Pollen; Allergen.Cats]

let powerOf2 n = 1 <<< n

let getIndex allergen = allergens |> List.findIndex (fun x -> x = allergen)

let allergicTo codedAllergies allergen =
    let inx = getIndex allergen
    let code = powerOf2 inx
    (codedAllergies &&& code) > 0

let listBuilder currList codedAllergies allergen =
    if allergicTo codedAllergies allergen then allergen :: currList
    else currList
    
let list codedAllergies =
    ([], [0..7])
    ||> Seq.fold (fun currList inx -> (listBuilder currList codedAllergies allergens.[inx]))
    |> List.rev
            