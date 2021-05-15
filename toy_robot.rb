# frozen_string_literal: true

PLACE = "PLACE"
MOVE = "MOVE"
REPORT = "REPORT"
NORTH = "NORTH"

commands = ["PLACE 0,0,NORTH", "MOVE", "REPORT"].freeze

commands.each do |command|
  x, y, facing = 0, 1, NORTH

  if command.start_with?(PLACE)
    nil
  elsif command.eql?(MOVE)
    nil
  elsif command.eql?(REPORT)
    print [x, y, facing].join(",")
  end
end
