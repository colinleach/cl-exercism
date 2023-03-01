import gleam/string.{drop_left, first}

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

fn turn_left(direction: Direction) -> Direction {
  case direction {
    North -> West
    East -> North
    South -> East
    West -> South
  }
}

fn turn_right(direction: Direction) -> Direction {
  case direction {
    North -> East
    East -> South
    South -> West
    West -> North
  }
}

fn advance(direction: Direction, position: Position) -> Position {
  case direction {
    North -> Position(x: position.x, y: position.y + 1)
    East -> Position(x: position.x + 1, y: position.y)
    South -> Position(x: position.x, y: position.y - 1)
    West -> Position(x: position.x - 1, y: position.y)
  }
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let h = first(instructions)
  let t = drop_left(instructions, 1)
  case h {
    Error(_) -> Robot(direction, position)
    Ok(c) ->
      case c {
        "R" -> move(turn_right(direction), position, t)
        "L" -> move(turn_left(direction), position, t)
        "A" -> move(direction, advance(direction, position), t)
      }
  }
}
