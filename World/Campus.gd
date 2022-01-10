extends Spatial

export var speed = 0
export var hour = 0
export var minute = 0

var time = 0
var digitalTime = "%d:%d"

func _process(delta):
	time += delta * speed
	timeManager(time)
	#setDaylight(time)
	
func timeManager(time):
	var int_time = int(floor(time))
	
	minute = (int_time / 60) % 60
	hour = (int_time / (60 * 60)) % 24

func setDaylight(time):
	pass
