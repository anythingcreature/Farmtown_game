extends KinematicBody2D

class_name PersistantState

var state
var state_manager

var velocity = Vector2()
var speed = 25

#idle state to run state to idle ect.

func _ready():
	state_manager = StateManager.new()
	change_state("idle")

func get_input():
	Utils.save_game()
	velocity = Vector2()
# originaly was is_action_just _pressed instead of is_action_pressed
	if Input.is_action_pressed("ui_left"):
		move_left()
	if Input.is_action_pressed("ui_right"):
		move_right()
	if Input.is_action_pressed("ui_up"):
		move_up()
	if Input.is_action_pressed("ui_down"):
		move_down()
	velocity = velocity.normalized()*speed

func _process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func move_left():
	state.move_left()
	

func move_right():
	state.move_right()
	

func move_up():
	state.move_up()
	

func move_down():
	state.move_down()
	

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = state_manager.get_state(new_state_name).new()
	state.setup(funcref(self, "change_state"), $AnimationPlayer, self)
	state.name = str(new_state_name)
	add_child(state)
