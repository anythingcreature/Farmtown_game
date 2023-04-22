extends YSort


const Corn = preload("res://Sprout Lands - Sprites - Basic pack/Sprout Lands - Sprites - Basic pack/Plants/Corn.tscn")
const Tomato = preload("res://Sprout Lands - Sprites - Basic pack/Sprout Lands - Sprites - Basic pack/Plants/Tomato.tscn")

var has_seed = false

func _ready():
	var Curr_plot = Game.Plot
	if Curr_plot.size() > 0:
		for i in Curr_plot.size():
			var plant1 = Corn.instance()
			if Curr_plot[i]["Seed"] == "Corn":
				plant1 = Corn.instance()
			if Curr_plot[i]["Seed"] == "Tomato":
				plant1 = Tomato.instance()
			plant1.PlantNum = i
			plant1.stage = int(Curr_plot[i]["Stage"])
			plant1.time = (float(round(Curr_plot[i]["Timer"])))
			get_child(i).add_child(plant1)
			has_seed = true
			Game.Plot.pop_at(i)
			Utils.save_game()
