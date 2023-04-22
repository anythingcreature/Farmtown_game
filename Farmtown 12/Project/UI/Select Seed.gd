extends Node2D

func _ready():
	hide_all()
	show_select()

func _input(event):
	hide_all()
	if event.is_action_pressed("Select_up"):
		Game.Selected +=1
	if event.is_action_pressed("Select_down"):
		Game.Selected -=1
	if Game.Selected > 1:
		Game.Selected = 0
	if Game.Selected < 0:
		Game.Selected = 1
	show_select()
	
func show_select():
	get_child(Game.Selected).get_child(0).show()
	
func hide_all():
	for i in get_child_count() -1:
		get_child(i).get_child(0).hide()
