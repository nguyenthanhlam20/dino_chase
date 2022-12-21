extends Enemy

class_name TurnBackEnemy

onready var animated_sprite = $AnimatedSprite
var velocity : Vector2
var position_x = 300
var position_y = 120
var moving_style : int
enum STATE {RUN, TURN_BACK, RUN_FASTER}

var current_state = STATE.RUN

var count = 0
func _ready():
	moving_style = Common.get_random_number(0, 2)

func _physics_process(_delta):
	moving()

func moving():
	match(current_state):
		STATE.RUN:
			animated_sprite.set("flip_h", false)
			animated_sprite.play("run")
			velocity = Vector2(
				velocity.x - moving_speed ,
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)
		STATE.RUN_FASTER:
			animated_sprite.set("flip_h", false)
			animated_sprite.play("run_fater")
			velocity = Vector2(
				velocity.x - (moving_speed * 3),
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)
		STATE.TURN_BACK:
			animated_sprite.set("flip_h", true)
			animated_sprite.play("run_fater")
			velocity = Vector2(
				velocity.x + (moving_speed  * 3) ,
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)
			
	if move_and_slide(velocity, Vector2.UP): 
		pass
		
func turn_back():
	if(moving_style == 2):
		count += 1
		if(count == 2):
			current_state = STATE.RUN_FASTER
	

func _on_HitBox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body shape entered hit box of flying enemy", body_rid, body_shape_index, body_shape_index, local_shape_index)
	body.get_hit(1)


func _on_TurnBackArea_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body is Player):
		if(moving_style > 0):
			current_state = STATE.TURN_BACK
