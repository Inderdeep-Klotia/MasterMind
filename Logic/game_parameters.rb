# frozen_string_literal: true

# Module to house the starting game parameters:
module GameParameters
  # Ask User: Play against computer or another player?
  def single_player?
    puts <<~HEREDOC
      #{Rainbow("Begin the Game:").underline.bright}
      Would you like to play against another Player--P or the Computer--C? Input P or C
    HEREDOC

    ans = gets.chomp!.upcase
    while ans != 'P' && ans != 'C'
      puts 'Please enter a valid response: P for Player, C for Computer'
      ans = gets.chomp!.upcase
    end

    # Return whether the user selected to play as a single player (against computer = true) or against another user.
    ans == 'C'
  end

  # Ask User: Play as the CodeBreaker or CodeMaker?
  def break_or_make?
    puts <<~HEREDOC
      #{Rainbow("Begin the Game:").underline.bright}
      Would you like to play as the CodeMaker--1 or CodeBreaker--2? Input 1 or 2
    HEREDOC

    ans = gets.chomp!
    while ans != '1' && ans != '2'
      puts 'Please enter a valid response: 1 for CodeMaker, 2 for CodeBreaker'
      ans = gets.chomp!
    end

    # Return whether the user selected CodeBreaker or CodeMaker
    ans
  end
end
