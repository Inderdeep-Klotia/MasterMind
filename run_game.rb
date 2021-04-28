# frozen_string_literal: true

require_relative 'Text & Interface/instructions'
require_relative 'Logic/game_parameters'
require_relative 'Logic/game_logic_codebreak_user'

# This class is responsible for starting & running the game.
class RunGame
  # Include the game_instructions module. Used to display instructions at the start of the game.
  include Instructions
  include GameParameters
  include GameLogicCodeBreakUser

  # Method responsible for starting the game.
  def begin
    # Call the method from Instructions
    puts starting_game_instructions

    # Ask if the user wishes to play against another player or the computer.
    if single_player?
      # Ask User: Play as the CodeBreaker or CodeMaker?
      selection = break_or_make?
      # Note the run_game method here is for the user playing against the AI as a Code Breaker
      selection == '2' ? run_game : 'Still need to create section'

    else
      puts 'If not single player, then multiplayer. Need to finish section.'
    end

  end




end
