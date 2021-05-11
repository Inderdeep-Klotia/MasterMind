# frozen_string_literal: true

# This module is responsible for checking whether or not the given sequence has provided us a winner.
module LogicMethods
  # Simple method that just checks if the user has won the game.
  def check_win(secret_code, guess)
    secret_code == guess
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
    user_guess_unique = user_guess.uniq

    user_guess_unique.each do |elem|
      next unless secret_code.include?(elem)

      occurrences_secret = secret_code.count(elem)
      occurrences_guess = user_guess.count(elem)

      if occurrences_secret > occurrences_guess
        occurrences_guess.times do
          arr_general.push('X')
        end
      elsif occurrences_guess > occurrences_secret
        occurrences_secret.times do
          arr_general.push('X')
        end
      else
        arr_general.push('X')
      end
    end

    arr_general
  end
end
