struct Point
    x::Int
    y::Int
end

@enum directions begin
    NORTH = 1
    EAST = 2
    SOUTH = 3
    WEST = 4
end

mutable struct Robot
    position::Point
    direction::directions
end

Robot(p::Tuple, direction::directions) = Robot(Point(p...), direction)

position(r::Robot) = r.position

heading(r::Robot) = r.direction

function advance!(r)
    if r.direction == NORTH
        r.position = Point(r.position.x, r.position.y + 1)
    elseif r.direction == EAST
        r.position = Point(r.position.x + 1, r.position.y)
    elseif r.direction == SOUTH
        r.position = Point(r.position.x, r.position.y - 1)
    elseif r.direction == WEST
        r.position = Point(r.position.x - 1, r.position.y)
    end
    r
end

function turn_left!(r)
    headings = [WEST, NORTH, EAST, SOUTH]
    r.direction =  headings[Int(r.direction)]
    r
end

function turn_right!(r)
    headings = [EAST, SOUTH, WEST, NORTH]
    r.direction =  headings[Int(r.direction)]
    r
end

function move!(r, instr)
    for c in instr
        if c == 'R'
            turn_right!(r)
        elseif c == 'L'
            turn_left!(r)
        elseif c == 'A'
            advance!(r)
        end
    end
    r
end
