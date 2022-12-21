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
	var index = GameSettings.random.randi_range(0, 4)
	return get_message(index)
	
func get_random_number(min_number, max_number):
	var index = GameSettings.random.randi_range(min_number, max_number)
	randomize()
	return index
	
func format_number(value):
	if(value > pow(10, 6)):
		return str(value / pow(10, 6)) + "m"
	elif(value > pow(10, 9)):
		return str(value / pow(10, 9)) + "t"
	else:
		return str(value)	
	
func format_distance(value):
	var result : String
	var kilometers = int(value / 1000)
	if(kilometers > 1000):
		result = str(kilometers) + "km"
		value -= kilometers * 1000
		result += str(value) + "m"
		
	else:
		result = str(value) + "m"
		
	return result
	
	
func format_percent(part, total):
	var result = float(part) / float(total)
	return str(ceil(result * 100)) + "%"

func format_time(time):
	var result : String
	
	var days = int(time / (3600 * 24))
	if(days > 0):
		result = str(days) + "d"
		time -= days * (3600 * 24)

	var hours =  int(time / 3600)
	if(hours > 0):
		result += str(hours) + "h"
		time -= hours * 3600

	var minutes = int(time / 60)
	if(minutes > 0):
		result += str(minutes) + "m"
		time -= minutes * 60
	
	result += str(int(time)) + "s"
		
	
	return result
	
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
