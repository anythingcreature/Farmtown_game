extends KinematicBody2D

onready var player_animation = $AnimationPlayer

func _ready():
	player_animation.play("Idle")
