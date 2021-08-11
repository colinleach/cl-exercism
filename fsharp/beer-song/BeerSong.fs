module BeerSong

let bottles (nBottles: int) =
    match nBottles with
    | 0 -> "no more bottles"
    | 1 -> "1 bottle"
    | _ -> $"{nBottles} bottles"

let verse (nBottles: int) = 
    let none = 
        [ "No more bottles of beer on the wall, no more bottles of beer."
          "Go to the store and buy some more, 99 bottles of beer on the wall." ]
    let one =
        ["1 bottle of beer on the wall, 1 bottle of beer.";
         "Take it down and pass it around, no more bottles of beer on the wall."]
    let more = 
        [ $"{bottles nBottles} of beer on the wall, {bottles nBottles} of beer."
          $"Take one down and pass it around, {bottles (nBottles - 1)} of beer on the wall." ]
 
    match nBottles with
    | 0 -> none
    | 1 -> one
    | _ -> more

let rec recite (startBottles: int) (takeDown: int) = 
    match takeDown with
    | 0 -> [""]
    | 1 -> verse startBottles
    | _ -> (verse startBottles) @ [""] @ (recite (startBottles-1) (takeDown-1))