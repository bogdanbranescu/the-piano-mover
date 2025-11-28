extends Node2D


@onready var logical_tiles = $LogicalTiles
@onready var overlay = $Overlay
@onready var background = $Background


func _ready() -> void:
	# TODO integrate animation, waiting, etc (only when running with UI)
	Global.NomicSystem.Board.updated.connect(load_board_data)
	#logical_tiles.modulate.a = 0.0

	var board_size = Vector2i(Global.BOARD_SIZE.x, Global.BOARD_SIZE.y)
	logical_tiles.position = - logical_tiles.tile_set.tile_size * board_size * 0.5


# func get_map_data() -> Array:
# 	var all_tile_data = logical_tiles.tile_map_data
# 	var parsed_data = [all_tile_data.slice(0, 2)]
# 	all_tile_data = all_tile_data.slice(2, all_tile_data.size())
# 	for i in range(int(all_tile_data.size() / 12.0)):
# 		parsed_data.append(all_tile_data.slice(12 * i, 12 * (i + 1)))
# 	return parsed_data


func load_board_data(board_data: Array[Array]) -> void:
	var expanded_board_data = [0, 0]
	for i in range(Global.BOARD_SIZE.y):
		for j in range(Global.BOARD_SIZE.x):
			if board_data[i][j] == 0:
				continue
			expanded_board_data.append_array(
				[i, 0, j, 0, 0, 0, 0, 0, 0, 0, board_data[i][j], 0]
			)

	logical_tiles.tile_map_data = expanded_board_data


func set_entity(at: Vector2i, to_be: Vector2i = Vector2(-1, -1)) -> void:
	logical_tiles.set_cell(at, -1, to_be)


func reveal_grid() -> void:
	pass
