module Clock

type Clock = {h : int; m : int}

let rec create hours minutes = 
    match (hours < 0, minutes < 0) with
    | (false, false)    ->
            {h = (hours + (minutes / 60)) % 24
             m = minutes % 60}
    | (false, true)     ->
            create (hours - 1) (minutes + 60)
    | (true, false)     ->
            create (hours  + 24) minutes
    | (true, true)     ->
            create (hours + 23) (minutes + 60)

let add minutes clock = 
    create clock.h (clock.m + minutes)

let subtract minutes clock = 
    create clock.h (clock.m - minutes)

let display clock = 
    // interpolated strings need F# 5.0
    $"%02d{clock.h}:%02d{clock.m}"