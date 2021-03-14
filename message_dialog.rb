#encoding: utf-8

module MessageDialog

  RIVAL_NAME = "太郎"

  def game_initial_msg
    puts <<~TEXT

        ------------------------------------------
        |                                        |
        |               BABANUKI                 |
        |                                        |
        ------------------------------------------

        対戦相手は#{RIVAL_NAME}さんです。
        TEXT
  end

  def game_start_msg(character)
    puts <<~TEXT

        #{character.name}さんですね！よろしくお願いします。
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
end
