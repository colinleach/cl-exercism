module SumOfMultiples exposing (sumOfMultiples)

import Set


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    let
        makeList : Int -> List Int
        makeList n =
            List.map (\a -> a * n) (List.range 1 ((limit - 1) // n))

    in
        divisors
        |> List.concatMap makeList
        -- |> List.concat
        |> Set.fromList
        |> Set.toList
        |> List.sum