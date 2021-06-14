module Raindrops

let convert (number: int): string = 
    let result = ""
    let pling = 
        if number % 3 = 0 then "Pling" else ""
    let plang = 
        if number % 5 = 0 then "Plang" else ""
    let plong = 
        if number % 7 = 0 then "Plong" else ""

    let drops = pling + plang + plong
    if drops = "" 
        then string number
        else drops