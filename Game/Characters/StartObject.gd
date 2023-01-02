extends KinematicBody2D


export(int) var move_speed = 10
onready var animation_player = $AnimationPlayer
enum STATE {IDLE, MOVE_BACKWARD, MOVE_FORWARD, STOP}

var velocity : Vector2

var current_state = STATE.MOVE_FORWARD
var root_node setget set_root_node

func set_root_node(value):
	root_node = value

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	if(Input.is_action_just_pressed("jump")):
		current_state = STATE.MOVE_BACKWARD
		root_node.starting()
		root_node.change_start_object_layer()
	match(current_state):
		STATE.IDLE: 
			animation_player.play("idle")
			velocity = Vector2(
				0,
				min(velocity.y + 50, GameSettings.terminal_gravity)
			)	
		STATE.MOVE_BACKWARD:
			animation_player.play("moving_backward")
			velocity = Vector2(
				velocity.x - move_speed,
				min(velocity.y + 50, GameSettings.terminal_gravity)
			)
		STATE.MOVE_FORWARD:
			animation_player.play("moving_forward")
			velocity = Vector2(
				velocity.x + move_speed,
				min(velocity.y + 50, GameSettings.terminal_gravity)
			)
		STATE.STOP:
			animation_player.play("stop")
			velocity = Vector2(
				0,
				min(velocity.y + 50, GameSettings.terminal_gravity)
			)
	if move_and_slide(velocity, Vector2.UP): 
		pass


func do_action():
	current_state = STATE.STOP
	
func stop_animation_finished():
	current_state = STATE.IDLE
	
func moving_animation_finished():
	self.queue_free()

