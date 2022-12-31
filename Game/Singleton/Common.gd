extends Node

var messages = []
var random = RandomNumberGenerator.new()

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
	var index = random.randi_range(0, 4)
	randomize()
	return get_message(index)
	
func get_random_number(min_number, max_number):
	var index = random.randi_range(min_number, max_number)
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
	
