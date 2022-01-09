extends KinematicBody



func _on_Hurtbox3D_area_entered(area):
	queue_free()
