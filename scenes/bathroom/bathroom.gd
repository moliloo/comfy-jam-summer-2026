extends Node2D

var entity: Player;

var spawn_point: String;

var area_entered: String;
var areas_list: Dictionary = {
	'house': ['res://scenes/house/house.tscn', 'FromBathroom'],
};


func _process(delta: float) -> void:
	if area_entered:
		if Input.is_action_just_pressed('interact'):
			print('clicou')
			ChangeScenes.change_scene(area_entered, entity, spawn_point);


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player == null: return;
	entity = body;
	area_entered = areas_list['house'][0];
	spawn_point = areas_list['house'][1];


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body as Player == null: return
	entity = null;
	area_entered = '';
