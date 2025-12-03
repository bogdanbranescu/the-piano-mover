extends Node
class_name TurnOrderSystem


signal updated(player_order)

var player_order = []
var order_index = -1


func _ready() -> void:
	pass
	

func compute(board_data: Array[Array]) -> void:
	player_order = []
	# Simple left-to-right
	for i in range(Global.BOARD_SIZE.x):
		for j in range(Global.BOARD_SIZE.y):
			if board_data[i][j] != 0:
				player_order.append({id = board_data[i][j] - 1, at = Vector2i(i, j)})
				break
	
	advance()

	call_deferred("emit_signal", "updated", player_order)
	print("TURN ORDER ", player_order.map(func(x): return x.id))


func get_current_player() -> Dictionary:
	return player_order[order_index]


func advance():
	order_index = wrapi(order_index + 1, 0, player_order.size())
