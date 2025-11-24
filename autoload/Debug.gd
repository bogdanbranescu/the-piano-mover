extends Node


signal input_up
signal input_left
signal input_down
signal input_right

signal input_u
signal input_i
signal input_o
signal input_p


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("force_quit"):
        get_tree().quit()

    if event.is_action_pressed("ui_up"):
        input_up.emit()
    if event.is_action_pressed("ui_left"):
        input_left.emit()
    if event.is_action_pressed("ui_down"):
        input_down.emit()
    if event.is_action_pressed("ui_right"):
        input_right.emit()

    if event.is_action_pressed("debug_update_u"):
        input_u.emit()
    if event.is_action_pressed("debug_update_i"):
        input_i.emit()
    if event.is_action_pressed("debug_update_o"):
        input_o.emit()
    if event.is_action_pressed("debug_update_p"):
        input_p.emit()