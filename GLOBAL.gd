extends Node

var can_play=false
var opcion=0
var score=0
var rng :RandomNumberGenerator = RandomNumberGenerator.new()

func random(min_value, max_value):
	rng.randomize()
	var n_random = rng.randi_range(min_value, max_value)
	return n_random
