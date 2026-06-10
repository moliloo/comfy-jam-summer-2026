extends Node2D
class_name Tamagochi

@export var food_bar: ProgressBar
@export var fun_bar: ProgressBar
@export var comfy_bar: ProgressBar

static var food : float 
static var fun : float 
static var comfy : float 
var max_food := 100
var max_fun := 100
var max_comfy := 100

func _ready() -> void:
	update_progress_bar()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/temporary/test.tscn");
	pass


#region test bar
func _process(_delta: float) -> void:
	food += 0.3
	fun += 0.2
	comfy += 0.1
	update_progress_bar()
#endregion

func update_stats(_food,_fun,_comfy): # call this function on interactions
	food = clamp(food + _food, 0, max_food)
	fun =  clamp(fun + _fun, 0, max_fun)
	comfy = clamp(comfy + _comfy, 0, max_comfy)
	update_progress_bar()

func update_progress_bar():
	food_bar.value = food/max_food * 100
	fun_bar.value = fun/max_fun * 100
	comfy_bar.value = comfy/max_comfy * 100
