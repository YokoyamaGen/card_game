#encoding: utf-8

require_relative "message_dialog.rb"

class GameController
  include MessageDialog

  def game_start(**params)
    # player1、player2クラスそれぞれのインスタンスをインスタンス変数に代入
    build_players(params)

    game_start_msg(player: @player1)

    shuffle_cards

    #各プレイヤーにカードを配る
    deal_cards

    #配られたカードの情報を出力する
    player_hand_info(player: @player1)
    player_hand_info(player: @player2)

    #ユーザにエンターキーを押すように促すためのメッセージ
    type_msg
    input = $stdin.gets.chomp

    #手札のカードの中で一致する番号がないか確認後。一致するカードがあれば、手札から捨てる
    @player1.check_matched_cards
    @player2.check_matched_cards

    #手札のカードを出力する
    player_hand_info(player: @player1)
    player_hand_info(player: @player2)

    #player1とplayer2で交互にカードを引く。引いたカードが手札のカードと一致した場合、カードを捨てる
    each_player_draw_card

    border_msg

    #ゲームの勝利者を判定する
    game_judgment

    border_msg
  end

  private

  def build_players(**params)
    @player1 = params[:player1]
    @player2 = params[:player2]
  end

  def shuffle_cards
    @total_cards = (HEART_FIRST_CARD..HEART_LAST_CARD).to_a
    @total_cards.concat((DIAMOND_FIRST_CARD..DIAMOND_LAST_CARD).to_a)
    @total_cards.concat((SPADE_FIRST_CARD..SPADE_LAST_CARD).to_a)
    @total_cards.concat((CLUB_FIRST_CARD..CLUB_LAST_CARD).to_a)
    @total_cards.push(JOKER_CARD)
    @total_cards.shuffle!
  end

  def deal_cards
    @total_cards.each.with_index(1) do |card, i|
      @player1.hand << card if i % 2 == 1
      @player2.hand << card if i % 2 == 0
    end
  end

  def player_hand_info(**params)
    player = params[:player]

    puts "#{player.name}さんの手札".center(MAX_BORDER_SIZE - player.name.size, BORDER_CHARCTER)
    puts ""

    player.hand.each.with_index(1) do |card, i|
      if player.name == RIVAL_NAME 
        printf(OUTPUT_FORMAT, MASKING_CARD)
      else
        printf(OUTPUT_FORMAT, "#{card}")
      end
      puts "" if i % INDENTION_POSITION == 0
    end

    puts ""
    border_msg
  end

  def game_judgment
    if @player1.hand.empty?
      puts "#{@player1.name}さんの勝利"
    else
      puts "#{@player2.name}さんの勝利"
    end
  end

  def each_player_draw_card
    while @player1.hand.any? && @player2.hand.any?
      @player1.draw_card(@player2)
      #手札に一致するカードがないかを確認する。一致するカードがあれば手札から捨てる。
      @player1.check_matched_cards

      break if @player1.hand.empty?
      player_hand_info(player: @player1)

      @player2.draw_card(@player1)
      @player2.check_matched_cards
      break if @player2.hand.empty?
      player_hand_info(player: @player2)
    end
  end
end
