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

      #{Rainbow("==================================================================================================================").darkorange}
                                                    #{Rainbow("MASTERMIND GAME").darkorange}
                                                         #{Rainbow(game_banner).darkred}     
                                                    #{Rainbow("INDERDEEP KLOTIA").darkorange}
      #{Rainbow("==================================================================================================================").darkorange}
      #{Rainbow("Welcome to MasterMind!").underline.dodgerblue}
      #{Rainbow("This version of Mastermind is a single game where the user will play against the computer. ").darkorange}
      
      #{Rainbow("How to play:").underline.dodgerblue}
      #{Rainbow("There will be a choice of 6 different numbers [pegs] from 1 - 6.").darkorange}
      #{Rainbow("Each choice will be represented with a specific color as shown below.").darkorange}
      
      #{Rainbow("Your options are displayed here:").darkorange}
      #{code_box_color(10)}

      #{Rainbow("You can either be the ").darkorange}#{Rainbow("CodeMaker").underline.darkred}#{Rainbow(" or the ").darkorange}#{Rainbow("CodeBreaker").underline.darkred}
      #{Rainbow("The CodeMaker will create a secret code of 4 pegs and the CodeBreaker must decode it within 12 turns.").darkorange}

      #{Rainbow("------------------------------------------------------------------------------------------------------------------").darkorange}
      #{Rainbow("Creating the Code:").underline.dodgerblue}
      #{Rainbow("Here's an example of 4 pegs that a CodeMaker could create:").darkorange}      
      #{code_box_color(1)} #{code_box_color(4)} #{code_box_color( 3)} #{code_box_color(2)}
    
      #{Rainbow("If you desire you can also add two of the same 'codes' in the set:").darkorange}
      #{code_box_color(5)} #{code_box_color(4)} #{code_box_color( 3)} #{code_box_color(5)}
      
      #{Rainbow("------------------------------------------------------------------------------------------------------------------").darkorange}
      #{Rainbow("Receiving Clues:").underline.dodgerblue}
      #{Rainbow("Every guess comes with clues.").darkorange}
      
      #{clue('Y')} #{Rainbow("This clue means that the CodeBreaker has a correct peg in the correct location ").darkorange}
      
      #{clue('x')} #{Rainbow("This clue means that the Codebreaker has a correct peg in the wrong location. ").darkorange}

      #{Rainbow("------------------------------------------------------------------------------------------------------------------").darkorange}
      #{Rainbow("Examples of Clues:").underline.dodgerblue}
      #{Rainbow("If the CodeMaker created the secret code '5435', the guess '5513' would produce the following clues:").darkorange}

      #{code_box_color(5)} #{code_box_color(5)} #{code_box_color(1)} #{code_box_color(3)}\
         #{clue('Y')} #{clue('x')} #{clue('x')}

      #{Rainbow("The secret code '5435' with the guess of '1235' would produce the following clues:").darkorange}
      #{code_box_color(1)} #{code_box_color(2)} #{code_box_color(3)} #{code_box_color(5)}\
         #{clue('Y')} #{clue('Y')}

      #{Rainbow("------------------------------------------------------------------------------------------------------------------").darkorange}
    HEREDOC
  end
end
