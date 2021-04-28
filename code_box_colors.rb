# frozen_string_literal: true

# Requires the Rainbow ruby gem.
require 'rainbow'
Rainbow.enabled = true

# Module houses the various code box colors that will be displayed on the game board when called. Created for ease of
# use. Each number corresponds to a particular box.
module CodeBoxColors
  def code_box_color(color_num)
    case color_num
      when 1
        "#{Rainbow("   1   ").bg(:darkred)}"

      when 2
        "#{Rainbow("   2   ").bg(:teal)}"

      when 3
        "#{Rainbow("   3   ").bg(:darkgreen)}"

      when 4
        "#{Rainbow("   4   ").bg(:navyblue)}"

      when 5
        "#{Rainbow("   5   ").bg(:darkmagenta)}"

      when 6
        "#{Rainbow("   6   ").bg(:dimgray)}"

      when 10
        "#{Rainbow("   1   ").bg(:darkred)} #{Rainbow("   2   ").bg(:teal)} #{Rainbow("   3   ").bg(:darkgreen)} "\
                      "#{Rainbow("   4   ").bg(:navyblue)} #{Rainbow("   5   ").bg(:darkmagenta)} #{Rainbow("   6   ").bg(:dimgray)}"
    end

  end

end
