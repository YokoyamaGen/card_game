#encoding: utf-8

module MessageDialog

  RIVAL_NAME = "太郎"
  NOT_PERMITED_PATTERN = /^[^a-zA-Z0-9０-９]+$/
  MAX_BORDER_SIZE = 50
  BORDER_CHARCTER = "-"
  HEART_FIRST_CARD = "H-1"
  HEART_LAST_CARD = "H-13"
  DIAMOND_FIRST_CARD = "D-1"
  DIAMOND_LAST_CARD = "D-13"
  SPADE_FIRST_CARD = "S-1"
  SPADE_LAST_CARD = "S-13"
  CLUB_FIRST_CARD = "C-1"
  CLUB_LAST_CARD = "C-13"
  JOKER_CARD = "Joker"
  MASKING_CARD = "***"
  INDENTION_POSITION = 8
  OUTPUT_FORMAT = "%-6s"
  CARD_CHARA_FIRST = 2
  CARD_CHARA_LAST = 3

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

  def input_player_name_msg
    print "あなたのプレイヤー名を日本語で入力ください。> "
    while true
      player_name = gets.chomp
      return player_name if player_name != RIVAL_NAME && player_name =~ NOT_PERMITED_PATTERN
      print  "日本語もしくは、#{RIVAL_NAME}さんと別の名前で入力ください> "
    end
  end

  def game_start_msg(**params)
    player = params[:player]
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
end
