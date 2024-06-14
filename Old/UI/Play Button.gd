extends MeshInstance3D


func _ready():
	pass # Replace with function body.


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.button_pressed == true:
			get_tree().change_scene_to_file("res://World/Campus.tscn")


func _on_Area_mouse_entered():
	self.scale.y = 0.3
	



func _on_Area_mouse_exited():
	self.scale.y = 0.09
