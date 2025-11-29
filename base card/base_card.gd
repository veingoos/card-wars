extends Node2D

func _ready():
	$CardControl/DeleteButton.visible = false

func _on_delete_button_pressed() -> void:
	$".".queue_free()
