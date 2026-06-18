extends Area2D

signal new_scene(scene: String, spawn_point: String);

func change_scene(scene: String, entity: Player, spawn_point: String):
	GlobalVariables.set_player_position(entity.get_global_position());
	new_scene.emit(scene, spawn_point);
