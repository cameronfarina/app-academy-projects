require_relative "game"
require_relative "player"
require_relative "computer_player"


game = Game.new(3, Player.new("Tom"), Computer.new("AI"))

game.play