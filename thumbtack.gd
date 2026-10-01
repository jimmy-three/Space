extends Node3D

func _ready() -> void:
	process_priority = 1

func _process(_delta: float) -> void:
	var camera = get_viewport().get_camera_3d()
	if not camera:
		return
	var to_camera_distance = (camera.global_position - get_parent().global_position)
	var to_camera_direction = to_camera_distance.normalized()
	global_position = camera.global_position - to_camera_direction * 15 - to_camera_distance * 0.00001
