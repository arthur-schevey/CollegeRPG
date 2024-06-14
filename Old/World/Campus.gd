extends Node3D

@export var speed = 0
@export var hour = 0
@export var minute = 0
var time = 0

func _process(delta):
	time += delta * speed
	timeManager(time)
	
func timeManager(time):
	var int_time = int(floor(time))
	
	minute = (int_time / 60) % 60
	hour = (int_time / (60 * 60)) % 24

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
