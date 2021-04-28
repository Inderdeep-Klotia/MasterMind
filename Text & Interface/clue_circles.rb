# frozen_string_literal: true

# This module is responsible for creating the circled clues on the display.
module ClueCircles
  def clue(ans)
    if ans == 'Y'
      # \e[92m\u25CF\e[0m
      # Using Bash to format some aspects of the game.
      # <Esc> sequence. 92m = Light Green, u25CF in Unicode means a Black Circle \e[0m removes all attributes going
      # forward
      "\e[92m\u25CF\e[0m"
    else
      # \e[33m\u25CB\e[0m
      # <Esc> sequence. 91m = Light Red,
      "\e[91m\u25CF\e[0m"
    end
  end
end
