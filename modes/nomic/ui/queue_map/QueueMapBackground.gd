extends TileMapLayer


func _ready() -> void:
	for i in range(Global.BOARD_SIZE.y):
		for j in range(Global.BOARD_SIZE.x):
			if (i + j) % 2 == 0:
				set_cell(Vector2i(i, j), 1, Vector2i(0, 0))
			else:
				set_cell(Vector2i(i, j), 1, Vector2i(1, 0))