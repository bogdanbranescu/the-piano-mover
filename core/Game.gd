extends Node2D


var current_mode = Refs.GAME_MODE.NOMIC


var required_global = [
	[States, "."],
	[EventScheduler, "."],
]

var required_per_mode = {
	Refs.GAME_MODE.NOMIC: {
		"NomicSystem": [Global.system_paths.nomic_system_path, "."],
		"NomicUI": [Global.system_paths.nomic_ui_path, "CanvasLayer"],
	},
	Refs.GAME_MODE.ADVENTURE: {
		"AdventureSystem": [Global.system_paths.adventure_system_path, "."],
		"AdventureUI": [Global.system_paths.adventure_ui_path, "CanvasLayer"],
	},
	Refs.GAME_MODE.CITYBUILDER: {
		"CitybuilderSystem": [Global.system_paths.citybuilder_system_path, "."],
		"CitybuilderUI": [Global.system_paths.citybuilder_ui_path, "CanvasLayer"],
	},
}

var time := 0.0


func _ready() -> void:
	Global.Game = self

	# Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) # TODO Show when using mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	init_systems()


func init_systems() -> void:
	for system_instantiation in required_global:
		print("init " + system_instantiation[0].get_global_name())
		var new_system = system_instantiation[0].new()
		new_system.name = new_system.get_script().get_global_name()
		get_node(system_instantiation[1]).add_child(new_system)
		new_system.set_owner(self)

	var current_system = required_per_mode[current_mode]
	for system_instantiation in current_system.keys():
		if "UI" in system_instantiation and Global.DEBUG.HEADLESS_MODE:
			continue

		print("\tinit " + system_instantiation)
		var new_system = load(current_system[system_instantiation][0]).instantiate()
		get_node(current_system[system_instantiation][1]).add_child(new_system)
		new_system.set_owner(self)


func load_state(_save_data):
	# TODO
	pass


func save_state() -> Variant:
	# TODO
	return {}
