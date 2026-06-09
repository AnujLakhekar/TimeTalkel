class_name PlayerStateMoving
extends PlayerState


func _process(delta: float) -> void:
	if player.control_scheme == Player.ControlScheme.AI:
		pass
	else:
		handle_human_movement()
	player.set_heading()
	player.set_movement_animaton()


func handle_human_movement() -> void:
	var direction =  KeyUtils.get_input_vector(player.control_scheme)
	player.velocity = direction * player.SPEED
