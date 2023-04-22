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
		"Harvested": false
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
			get_parent().has_seed = false

func _on_Timer_timeout():
	if stage < 5:
		stage += 1
		Game.Plot[PlantNum]["Stage"] = stage
		Utils.save_game()


func _on_Tomato_body_entered(body):
	var exists = false
	if body.name == "Player" && stage == 5 :
		for i in Game.Harvests.size():
			if Game.Harvests[i]["Name"] == "Tomato":
				Game.Harvests[i] = {
				"Name": "Tomato",
				"Count": Game.Harvests[i]["Count"]+1,
				"Consumable": true,
				}
				exists = true
		if exists == false:
			Game.Harvests += [{
				"Name": "Tomato",
				"Count": 1,
				"Consumable": true,
				}]
		Game.Plot[PlantNum]["Harvested"] = true
		queue_free()
		print(Game.Harvests)
