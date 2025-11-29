extends Control

@onready var mouse_in: bool = false
@onready var is_dragging: bool = false
var move_direction = -1

@export var HP: int = 8
@export var ATK: int = 2
@export var PRICE: int = 2
@export var NAME: String = "base card"
@export var DESCRIPTION: String = "XD XD XD XD"


func _physics_process(delta: float) -> void:
	drag_logic(delta)
	
	if Input.is_action_just_pressed("click"):
		if move_direction < 0:
			$DeleteButton.visible = true
		else:
			$DeleteButton.visible = false
		move_direction *= -1
		$DeleteButton.position += Vector2(130, 0) * move_direction

func drag_logic(delta):
	if (mouse_in or is_dragging) and (Gamerule.card_dragging == null or Gamerule.card_dragging == self):

		if Input.is_action_pressed("click"):
			global_position = lerp(global_position, get_global_mouse_position() - (size/2.0), 40.0 * delta)
			is_dragging = true
		else:
			is_dragging = false
			if Gamerule.card_dragging == self:
				Gamerule.card_dragging == null


func _on_mouse_entered() -> void:

	mouse_in = true

func _on_mouse_exited() -> void:
	mouse_in = false
