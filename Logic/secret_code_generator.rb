# frozen_string_literal: true

# This module is responsible for generating a secret code.
module SecretCodeGenerator
  def generate_code
    code = []
    4.times do
      code.push(rand(1..6))
    end
    code
  end
end