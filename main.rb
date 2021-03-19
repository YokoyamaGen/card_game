#encoding: utf-8

require_relative "game_controller.rb"

RIVAL_NAME = "太郎"

GameController.game_initial_msg

player_name = GameController.input_player_name_msg

player = Player.new(name: player_name)
rival = Rival.new(name: RIVAL_NAME)

game_controller = GameController.new(player, rival)
game_controller.game_start
game_controller.game_judgment