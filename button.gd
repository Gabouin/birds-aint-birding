extends Button

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
