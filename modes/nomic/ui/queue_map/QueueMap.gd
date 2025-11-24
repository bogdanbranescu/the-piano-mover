extends TileMapLayer


@onready var overlay = $Overlay
@onready var background = $Background


func _ready() -> void:
	# TODO integrate animation, waiting, etc (only when running with UI)
	Global.NomicSystem.Board.updated.connect(load_board_data)
	

func get_map_data() -> Array:
	var all_tile_data = tile_map_data
	var parsed_data = [all_tile_data.slice(0, 2)]
	all_tile_data = all_tile_data.slice(2, all_tile_data.size())
	for i in range(int(all_tile_data.size() / 12.0)):
		parsed_data.append(all_tile_data.slice(12 * i, 12 * (i + 1)))
	return parsed_data


func load_board_data(board_data: Array[Array]) -> void:
	var expanded_board_data = [0, 0]
	for i in range(Global.BOARD_SIZE.y):
		for j in range(Global.BOARD_SIZE.x):
			if board_data[i][j] == 0:
				continue
			expanded_board_data.append_array(
				[i, 0, j, 0, 0, 0, 0, 0, 0, 0, board_data[i][j], 0]
			)

	tile_map_data = expanded_board_data

	queue_redraw()


func get_entity(at: Vector2i) -> Variant:
	return get_cell_tile_data(at)


func set_entity(at: Vector2i, to_be: Vector2i = Vector2(-1, -1)) -> void:
	set_cell(at, -1, to_be)


func move_entity(from: Vector2i, to: Vector2i) -> bool:
	if get_entity(to) == null:
		set_entity(from)
		return true
	return false


func _draw():
	var order_queue = Global.NomicSystem.Board.turn_order.order_queue
	for i in range(order_queue.size() - 1):
		draw_line(
			30 * Vector2(order_queue[i][0], order_queue[i][1]) + 15 * Vector2.ONE,
			30 * Vector2(order_queue[i + 1][0], order_queue[i + 1][1]) + 15 * Vector2.ONE,
			Color.WHITE
		)


# TODO later
func reveal_grid() -> void:
	pass
