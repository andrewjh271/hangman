require_relative 'game'


game = Game.new

until game.over?
  game.request_guess
end

puts game.key