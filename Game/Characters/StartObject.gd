extends KinematicBody2D


export(int) var move_speed = 10
onready var animated_sprite = $AnimatedSprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum STATE {IDLE, MOVE}

var velocity : Vector2

var current_state = STATE.IDLE
var root_node setget set_root_node

func set_root_node(value):
	root_node = value

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if(Input.is_action_just_pressed("jump")):
		current_state = STATE.MOVE
		root_node.starting()
		root_node.change_start_object_layer()
#		player.position.x = 25
	match(current_state):
		STATE.IDLE: 
			animated_sprite.play("idle")
			velocity = Vector2(
				0,
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)	
		STATE.MOVE:
			animated_sprite.play("moving")
			velocity = Vector2(
				velocity.x - move_speed,
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)

	if move_and_slide(velocity, Vector2.UP): 
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
