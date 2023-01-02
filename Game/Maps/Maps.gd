extends Control

onready var background = $Background

onready var layer1 = $Background/Layer1
onready var layer2 = $Background/Layer2
onready var layer3 = $Background/Layer3
onready var layer4 = $Background/Layer4
onready var layer5 = $Background/Layer5

onready var ground = $Ground

export(int) var base_speed = -25



var velocity = Vector2(1, 0)
var is_running = true setget set_is_running


onready var viewportWidth = get_viewport().size.x
onready var viewportHeight = get_viewport().size.y


func set_is_running(value: bool):
	is_running = value

func _process(delta):
	if(is_running):
		layer1.motion_offset -= velocity * delta * (base_speed + 8)
		layer2.motion_offset += velocity * delta * (base_speed + 6)
		layer3.motion_offset += velocity * delta * (base_speed + 4)
		layer4.motion_offset += velocity * delta * (base_speed)
		layer5.motion_offset += velocity * delta * (base_speed - 4)
		ground.scroll_offset += velocity * delta * (base_speed - 10)
