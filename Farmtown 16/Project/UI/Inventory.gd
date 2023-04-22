extends Node2D

var dragging = false
var click_radius = 40
var posClicked

var ButtonInfo = {
	"Name": "Corn",
	"Count": 0,
}

onready var slotContainer = get_node("SlotContainer")
onready var SlotButtons = [
	get_node("SlotContainer/Slot0"),
	get_node("SlotContainer/Slot1"),
	get_node("SlotContainer/Slot2"),
	get_node("SlotContainer/Slot3"),
	get_node("SlotContainer/Slot4"),
	get_node("SlotContainer/Slot5"),
]

func _ready():
	self.hide()

func _input(event):
	if event.is_action_pressed("Inventory"):
		if self.visible == true:
			self.hide()
		else: 
			self.show()
			get_node("SlotContainer").setInventory()


func _on_Slot_gui_input(event, extra_arg_0):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.position.length() < click_radius:
			if not dragging and event.pressed:
				if slotContainer.get_child(extra_arg_0).has_item == true:
					dragging = true
					posClicked = slotContainer.get_child(extra_arg_0).rect_position.x
					ButtonInfo["Name"] = slotContainer.get_child(extra_arg_0).itemName
					ButtonInfo["Count"] = slotContainer.get_child(extra_arg_0).itemCount
					slotContainer.get_child(extra_arg_0).itemName = ""
					slotContainer.get_child(extra_arg_0).itemCount = 0
					slotContainer.get_child(extra_arg_0).has_item = false
		if dragging and not event.pressed:
			dragging = false
			slotContainer.get_child(extra_arg_0).get_node("Item").position = Vector2(20, 20)
			get_node("Sprite").hide()
			var placed = false
			for i in SlotButtons.size():
				var spot = get_global_mouse_position() - Vector2(-80, -50)
				if (spot >= slotContainer.get_child(5-i).rect_position + Vector2(120, 72) && spot >= slotContainer.get_child(5-i).rect_position + Vector2(160, 112) && placed == false && slotContainer.get_child(5-i).has_item == false):
					slotContainer.get_child(5-i).has_item = true
					slotContainer.get_child(5-i).itemName = ButtonInfo["Name"]
					slotContainer.get_child(5-i).itemCount = ButtonInfo["Count"]
					placed = true
	if event is InputEventMouseMotion and dragging:
		get_node("Sprite").show()
		get_node("Sprite").texture = slotContainer.get_child(extra_arg_0).get_node("Item").texture
		get_node("Sprite").position.x = get_global_mouse_position().x -80
		get_node("Sprite").position.y = get_global_mouse_position().y -50
