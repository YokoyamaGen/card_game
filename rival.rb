#encoding: utf-8
require_relative "player.rb"

class Rival < Player
  def draw_card(player)
    @hand << player.hand[0]
    player.hand.delete_at(0)
  end
end