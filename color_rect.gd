extends ColorRect

# Declare a variable to hold the reference to the DialogPanel
@onready var dialog_panel = $DialogPanel

func _ready():
	# Ensure the ColorRect captures mouse input
	mouse_filter = MOUSE_FILTER_STOP
	# Connect the gui_input signal using a Callable
	connect("gui_input", Callable(self, "_on_gui_input"))

func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("ColorRect clicked!")
		# Call the show_text() function on the DialogPanel
		var world_position: Vector2 = get_global_rect().position
		dialog_panel.show_text("This is a test, jesus christ this shouldn't be so hard.", world_position)
