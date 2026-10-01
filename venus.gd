extends MeshInstance3D

var venus_orbital_speed = Global.get_rotate_speed(1.602)
var venus_rotational_speed = Global.get_rotate_speed(1.481)
var surface_rotational_speed = Global.get_rotate_speed(92.3) - venus_rotational_speed
var orbital_angle = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.orbital_rotate(get_parent(), 10820, orbital_angle)
	orbital_angle += venus_orbital_speed * delta
	rotate_y(venus_rotational_speed * delta)
	$Atmosphere.rotate_y(surface_rotational_speed * delta)
