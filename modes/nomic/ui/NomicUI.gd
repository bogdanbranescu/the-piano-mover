extends Control


@onready var info_bar = $Container/InfoBarContainer/InfoBar
@onready var initiative = $Container/InitiativeDisplay
@onready var board = $Container/Board/GridMap
@onready var actions = $Container/ActionContainer/Actions


func _ready() -> void:
	Global.NomicUI = self
	EventBusNomic.turn_started.connect(start_turn)
	EventBusNomic.turn_ended.connect(end_turn)

	Global.State.actions.state_entered.connect(pass_focus_to.bind(actions))
	#Global.State.actions.state_exited.connect(pass_focus_to.bind(self))

	init()


func init() -> void:
	pass


func start_night() -> void:
	info_bar.update()


func start_turn() -> void:
	info_bar.update()


func end_turn() -> void:
	pass


func end_night() -> void:
	pass


func pass_focus_to(ui_element: Node) -> void:
	ui_element.grab_focus()
