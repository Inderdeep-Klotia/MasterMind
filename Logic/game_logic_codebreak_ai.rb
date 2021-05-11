# frozen_string_literal: true

require_relative '../Text & Interface/game_text'
require_relative 'logic_methods'

# This module is responsible for housing the methods involved with breaking the code when the user is playing as the
# code maker and the AI is responsible for breaking the code.
module GameLogicCodebreakAI

  include GameText
  include LogicMethods

  def run_codebreak_AI
    # Obtain user inputted secret code.
    secret_code = user_secret_code(0)

    # Set of all possible combinations:
    set = create_set

    12.times do |n|
      # Starting Text
      ai_turn_text(n + 1)
      # Ai current guess
      guess = set.sample

      # Obtain the clues for the guess:
      clues = check_guess(secret_code, guess)

      # Display end turn value:
      ai_turn_end(guess, clues)

      if check_win(secret_code, guess)
        ai_won_game(secret_code, guess, n + 1)
        break
      end

      # Delete all values that don't return the same clues as the user's guess. The user's guess will act as the secret
      # code
      delete_values(set, clues, guess)

      # Give some time intervals between turns.
      sleep(1)
    end
  end

  # Creates an array that houses all possible combinations.
  def create_set
    set = ('1'..'6').to_a
    set = set.repeated_permutation(4).to_a
    # Convert the set values to integers:
    set.map do |i|
      i.map!(&:to_i)
    end

    # Returns the set.
    set
  end

  # Delete values from set:
  def delete_values(set, clues, guess)
    set.delete_if do |val|
      clue_arr2 = check_guess(guess, val)
      clues != clue_arr2
    end
    set.delete(guess)
  end

end
