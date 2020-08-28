


#!/usr/bin/env ruby

# require_relative '../config/environment'

# game = Game.new
# until game.won?
#   game.start
#   game.board.reset!
#   puts "\n\n\n\n\n-----NEW GAME--------"
# end

require_relative '../config/environment'

game = Game.new
until game.won?
  game.start
  game.board.reset!
  puts "\n\n\n\n\n-----NEW GAME--------"
end