require_relative 'game'
require_relative 'color'


game = Game.new

until game.over?
  game.request_guess
end