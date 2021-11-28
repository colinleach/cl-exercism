module RunLengthEncoding

let rec countChars prevChar prevCount chars counts =
    match chars with
    | [ c ] -> // last char, return result
        if c = prevChar then (c, prevCount+1) :: counts
        else (c, 1) :: (prevChar, prevCount) :: counts
    | c :: tl ->
        if c = prevChar then countChars c (prevCount+1) tl counts
        else countChars c 1 tl ((prevChar, prevCount) :: counts)
    | _ -> failwith "Invalid input"
   
let countsToString (char, count) = if count = 1 then $"{char}" else $"{count}{char}"
    
let encode input =
    match input with
    | s when (s |> String.length) < 2 -> input
    | _ ->
        match (input |> Seq.toList) with
        | c :: tl ->
            let countList = countChars c 1 tl [] |> List.rev
            String.concat "" (countList |> List.map countsToString)
        | _ -> failwith "Invalid input"

let expandChars c count = if count = "" then $"{c}" else String.replicate (count |> int) $"{c}"
    
let rec getNums prevString chars decoded =
    match chars with
    | [ c ] -> // last char, return result
        (expandChars c prevString) :: decoded
    | c :: tl ->
        if (c >= '0' && c <= '9') then getNums (prevString + string c) tl decoded
        else getNums "" tl ((expandChars c prevString) :: decoded)
    | _ -> failwith "Invalid input"
    
let decode input =
    match input with
    | s when (s |> String.length) < 2 -> input
    | _ ->
        let stringList = getNums "" (input |> Seq.toList) [] |> List.rev
        String.concat "" stringList