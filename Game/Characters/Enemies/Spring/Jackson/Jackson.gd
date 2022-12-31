extends Enemy

class_name Jackson

onready var animation_player = $AnimationPlayer

var velocity : Vector2

var position_x = GameSettings.right_position.x + 10
var position_y = GameSettings.right_position.y - 120

enum STATE {RUN, GO_UP, GO_DOWN}

var current_state = STATE.RUN

var custom_y : float

var run_count = 0

var moving_style : int


func _ready():
	moving_style = Common.get_random_number(0, 1)

func _physics_process(_delta):
	moving()

func moving():
	
	match(current_state):
		STATE.RUN:
			animation_player.play("run")
			custom_y = 0
			if(self.rotation_degrees < 0):
				self.rotation_degrees += 1
		STATE.GO_DOWN:
			if(self.rotation_degrees > -15):
				self.rotation_degrees -= 1
			animation_player.play("go_down")
			custom_y = 20
	if(is_on_floor()):
		current_state = STATE.RUN
	velocity = Vector2(
		-moving_speed,
		custom_y
	)

	if move_and_slide(velocity, Vector2.UP): 
		pass
	
	
func _on_HitBox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.get_hit(1)

func go_down():
	current_state = STATE.GO_DOWN
	
func go_run():
	current_state = STATE.RUN
	
func go_down_animation_finished():
	current_state = STATE.RUN

func do_action():
	go_down()

