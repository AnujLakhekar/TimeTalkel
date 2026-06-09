class_name Player
extends CharacterBody2D

enum ControlScheme {P1, AI}

@export var SPEED : float = 300.0
@export var JUMP_VELOCITY : float = -400.0
@export var control_scheme : ControlScheme

@onready var animation: AnimationPlayer = %animation
@onready var sprite: Sprite2D = %Sprite2D


var heading = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	if control_scheme == ControlScheme.AI:
		pass
	else:
		handle_human_movement()
	set_heading()
	flip()
	set_movement_animaton()
	move_and_slide()


func handle_human_movement() -> void:
	var direction =  KeyUtils.get_input_vector(control_scheme)
	velocity = direction * SPEED

func set_movement_animaton() -> void:
	if velocity.x != 0:
		animation.play("run")
	elif velocity.x == 0:
		animation.play("idle")

func set_heading() -> void:
	if velocity.x > 0:
		heading = Vector2.RIGHT
	elif velocity.x < 0:
		heading = Vector2.LEFT
	
func flip() -> void:
	if heading == Vector2.RIGHT:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
