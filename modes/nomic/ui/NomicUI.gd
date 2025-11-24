extends Control


@onready var board = $Container/Board


func _ready() -> void:
	EventBusNomic.turn_started.connect(start_turn)
	EventBusNomic.turn_ended.connect(end_turn)
	init()


func init() -> void:
	pass


func start_night() -> void:
	pass


func start_turn() -> void:
	pass


func end_turn() -> void:
	pass


func end_night() -> void:
	pass
