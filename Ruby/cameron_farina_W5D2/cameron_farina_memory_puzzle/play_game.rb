require_relative "game"
# require_relative "computer_player"
require_relative "human_player"

game = Game.new(Human_player.new("Cameron"), Human_player.new("CPU"))


game.play