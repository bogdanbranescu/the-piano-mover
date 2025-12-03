extends Node2D
class_name PlayerPiece


@onready var sprite = $Sprite

var texture: PortableCompressedTexture2D


var player_id: int:
	set(value):
		player_id = value
		set_board_piece()
		

func set_board_piece() -> void:
	texture = Global.NomicSystem.PlayerManager.get_player(player_id).data.board_piece
	$Sprite.texture = texture
