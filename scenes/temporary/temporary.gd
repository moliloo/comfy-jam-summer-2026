extends Node2D

@onready var canvas_layer: CanvasLayer = $UI
@onready var ui = $UI/DayNightCycleUI
@onready var area = get_node('SceneArea')

func _ready() -> void:
	canvas_layer.visible = true;
	ChangeScenes.new_scene.connect(_update_scene);
	

func _update_scene(scene_path: String):
	var loaded_scene = load(scene_path)
	
	if loaded_scene:
		var new_area = loaded_scene.instantiate()
		var area_child = area.get_child(0)
		
		area.remove_child(area_child)
		
		area.add_child(new_area)
		
		area_child.scale = Vector2(3.0, 3.0)
		area_child.position = Vector2(160.0, 360.0)
