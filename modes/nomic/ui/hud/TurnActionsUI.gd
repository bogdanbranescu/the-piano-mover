extends HBoxContainer


@onready var action_move := $Move as Button
@onready var action_propose := $Propose as Button
@onready var action_skip := $Skip as Button


func _ready() -> void:
	action_skip.pressed.connect(do_skip)


func do_skip() -> void:
	Global.NomicSystem.end_turn()
