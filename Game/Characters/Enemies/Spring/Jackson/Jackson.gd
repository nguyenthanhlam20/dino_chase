extends Enemy

class_name Jackson

onready var animation_player = $AnimationPlayer

var velocity : Vector2

var position_x = 280
var position_y = 60

enum STATE {RUN, GO_UP, GO_DOWN}

var current_state = STATE.RUN

var custom_y : float

var run_count = 0

var moving_style : int

# moving_style:
# 0: normal run 
# 1: zic zac
# 2: fly up suddently


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
#				current_state = STATE.RUN
			print("rotation_degrees: ", self.rotation_degrees)
			animation_player.play("go_down")
			custom_y = 30
	if(is_on_floor()):
		current_state = STATE.RUN
#	print("position ", velocity, custom_y)
	velocity = Vector2(
		velocity.x - moving_speed,
		custom_y
	)

	if move_and_slide(velocity, Vector2.UP): 
		pass
	
	
func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)

func go_down():

	current_state = STATE.GO_DOWN
func go_run():
	current_state = STATE.RUN
	
func go_down_animation_finished():
	current_state = STATE.RUN
	

