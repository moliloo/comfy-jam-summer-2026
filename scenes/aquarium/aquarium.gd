extends Node2D
class_name Aquarium

var can_interact = false;
var entity: Player;

func _physics_process(delta: float) -> void:
	if can_interact:
		if Input.is_action_just_pressed('interact'):
			GlobalVariables.set_player_position(entity.get_global_position());
			get_tree().change_scene_to_file('res://cute_horror/tamagotchi/tamagotchi.tscn');

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player == null: return;
	entity = body;
	can_interact = true;

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body as Player == null: return
	entity = null;
	can_interact = false;
