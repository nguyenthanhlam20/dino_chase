extends Node2D


onready var animation_player = $AnimationPlayer

enum STATE {APPEAR, IDLE, DISAPPEAR}


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("appear")

func appear_animation_finished():
	GameSettings.stopEffect()
	animation_player.play("idle")

func disappear_animation_finished():
	self.queue_free()

func _on_Hitbox_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if(body.name == "Player"):
		GameSettings.playEffect(Constants.COIN_EFFECT)
		animation_player.play("disappear")
		body.gain_coin()

func play_disappear():
	animation_player.play("disappear")
