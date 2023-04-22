extends Area2D

onready var timer = $Timer
onready var plant = $Sprite
var stage = 1
var PlantNum = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	if PlantNum == -1:
		PlantNum = Game.Plot.size()
	Game.Plot += [{
		"Seed": "Corn",
		"TimeLeft": timer.time_left,
		"Stage": stage,
	}]
	Utils.save_game()


func _process(delta):
	Game.Plot[PlantNum]["Timer"] = timer.time_left
	match stage:
		1:
			plant.frame = stage
		2:
			plant.frame = stage
		3:
			plant.frame = stage
		4:
			plant.frame = stage
		5:
			plant.frame = stage

func _on_Timer_timeout():
	if stage <= 5:
		stage += 1
		Game.Plot[PlantNum]["Stage"] = stage
		Utils.save_game()
