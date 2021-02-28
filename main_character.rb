#encoding: utf-8
require_relative "player.rb"

class MainCharacter < Player
  def draw_card(player)
    print "相手の手札の左から何番目のカードを引きますか？半角数字で入力してください> "
    while true
      draw_position = gets.to_i
      draw_position -= 1
      break if draw_position < player.hand.size
      puts ""
      print "存在しないカードです。もう一度選び直してください> "
    end

    puts <<~TEXT

    「#{player.hand[draw_position]}」のカードを引きました。

    TEXT

    @hand << player.hand[draw_position]
    player.hand.delete_at(draw_position)
  end
end