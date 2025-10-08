extends Node2D


@onready var required = {
	"GameSystem": [load(Global.system_paths.game_system_path), "."],
	# also UI?
}

var time := 0.0


func _ready() -> void:
	Global.World = self

	init_systems()


func init_systems() -> void:
	for system_instantiation in required.keys():
		print("\tinit " + system_instantiation)
		var new_system = required[system_instantiation][0].instantiate()
		get_node(required[system_instantiation][1]).add_child(new_system)
		new_system.set_owner(self)


func load_state(_save_data):
	# TODO
	pass


func save_state() -> Variant:
	# TODO
	return {}
