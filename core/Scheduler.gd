extends Node
class_name EventScheduler


var upcoming_events = []


func _ready() -> void:
	Global.Scheduler = self
