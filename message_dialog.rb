#encoding: utf-8

module MessageDialog

  def game_initial
    puts <<~TEXT

        ------------------------------------------
        |                                        |
        |               BABANUKI                 |
        |                                        |
        ------------------------------------------

        対戦相手は#{RIVAL_NAME}さんです。
        TEXT
  end

  def game_start_msg(player)
    puts <<~TEXT

        #{player.name}さんですね！よろしくお願いします。
        それでは、ゲームを始めます。
        カードを配ります。

        TEXT
  end

  def type_msg
    puts <<~TEXT
            キーボードでエンターキーを押してください。
            一致するカードがある場合は手札から捨てます。
            
        TEXT
  end

  def border_msg
    puts <<~TEXT

           -------------------------------------------------------

    TEXT
  end

  def input_draw_card_position_msg
    print "相手の手札の左から何番目のカードを引きますか？半角数字で入力してください> "
  end

  def not_exist_card_msg
    print "存在しないカードです。もう一度選び直してください> "
  end

  def draw_card_msg(rival, draw_position)
    puts <<~TEXT

    「#{rival.hand[draw_position].card_info}」のカードを引きました。

    TEXT
  end

  def init_discard_hand_msg(delete_hand1, delete_hand2)
    puts <<~TEXT
      #{name}さんは以下の2枚の数字が一致したので、手札から捨てた
      #{delete_hand1.card_info}と#{delete_hand2.card_info}

    TEXT
  end

  def add_hand_msg(character, draw_position)
     puts <<~TEXT
       #{name}さんは手札に一致するカードがなかったので、#{character.hand[draw_position].card_info}を手札に加えた
       
     TEXT
  end

  def discard_hand_msg(matched_card, character, draw_position)
     puts <<~TEXT
       #{name}さんは以下の2枚の数字が一致したので、手札から捨てた
       #{matched_card.card_info}と#{character.hand[draw_position].card_info}

     TEXT
  end
end
