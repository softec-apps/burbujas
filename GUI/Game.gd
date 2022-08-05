extends Node2D

onready var audio = $AudioStreamPlayer
onready var timer = $Timer
onready var animation = $AnimationPlayer
onready var path_follow=$Path2D/PathFollow2D
onready var countdown = $countown
onready var score=$score/label
export var scene_restart : PackedScene
export var bubble_scene: PackedScene
var rng :RandomNumberGenerator = RandomNumberGenerator.new()
var cont=1
var vocal=['a','e','i','o','u']
var n=1

func _ready():
	score.text=str(Global.score)
	animation.play("tutorial")

func _process(_delta):
	score.text=str(Global.score)
	if n==5 and cont==1:
		var restart = scene_restart.instance()
		add_child(restart)
		cont+=1


func spawn_bubbles():
	rng.randomize()
	path_follow.unit_offset=rng.randf_range(0,1)
	var bubble=bubble_scene.instance()
	add_child(bubble)
	bubble.position=path_follow.position
	if n<5:
		timer.start(1)


func _on_Timer_timeout():
	timer.stop()
	spawn_bubbles()

func letter_select():
	var n_letter=Global.random(0,4)
	audio.stream=load("res://assets/sounds/letra/"+str(vocal[n_letter])+".mp3")
	audio.play()
	yield(audio,"finished")
	Global.opcion=n_letter+1
	spawn_bubbles()
	countdown.start(10)


func _on_AnimationPlayer_animation_finished(_anim_name):
	letter_select()


func _on_countown_timeout():
	countdown.stop()
	n+=1
	if n<5:
		letter_select()
