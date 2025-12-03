extends HBoxContainer


@onready var action_move := $Move as Button
@onready var action_propose := $Propose as Button
@onready var action_skip := $Skip as Button


func _ready() -> void:
	action_move.pressed.connect(do_move)
	action_propose.pressed.connect(do_propose)
	action_skip.pressed.connect(do_skip)


func do_move() -> void:
	Global.State.send_chart_event("move")
	action_move.release_focus()


func do_propose() -> void:
	Global.State.send_chart_event("propose")
	action_propose.release_focus()


func do_skip() -> void:
	Global.NomicSystem.end_turn()
