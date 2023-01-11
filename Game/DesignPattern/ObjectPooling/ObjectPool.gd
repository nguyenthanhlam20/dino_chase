extends Node

var instances : Dictionary

func instantiate(scene: PackedScene):
	var existingInstances = instances.get(scene, null)
	if existingInstances:
		var instance = existingInstances.pop_back()
		if existingInstances.size() == 0:
			instances.erase(scene)
		instance.request_ready()
		if "poolingHandle" in instance:
			instance.poolingHandle = scene
		return instance
	else:
		var instance = scene.instantiate()
		instance.prepare()
		if "poolingHandle" in instance:
			instance.poolingHandle = scene
		return scene
