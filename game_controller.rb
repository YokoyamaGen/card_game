#encoding: utf-8

require_relative "message_dialog.rb"

class GameController
  include MessageDialog

  def game_start(**params)
    player1 = params[:player1]
    player2 = params[:player2]

    shuffle_cards

    deal_cards(player1: player1, player2: player2)

    player_hand_info(player: player1)
    player_hand_info(player: player2)

    puts <<~TEXT
           一致するカードがある場合は手札から捨ててください

           
         TEXT

    player1.check_matched_cards
    player2.check_matched_cards

    player_hand_info(player: player1)
    player_hand_info(player: player2)

    while player1.hand.any? && player2.hand.any?
      player1.draw_card(player2)
      player1.check_matched_cards

      break if player1.hand.empty?

      player2.draw_card(player1)
      player2.check_matched_cards
    end

    if player1.hand.empty?
      puts "#{player1.name}さんの勝利"
    else
      puts "#{player2.name}さんの勝利"
    end
  end

  private

  def shuffle_cards
    @total_cards = ("H-1".."H-12").to_a
    @total_cards.concat(("J-1".."J-12").to_a)
    @total_cards.concat(("S-1".."S-12").to_a)
    @total_cards.concat(("Q-1".."Q-12").to_a)
    @total_cards.push("Joker")
    @total_cards.shuffle!
  end

  def deal_cards(**params)
    player1 = params[:player1]
    player2 = params[:player2]

    @total_cards.each.with_index(1) do |card, i|
      player1.hand << card if i % 2 == 1
      player2.hand << card if i % 2 == 0
    end
  end
end
