extends Node2D


@onready var logical_tiles = $LogicalTiles
@onready var overlay = $Overlay
@onready var background = $Background

@onready var entities = $Entities


func _ready() -> void:
	# TODO integrate animation, waiting, etc (only when running with UI)
	Global.NomicSystem.Board.updated.connect(load_board_data)

	Global.State.move.state_entered.connect(enable_input.bind(true))
	Global.State.move.state_exited.connect(enable_input.bind(false))

	enable_input(false)

	var board_size = Vector2i(Global.BOARD_SIZE.x, Global.BOARD_SIZE.y)
	position = - logical_tiles.tile_set.tile_size * board_size * 0.5


func get_map_data() -> Array:
	var all_tile_data = logical_tiles.tile_map_data
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
				[i, 0, # TileMapLayer x
				 j, 0, # TileMapLayer y
				 0, 0, # source id
				 board_data[i][j], 0, # atlas x
				 0, 0, # atlas y
				 0, 0]
			)

	logical_tiles.tile_map_data = expanded_board_data
	entities.sync_to_logical_tiles(logical_tiles.get_used_cells(), board_data)

	set_indicator_on_current_player()


func set_entity(at: Vector2i, to_be: Vector2i = Vector2(-1, -1)) -> void:
	logical_tiles.set_cell(at, -1, to_be)


func set_indicator_on_current_player():
	var player_board_data = Global.NomicSystem.Board.turn_order.get_current_player()
	var board_position = player_board_data.at
	overlay.position = logical_tiles.tile_set.tile_size * board_position


func reveal_grid() -> void:
	pass


func enable_input(enable: bool) -> void:
	set_process_input(enable)


func _input(event: InputEvent) -> void:
	var direction = Vector2i.ZERO
	if event.is_action_pressed("ui_up"):
		direction = Vector2i(0, 1)
	
	if direction != Vector2i.ZERO:
		var player = Global.NomicSystem.Board.turn_order.get_current_player()
		
		print(Global.NomicSystem.Board.board_data[player.at.y][player.at.x])
		print(Global.NomicSystem.Board.board_data[(player.at + direction).y][(player.at + direction).x])

		var maybe_move = Global.NomicSystem.Board.move_entity(2, 2, 4, 4)
		# 	player.at.y, player.at.x,
		# 	(player.at + direction).y, (player.at + direction).x
		# )
		print("MOVE ", maybe_move)
		load_board_data(Global.NomicSystem.Board.board_data)
