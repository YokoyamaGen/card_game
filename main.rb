#encoding: utf-8

class Player
  attr_reader :name
  attr_accessor :hand

  def initialize(**params)
    @name = params[:name]
    @hand = []
  end

  def check_matched_cards
    i = 0

    while i < @hand.length - 1
      j = i + 1

      #手札の中で番号が一致するトランプの要素番号を取得する
      while j < @hand.size
        break if @hand[j].slice(2..4) == @hand[i].slice(2..4)
        j += 1
      end

      #手札の中で一致するカードがあった場合は、手札の中から捨てる
      if j < @hand.size
        @hand.delete(@hand[j])
        @hand.delete(@hand[i])
      else
        i += 1
      end
    end
  end
end

class GameController
  def game_start(**params)
    player1 = params[:player1]
    player2 = params[:player2]

    shuffle_cards

    deal_cards(player1: player1, player2: player2)

    puts "#{player1.hand} player1"s
    player1.check_matched_cards
    puts "#{player1.hand} player1"
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

player1 = Player.new(name: "太郎")
player2 = Player.new(name: "花子")

game_controller = GameController.new
game_controller.game_start(player1: player1, player2: player2)
