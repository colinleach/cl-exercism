-- Futhark Case Statement Examples
-- In Futhark, pattern matching is done with 'match' expressions

-- Example 1: Simple value matching
def classify_number (x: i32): []u8 =
  match x
  case 0 -> "zero"
  case 1 -> "one" 
  case 2 -> "two"
  case _ -> "other"

-- Example 2: Matching with tuples
def tuple_match (pair: (i32, i32)): []u8 =
  match pair
  case (0, 0) -> "origin"
  case (_, 0) -> "on x-axis"
  case (0, _) -> "on y-axis" 
  case (_, _) -> "general point"

-- Example 3: Matching with sum types
type shape = #circle f64 | #rectangle f64 f64 | #triangle f64 f64 f64

def area (s: shape): f64 =
  match s
  case #circle r -> 3.14159 * r * r
  case #rectangle w h -> w * h
  case #triangle a b c -> 
    let s = (a + b + c) / 2.0
    in f64.sqrt (s * (s - a) * (s - b) * (s - c))

-- Example 4: Guards in pattern matching (using if-then-else)
def categorize_score (score: i32): []u8 =
  if score >= 90 then "A"
  else if score >= 80 then "B"
  else if score >= 70 then "C" 
  else if score >= 60 then "D"
  else "F"

-- Example 5: Using match for the darts problem (alternative approach)
type dart_zone = #bullseye | #inner | #outer | #miss

def classify_dart_position (x: f64) (y: f64): dart_zone =
  let r_sq = x*x + y*y
  in if r_sq <= 1.0 then #bullseye
     else if r_sq <= 25.0 then #inner
     else if r_sq <= 100.0 then #outer
     else #miss

def dart_score_with_match (x: f64) (y: f64): i32 =
  match classify_dart_position x y
  case #bullseye -> 10
  case #inner -> 5
  case #outer -> 1
  case #miss -> 0
