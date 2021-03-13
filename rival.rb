#encoding: utf-8
require_relative "character.rb"

class Rival < Character
  def draw_card(player)
    @hand << player.hand[0]
    player.hand.delete_at(0)
  end
end