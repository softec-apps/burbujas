extends Control

onready var animation=$AnimationPlayer

func _ready():
	MusicController.play()
	animation.play("intro")


func _on_Button_pressed():
	return get_tree().change_scene("res://GUI/Game.tscn")
