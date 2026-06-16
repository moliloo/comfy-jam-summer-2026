extends Area2D

signal new_scene(scene: String);

func change_scene(scene: String, entity: Player):
	GlobalVariables.set_player_position(entity.get_global_position());
	new_scene.emit(scene);
	get_tree().change_scene_to_file(scene);
