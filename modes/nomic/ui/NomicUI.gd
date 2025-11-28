extends Control


@onready var board = $Container/Board

@onready var info_bar = $Container/InfoBarContainer/InfoBar


func _ready() -> void:
	EventBusNomic.turn_started.connect(start_turn)
	EventBusNomic.turn_ended.connect(end_turn)
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
