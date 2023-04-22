extends Node2D



func _ready():
	#Utils.save_game()
	Utils.load_game()
	var size = Game.Plot.size()
	var i =  0;
	while i < size:
		if Game.Plot[i-1]["Harvested"] == true:
			Game.Plot.pop_at(i-1)
			i -=1
			size -=1
		i+= 1
	print(Game.Plot)
func _on_Play_pressed():
	get_tree().change_scene("res://World/World.tscn")
	

