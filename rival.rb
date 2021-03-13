#encoding: utf-8
require_relative "character.rb"

class Rival < Character
  def draw_card(player)
    @hand << player.hand[0]
    player.delete_player_hand(0)
  end

  def delete_rival_hand(draw_position)
    @hand.delete_at(draw_position)
  end
end