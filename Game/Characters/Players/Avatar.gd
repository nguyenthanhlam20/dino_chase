extends KinematicBody2D

enum STATE {LOCK, UNLOCK}
enum MOVING_STYLE {IDLE, BEND_DOWN}
var moving_style = MOVING_STYLE.IDLE

var current_state : int setget set_current_state

func _process(_delta):
	match(moving_style):
		MOVING_STYLE.IDLE:
			match(current_state):
				STATE.LOCK:
					$AnimationPlayer.play("idle_lock")
				STATE.UNLOCK:
					$AnimationPlayer.play("idle")
		MOVING_STYLE.BEND_DOWN:
			match(current_state):
				STATE.LOCK:
					$AnimationPlayer.play("bend_down_lock")
				STATE.UNLOCK:
					$AnimationPlayer.play("bend_down")
					
func set_current_state(value):
	current_state = value
	
func set_player_avatar(value) -> void:
	$AnimatedSprite.frames = load(value)
	
func idle_animation_finished():
	moving_style = MOVING_STYLE.BEND_DOWN
			
func bend_down_animation_finished():
	moving_style = MOVING_STYLE.IDLE
