extends State

class_name RunState

func get_input():
	if Input.is_action_just_released("ui_left"):
		change_state.call_func("idle")
	if Input.is_action_just_released("ui_right"):
		change_state.call_func("idle")
	if Input.is_action_just_released("ui_up"):
		change_state.call_func("idle")
	if Input.is_action_just_released("ui_down"):
		change_state.call_func("idle")

func _physics_process(delta):
	get_input()

func move_left():
	persistant_state.velocity.x -= 1

func move_right():
	persistant_state.velocity.x += 1

func move_up():
	persistant_state.velocity.y -= 1

func move_down():
	persistant_state.velocity.y += 1
