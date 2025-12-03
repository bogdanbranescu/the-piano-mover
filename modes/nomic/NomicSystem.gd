extends Node


@onready var Board: Node
@onready var PlayerManager: Node

@onready var required = {
	"BoardSystem": [BoardSystem, "."],
	"PlayerManager": [Global.system_paths.player_manager_path, "."],
	"RuleManager": [Global.system_paths.rule_manager_path, "."],
}

var TURN_LIMIT := 20

var night_idx := 0
var turn_idx := 0


func _ready() -> void:
	Global.NomicSystem = self

	Debug.input_u.connect(end_turn) # TODO remove when not testing

	init_systems()

	start_night()


func init_systems() -> void:
	for system_instantiation in required.keys():
		print("\tinit " + system_instantiation)
		var new_system
		if required[system_instantiation][0] is Object:
			new_system = required[system_instantiation][0].new()
			new_system.name = new_system.get_script().get_global_name()
		else:
			new_system = load(required[system_instantiation][0]).instantiate()
		get_node(required[system_instantiation][1]).add_child(new_system)
		new_system.set_owner(self)
	
	Board = get_node("BoardSystem") # TODO CLEAN THIS UP???
	PlayerManager = get_node("PlayerManager")


func start_night() -> void:
	print("NIGHT ", night_idx)
	
	var player_selection = PlayerManager.init_players()
	Board.setup_players(player_selection)

	turn_idx = 0
	start_turn()

	EventBusNomic.night_started.emit()
	

func start_turn() -> void:
	print("\tTURN  ", turn_idx)
	Board.turn_order.compute(Board.board_data)

	EventBusNomic.turn_started.emit()


func end_turn() -> void:
	turn_idx += 1
	if turn_idx >= TURN_LIMIT:
		end_night()
		return
	start_turn()

	EventBusNomic.turn_ended.emit()


func end_night() -> void:
	night_idx += 1
	start_night()

	EventBusNomic.night_ended.emit()
