# frozen_string_literal: true

require_relative 'code_box_colors'
require 'rainbow/refinement'
using Rainbow


# This module is responsible for generating the game text that will be displayed while the user plays the game.
module GameText
  include CodeBoxColors

  # Methods display game text for the CodeBreaker (User) playing against the Computer:
  def codebreaker_text(turn)
    puts <<~HEREDOC

      ==================================================================================================================
                                                           #{Rainbow("Turn #: #{turn}").teal}

      Type in 4 numbers from 1 - 6 to guess the secret code.
    HEREDOC

    # Obtain the input from the user:
    input = gets.chomp!
    input = verify_input(input)

    # Return the user's guess
    input.to_i.digits.reverse
  end

  # Method to check the input that the user has given:
  def verify_input(input)
    until /[1-6]{4}/.match(input.to_s) && input.length == 4
      puts 'Please enter a valid secret code combination. 4 integers with each integer ranging from 1-6:'.red
      input = gets.chomp!
    end
    input
  end

  # Method to finish displaying the remainder of the turn:
  def codebreaker_text_end(user_guess, clue_arr)
    # Multi-line concatenation without newline or extra whitespace:
    str = "#{code_box_color(user_guess[0])} #{code_box_color(user_guess[1])} #{code_box_color(user_guess[2])} "\
          "#{code_box_color(user_guess[3])}"

    # Obtain the clues in a displayable format:
    display_clues = convert_clues(clue_arr)

    puts <<~HEREDOC
      #{str} #{display_clues}
      #{Rainbow("==================================================================================================================").darkorange}
    HEREDOC
  end

  # Method to convert the clue array into a displayable set of clue circles for the user:
  def convert_clues(clue_arr)
    # An array to house the colored circle output that will be displayed to the user
    clue_display_arr = []
    clue_arr.length.times do |i|
      clue_display_arr.push(clue(clue_arr[i]))
    end

    # Convert the clues into a displayable format and return:
    clue_display_arr.join(' ')
  end



  # Methods here will now assist in displaying text for the AI playing as the CodeBreaker and the user playing as the
  # CodeMaker:

  # Obtain the secret code from the user:
  def user_secret_code(turn)
    puts <<~HEREDOC

      #{Rainbow("==================================================================================================================").darkorange}
                                                           #{Rainbow("Turn #: #{turn}").teal}

      #{Rainbow("Please enter a 4 digit secret code that includes digits from 1 to 6.").darkorange}
    HEREDOC

    # Obtain the input from the user:
    input = gets.chomp!
    input = verify_input(input)
    input = input.to_i.digits.reverse

    # Display the secret key:
    puts "\n#{Rainbow("Your Secret Key:").darkorange}\n"
    puts "#{code_box_color(input[0])} #{code_box_color(input[1])} #{code_box_color(input[2])} "\
         "#{code_box_color(input[3])}"

    puts <<~HEREDOC
      #{Rainbow("==================================================================================================================").darkorange}
    HEREDOC

    # return input:
    input
  end

  # Displays ai turn text
  def ai_turn_text(turn)
    puts <<~HEREDOC

      #{Rainbow("==================================================================================================================").darkorange}
                                                           #{Rainbow("Turn #: #{turn}").teal}

      #{Rainbow("The Computer's Guess is displayed below:").darkorange}
    HEREDOC
  end

  # Display ai end turn text
  def ai_turn_end(guess, clues)
    str = "#{code_box_color(guess[0])} #{code_box_color(guess[1])} #{code_box_color(guess[2])} "\
          "#{code_box_color(guess[3])}"

    # Obtain clues in displayable format:
    display_clues = convert_clues(clues)
    puts <<~HEREDOC
      #{str} #{display_clues}
      #{Rainbow("==================================================================================================================").darkorange}
    HEREDOC
  end

  # Method displays that the AI won the game.
  def ai_won_game(secret_code, guess, turn)
    puts <<~HEREDOC
      #{Rainbow("==================================================================================================================").darkorange}
      #{Rainbow("The AI cracked the code!").dodgerblue}
      #{Rainbow("Secret Code: #{secret_code}").darkorange}
      #{Rainbow("Winning Guess: #{guess}").darkorange}
      #{Rainbow("Number of Turns it took to Win: #{turn}").darkorange}
    HEREDOC
  end

end
