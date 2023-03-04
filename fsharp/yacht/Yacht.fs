module Yacht

type Category = 
    | Ones
    | Twos
    | Threes
    | Fours
    | Fives
    | Sixes
    | FullHouse
    | FourOfAKind
    | LittleStraight
    | BigStraight
    | Choice
    | Yacht

type Die =
    | One 
    | Two 
    | Three
    | Four 
    | Five 
    | Six

let score (category: Category) (dice: Die list) =
    let countDice die =
        dice
        |> List.filter (fun x -> x = die)
        |> List.length
        
    let freqs =
        [Die.One; Die.Two; Die.Three; Die.Four; Die.Five; Die.Six]
        |> List.map countDice
        
    let number die =
        match die with
        | Die.One -> 1
        | Die.Two -> 2
        | Die.Three -> 3
        | Die.Four -> 4
        | Die.Five -> 5
        | Die.Six -> 6
        
    let numbers dice = dice |> List.map number
    
    let sumDice dice = dice |> numbers |> List.sum
        
    match category with
    | Ones  -> countDice Die.One
    | Twos  -> 2 * countDice Die.Two
    | Threes -> 3 * countDice Die.Three
    | Fours -> 4 * countDice Die.Four
    | Fives -> 5 * countDice Die.Five
    | Sixes -> 6 * countDice Die.Six
    | FullHouse ->
        match (List.sort freqs) with
        | [_; _; _; _; 2; 3] -> sumDice dice
        | _ -> 0
    | FourOfAKind ->
        let topFreq = List.max freqs
        match topFreq with
        |4 | 5 -> 4 * ((List.findIndex (fun x -> x = topFreq) freqs) + 1)
        | _ -> 0
    | LittleStraight ->
        match freqs with
        | [1; 1; 1; 1; 1; _] -> 30
        | _ -> 0
    | BigStraight ->
        match freqs with
        | [_; 1; 1; 1; 1; 1] -> 30
        | _ -> 0
    | Choice -> sumDice dice
    | Yacht -> if (List.max freqs) = 5 then 50 else 0
     