require_relative "player"
require_relative "ai_player"
require_relative "game"


ghost = Game.new(Ai_Player.new("AI_BOB"), Player.new("Cameron"), Player.new("Anshu"))
ghost.start_the_game