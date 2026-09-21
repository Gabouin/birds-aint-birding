extends Area2D

@export var win_screen: CanvasLayer

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		win_screen.show()
		get_tree().paused = true
