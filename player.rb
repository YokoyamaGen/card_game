#encoding: utf-8

class Player
  attr_reader :name
  attr_accessor :hand

  def initialize(**params)
    @name = params[:name]
    @hand = []
  end

  def check_matched_cards
    i = 0

    while i < @hand.length - 1
      j = i + 1

      #手札の中で番号が一致するトランプの要素番号を取得する
      while j < @hand.size
        break if @hand[j].slice(2..4) == @hand[i].slice(2..4)
        j += 1
      end

      #手札の中で一致するカードがあった場合は、手札の中から捨てる
      if j < @hand.size
        @hand.delete(@hand[j])
        @hand.delete(@hand[i])
      else
        i += 1
      end
    end
  end

  def draw_card(player)
    @hand << player.hand[0]
    player.hand.delete_at(0)
  end
end
