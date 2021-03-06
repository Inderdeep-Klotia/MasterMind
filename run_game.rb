# frozen_string_literal: true

require_relative 'Text & Interface/instructions'
require_relative 'Logic/game_parameters'
require_relative 'Logic/game_logic_codebreak_user'
require_relative 'Logic/game_logic_codebreak_ai'

# Requires the Rainbow ruby gem
require 'rainbow'
Rainbow.enabled = true


# This class is responsible for starting & running the game.
class RunGame
  # Include the game_instructions module. Used to display instructions at the start of the game.
  include Instructions
  include GameParameters
  include GameLogicCodeBreakUser
  include GameLogicCodebreakAI

  # Method responsible for starting the game.
  def begin
    # Call the method from Instructions
    puts starting_game_instructions

    # Ask User: Play as the CodeBreaker or CodeMaker?
    selection = break_or_make?
    # Have the user or the AI break the code based on the user input.
    selection == '2' ? run_codebreak_user : run_codebreak_AI

    # Ask if the user wants to play again:
    play_again?
  end

  # This method asks if the user wants to play again. If so restart the entire game.
  def play_again?
    puts "\n\n"
    puts "#{Rainbow("Would you like to play again? Y to play again, any key to quit.").darkorange}"
    response = gets.chomp!.upcase

    if response == 'Y'
      puts "\n\n\n\n\n"
      RunGame.new.begin
    else
      puts "\n\n"
      puts "#{Rainbow("Thank you for playing. Come again!").darkorange}"
    end
  end

end
