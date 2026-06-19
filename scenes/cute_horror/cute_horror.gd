extends CharacterBody2D

@export var sprite: AnimatedSprite2D
@export var tamagochi: Tamagochi

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var ended_animation: bool = true


func _ready() -> void:
	tamagochi.change_animation.connect(_play_idle_animation)


func _play_idle_animation(animation: String):
	if animation:
		sprite.play(animation)
