extends Node2D

var can_interact = false;
var entity: Player;

var area_entered: String;
var areas_list: Dictionary = {
	'house': 'res://scenes/house.tscn',
};


func _process(delta: float) -> void:
	if can_interact and area_entered:
		if Input.is_action_just_pressed('interact'):
			ChangeScenes.change_scene(area_entered, entity);


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player == null: return;
	entity = body;
	area_entered = areas_list['house'];


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body as Player == null: return
	entity = null;
	area_entered = '';
