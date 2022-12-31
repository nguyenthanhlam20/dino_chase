extends KinematicBody2D

class_name Enemy

export(int) var moving_speed = 90
export(int) var bullet_enemy_speed = 76
export(int) var bullet_speed = 70
export(int) var jump_speed = 130
export(int) var jump_speed_far = 100
export(int) var jump_force = 250
export(int) var gravity = 10
 
func _moving():
	print("The moving function in child class doesn't work")

func update_moving_speed(value: int) -> void: 
	moving_speed = value
	
func _do_action():
	print("The do action function in child class doesn't work")
