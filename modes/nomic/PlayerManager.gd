extends Node


@onready var players = $Players


var player_selection = [
	Refs.CHARACTERS.A,
	Refs.CHARACTERS.B,
	Refs.CHARACTERS.C,
	Refs.CHARACTERS.DEMON,
	Refs.CHARACTERS.E,
	Refs.CHARACTERS.F,
]

var order: Array
var queue: Array

var active_player_count := 1
var active_players: Array


func _ready() -> void:
	init_players()
	var all_players = player_selection.duplicate()
	assign_active_players(all_players)
	init_queue()

	print(active_players)
	print(queue)


func init_players() -> void:
	for p in player_selection:
		var data = load(Global.data_paths.players + Global.player_data[p])
		var new_player = Player.new()
		new_player.data = data
		players.add_child(new_player)


func assign_active_players(available_players) -> void:
	for i in range(active_player_count):
		var pick = randi_range(0, available_players.size() - 1)
		active_players.append(available_players[pick])
		available_players.remove_at(pick)


func init_queue() -> void:
	order = player_selection.duplicate()
	order.shuffle()
	queue = order.duplicate()
	queue += queue


func update_queue() -> void:
	pass
