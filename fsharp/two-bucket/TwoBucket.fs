module TwoBucket

type Bucket =
    | One
    | Two
    
type Result = { Moves:int; GoalBucket:Bucket; OtherBucket:int }

let measure bucketOne bucketTwo goal startBucket =
    let isGoal (b1, b2) = b1 = goal || b2 = goal
    
    let isFound stats =
        let matches = Set.filter isGoal stats
        if matches.IsEmpty then None else Some (Set.toArray matches)
    
    let branch (b1, b2) =
        let transfer1to2 = min b1 (bucketTwo - b2)
        let transfer2to1 = min b2 (bucketOne - b1)
        [ (b1, 0); (0, b2); (b1, bucketTwo); (bucketOne, b2); // empty/fill one bucket
          (b1 - transfer1to2, b2 + transfer1to2) // transfer 1 -> 2
          (b1 + transfer2to1, b2 - transfer2to1) ] // transfer 2 -> 1

    let rec step steps prevSeen prevStatus =
        let possibleSteps = Set (List.collect branch (Set.toList prevStatus)) - prevSeen
        match isFound possibleSteps with
        | Some m ->
            let (b1, b2) = m[0]
            if b1 = goal
                then { Moves = steps + 1; GoalBucket = Bucket.One; OtherBucket = b2 }
                else { Moves = steps + 1; GoalBucket = Bucket.Two; OtherBucket = b1 }
        | None -> step (steps + 1) (prevSeen + possibleSteps) (prevStatus + possibleSteps)
            
    let seen = Set [(0, 0); (bucketOne, 0); (0, bucketTwo)]
    let status = if startBucket = Bucket.One then Set [ (bucketOne, 0); ] else Set [ (0, bucketTwo); ]
    match isFound status with
    | Some m ->
        let (b1, b2) = m[0]
        if b1 = goal
            then { Moves = 1; GoalBucket = Bucket.One; OtherBucket = b2 }
            else { Moves = 1; GoalBucket = Bucket.Two; OtherBucket = b1}
    | None -> step 1 seen (Set status)
