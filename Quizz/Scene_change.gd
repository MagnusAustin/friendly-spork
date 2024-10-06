extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_office_pressed():
	get_tree().change_scene_to_file("res://Office1.tscn") # Replace with function body.


func _on_server_pressed():
	get_tree().change_scene_to_file("res://server.tscn") # Replace with function body.


func _on_home_pressed():
	get_tree().change_scene_to_file("res://home_office1.tscn") # Replace with function body.
