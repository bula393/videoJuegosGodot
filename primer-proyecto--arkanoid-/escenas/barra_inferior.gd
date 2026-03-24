extends CharacterBody2D


func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("ui_left"):
		global_position += Vector2.LEFT * 5
	if Input.is_action_pressed("ui_right"):
		global_position += Vector2.RIGHT * 5
	move_and_collide(velocity * 0)
