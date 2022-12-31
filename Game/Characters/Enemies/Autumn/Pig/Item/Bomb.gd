extends Enemy

enum STATE {OFF, ON, BOOM, FALL}

var current_state = STATE.ON
onready var animation_player = $AnimationPlayer
var velocity : Vector2

var bomb_moving_speed = 90
var pig_moving_speed : int

func _ready():
	var differ = pig_moving_speed - bomb_moving_speed
	bomb_moving_speed -= differ
	
func _physics_process(_delta):
	match(current_state):
		STATE.OFF:
			animation_player.play("off")
			velocity = Vector2(
				-bomb_moving_speed, 
				min(velocity.y + gravity, GameSettings.terminal_gravity)
			)
		STATE.ON:
			animation_player.play("on")
			velocity = Vector2(-bomb_moving_speed, -300)
			current_state = STATE.FALL
		STATE.FALL: 
			animation_player.play("on")
			velocity = Vector2(
				-bomb_moving_speed, 
				min(velocity.y + gravity, GameSettings.terminal_gravity)
			)
		STATE.BOOM:
			
			animation_player.play("boom")
			velocity = Vector2(29.5, min(velocity.y + gravity, GameSettings.terminal_gravity))
			
	if(is_on_floor() && current_state != STATE.BOOM):
		current_state = STATE.BOOM
			
	if(move_and_slide(velocity, Vector2.UP)):
		pass

func boom_animation_finished():

	self.queue_free()

func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	current_state = STATE.BOOM
	body.get_hit(1)
