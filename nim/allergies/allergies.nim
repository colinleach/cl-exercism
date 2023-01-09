type Allergies* = object
    score*: int
    
let foods = 
    ["eggs",
    "peanuts",
    "shellfish",
    "strawberries",
    "tomatoes",
    "chocolate",
    "pollen",
    "cats"]

proc isAllergicTo*(allergies: Allergies, food: string): bool =
    let lowscore = allergies.score mod 256
    let mask = 1 shl find(foods, food)
    return (lowscore and mask) != 0

proc lst*(allergies: Allergies): seq[string] =
    for food in foods:
        if allergies.isAllergicTo(food):
            result.add(food)
