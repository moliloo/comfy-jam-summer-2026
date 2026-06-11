extends Node

var player_spawn_position = null

var saved_time
var saved_day_count: int

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

func set_day_count():
	saved_day_count += 1

func get_day_count():
	if not saved_day_count: return 1
	return saved_day_count
