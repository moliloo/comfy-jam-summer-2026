extends Node

var player_spawn_position = null

func set_player_position(position: Vector2):
	player_spawn_position = position;

func get_player_position() -> Vector2:
	if player_spawn_position:
		return player_spawn_position;
	return Vector2.ZERO
