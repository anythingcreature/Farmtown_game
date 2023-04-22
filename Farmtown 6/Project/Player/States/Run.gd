extends State

class_name RunState

func get_input():
	if Input.is_action_just_released("ui_left"):
		change_state.call_func("idle")
		animation.play("Idle")
	if Input.is_action_just_released("ui_right"):
		change_state.call_func("idle")
		animation.play("Idle")
	if Input.is_action_just_released("ui_up"):
		change_state.call_func("idle")
		animation.play("Idle")
	if Input.is_action_just_released("ui_down"):
		change_state.call_func("idle")
		animation.play("Idle")

func _physics_process(delta):
	get_input()

func move_left():
	persistant_state.velocity.x -= 1
	animation.play("Walk left")

func move_right():
	persistant_state.velocity.x += 1
	animation.play("Walk Right")

func move_up():
	persistant_state.velocity.y -= 1
	animation.play("Walk up")

func move_down():
	persistant_state.velocity.y += 1
	animation.play("Walk down")
