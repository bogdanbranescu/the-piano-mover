extends Node
class_name TurnOrderSystem


signal updated

var order_queue = []
var current_player


func _ready() -> void:
	Global.NomicSystem = self
	

func compute(board_data: Array[Array]) -> void:
	order_queue = []
	# Simple left-to-right
	for i in range(Global.BOARD_SIZE.x):
		for j in range(Global.BOARD_SIZE.y):
			if board_data[i][j] != 0:
				order_queue.append([i, j, board_data[i][j]])
				break
	
	print("TURN ORDER", order_queue)
