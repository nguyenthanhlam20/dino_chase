extends Node2D

onready var loading_scene = preload("res://Game/UI/Screen/SceneTransition/SceneTransition.tscn")

func change_scene(current_scene, next_scene):
	var loading_scene_instance = loading_scene.instance()

	get_tree().get_root().call_deferred("add_child",loading_scene_instance)
	var animation_player = loading_scene_instance.get_node("AnimationPlayer")
	var progress_bar = loading_scene_instance.get_node("ProgressBar")
	var loading_container = loading_scene_instance.get_node("LoadingContainer")
	animation_player.play('dissolve')
	yield(animation_player,'animation_finished')
	loading_container.visible = true
	progress_bar.visible = true
#	print("change scene status: ", get_tree().change_scene(target))

	# add loading scene to the root
	
	# find the targeted scene
	var loader = ResourceLoader.load_interactive(next_scene)
	
	#check for errors
	if loader == null:
		# handle your error
		print("error occured while getting the scene")
		return

	current_scene.queue_free()
	# creating a little delay, that lets the loading screen to appear.
	yield(get_tree().create_timer(0.5),"timeout")

	# loading the next_scene using poll() function
	# since poll() function loads data in chunks thus we need to put that in loop
	while true:
		var error = loader.poll()

		# when we get a chunk of data
		if error == OK:
			# update the progress bar according to amount of data loaded
			progress_bar.value = float(loader.get_stage())/loader.get_stage_count() * 100
			yield(get_tree().create_timer(0.05),"timeout")
		# when all the data have been loaded
		elif error == ERR_FILE_EOF:
			progress_bar.value = float(100)
			yield(get_tree().create_timer(0.05),"timeout")
			# creating scene instance from loaded data
			var scene = loader.get_resource().instance()
			# adding scene to the root

			get_tree().get_root().call_deferred("add_child",scene)
			# removing loading scene
			animation_player.play_backwards('dissolve')
			progress_bar.visible = false
			loading_container.visible = false
			yield(animation_player,'animation_finished')
			loading_scene_instance.queue_free()
			return
		else:
			# handle your error
			print('error occurred while loading chunks of data')
			return
		
	
