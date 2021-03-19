 #encoding: utf-8

 require_relative "message_dialog.rb"

class Character
  include MessageDialog

  MASKING_CARD = "***"
  INDENTION_POSITION = 8
  OUTPUT_FORMAT = "%-6s"

  attr_reader :name, :hand

  def initialize(name:)
    @name = name
  end

  def receive_cards(hand)
    @hand = hand
  end

  def check_matched_cards
    i = 0

    while i < @hand.length - 1
      j = i + 1

      #手札の中で番号が一致するトランプの要素番号を取得する
      while j < @hand.length
        break if @hand[j].num == @hand[i].num
        j += 1
      end

      #手札の中で一致するカードがあった場合は、手札の中から捨てる
      if j < @hand.length
        delete_hand1 = @hand[j]
        delete_hand2 = @hand[i]

        @hand.delete(delete_hand1)
        @hand.delete(delete_hand2)

        init_discard_hand_msg(delete_hand1, delete_hand2)
      else
        i += 1
      end
    end
  end

  def check_drawed_card(character, draw_position)
    #相手の手札から引いたカードが自身の手札と一致するか確認する
    matched_card = @hand.find { |n| n.num == character.hand[draw_position].num }

    if matched_card.nil?
      #引いたカードと手札のカードがマッチしなかったら、引いたカードを手札に加える。
      @hand << character.hand[draw_position]

      add_hand_msg(character, draw_position)
    else
      #引いたカードと手札のカードがマッチしたら、引いたカードと手札のカード捨てる。
      @hand.delete(matched_card)

      discard_hand_msg(matched_card, character, draw_position)
    end
  end

  def delete_hand(draw_position)
    @hand.delete_at(draw_position)
  end
end
