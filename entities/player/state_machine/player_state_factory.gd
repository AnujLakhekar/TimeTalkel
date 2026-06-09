class_name PlayerStateFactory

var states : Dictionary

func _init() -> void:
	states = {
		Player.State.MOVING : PlayerStateMoving
	}


func get_fresh_state(state: Player.State) -> PlayerState:
	assert(states.has(state), "no state found")
	return states.get(state).new()
