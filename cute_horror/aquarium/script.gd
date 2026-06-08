extends Node2D
class_name Aquarium

var can_interact = false;

func _physics_process(delta: float) -> void:
	if can_interact:
		if Input.is_action_just_pressed('interact'):
			get_tree().change_scene_to_file("res://cute_horror/tamagotchi/scene.tscn");

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as Player == null: return;
	can_interact = true;
	if Input.is_action_just_pressed('interact'):
		get_tree().change_scene_to_file("res://cute_horror/tamagotchi/scene.tscn");
	pass

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body as Player == null: return
	can_interact = false;
	pass
