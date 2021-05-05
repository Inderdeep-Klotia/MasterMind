# frozen_string_literal: true

require_relative 'secret_code_generator'
require_relative 'check_for_win'
require_relative '../Text & Interface/game_text'
require_relative '../Text & Interface/clue_circles'

# This module is responsible for housing the methods involved with break the code when the user is playing against the
# computer
module GameLogicCodeBreakUser
  include SecretCodeGenerator
  include GameText
  include ClueCircles
  include CheckForWin

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

  # Method to see the number of guesses the user got correct:
  def check_guess(secret_code, user_guess)
    # Array to house all exact matches:
    arr_exact = check_exact(secret_code, user_guess)
    # Array to house all of the generic matches:
    arr_general = check_generic(secret_code, user_guess)

    # Subtract the total number of general occurrences by the number of exact occurrences
    len = arr_exact.length
    len.times { arr_general.delete_at(0) }

    # Return the clue array combined.
    arr_exact + arr_general
  end

  # This method returns the number of correct exact matches from the user's guess.
  def check_exact(secret_code, user_guess)
    # Array to house all exact matches:
    arr_exact = []

    # Check only for exact matches:
    user_guess.each_index do |i|
      arr_exact.push('Y') if secret_code[i] == user_guess[i]
    end
    arr_exact
  end

  # This method returns the number of correct generic matches from the user's guess.
  def check_generic(secret_code, user_guess)
    # Variable to house all generic matches:
    arr_general = []

    x = user_guess.uniq
    x.each do |val|
      next unless secret_code.include?(val)

      # Count the number of occurrences in total:
      occurrences = secret_code.count(val)

      # Add to the generic array based on the number of occurrences.
      occurrences.times do
        arr_general.push('X')
      end
    end

    arr_general
  end
end
