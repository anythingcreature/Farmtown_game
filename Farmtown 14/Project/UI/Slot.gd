extends TextureButton


var has_item = false
var itemIcon = preload("res://UI/Free Inventory/Inventory_background.png")
var itemName = ""
var itemCount = 0

func _ready():
	get_node("Info").hide()

func _process(delta):
	if itemCount == 0:
		get_node("Item").hide()
		get_node("Count").hide()
	else:
		get_node("Item").show()
		get_node("Item").texture = itemIcon
		get_node("Count").show()
		get_node("Count").text = str(itemCount)

func _on_Slot_mouse_entered():
	if itemCount > 0:
		get_node("Info").show()
		get_node("Info/Label").text = "Name: " + itemName +"\nCount: " + str(itemCount)

func _on_Slot_mouse_exited():
	get_node("Info").hide()
