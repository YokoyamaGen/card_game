#encoding: utf-8
require_relative "player.rb"

class MainCharacter < Player
  def draw_card(player)
    input_draw_card_position_msg
    while true
      draw_position = gets.to_i
      draw_position -= 1
      break if draw_position < player.hand.size
      puts ""
      not_exist_card_msg
    end

    puts <<~TEXT

    「#{player.hand[draw_position]}」のカードを引きました。

    TEXT

    @hand << player.hand[draw_position]
    player.hand.delete_at(draw_position)
  end
end