module RobotSimulator

type Direction = North | East | South | West
type Position = int * int
type Robot = { direction: Direction; position: Position }

let create direction position =
    {direction=direction; position=position}

let turnLeft robot =
    match robot.direction with
    | North -> { robot with direction = West }
    | East -> { robot with direction = North }
    | South -> { robot with direction = East }
    | West -> { robot with direction = South }
    
let turnRight robot =
    match robot.direction with
    | North -> { robot with direction = East }
    | East -> { robot with direction = South }
    | South -> { robot with direction = West }
    | West -> { robot with direction = North }
    
let advance robot =
    let x, y = robot.position
    match robot.direction with
    | North -> { robot with position = (x, y+1) }
    | East -> { robot with position = (x+1, y) }
    | South -> { robot with position = (x, y-1) }
    | West -> { robot with position = (x-1, y) }
    
let doInstruction c robot : Robot =
    match c with
    | 'L' -> turnLeft robot
    | 'R' -> turnRight robot
    | 'A' -> advance robot
    | _ -> raise (System.ArgumentException("Invalid instruction!"))
    
let rec processInstructions chars robot =
    match chars with
    | [] -> robot
    | [ c ] -> doInstruction c robot
    | c::rest -> processInstructions rest (doInstruction c robot)
    
let move instructions robot =
    let chars = Seq.toList instructions
    processInstructions chars robot
    
    