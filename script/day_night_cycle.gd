extends CanvasModulate
class_name DayNightCycle

const MINUTES_PER_DAY = 1440;
const MINUTES_PER_HOUR = 60;
const IN_GAME_TO_REAL_MINUTE_DURATION = (2 * PI) / MINUTES_PER_DAY

signal time_tick(day: int, hour: int, minute: int)

@export var gradient: GradientTexture1D
@export var IN_GAME_SPEED: float = 1.0
@export var INITIAL_HOUR: int = 6:
	set(h):
		INITIAL_HOUR = h
		time = IN_GAME_TO_REAL_MINUTE_DURATION * INITIAL_HOUR * MINUTES_PER_HOUR

var time: float = 0.0
var past_minute: float = -1.0

func _ready() -> void:
	if GlobalVariables.get_saved_time():
		time = GlobalVariables.get_saved_time()
	else:
		time = IN_GAME_TO_REAL_MINUTE_DURATION * INITIAL_HOUR * MINUTES_PER_HOUR

func _process(delta: float) -> void:
	time += delta * IN_GAME_TO_REAL_MINUTE_DURATION * IN_GAME_SPEED
	var value = (sin(time - PI / 2) + 1.0) / 2.0
	self.color = gradient.gradient.sample(value)
	
	_recalc_time()

func _recalc_time() -> void:
	var total_minutes = int(time / IN_GAME_TO_REAL_MINUTE_DURATION)

	var day = int(total_minutes / MINUTES_PER_DAY)
	var current_day_minutes = total_minutes % MINUTES_PER_DAY
	
	var hour = int(current_day_minutes / MINUTES_PER_HOUR)
	
	var minute = int(current_day_minutes % MINUTES_PER_HOUR)
	
	if past_minute != minute:
		past_minute = minute
		time_tick.emit(day, hour, minute)
		GlobalVariables.save_time(time)

func next_day():
	GlobalVariables.set_day_count()
	var day_count = GlobalVariables.get_day_count()
	
	var total_minutes: int = day_count * MINUTES_PER_DAY + INITIAL_HOUR * MINUTES_PER_HOUR
	var new_time: float = float(total_minutes) * IN_GAME_TO_REAL_MINUTE_DURATION
	
	time = new_time 
	GlobalVariables.save_time(new_time)
