 #encoding: utf-8

 require_relative "message_dialog.rb"

class Character
  include MessageDialog

  attr_reader :name, :hand

  def initialize(name:, hand:)
    @name = name
    @hand = hand
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
        break if @hand[j].num == @hand[i].num
        j += 1
      end

      #手札の中で一致するカードがあった場合は、手札の中から捨てる
      if j < @hand.size
        delete_hand1 = @hand[j]
        delete_hand2 = @hand[i]

        @hand.delete(delete_hand1)
        @hand.delete(delete_hand2)

        puts <<~TEXT
        #{name}さんは以下の2枚の数字が一致したので、手札から捨てた
        #{delete_hand1.card_info}と#{delete_hand2.card_info}

        TEXT
      else
        i += 1
      end
    end
  end
end
