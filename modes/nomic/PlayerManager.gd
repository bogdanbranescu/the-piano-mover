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

var controllable_player_count := 1
var controllable_players: Array


func _ready() -> void:
	pass


func init_players() -> Array:
	# TODO Load player_selection from some meta-progression state tracker
	var all_players = player_selection.duplicate()
	assign_controllable_players(all_players)

	print(controllable_players)

	for p in player_selection:
		var data = load(Global.data_paths.players + Global.player_data[p])
		var new_player = Player.new()
		new_player.data = data
		players.add_child(new_player)
	
	return player_selection as Array


func get_player(player_id: int):
	return players.get_children(player_id).filter(
		func(x): return x.data.id == player_id
	)[0]


func assign_controllable_players(available_players) -> void:
	controllable_players = []
	for i in range(controllable_player_count):
		var pick = randi_range(0, available_players.size() - 1)
		controllable_players.append(available_players[pick])
		available_players.remove_at(pick)
