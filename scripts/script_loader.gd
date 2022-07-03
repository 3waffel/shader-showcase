extends Node2D

export var script_content = String()

signal commit_change


func _ready():
	connect("commit_change", self, "on_commit_change")
	pass


func _process(delta):
	pass


func on_commit_change():
	# clear the scene and load...
	load_script()
	pass


func load_script():
	pass
