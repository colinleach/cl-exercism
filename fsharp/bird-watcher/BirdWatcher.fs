module BirdWatcher

let lastWeek: int[] =
    [| 0; 2; 5; 3; 7; 8; 4 |]

let yesterday(counts: int[]): int =
    counts.[counts.Length - 2]

let total(counts: int[]): int =
    counts |> Array.sum

let dayWithoutBirds(counts: int[]): bool =
    counts |> Array.exists (fun elm -> elm = 0)

let incrementTodaysCount(counts: int[]): int[] =
    let last = counts.Length - 1
    Array.set counts last (counts.[last] + 1)
    counts

let oddWeek(counts: int[]): bool =
    match counts with
    | [| _; 0; _; 0; _; 0; _ |] -> true
    | [| _; 10; _; 10; _; 10; _ |] -> true
    | [| 5; _; 5; _; 5; _; 5 |] -> true
    | _ -> false