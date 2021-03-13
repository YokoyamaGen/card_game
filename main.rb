#encoding: utf-8

require_relative "player.rb"
require_relative "rival.rb"
require_relative "game_controller.rb"
require_relative "message_dialog.rb"

include MessageDialog

game_initial_msg

player_name = input_player_name_msg

player = Player.new(name: "#{player_name}")
rival = Rival.new(name: RIVAL_NAME) 

game_controller = GameController.new(main_character: player, sub_character: rival)
game_controller.game_start