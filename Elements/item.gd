extends RigidBody2D

var vocals={1:'a',2:'e',3:'i',4:'o',5:'u'}
var n_letter=0
onready var button=$Button
onready var animation=$AnimationPlayer
onready var audio=$AudioStreamPlayer

func _ready():
	var text=Global.random(1,5)
	n_letter=text
	button.text=vocals[text]
	animation.play("normal")
	


func _on_Button_pressed():
	if n_letter==Global.opcion:
		animation.play("delete")
		yield(animation,"animation_finished")
		Global.score+=1
		queue_free()


func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	queue_free()
