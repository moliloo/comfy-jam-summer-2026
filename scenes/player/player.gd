extends CharacterBody2D
class_name Player

@export var sprite: AnimatedSprite2D
@export var day_night_cycle: DayNightCycle

var SPEED: float = 400;
var direction: Vector2 = Vector2(0, 0);
var interacting : bool = false
var ended_animation := true
var working := "_work" # "" or "_work"

func _ready() -> void:
	if GlobalVariables.get_player_position():
		set_global_position(GlobalVariables.get_player_position());
	day_night_cycle.midnight.connect(_on_midnight)

func _process(_delta: float) -> void:
	move_player()

func ret(): 
	interacting = false
	sprite.animation_finished.disconnect(ret)

func move_player() -> void:
	if Input.is_action_just_pressed("interact"):
		if working == "_work":
			interacting = true
			sprite.play("collecting_" + sprite.animation)
			sprite.animation_finished.connect(ret)
	
	if interacting:
		return
	
	if Input.is_action_pressed('move_right'):
		direction.x = 1;
	elif Input.is_action_pressed('move_left'):
		direction.x = -1;
	else: 
		direction.x = 0;

	if Input.is_action_pressed('move_up'):
		direction.y = -1;
	elif Input.is_action_pressed('move_down'):
		direction.y = 1;
	else: 
		direction.y = 0;
	
	match direction:
		Vector2(1,0): sprite.play("walk_right" + working)
		Vector2(-1,0): sprite.play("walk_left" + working)
		Vector2(0,1): sprite.play("walk_down" + working)
		Vector2(0,-1): sprite.play("walk_up" + working)
		Vector2(1,1): sprite.play("walk_down" + working)
		Vector2(1,-1): sprite.play("walk_up" + working)
		Vector2(-1,1): sprite.play("walk_down" + working)
		Vector2(-1,-1): sprite.play("walk_up" + working)
		Vector2(0,0): sprite.frame = 0
		_: print("error file player.gd player movement animation",direction)
	velocity = direction.normalized() * SPEED;
	move_and_slide();

func _on_midnight():
	GlobalVariables.set_player_position(get_global_position())
	day_night_cycle.next_day()
	get_tree().change_scene_to_file('res://scenes/day_summary/day_summary.tscn')
