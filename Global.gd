extends Node
#Marker的rotation改星球的倾角
var scale_multiplier = 1-0.985

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func get_rotate_speed(angle_per_day):
	return (angle_per_day/360) * TAU

func orbital_rotate(parent_node, radius_times_2, orbital_angle):
	parent_node.position.x = radius_times_2 / 2 * Global.scale_multiplier * sin(orbital_angle)
	parent_node.position.z = radius_times_2 / 2 * Global.scale_multiplier * cos(orbital_angle)
