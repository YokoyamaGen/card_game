#encoding: utf-8

require_relative "player.rb"
require_relative "rival.rb"
require_relative "game_controller.rb"
require_relative "message_dialog.rb"
require_relative "card.rb"

class GameController
  include MessageDialog

  MAX_BORDER_SIZE = 50
  BORDER_CHARCTER = "-"

  def initialize
    game_initial_msg

    player_name = input_player_name_msg
    
    shuffle_cards

    player_hand = @total_cards.select.with_index(1){|card, index| index % 2 == 1} 
    rival_hand = @total_cards.select.with_index(1){|card, index| index % 2 == 0} 

    @player = Player.new(name: "#{player_name}", hand: player_hand)
    @rival = Rival.new(name: RIVAL_NAME, hand: rival_hand) 

    game_start_msg(character: @player)

    #配られたカードの情報を出力する
    player_hand_info(character: @player)
    player_hand_info(character: @rival)

    #ユーザにエンターキーを押すように促すためのメッセージ
    type_msg
    $stdin.gets.chomp

    #手札のカードの中で一致する番号がないか確認後。一致するカードがあれば、手札から捨てる
    @player.check_matched_cards
    @rival.check_matched_cards

    #手札のカードを出力する
    player_hand_info(character: @player)
    player_hand_info(character: @rival)
  end

  def game_start
    #playerとrivalで交互にカードを引く。引いたカードが手札のカードと一致した場合、カードを捨てる
    while @player.hand.any? && @rival.hand.any?
      @player.draw_card(character: @rival)
      #手札に一致するカードがないかを確認する。一致するカードがあれば手札から捨てる。
      @player.check_matched_cards

      break if @player.hand.empty?
      player_hand_info(character: @player)

      @rival.draw_card(@player)
      @rival.check_matched_cards
      break if @rival.hand.empty?
      player_hand_info(character: @rival)
    end

    border_msg

    #ゲームの勝利者を判定する
    game_judgment

    border_msg
  end

  private

  def shuffle_cards
    @total_cards = []
    
    for suit in ["♡","♢","♤","♧"]
      (1..13).each{|num|
        card = Card.new(suit: suit, num: num)
        @total_cards.push(card)
      }
    end

    @total_cards.push(Card.new(suit: "", num: "Joker"))
    @total_cards.shuffle!
  end

  def player_hand_info(character:)

    puts "#{character.name}さんの手札".center(MAX_BORDER_SIZE - character.name.size, BORDER_CHARCTER)
    puts ""

    character.output_hand_info

    puts ""
    border_msg
  end

  def game_judgment
    if @player.hand.empty?
      puts "#{@player.name}さんの勝利"
    else
      puts "#{@rival.name}さんの勝利"
    end
  end
end
