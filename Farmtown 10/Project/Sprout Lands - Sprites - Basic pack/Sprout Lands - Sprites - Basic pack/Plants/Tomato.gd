extends Area2D

onready var timer = $Timer
var time = 0.0
onready var plant = $Sprite
var stage = 1
var PlantNum = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = time
	if PlantNum == -1:
		PlantNum = Game.Plot.size()
	Game.Plot += [{
		"Seed": "Tomato",
		"TimeLeft": timer.time_left,
		"Stage": stage,
	}]
	Utils.save_game()


func _process(delta):
	Game.Plot[PlantNum]["Timer"] = timer.time_left
	match stage:
		1:
			plant.frame = 7
		2:
			plant.frame = 8
		3:
			plant.frame = 9
		4:
			plant.frame = 10
		5:
			plant.frame = 11
		6: 
			print(get_parent())
			get_parent().has_seed = false
			queue_free()

func _on_Timer_timeout():
	if stage <= 5:
		stage += 1
		Game.Plot[PlantNum]["Stage"] = stage
		Utils.save_game()
