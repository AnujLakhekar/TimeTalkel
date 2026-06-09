extends Node
class_name KeyUtils

# Added JUMP to match your Input Map
enum Action {LEFT, RIGHT, UP, DOWN, ROLL, JUMP}

const ACTION_MAP : Dictionary = {
	Player.ControlScheme.P1 : {
		Action.LEFT : "player_left",
		Action.RIGHT : "player_right",
		Action.UP : "player_up",
		Action.DOWN : "player_down",
		Action.ROLL : "player_roll",
		Action.JUMP : "player_jump"
	}
}


static func get_input_vector(scheme: Player.ControlScheme) -> Vector2:
	var map = ACTION_MAP[scheme]
	return Input.get_vector(map[Action.LEFT], map[Action.RIGHT], map[Action.UP], map[Action.DOWN])

static func is_action_pressed(scheme : Player.ControlScheme, action: Action) -> bool:
	return Input.is_action_pressed(ACTION_MAP[scheme][action])
	
static func is_action_just_released(scheme : Player.ControlScheme, action: Action) -> bool:
	return Input.is_action_just_released(ACTION_MAP[scheme][action])
	
static func is_action_just_pressed(scheme : Player.ControlScheme, action: Action) -> bool:
	return Input.is_action_just_pressed(ACTION_MAP[scheme][action])
