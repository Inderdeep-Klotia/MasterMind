# frozen_string_literal: true

# This module is responsible for checking whether or not the given sequence has provided us a winner.
module CheckForWin
  def check_win(secret_code, guess)
    secret_code == guess
  end
end
