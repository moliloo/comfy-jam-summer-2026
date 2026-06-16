extends Node2D

var can_interact = false;
var entity: Player;

var area_entered: String;
var areas_list: Dictionary = {
	'beach': 'res://scenes/beach/beach.tscn',
	'bathroom': 'res://scenes/bathroom/bathroom.tscn',
	'temporary': 'res://scenes/temporary/temporary.tscn',
};


func _physics_process(delta: float) -> void:
	if area_entered:
		if Input.is_action_just_pressed('interact'):
			ChangeScenes.change_scene(area_entered, entity);


func _on_exit_door_area_body_entered(body: Node2D) -> void:
	if body as Player == null: return;
	entity = body;
	area_entered = areas_list['beach'];

func _on_exit_door_area_body_exited(body: Node2D) -> void:
	if body as Player == null: return
	entity = null;
	area_entered = '';


func _on_bathroom_door_area_body_entered(body: Node2D) -> void:
	if body as Player == null: return;
	entity = body;
	area_entered = areas_list['bathroom'];


func _on_bathroom_door_area_body_exited(body: Node2D) -> void:
	if body as Player == null: return
	entity = null;
	area_entered = '';
