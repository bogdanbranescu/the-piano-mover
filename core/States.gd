extends Node
class_name States


var chart: StateChart

var actions
var move


func _ready() -> void:
	Global.State = self # Careful: singular
	
	var chart_scene = load(Global.system_paths.state_chart_path)
	chart = chart_scene.instantiate()
	add_child(chart)

	actions = chart.find_child("Actions")
	move = chart.find_child("Move")


func send_chart_event(event_name: String):
	chart.send_event.call_deferred(event_name)
