extends Node


var DEBUG = {
	HEADLESS_MODE = false
}

const WIDTH = 640
const HEIGHT = 360

var SAVE_INDEX := -1

var game_mode := Refs.GAME_MODE

var BOARD_SIZE := Vector2i(6, 6)

# Singletons
var Game: Node
var State: Node
var Scheduler: Node
var NomicSystem: Node

var NomicUI: Node


var system_paths = {
	# CORE
	scheduler_path = "res://modes/core/Scheduler.gd",
	state_chart_path = "res://core/StateChart.tscn",
	# NOMIC
	nomic_system_path = "res://modes/nomic/NomicSystem.tscn",
	board_system_path = "res://modes/nomic/BoardSystem.gd",
	player_manager_path = "res://modes/nomic/PlayerManager.tscn",
	rule_manager_path = "res://modes/nomic/RuleManager.tscn",
	nomic_ui_path = "res://modes/nomic/ui/NomicUI.tscn",
	# ADVENTURE
	adventure_system_path = "res://modes/adventure/AdventureSystem.tscn",
	adventure_ui_path = "res://modes/nomic/ui/NomicUI.tscn",
	# CITYBUILDER
	citybuilder_system_path = "res://modes/citybuilder/CitybuilderSystem.tscn",
	citybuilder_ui_path = "res://modes/nomic/ui/NomicUI.tscn",
}

var data_paths = {
	players = "res://data/player/",
	rules = "res://data/rule/",
}

var player_data = {
	Refs.CHARACTERS.A: "A/data.tres",
	Refs.CHARACTERS.B: "B/data.tres",
	Refs.CHARACTERS.C: "C/data.tres",
	Refs.CHARACTERS.DEMON: "D/data.tres",
	Refs.CHARACTERS.E: "E/data.tres",
	Refs.CHARACTERS.F: "F/data.tres",
}
