PLACE = "PLACE".freeze
MOVE = "MOVE".freeze
REPORT = "REPORT".freeze
NORTH = "NORTH".freeze
LEFT = "LEFT".freeze

# commands = ["PLACE 0,0,NORTH", "MOVE", "REPORT"]
commands = ["PLACE 0,0,NORTH", "LEFT", "REPORT"]
current_commands = commands

x, y, facing = 0, 0, NORTH

current_commands.each do |command|
  if command.start_with?(PLACE)
    command.delete_prefix!(PLACE)
    command.strip!
    new_x, new_y, facing = command.split(",")
    x = new_x.to_i
    y = new_y.to_i
  elsif command.eql?(MOVE)
    y += 1
  elsif command.eql?(LEFT)
    facing = "WEST"
  elsif command.eql?(REPORT)
    print [x, y, facing].join(",")
  end
end
