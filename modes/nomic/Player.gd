extends Node
class_name Player


var data: PlayerData:
    set(value):
        data = value
        name = value.player_name
