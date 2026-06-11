extends Node2D

var bubbles
var speed := 4
const buble_texture = [preload("uid://bu2ew0oxijkjr"),preload("uid://346qwjeogbc3")]
@onready var bubbles_height_destroy : float = $"../bubbles_destroy".position.y
@onready var bubbles_destroy: Vector2 = $"../bubbles_destroy".position
@onready var bubbles_destroy_2: Vector2 = $"../bubbles_destroy2".position

func _process(delta: float) -> void:
	bubles_movement(delta)


func bubles_movement(delta):
	bubbles = get_children()
	for bubble in bubbles:
		bubble.position.y -= speed + randi_range(-2,2) *delta
		if bubble.position.y <= bubbles_height_destroy:
			bubble.queue_free()
		

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			var BUBBLE = Sprite2D.new()
			BUBBLE.texture = buble_texture.pick_random()
			BUBBLE.position = get_local_mouse_position()
			if BUBBLE.position.x >= bubbles_destroy.x and BUBBLE.position.x <= bubbles_destroy_2.x and BUBBLE.position.y <= bubbles_destroy_2.y:
				print(BUBBLE.position)
				add_child(BUBBLE)
