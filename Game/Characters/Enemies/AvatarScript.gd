extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite

var is_unlock : bool

func set_is_unlock(value: bool) -> void:
	is_unlock = value

func enable_playing(value: bool) -> void:
	if(value):
		if(is_unlock):
			$AnimatedSprite.play("active")
		else:
			$AnimatedSprite.play("lock_active")
	else:
		if(is_unlock):
			$AnimatedSprite.play("deactive")
		else:
			$AnimatedSprite.play("lock_deactive")
		
#	animated_sprite.set("playing", value)

func play_run() -> void:
	enable_playing(true)
	
func adjust_scale(value: Vector2) -> void:
	self.set("scale", value)
