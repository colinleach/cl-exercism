module KindergartenGarden

type Plant = 
| Clover
| Grass
| Radishes
| Violets

let students = 
    [   "Alice", 0;
        "Bob", 1;
        "Charlie", 2;
        "David", 3;
        "Eve", 4;
        "Fred", 5;
        "Ginny", 6;
        "Harriet", 7;
        "Ileana", 8;
        "Joseph", 9;
        "Kincaid", 10;
        "Larry", 11]
    |> dict

let findPlant abbrev = 
    match abbrev with
    | 'C' -> Plant.Clover
    | 'G' -> Plant.Grass
    | 'R' -> Plant.Radishes
    | 'V' -> Plant.Violets

let plants (diagram: string) student = 
    let rows = diagram.Split '\n'
    let studentVal = 2 * students.[student]
    let planted = rows.[0].[studentVal..(studentVal+1)] + 
                  rows.[1].[studentVal..(studentVal+1)]
    planted |> Seq.toList |> List.map findPlant
