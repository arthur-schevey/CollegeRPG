extends Node3D

@onready var animation_player = $AnimationPlayer
@export var starting_level : PackedScene

func changeScene():
	get_tree().change_scene_to_packed(starting_level)


func _on_play_mouse_entered():
	animation_player.play("PlaySelect")


func _on_play_mouse_exited():
	animation_player.play("PlayDeselect")


func _on_play_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		animation_player.play("Transition")


func _on_quit_mouse_entered():
	animation_player.play("QuitSelect")


func _on_quit_mouse_exited():
	animation_player.play("QuitDeselect")


func _on_quit_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		get_tree().quit()
		
