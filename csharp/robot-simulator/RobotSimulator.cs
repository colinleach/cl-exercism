using System;

public enum Direction
{
    North,
    East,
    South,
    West
}

public class RobotSimulator(Direction direction, int x, int y)
{
    public Direction Direction { get; private set; } = direction;

    public int X { get; private set; } = x;

    public int Y { get; private set; } = y;

    public void Move(string instructions)
    {
        foreach (char instruction in instructions)
        {
            switch (instruction)
            {
                case 'A':
                    Advance();
                    break;
                case 'L':
                    TurnLeft();
                    break;
                case 'R':
                    TurnRight();
                    break;
            }
        }
    }

    private void Advance()
    {
        switch (Direction)
        {
            case Direction.North:
                Y++;
                break;
            case Direction.East:
                X++;
                break;
            case Direction.South:
                Y--;
                break;
            case Direction.West:
                X--;
                break;
            default:
                throw new ArgumentOutOfRangeException();
        }
    }

    private void TurnLeft() =>
        Direction = Direction switch
        {
            Direction.North => Direction.West,
            Direction.East => Direction.North,
            Direction.South => Direction.East,
            Direction.West => Direction.South,
            _ => Direction
        };

    private void TurnRight() =>
        Direction = Direction switch
        {
            Direction.North => Direction.East,
            Direction.East => Direction.South,
            Direction.South => Direction.West,
            Direction.West => Direction.North,
            _ => Direction
        };
}
