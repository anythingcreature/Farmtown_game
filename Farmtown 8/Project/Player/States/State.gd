extends Node2D

class_name State

var change_state
var animation
var persistant_state
var velocity = 0

func _physics_process(delta):
	persistant_state.move_and_slide(persistant_state.velocity, Vector2.UP)

func setup(change_state, animation, persistant_state):
	self.change_state = change_state
	self.animation = animation
	self.persistant_state = persistant_state
