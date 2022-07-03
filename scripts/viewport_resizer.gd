extends ViewportContainer

var viewport: Viewport


func _ready():
	viewport = get_node("Viewport")
	get_viewport().connect("size_changed", self, "on_size_changed")
	viewport.size = get_viewport().size


func on_size_changed():
	viewport.size = get_viewport().size
