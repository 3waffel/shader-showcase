extends Button

var panel: Panel


func _ready():
	panel = get_parent().get_node("Panel")
	if panel == null:
		push_error("no panel found")


func on_button_pressed():
	panel.visible = !panel.visible
