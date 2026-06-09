class_name Player
extends CharacterBody2D

enum ControlScheme {P1, AI}
enum State {MOVING, ROLLING}

@export var SPEED : float = 300.0
@export var JUMP_VELOCITY : float = -400.0
@export var control_scheme : ControlScheme

@onready var animation: AnimationPlayer = %animation
@onready var sprite: Sprite2D = %Sprite2D

var heading = Vector2.RIGHT

# statemanager
var current_state : PlayerState
var factory : PlayerStateFactory = PlayerStateFactory.new()

func _ready() -> void:
	switch_state(State.MOVING)

func _physics_process(delta: float) -> void:
	flip()
	move_and_slide()

func switch_state(new_state: State) -> void:
	if current_state != null:
		current_state.queue_free()
	current_state = factory.get_fresh_state(new_state)
	current_state.setup(self, sprite, animation)
	current_state.transition_state_req.connect(switch_state.bind())
	current_state.name = "state_machine_" + str(new_state)
	call_deferred("add_child", current_state) 

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
