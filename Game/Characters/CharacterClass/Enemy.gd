extends Character
class_name Enemy

export(float) var moving_speed = 0.2
 
func _moving():
	push_error("The moving function in child class doesn't work")