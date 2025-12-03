extends Node2D


@onready var player_piece_scene = load("res://modes/nomic/ui/grid_map/entities/PlayerPiece.tscn")


func _ready() -> void:
	pass


func sync_to_logical_tiles(used_cells: Array[Vector2i], board_data: Array[Array]) -> void:
	for n in get_children():
		remove_child(n)
		n.queue_free()

	print(used_cells)
	print(board_data)

	for cell in used_cells:
		var new_piece = player_piece_scene.instantiate() as PlayerPiece
		new_piece.player_id = board_data[cell.y][cell.x]
		new_piece.position = 30 * cell # TODO Remove magic number!
		
		add_child(new_piece)
