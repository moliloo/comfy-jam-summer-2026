extends Node2D

var entity: Player;

var spawn_point: String;

var area_entered: String;
var areas_list: Dictionary = {
	'beach': ['res://scenes/beach/beach.tscn', 'FromHouse'],
	'bathroom': ['res://scenes/bathroom/bathroom.tscn', 'FromHouse'],
};


func _physics_process(delta: float) -> void:
	if area_entered:
		if Input.is_action_just_pressed('interact'):
			ChangeScenes.change_scene(area_entered, entity, spawn_point);


func _on_exit_door_area_body_entered(body: Node2D) -> void:
	if body as Player == null: return;
	entity = body;
	area_entered = areas_list['beach'][0];
	spawn_point = areas_list['beach'][1];

func _on_exit_door_area_body_exited(body: Node2D) -> void:
	if body as Player == null: return
	entity = null;
	area_entered = '';


func _on_bathroom_door_area_body_entered(body: Node2D) -> void:
	if body as Player == null: return;
	entity = body;
	area_entered = areas_list['bathroom'][0];
	spawn_point = areas_list['bathroom'][1];


func _on_bathroom_door_area_body_exited(body: Node2D) -> void:
	if body as Player == null: return
	entity = null;
	area_entered = '';
