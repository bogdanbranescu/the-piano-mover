extends Node


@onready var required = {
	"PlayerManager": [load(Global.system_paths.player_manager_path), "."],
	"RuleManager": [load(Global.system_paths.rule_manager_path), "."],
}


func _ready() -> void:
	Global.GameSystem = self

	init_systems()


func init_systems() -> void:
	for system_instantiation in required.keys():
		print("\tinit " + system_instantiation)
		var new_system = required[system_instantiation][0].instantiate()
		get_node(required[system_instantiation][1]).add_child(new_system)
		new_system.set_owner(self)
