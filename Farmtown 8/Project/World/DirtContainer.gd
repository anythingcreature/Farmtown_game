extends YSort


const Corn = preload("res://Sprout Lands - Sprites - Basic pack/Sprout Lands - Sprites - Basic pack/Plants/Corn.tscn")

var has_seed = false

func _ready():
	var Curr_plot = Game.Plot
	if Curr_plot.size() > 0:
		for i in Curr_plot.size():
			Game.Plot.pop_at(i)
			var plant1 = Corn.instance()
			plant1.PlantNum = 1
			plant1.stage = int(Curr_plot[i-1]["Stage"])
			#plant1.timer.wait_time = int(round(Curr_plot[i-1]["TimeLeft"]))
			get_child(i).add_child(plant1)
			has_seed = true
			Utils.save_game()
