# frozen_string_literal: true

require_relative 'secret_code_generator'
require_relative 'logic_methods'
require_relative '../Text & Interface/game_text'
require_relative '../Text & Interface/clue_circles'

# This module is responsible for housing the methods involved with breaking the code when the user is playing as the
# code breaker against the AI.
module GameLogicCodeBreakUser
  include SecretCodeGenerator
  include GameText
  include ClueCircles
  include LogicMethods

  def run_codebreak_user
    # Call the appropriate method to house the computer's secret code,
    secret_code = generate_code

    # Variable to house the turn number.
    turn = 1
    until turn == 13
      # Call the function responsible for displaying the game text [First half of the turn]:
      user_guess = codebreaker_text(turn)

      # House all of the clues in an array
      clue_arr = check_guess(secret_code, user_guess)

      # Call the function responsible for displaying the remainder of the game text [Second half of the turn]:
      codebreaker_text_end(user_guess, clue_arr)

      # Check if the user has won the game:
      if check_win(secret_code, user_guess)
        puts "You've broke the code! Congratulations!"
        break
      end

      turn += 1
    end

  end
end
