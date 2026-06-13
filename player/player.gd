extends CharacterBody2D
class_name Player

@export var sprite: AnimatedSprite2D
@export var day_night_cycle: DayNightCycle

var SPEED: float = 400;
var direction: Vector2 = Vector2(0, 0);
var interacting : bool = false

func _ready() -> void:
	if GlobalVariables.get_player_position():
		set_global_position(GlobalVariables.get_player_position());
	day_night_cycle.midnight.connect(_on_midnight)

func _process(_delta: float) -> void:
	move_player()

func move_player() -> void:
	if Input.is_action_just_pressed("interact"):
		interacting = true
		sprite.play("collecting_front")
		sprite.animation_finished.connect(func rev(): interacting = false)
	if interacting:
		return
	if Input.is_action_pressed('move_right'):
		if sprite.animation not in ["walk_up","walk_down"]:
			sprite.play("walk_right")
		#sprite.flip_h = false;
		direction.x = 1;
	elif Input.is_action_pressed('move_left'):
		if sprite.animation not in ["walk_up","walk_down"]:
			sprite.play("walk_left")
		#sprite.flip_h = true;
		direction.x = -1;
	else: 
		direction.x = 0;

	if Input.is_action_pressed('move_up'):
		sprite.play("walk_up")
		direction.y = -1;
	elif Input.is_action_pressed('move_down'):
		sprite.play("walk_down")
		direction.y = 1;
	else: 
		direction.y = 0;
	if direction == Vector2(0,0) or (sprite.animation in ["walk_up","walk_down"] and direction.y == 0):
		sprite.play("default")
	velocity = direction.normalized() * SPEED;
	move_and_slide();

func _on_midnight():
	GlobalVariables.set_player_position(get_global_position())
	day_night_cycle.next_day()
	get_tree().change_scene_to_file('res://scenes/day_summary/day_summary.tscn')
