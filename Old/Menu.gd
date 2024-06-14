extends Node3D

var play
var quit

var anim = AnimationPlayer

func _ready():
	play = $"Menu Buttons/Play Model"
	quit = $"Menu Buttons/Quit Model"
	anim = $AnimationPlayer


func _on_Play_Button_pressed():
	$ColorRect.visible = true
	anim.play("Transition")

func _on_Quit_Button_pressed():
	get_tree().quit()

func _on_Play_Button_mouse_entered():
	anim.play("PlaySelect")
	
	
func _on_Play_Button_mouse_exited():
	anim.play("PlayDeselect")
	
	
func _on_Quit_Button_mouse_entered():
	anim.play("QuitSelect")
	
	
func _on_Quit_Button_mouse_exited():
	anim.play("QuitDeselect")

func changeScene():
	get_tree().change_scene_to_file("res://World/Campus.tscn")
