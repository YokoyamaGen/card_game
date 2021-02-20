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

  def draw_card(player)
    @hand << player.hand[0]
    player.hand.delete_at(0)
  end
end

class GameController
  def game_start(**params)
    player1 = params[:player1]
    player2 = params[:player2]

    shuffle_cards

    deal_cards(player1: player1, player2: player2)

    puts "----------------- #{player1.name}さんの手札----------------"
    puts ""

    player1.hand.each.with_index(1) do |card, i|
      printf("%-6s", "#{card}")
      puts "" if i % 8 == 0
    end

    puts <<~TEXT

           
           -----------------------------------------------

         TEXT

    player1.check_matched_cards
    player2.check_matched_cards

    puts <<~TEXT
           #{player1.name}の手札の状況 #{player1.hand}

           #{player2.name}の手札の状況 #{player2.hand}
         TEXT

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

puts <<~TEXT

       ------------------------------------------
       |                                        |
       |               BABANUKI                 |
       |                                        |
       ------------------------------------------

       対戦相手は太郎さんです。
     TEXT

print "あなたのプレイヤー名をご自由に入力ください。 > "
player_name = gets.chomp
puts <<~TEXT

       #{player_name}さんですね！よろしくお願いします。
       それでは、ゲームを始めます。
       カードを配ります。

     TEXT

player1 = Player.new(name: "#{player_name}")
player2 = Player.new(name: "太郎")

game_controller = GameController.new
game_controller.game_start(player1: player1, player2: player2)
