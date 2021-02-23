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

print "あなたのプレイヤー名を日本語で入力ください。> "
while true
  player_name = gets.chomp
  break if player_name =~ /^[^a-zA-Z0-9]+$/
  print  "日本語で入力ください> "
end

puts <<~TEXT

       #{player_name}さんですね！よろしくお願いします。
       それでは、ゲームを始めます。
       カードを配ります。

     TEXT

player1 = Player.new(name: "#{player_name}")
player2 = Player.new(name: "太郎")

game_controller = GameController.new
game_controller.game_start(player1: player1, player2: player2)
