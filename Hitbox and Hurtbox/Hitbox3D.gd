extends Area

func _ready():
	$CollisionShape.set_deferred("disabled", true)
