#encoding: utf-8

#require_relative "player.rb"
require_relative "main_character.rb"
require_relative "rival.rb"
require_relative "game_controller.rb"
require_relative "message_dialog.rb"

include MessageDialog

game_initial_msg

player_name = input_player_name_msg

# player1 = Player.new(name: "#{player_name}")
player1 = MainCharacter.new(name: "#{player_name}")
#player2 = Player.new(name: RIVAL_NAME) 
player2 = Rival.new(name: RIVAL_NAME) 

game_controller = GameController.new
game_controller.game_start(player1: player1, player2: player2)
