extends Node2D

@export var display_text: String = "Hello!"
@export var npc_color: Color = Color.WHITE


@onready var box := $ColorRect
@onready var panel := $Panel
@onready var label := $Panel/Label

func _ready():
	panel.visible = false
	box.color = npc_color
	box.gui_input.connect(_on_box_gui_input)

func _on_box_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			show_dialog(display_text)

func show_dialog(text: String):
	label.text = text
	await get_tree().process_frame  # allow UI to update the label size
	panel.size = panel.get_minimum_size()
	panel.visible = true

	get_tree().create_timer(3.0).timeout.connect(func():
		panel.visible = false
	)
