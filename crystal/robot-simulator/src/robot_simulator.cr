class RobotSimulator
  @x : Int32
  @y : Int32
  @direction : Symbol

  getter :x
  getter :y
  getter :direction

  def initialize(pos, dir)
    @x, @y = pos
    @direction = dir
  end

  def move(instructions)
    instructions.each_char do |cmd|
      case cmd
        when 'A'
          advance
        when 'L'
          turn_left
        when 'R'
          turn_right
      end
    end
  end

  def advance
    case @direction
      when :north
        @y += 1
      when :east
        @x += 1
      when :south
        @y -= 1
      else :west
        @x -= 1
    end
  end

  def turn_left
    new_dir = case @direction
      when :north
        :west
      when :east
        :north
      when :south
        :east
      when :west
        :south
    end
    @direction = new_dir.as(Symbol)
  end

  def turn_right
    new_dir = case @direction
      when :north
      :east
      when :east
        :south
      when :south
        :west
      when :west
        :north
    end
    @direction = new_dir.as(Symbol)
  end
end
