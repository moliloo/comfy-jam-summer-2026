extends Node2D

@onready var canvas_layer: CanvasLayer = $UI
@onready var ui = $UI/DayNightCycleUI

func _ready() -> void:
	canvas_layer.visible = true
