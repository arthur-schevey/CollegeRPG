extends CharacterBody3D



func _on_Hurtbox3D_area_entered(_area):
	queue_free()
