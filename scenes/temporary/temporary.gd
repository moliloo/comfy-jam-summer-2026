extends Node2D

@onready var canvas_layer: CanvasLayer = $UI
@onready var ui = $UI/DayNightCycleUI
@onready var area = get_node('SceneArea')
@onready var player = get_node('Player')

func _ready() -> void:
	canvas_layer.visible = true;
	ChangeScenes.new_scene.connect(_update_scene);


func _update_scene(scene_path: String, spawn_point: String):
	var loaded_scene = load(scene_path) as PackedScene
	
	if loaded_scene:
		var new_area = loaded_scene.instantiate()
		var area_child = area.get_child(0)
		
		area.remove_child(area_child)
		area_child.queue_free()
		
		new_area.scale = Vector2(3.0, 3.0)
		
		area.add_child(new_area)
		
		var spawn = new_area.get_node('Spawnpoints/' + spawn_point)
		if spawn:
			player.global_position = spawn.global_position
