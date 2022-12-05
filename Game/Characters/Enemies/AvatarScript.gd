extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite


func enable_playing(value: bool):
	if(value):
		$AnimatedSprite.play("active")
	else:
		$AnimatedSprite.play("deactive")
#	animated_sprite.set("playing", value)

func play_run() -> void:
	enable_playing(true)
	
func adjust_scale(value: Vector2):
	self.set("scale", value)
