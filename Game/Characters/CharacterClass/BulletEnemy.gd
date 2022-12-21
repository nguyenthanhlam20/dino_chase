extends Enemy

class_name BulletEnemy

onready var animation_player = $AnimationPlayer
onready var bullet = load("res://Game/Characters/Enemies/Spring/Plant/PlantBullet.tscn")

var velocity : Vector2
var position_x = 300
var position_y = 120
var root_node setget set_root_node
var number_of_bullet = 0
var current_state = STATE.RUN
enum STATE {RUN, IDLE, ATTACK, HIT, DEATH}

func set_root_node(value) -> void:
	root_node = value	
	
func go_stop():
	current_state = STATE.IDLE

func _physics_process(_delta):
	match(current_state):
		STATE.RUN:
			animation_player.play("idle")
			velocity = Vector2(
				velocity.x - moving_speed,
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)
		STATE.IDLE:
			animation_player.play("idle")
			velocity = Vector2(
				0,
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)
		STATE.ATTACK:
			animation_player.play("attack")
			velocity = Vector2(
				0,
				min(velocity.y + GameSettings.gravity, GameSettings.terminal_gravity)
			)
		STATE.HIT:
			animation_player.play("hit")
		STATE.DEATH:
			animation_player.play("death")
		
	if(move_and_slide(velocity, Vector2.UP)):
		pass

func idle_animation_finished():
	
	if(number_of_bullet == 3):
		current_state = STATE.HIT
	else:
		current_state = STATE.ATTACK

func death_animation_finished():
	root_node.stop_running(true)
	root_node.set_bullet_enemy_appear(false)
	self.queue_free()

func hit_animation_finished():
	current_state = STATE.DEATH
	
func attack_animation_finished():
	var bullet_instance = bullet.instance()
	bullet_instance.set("position", Vector2(-8, -1))
	number_of_bullet += 1
	self.add_child(bullet_instance)
	current_state = STATE.IDLE
