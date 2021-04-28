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
    until /[1-6]{4}/.match(input.to_s)
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
      ==================================================================================================================
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

end
