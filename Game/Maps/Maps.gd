extends Control

onready var background = $Background

onready var layer1 = $Background/Layer1
onready var layer2 = $Background/Layer2
onready var layer3 = $Background/Layer3
onready var layer4 = $Background/Layer4
onready var layer5 = $Background/Layer5

onready var ground = $Ground

export(int) var base_speed = -10


var velocity = Vector2(1, 0)
var is_running = true setget set_is_running


onready var viewportWidth = get_viewport().size.x
onready var viewportHeight = get_viewport().size.y


#func _ready():
#	var scale = $Background/Layer1/Sprite.texture.get_size().x / viewportWidth
#	print("----", $Background/Layer1/Sprite.texture.get_size())
## Optional: Center the sprite, required only if the sprite's Offset>Centered checkbox is set
#	$Background/Layer1/Sprite.set_position(Vector2(viewportWidth/2, viewportHeight/2))
#
## Set same scale value horizontally/vertically to maintain aspect ratio
## If however you don't want to maintain aspect ratio, simply set different
## scale along x and y
#	$Background/Layer1/Sprite.set_scale(Vector2(scale, scale))
#

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
