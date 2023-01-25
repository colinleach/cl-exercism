module MariosMarvellousLasagna exposing (remainingTimeInMinutes)

    remainingTimeInMinutes : Int -> Int
    remainingTimeInMinutes layers elapsedMinutes =
        let
            expectedMinutesInOven = 40

            preparationTimeInMinutes layers = layers * 2
        in
        layers + expectedMinutesInOven - elapsedMinutes
