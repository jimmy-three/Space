extends MeshInstance3D

var mercury_orbital_speed = Global.get_rotate_speed(4.09)
var mercury_rotational_speed = Global.get_rotate_speed(6.14)
var orbital_angle = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.orbital_rotate(get_parent(), 5760, orbital_angle)
	orbital_angle += mercury_orbital_speed * delta
	rotate_y(mercury_rotational_speed * delta)
