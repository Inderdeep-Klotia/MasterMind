# frozen_string_literal: true

# Requires the Rainbow ruby gem
require 'rainbow'
Rainbow.enabled = true

# Requires various files to work.
require_relative 'code_box_colors'
require_relative 'clue_circles'

# Module used, no need to ever be initialized. Only required to cleanly display methods
module Instructions
  # Include the code box colors module for easy access to box colors:
  include CodeBoxColors
  # Include the clue circles for easy access to circular clues.
  include ClueCircles

  def starting_game_instructions
    # Define a very long string to display all the user instructions in one go.

    game_banner = "
              ███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗
              ████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗
              ██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║
              ██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║
              ██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
              ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝
               "



    str = <<~HEREDOC

      ==================================================================================================================
                                                    MASTERMIND GAME
                                                         #{game_banner}     
                                                   INDERDEEP KLOTIA        
      ==================================================================================================================
      #{Rainbow("Welcome to MasterMind!").underline.bright}
      This version of Mastermind is a single game where the user will play against the computer. 
      
      #{Rainbow("How to play:").underline.bright}
      There will be a choice of 6 different numbers [pegs] from 1 - 6. 
      Each choice will be represented with a specific color as shown below.
      
      Your options are displayed here:
      #{code_box_color(10)}

      You can either be the #{Rainbow("CodeMaker").underline.red} or the #{Rainbow("CodeBreaker").underline.red}
      The CodeMaker will create a secret code of 4 pegs and the CodeBreaker must decode it within 12 turns.

      ------------------------------------------------------------------------------------------------------------------
      #{Rainbow("Creating the Code:").underline.bright}
      Here's an example of 4 pegs that a CodeMaker could create:
      #{code_box_color(1)} #{code_box_color(4)} #{code_box_color( 3)} #{code_box_color(2)}
    
      If you desire you can also add two of the same 'codes' in the set:
      #{code_box_color(5)} #{code_box_color(4)} #{code_box_color( 3)} #{code_box_color(5)}
      
      ------------------------------------------------------------------------------------------------------------------
      #{Rainbow("Receiving Clues:").underline.bright}
      Every guess comes with clues.
      
      #{clue('Y')} This clue means that the CodeBreaker has a correct peg in the correct location 
      
      #{clue('x')} This clue means that the Codebreaker has a correct peg in the wrong location.

      ------------------------------------------------------------------------------------------------------------------
      #{Rainbow("Examples of Clues:").underline.bright}
      If the CodeMaker created the secret code '5435', the guess '5513' would produce the following clues:

      #{code_box_color(5)} #{code_box_color(5)} #{code_box_color(1)} #{code_box_color(3)}\
         #{clue('Y')} #{clue('x')} #{clue('x')}

      The secret code '5435' with the guess of '1235' would produce the following clues:
      #{code_box_color(1)} #{code_box_color(2)} #{code_box_color(3)} #{code_box_color(5)}\
         #{clue('Y')} #{clue('Y')}

      ------------------------------------------------------------------------------------------------------------------
    HEREDOC
  end
end
