extends GridContainer


onready var SlotButtons = [
	get_node("Slot0"),
	get_node("Slot1"),
	get_node("Slot2"),
	get_node("Slot3"),
	get_node("Slot4"),
	get_node("Slot5"),
]

func setInventory():
	if Game.Harvests.size() == 0:
		Game.Harvests += [{"Name": "Corn", "Count": 0, "Consumable": true}]
		Game.Harvests += [{"Name": "Tomato", "Count": 0, "Consumable": true}]
	for i in Game.Harvests.size():
		if int(Game.Harvests[i]["Count"]) > 0:
			SlotButtons[i].has_item = true
			SlotButtons[i].itemIcon = load("res://Sprout Lands - Sprites - Basic pack/Sprout Lands - Sprites - Basic pack/Objects/" +Game.Harvests[i]["Name"]+".png")
			SlotButtons[i].itemName= Game.Harvests[i]["Name"]
			SlotButtons[i].itemCount = Game.Harvests[i]["Count"]
