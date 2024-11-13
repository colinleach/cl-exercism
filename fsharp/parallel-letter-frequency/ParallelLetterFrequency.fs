module ParallelLetterFrequency

let addDicts unmerged =
    let getKeys d = d |> Map.toList |> List.map fst 
    let keys = List.map getKeys unmerged |> List.concat  |> List.distinct |> List.sort

    let getCount (m: Map<char,int>) k =
        match m.TryFind k with
        | Some i -> i
        | None -> 0

    let addCounts k = (List.map (fun m -> getCount m k) unmerged) |> List.sum
    List.map (fun k -> (k, addCounts k)) keys |> Map

let frequency texts =
    let addOrIncrementCount (frequencies:Map<char, int>) letter =
        if System.Char.IsLetter letter then
            let entry = frequencies.TryFind letter
            match entry with
            | Some count -> frequencies.Add (letter, count + 1)
            | None -> frequencies.Add (letter, 1)
        else
            frequencies
            
    // Version 1, no parallelism
    // let processText (txt: string) =
    //     Seq.fold addOrIncrementCount Map.empty (txt.ToLower())
    //     
    // addDicts (List.map processText texts)
        
    // Version 2, async
    let processText (txt: string) = 
        Seq.fold addOrIncrementCount Map.empty (txt.ToLower())
        
    List.map (fun txt -> async { return processText txt }) texts
        |> Async.Parallel
        |> Async.RunSynchronously
        |> Array.toList
        |> addDicts
