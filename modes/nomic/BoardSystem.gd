extends Node
class_name BoardSystem


signal updated(board_data)

var turn_order

var board_data: Array[Array]


func _ready() -> void:
	board_data.resize(Global.BOARD_SIZE.y)
	for i in range(board_data.size()):
		board_data[i].resize(Global.BOARD_SIZE.x)
		board_data[i].fill(0)

	turn_order = TurnOrderSystem.new()

	# TESTING
	set_entity(0, 1, 0)
	set_entity(1, 1, 1)
	set_entity(2, 1, 2)
	set_entity(3, 1, 3)
	set_entity(4, 1, 4)
	set_entity(5, 1, 5)

	Debug.input_u.connect(updated.emit.bind(board_data))
	Debug.input_i.connect(turn_order.compute.bind(board_data))


func setup_players(player_selection: Array):
	for character_index in player_selection:
		set_entity(1, 1, character_index)


func get_entity(row: int, col: int) -> int:
	return board_data[row][col]


func set_entity(row: int, col: int, etype: int) -> void:
	board_data[row][col] = etype


func move_entity(row_from: int, col_from: int, row_to: int, col_to: int) -> bool:
	var from = get_entity(row_from, col_from)
	var to = get_entity(row_to, col_to)
	
	if from != 0 and to == 0:
		set_entity(row_from, col_from, 0)
		set_entity(row_to, col_to, from)
		return true
	
	return false
