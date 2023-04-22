extends Area2D

const Corn = preload("res://Sprout Lands - Sprites - Basic pack/Sprout Lands - Sprites - Basic pack/Plants/Corn.tscn")

var has_seed = false



func _on_Dirt2_input_event(viewport, event, shape_idx):
	if !has_seed:
		if event.is_action("Spawn"):
			var plant1 = Corn.instance()
			plant1.position = self.position
			get_node("../../Seeds").add_child(plant1)
			has_seed = true
