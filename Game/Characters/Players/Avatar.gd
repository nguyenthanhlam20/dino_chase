extends KinematicBody2D

#onready var animation_player = $AnimationPlayer
#onready var animation_player = $AnimationPlayer


var current_state = "LOCK" setget set_current_state

func set_current_state(value):
	current_state = value

func _ready():
	match(current_state):
		"LOCK":
#			print("lock")
			$AnimationPlayer.play("bend_down_lock")
		"UNLOCK":
#			print("unlock")
			$AnimationPlayer.play("bend_down")
#func _physics_process(delta):
	
		
	
