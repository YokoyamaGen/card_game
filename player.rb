#encoding: utf-8
require_relative "character.rb"

class Player < Character
  def draw_card(character:)
    input_draw_card_position_msg
    while true
      draw_position = gets.to_i - 1
      break if draw_position < character.hand.size &&  draw_position >= 0
      puts ""
      not_exist_card_msg
    end

    puts <<~TEXT

    「#{character.hand[draw_position].card_info}」のカードを引きました。

    TEXT

    @hand << character.hand[draw_position]
    character.hand.delete_at(draw_position)
  end
end