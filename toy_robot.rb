# frozen_string_literal: true

PLACE = "PLACE"
MOVE = "MOVE"
REPORT = "REPORT"

EAST = "EAST"
NORTH = "NORTH"
WEST = "WEST"
SOUTH = "SOUTH"

LEFT = "LEFT"
RIGHT = "RIGHT"

if ARGF.filename != "-"
  command_set = ARGF.readlines
  command_set.each { |command| command.strip! }

  x, y, direction = 0, 0, NORTH
  command_set.each do |command|
    if command.start_with?(PLACE)

      command.delete_prefix!(PLACE)
      command.strip!
      new_x, new_y, direction = command.split(",")
      x = new_x.to_i
      y = new_y.to_i

    elsif command.eql?(MOVE)

      if direction.eql?(EAST)
        x += 1
      elsif direction.eql?(NORTH)
        y += 1
      elsif direction.eql?(WEST)
        x -= 1
      elsif direction.eql?(SOUTH)
        y -= 1
      end

    elsif command.eql?(LEFT)

      if direction.eql?(EAST)
        direction = NORTH
      elsif direction.eql?(NORTH)
        direction = WEST
      elsif direction.eql?(WEST)
        direction = SOUTH
      elsif direction.eql?(SOUTH)
        direction = EAST
      end

    elsif command.eql?(RIGHT)

      if direction.eql?(EAST)
        direction = SOUTH
      elsif direction.eql?(NORTH)
        direction = EAST
      elsif direction.eql?(WEST)
        direction = NORTH
      elsif direction.eql?(SOUTH)
        direction = WEST
      end

    elsif command.eql?(REPORT)
      pp [x, y, direction].join(",")
    end
  end
else
  pp "No commands provided"
end
