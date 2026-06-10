extends CharacterBody2D
class_name Player

@export var sprite: Sprite2D
@export var day_night_cycle: DayNightCycle

var SPEED: float = 400;
var direction: Vector2 = Vector2(0, 0);

func _ready() -> void:
	if GlobalVariables.get_player_position():
		set_global_position(GlobalVariables.get_player_position());
	day_night_cycle.midnight.connect(_on_midnight)

func _process(delta: float) -> void:
	move_player()

func move_player() -> void:
	if Input.is_action_pressed('move_right'):
		sprite.flip_h = false;
		direction.x = 1;
	elif Input.is_action_pressed('move_left'):
		sprite.flip_h = true;
		direction.x = -1;
	else: 
		direction.x = 0;

	if Input.is_action_pressed('move_up'):
		direction.y = -1;
	elif Input.is_action_pressed('move_down'):
		direction.y = 1;
	else: 
		direction.y = 0;

	velocity = direction.normalized() * SPEED;
	move_and_slide();

func _on_midnight():
	GlobalVariables.set_player_position(get_global_position())
	day_night_cycle.next_day()
	get_tree().change_scene_to_file('res://scenes/day_summary/day_summary.tscn')
