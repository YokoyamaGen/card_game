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
        break if @hand[j].slice(CARD_CHARA_FIRST..CARD_CHARA_LAST) == @hand[i].slice(CARD_CHARA_FIRST..CARD_CHARA_LAST)
        j += 1
      end

      #手札の中で一致するカードがあった場合は、手札の中から捨てる
      if j < @hand.size
        puts "#{name}さんは#{@hand[j]}と#{@hand[i]}の数字が一致したので、手札から捨てた"
        puts ""
        @hand.delete(@hand[j])
        @hand.delete(@hand[i])
      else
        i += 1
      end
    end
  end
end
