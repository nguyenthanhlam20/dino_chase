extends CanvasLayer

onready var animation_player = $AnimationPlayer


func change_scene(target: String) -> void:
	animation_player.play('dissolve')
	LoadingScene.showLoading(true)
	yield(animation_player,'animation_finished')
	print("change scene status: ", get_tree().change_scene(target))
	animation_player.play_backwards('dissolve')
	yield(animation_player,'animation_finished')
	LoadingScene.visible = false
