class Robot
  DIRECTIONS = [:east, :south, :west, :north]
  
  attr_reader :bearing, :coordinates

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    @bearing = direction
  end

  def turn_right
    direction_index = DIRECTIONS.index(@bearing)
    next_direction_index = (direction_index + 1) % DIRECTIONS.size
    @bearing = DIRECTIONS[next_direction_index]
  end

  def turn_left
    direction_index = DIRECTIONS.index(@bearing)
    next_direction_index = (direction_index - 1) % DIRECTIONS.size
    @bearing = DIRECTIONS[next_direction_index]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case bearing
    when :north then @coordinates[1] += 1
    when :east  then @coordinates[0] += 1
    when :south then @coordinates[1] -= 1
    when :west  then @coordinates[0] -= 1
    end
  end
end

class Simulator
  def instructions(commands)
    commands.chars.each_with_object([]) do |command, ary|
      case command
      when 'L' then ary << :turn_left
      when 'R' then ary << :turn_right
      when 'A' then ary << :advance
      end
    end
  end

  def place(robot, hash)
    robot.at(hash[:x], hash[:y])
    robot.orient(hash[:direction])
  end

  def evaluate(robot, commands)
    instructions(commands).each do |command|
      robot.send(command)
    end
  end
end