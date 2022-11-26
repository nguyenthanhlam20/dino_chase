extends Node

var messages = []

func _ready():
	messages.append("Never give up")
	messages.append("You ran faster than you usually do")
	messages.append("Just keep moving forward")
	messages.append("Fall seven times and stand up eight")
	messages.append("Well done is better than well said")
	messages.append("If you can dream it, you can do it")

func get_message(index):
	return messages[index]

func paused_game(value):
	get_tree().paused = value

func get_random_message():
	var index = GameSettings.random.randi_range(0, 2)
	return get_message(index)
	
	
#(Un)pauses a single node
func set_pause_node(node : Node, pause : bool) -> void:
	print(" i go to set pause mode function")
	node.set_process(!pause)
	node.set_process_input(!pause)
	node.set_process_internal(!pause)
	node.set_process_unhandled_input(!pause)
	node.set_process_unhandled_key_input(!pause)

#(Un)pauses a scene
#Ignored childs is an optional argument, that contains the path of nodes whose state must not be altered by the function
func set_pause_scene(rootNode : Node, pause : bool, ignoredChilds : PoolStringArray = [null]):
	set_pause_node(rootNode, pause)
	for node in rootNode.get_children():
		if not (String(node.get_path()) in ignoredChilds):
			set_pause_scene(node, pause, ignoredChilds)
