class_name PlayerState
extends Node

signal transition_state_req(new_state : Player.State)

var animation: AnimationPlayer
var sprite : Sprite2D
var player : Player

func setup(context_player : Player, context_sprite : Sprite2D, context_animation : AnimationPlayer) -> void:
	animation = context_animation
	sprite = context_sprite
	player = context_player
