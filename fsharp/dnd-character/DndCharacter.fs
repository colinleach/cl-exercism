module DndCharacter

open System

let rnd = Random()

let modifier x = float (x - 10) / 2.0 |> floor |> int

let ability() = 
    let dice = Array.init  4 (fun _ -> rnd.Next(1, 7))
    Array.sum dice - Array.min dice

type Character = {
    Strength: int;
    Dexterity: int;
    Constitution: int;
    Intelligence: int
    Wisdom: int;
    Charisma: int
    Hitpoints: int
}

let createCharacter() =
    let constitution = ability();
    {
        Strength = ability();
        Dexterity = ability();
        Constitution = constitution;
        Intelligence = ability();
        Wisdom = ability();
        Charisma = ability();
        Hitpoints = modifier constitution + 10;
    }
