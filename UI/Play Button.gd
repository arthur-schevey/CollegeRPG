extends MeshInstance


func _ready():
	pass # Replace with function body.


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			get_tree().change_scene("res://World/Campus.tscn")


func _on_Area_mouse_entered():
	self.scale.y = 0.3
	



func _on_Area_mouse_exited():
	self.scale.y = 0.09
