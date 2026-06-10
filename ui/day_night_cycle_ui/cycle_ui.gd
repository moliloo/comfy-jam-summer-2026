extends Control

@onready var time_label: Label = $Label
@export var day_cycle: DayNightCycle

func _ready() -> void:
	day_cycle.time_tick.connect(_set_day_time)

func _set_day_time(day: int, hour: int, minute: int):
	time_label.text = 'Day: %s | %s:%s' % [day, hour, minute]
