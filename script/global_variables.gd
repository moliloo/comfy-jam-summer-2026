extends Node

var player_spawn_position = null

var saved_time

func set_player_position(position: Vector2):
	player_spawn_position = position;

func get_player_position() -> Vector2:
	if player_spawn_position:
		return player_spawn_position;
	return Vector2.ZERO

func save_time(time):
	saved_time = time

func get_saved_time():
	return saved_time
