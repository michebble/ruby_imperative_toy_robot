PLACE = "PLACE".freeze
MOVE = "MOVE".freeze
REPORT = "REPORT".freeze
NORTH = "NORTH".freeze
EAST = "EAST".freeze
WEST = "WEST".freeze
LEFT = "LEFT".freeze

# command_set = ["PLACE 0,0,NORTH", "MOVE", "REPORT"] # ->  0,1,NORTH
# command_set = ["PLACE 0,0,NORTH", "LEFT", "REPORT"] # -> 0,0,WEST
command_set = ["PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"] # -> 3,3,NORTH
current_commands = command_set

x, y, facing = 0, 0, NORTH

current_commands.each do |command|
  if command.start_with?(PLACE)

    command.delete_prefix!(PLACE)
    command.strip!
    new_x, new_y, facing = command.split(",")
    x = new_x.to_i
    y = new_y.to_i

  elsif command.eql?(MOVE)

    if facing.eql?(EAST)
      x += 1
    elsif facing.eql?(NORTH)
      y += 1
    elsif facing.eql?(WEST)
      x -= 1
    end

  elsif command.eql?(LEFT)

    if facing.eql?(EAST)
      facing = NORTH
    elsif facing.eql?(NORTH)
      facing = WEST
    end

  elsif command.eql?(REPORT)
    print [x, y, facing].join(",")
  end
end
