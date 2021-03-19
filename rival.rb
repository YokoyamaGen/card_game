#encoding: utf-8
require_relative "character.rb"

class Rival < Character
  def draw_card(player)
    check_drawed_card(player, 0)
    player.delete_hand(0)
  end

  def display_hand_info
    @hand.each.with_index(1) do |card, i|
      printf(OUTPUT_FORMAT, MASKING_CARD)
      puts "" if i % INDENTION_POSITION == 0
    end
  end
end