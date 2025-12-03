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
	update()

	EventBusNomic.turn_started.connect(update)


func setup_players(player_selection: Array) -> Array[Array]:
	for character_index in player_selection:
		set_entity(character_index + 1, Vector2i(character_index, 2))

	return board_data


func update():
	call_deferred("emit_signal", "updated", board_data)


func get_entity(col: int, row: int) -> int:
	return board_data[row][col]


func find_entity(value: int) -> Vector2:
	for i in range(Global.BOARD_SIZE.y):
		for j in range(Global.BOARD_SIZE.x):
			if board_data[i][j] == value:
				return Vector2(i, j)

	return Vector2(-1, -1)


func set_entity(etype: int, pos: Vector2i) -> void:
	print(etype, pos)
	board_data[pos.y][pos.x] = etype


func move_entity(col_from: int, row_from: int, col_to: int, row_to: int) -> bool:
	var from = get_entity(col_from, row_from)
	var to = get_entity(col_to, row_to)
	
	if from != 0 and to == 0:
		set_entity(0, Vector2(row_from, col_from))
		set_entity(from, Vector2(row_from, col_from))
		return true
	
	return false


func print_board() -> String:
	return str(board_data).replace(
		"], ", "\n").replace(
		"[", "").replace(
		",", "").replace(
		"]", "")


func _process(_delta) -> void:
	Global.NomicUI.get_node("Label").text = print_board()
