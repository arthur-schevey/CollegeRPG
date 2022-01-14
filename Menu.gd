extends Spatial

var play
var quit

func _ready():
	play = $"Menu Buttons/Play Model"
	quit = $"Menu Buttons/Quit Model"


func _on_Play_Button_pressed():
	get_tree().change_scene("res://World/Campus.tscn")


func _on_Quit_Button_pressed():
	get_tree().quit()

func _on_Play_Button_mouse_entered():
	play.scale.y = 0.3


func _on_Play_Button_mouse_exited():
	play.scale.y = 0.09


func _on_Quit_Button_mouse_entered():
	quit.scale.y = 0.3


func _on_Quit_Button_mouse_exited():
	quit.scale.y = 0.09
