extends CanvasLayer

@onready var health_bar := $MarginContainer/HBoxContainer/HealthBar
@onready var sanity_bar := $MarginContainer/HBoxContainer/SanityBar
@onready var timer_label := $MarginContainer/HBoxContainer/TimerLabel

var health: float = 100
var sanity: float = 100
var time_passed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_label.text = "Time Elapsed: "
	set_health(health)
	set_sanity(sanity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_passed += delta
	set_health(health)
	set_sanity(sanity)
	timer_label.text = "Time Elapsed: " + format_time(time_passed)
	
func set_health(value: float):
	health_bar.value = value

func set_sanity(value: float):
	sanity_bar.value = value
	
func format_time(t):
	var seconds = int(t) % 60
	var minutes = int(t) / 60
	return "%02d:%02d" % [minutes, seconds]


func _on_timer_timeout() -> void:
	sanity -= 0.5
