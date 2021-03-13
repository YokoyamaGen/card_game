 #encoding: utf-8
class Character
  attr_reader :name
  attr_accessor :hand

  def initialize(name:)
    @name = name
    @hand = []
  end

  def output_hand_info
    @hand.each.with_index(1) do |card, i|
      if self.class == Rival 
        printf(OUTPUT_FORMAT, MASKING_CARD)
      else
        printf(OUTPUT_FORMAT, "#{card.card_info}")
      end
      puts "" if i % INDENTION_POSITION == 0
    end
  end

  def check_matched_cards
    i = 0

    while i < @hand.length - 1
      j = i + 1

      #手札の中で番号が一致するトランプの要素番号を取得する
      while j < @hand.size
        #break if @hand[j].slice(CARD_CHARA_FIRST..CARD_CHARA_LAST) == @hand[i].slice(CARD_CHARA_FIRST..CARD_CHARA_LAST)
        break if @hand[j].num == @hand[i].num
        j += 1
      end

      #手札の中で一致するカードがあった場合は、手札の中から捨てる
      if j < @hand.size
        puts <<~TEXT
        #{name}さんは以下の2枚の数字が一致したので、手札から捨てた
        #{@hand[j].card_info}と#{@hand[i].card_info}

        TEXT
        @hand.delete(@hand[j])
        @hand.delete(@hand[i])
      else
        i += 1
      end
    end
  end
end
