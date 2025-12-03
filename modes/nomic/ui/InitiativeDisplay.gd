extends Control


@onready var initiatives = $Initiatives


func _ready() -> void:
	Global.NomicSystem.Board.turn_order.updated.connect(update_queue_display)


func update_queue_display(player_order) -> void:
	for n in initiatives.get_children():
		initiatives.remove_child(n)
		n.queue_free()

	for player in player_order:
		var player_icon = TextureRect.new()
		player_icon.texture = Global.NomicSystem.PlayerManager.get_player(player.id).data.initiative_symbol
		initiatives.add_child(player_icon)

		var connector_icon = TextureRect.new()
		connector_icon.texture = load("res://modes/nomic/ui/hud/initiative-connector.ase")
		initiatives.add_child(connector_icon)
