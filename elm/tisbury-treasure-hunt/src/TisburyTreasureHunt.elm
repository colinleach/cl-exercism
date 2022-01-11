module TisburyTreasureHunt exposing (..)

type alias TreasureLocation = ( Int, Char )
type alias PlaceLocation = ( Char, Int )
type alias Place = ( String, PlaceLocation )
type alias Treasure = ( String, TreasureLocation )


placeLocationToTreasureLocation : PlaceLocation -> TreasureLocation
placeLocationToTreasureLocation placeLocation =
    let
        ( c, n ) = placeLocation
    in
        ( n, c )


treasureLocationMatchesPlaceLocation : PlaceLocation -> TreasureLocation -> Bool
treasureLocationMatchesPlaceLocation placeLocation treasureLocation =
    treasureLocation == ( placeLocationToTreasureLocation placeLocation )


countPlaceTreasures : Place -> List ( Treasure ) -> Int
countPlaceTreasures ( _, loc ) treasures =
    let

        isPlace treasureLoc = treasureLocationMatchesPlaceLocation loc treasureLoc
    in
        treasures |> List.map Tuple.second |> List.filter isPlace |> List.length


specialCaseSwapPossible : Treasure -> Place -> Treasure -> Bool
specialCaseSwapPossible ( foundTreasure, _ ) ( place, _ ) ( desiredTreasure, _ ) =
    case (foundTreasure, desiredTreasure, place) of
        ( "Brass Spyglass", _, "Abandoned Lighthouse" ) -> True
        ( "Amethyst Octopus", "Crystal Crab", "Stormy Breakwater" ) -> True
        ( "Amethyst Octopus", "Glass Starfish", "Stormy Breakwater" ) -> True
        ( "Vintage Pirate Hat", "Model Ship in Large Bottle", "Harbor Managers Office" ) -> True
        ( "Vintage Pirate Hat", "Antique Glass Fishnet Float", "Harbor Managers Office" ) -> True
        _ -> False
