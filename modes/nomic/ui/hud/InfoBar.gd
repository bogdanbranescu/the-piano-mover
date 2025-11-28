extends HBoxContainer


@onready var night := $Night
@onready var turn := $Turn


func update() -> void:
	night.get_node("Value").text = str(Global.NomicSystem.night_idx + 1)
	turn.get_node("Value").text = str(Global.NomicSystem.turn_idx + 1) + "/" + str(Global.NomicSystem.TURN_LIMIT)
