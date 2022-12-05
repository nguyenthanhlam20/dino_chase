extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
	$AnimationPlayer.play("fade")
	$MessageContainer.visible = true
	yield($AnimationPlayer,'animation_finished')
	yield(get_tree().create_timer(0.1), "timeout")
	$AnimationPlayer.play_backwards("fade")
	yield(get_tree().create_timer(0.1), "timeout")
	$MessageContainer.visible = false
	SceneTransition.change_scene(self, "res://Game/UI/Screen/HomeScreen/HomeScreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
