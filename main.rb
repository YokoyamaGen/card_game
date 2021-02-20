#encoding: utf-8

require_relative "player.rb"
require_relative "game_controller.rb"

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
