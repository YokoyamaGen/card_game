#encoding: utf-8
require_relative "character.rb"

class Player < Character
  def draw_card(rival)
    input_draw_card_position_msg
    while true
      draw_position = gets.to_i - 1
      break if draw_position < rival.hand.size &&  draw_position >= 0
      puts ""
      not_exist_card_msg
    end

    puts <<~TEXT

    「#{rival.hand[draw_position].card_info}」のカードを引きました。

    TEXT

    check_drawed_card(rival, draw_position)

    rival.delete_hand(draw_position)
  end

  def display_hand_info
    @hand.each.with_index(1) do |card, i|
      printf(OUTPUT_FORMAT, "#{card.card_info}")
      puts "" if i % INDENTION_POSITION == 0
    end
  end
end