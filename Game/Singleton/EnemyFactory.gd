extends Node2D


const Dinosaur = preload("res://Game/Characters/Enemies/Dinosaur/Dinosaur.tscn")
const Bat = preload("res://Game/Characters/Enemies/Bat/Bat.tscn")
const BlueBird = preload("res://Game/Characters/Enemies/BlueBird/BlueBird.tscn")
const Bunny = preload("res://Game/Characters/Enemies/Bunny/Bunny.tscn")
const Chameleon = preload("res://Game/Characters/Enemies/Chameleon/Chameleon.tscn")
const Chicken = preload("res://Game/Characters/Enemies/Chicken/Chicken.tscn")

var ememy_factory = []

# Called when the node enters the scene tree for the first time.
func _ready():
	ememy_factory.append(Dinosaur)
	ememy_factory.append(Bat)
	ememy_factory.append(Chicken)
	ememy_factory.append(BlueBird)
	ememy_factory.append(Chameleon)
	ememy_factory.append(Bunny)

func get_enemies():
	return ememy_factory

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
