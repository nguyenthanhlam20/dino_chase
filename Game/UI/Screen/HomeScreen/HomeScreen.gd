extends Control

onready var option_btn = $LeftPos/Options
onready var play_btn = $CenterPos/Play
onready var more_btn = $RightPos/More
onready var tile_map = $TileMap
onready var animation_player = $AnimationPlayer

onready var right_position = $RightPos
onready var center_position = $CenterPos
onready var setting_screen = load(Constants.SETTINGS_SCREEN)

var settings_screen : Control
var size_decrease : int
var player : KinematicBody2D

func change_player_speed():
	size_decrease = right_position.rect_position.x - center_position.rect_position.x - 80
	if(player.move_speed > 0):
		player.jump_speed = size_decrease
	if(player.move_speed < 0):
		player.jump_speed = -size_decrease
	player.jump_force = 380

func normal_animation_finished():
	animation_player.play("zoom")

func zoom_animation_finished():
	animation_player.play("normal")
		

func _ready():
	animation_player.play("normal")
	GameSettings.gravity = 15
	tile_map.visible = false
	var player_movement = load(PlayerSettings.get_player_info("move")).instance()
	var map_background = load(MapSettings.get_map_info("map_background")).instance()
	map_background.base_speed = -30
	player_movement.position = Vector2(more_btn.global_position.x + 30, more_btn.global_position.y)
	self.add_child(player_movement)
	self.add_child(map_background)
	player = player_movement
	change_player_speed()
	enable_buttons()
	
func disable_buttons():
	option_btn.disconnect("released", self, "_on_Options_released")
	play_btn.disconnect("released", self, "_on_Play_released")
	more_btn.disconnect("released", self, "_on_More_released")
	
func enable_buttons():
	option_btn.connect("released", self, "_on_Options_released")
	play_btn.connect("released", self, "_on_Play_released")
	more_btn.connect("released", self, "_on_More_released")
	
func _on_Options_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	settings_screen = setting_screen.instance()
	settings_screen.set_root_node(self)
	self.add_child(settings_screen)
	get_tree().paused = true


func _on_Play_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	SceneTransition.change_scene(self, Constants.CHARACTER_SCREEN)

func _on_More_released():
	disable_buttons()
	yield(get_tree().create_timer(0.1), "timeout")
	SceneTransition.change_scene(self, Constants.STATISTIC_SCREEN)


func _on_Left_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.set_random_state()
	body.set_fip_h(false)
	if(body.move_speed > 0):
		body.move_speed = body.move_speed
		body.jump_speed = body.jump_speed
	else:
		body.move_speed = -body.move_speed
		body.jump_speed = -body.jump_speed


func _on_Right_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.set_random_state()
	body.set_fip_h(true)
	if(body.move_speed > 0):
		body.move_speed = -body.move_speed
		body.jump_speed = -body.jump_speed
	else:
		body.move_speed = body.move_speed
		body.jump_speed = body.jump_speed

func _on_First_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if(!body.get_flip_h()):
		body.go_to_jump_state()

func _on_Second_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if(body.get_flip_h()):
		body.go_to_jump_state()

func _on_Third_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if(!body.get_flip_h()):
		body.go_to_jump_state()

func _on_Fourth_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if(body.get_flip_h()):
		body.go_to_jump_state()
