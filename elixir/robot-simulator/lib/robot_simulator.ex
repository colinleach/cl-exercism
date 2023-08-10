defmodule RobotSimulator do
  @type robot() :: any()
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """

  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(), do: create(:north, {0, 0})
  def create(:direction, :position), do: %{direction: direction, position: position}
  def create(direction, _), do: {:error, "invalid direction"}
  def create(_, position), do: {:error, "invalid position"}


  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, instructions) do

  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot) :: direction()
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position(robot) do
    robot.position
  end
end

# module RobotSimulator

# type Direction = North | East | South | West
# type Position = int * int
# type Robot = { direction: Direction; position: Position }

# let create direction position =
#     {direction=direction; position=position}

# let turnLeft robot =
#     match robot.direction with
#     | North -> { robot with direction = West }
#     | East -> { robot with direction = North }
#     | South -> { robot with direction = East }
#     | West -> { robot with direction = South }

# let turnRight robot =
#     match robot.direction with
#     | North -> { robot with direction = East }
#     | East -> { robot with direction = South }
#     | South -> { robot with direction = West }
#     | West -> { robot with direction = North }

# let advance robot =
#     let x, y = robot.position
#     match robot.direction with
#     | North -> { robot with position = (x, y+1) }
#     | East -> { robot with position = (x+1, y) }
#     | South -> { robot with position = (x, y-1) }
#     | West -> { robot with position = (x-1, y) }

# let doInstruction c robot : Robot =
#     match c with
#     | 'L' -> turnLeft robot
#     | 'R' -> turnRight robot
#     | 'A' -> advance robot
#     | _ -> raise (System.ArgumentException("Invalid instruction!"))

# let rec processInstructions chars robot =
#     match chars with
#     | [] -> robot
#     | [ c ] -> doInstruction c robot
#     | c::rest -> processInstructions rest (doInstruction c robot)

# let move instructions robot =
#     let chars = Seq.toList instructions
#     processInstructions chars robot
