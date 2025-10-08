extends Node


const WIDTH = 640
const HEIGHT = 360

# Singletons
var World: Node
var GameSystem: Node

var system_paths = {
	game_system_path = "res://game_system/GameSystem.tscn",
    player_manager_path = "res://game_system/PlayerManager.tscn",
    rule_manager_path = "res://game_system/RuleManager.tscn",
}
