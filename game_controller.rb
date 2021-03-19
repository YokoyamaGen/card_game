#encoding: utf-8

require_relative "player.rb"
require_relative "rival.rb"
require_relative "game_controller.rb"
require_relative "message_dialog.rb"
require_relative "card.rb"

class GameController
  include MessageDialog
  extend MessageDialog

  NOT_PERMITED_PATTERN = /^[^a-zA-Z0-9０-９]+$/
  MAX_BORDER_SIZE = 50
  BORDER_CHARCTER = "-"

  class << self
    def game_initial_msg
      game_initial
    end

    def input_player_name_msg
      print "あなたのプレイヤー名を日本語で入力ください。> "
      while true
        player_name = gets.chomp
        return player_name if player_name != RIVAL_NAME && player_name =~ NOT_PERMITED_PATTERN
        print  "日本語もしくは、#{RIVAL_NAME}さんと別の名前で入力ください> "
      end
    end
  end

  def initialize(player, rival)
    @player = player
    @rival = rival

    game_start_msg(@player)

    total_cards = shuffle_cards

    player_hand = total_cards.select.with_index(1){|card, index| index % 2 == 1} 
    rival_hand = total_cards.select.with_index(1){|card, index| index % 2 == 0} 
    
    @player.receive_cards(player_hand)
    @rival.receive_cards(rival_hand)

    #配られたカードの情報を出力する
    player_hand_info(@player)
    player_hand_info(@rival)

    #ユーザにエンターキーを押すように促すためのメッセージ
    type_msg
    $stdin.gets.chomp

    #手札のカードの中で一致する番号がないか確認後。一致するカードがあれば、手札から捨てる
    @player.check_matched_cards
    @rival.check_matched_cards

    #手札のカードを出力する
    player_hand_info(@player)
    player_hand_info(@rival)
  end

  def game_start
    #playerとrivalで交互にカードを引く。引いたカードが手札のカードと一致した場合、カードを捨てる
    while @player.hand.any? && @rival.hand.any?
      @player.draw_card(@rival)

      break if @player.hand.empty?
      player_hand_info(@player)

      @rival.draw_card(@player)
      break if @rival.hand.empty?
      player_hand_info(@rival)
    end
  end

  #ゲームの勝利者を判定する
  def game_judgment   
    border_msg

    if @player.hand.empty?
      puts "#{@player.name}さんの勝利"
    else
      puts "#{@rival.name}さんの勝利"
    end

    border_msg
  end

  private

  def shuffle_cards
    total_cards = []
    
    for card_mark in ["♡","♢","♤","♧"]
      (1..13).each do |card_num|
        card = Card.new(mark: card_mark, num: card_num)
        total_cards.push(card)
      end
    end

    total_cards.push(Card.new(mark: "", num: "Joker"))
    total_cards.shuffle!
  end

  def player_hand_info(character)
    puts "#{character.name}さんの手札".center(MAX_BORDER_SIZE - character.name.size, BORDER_CHARCTER)
    puts ""

    character.display_hand_info

    puts ""
    border_msg
  end
end
