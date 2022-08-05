extends CanvasLayer

onready var animation=$AnimationPlayer
onready var game = get_tree().get_nodes_in_group("game")

func _ready():
	animation.play("restart")


func _on_Button_pressed():
	Global.opcion=0
	Global.score=0
	Global.can_play=false
	return get_tree().reload_current_scene()
