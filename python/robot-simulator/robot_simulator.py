# Globals for the directions
NORTH = 0
EAST = 1
SOUTH = 2
WEST = 3


class Robot:
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.direction = direction
        self.x_pos = x_pos
        self.y_pos = y_pos
        self.coordinates = self.x_pos, self.y_pos

    def move(self, cmds):
        for cmd in cmds:
            match cmd:
                case 'A':
                    self.advance()
                case 'L':
                    self.turn_left()
                case 'R':
                    self.turn_right()

    def advance(self):
        if self.direction == NORTH:
            self.y_pos += 1
        elif self.direction == EAST:
            self.x_pos += 1
        elif self.direction == SOUTH:
            self.y_pos -= 1
        elif self.direction == WEST:
            self.x_pos -= 1
        self.coordinates = self.x_pos, self.y_pos

    def turn_left(self):
        directions = [WEST, NORTH, EAST, SOUTH]
        self.direction = directions[self.direction]

    def turn_right(self):
        directions = [EAST, SOUTH, WEST, NORTH]
        self.direction = directions[self.direction]
