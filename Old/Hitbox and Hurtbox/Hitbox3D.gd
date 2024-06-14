extends Area3D

func _ready():
	$CollisionShape3D.set_deferred("disabled", true)
