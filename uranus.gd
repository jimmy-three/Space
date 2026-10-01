extends MeshInstance3D

var uranus_orbital_speed = Global.get_rotate_speed(0.0117)
var uranus_rotational_speed = Global.get_rotate_speed(501.4)
var orbital_angle = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.orbital_rotate(get_parent(), 287097, orbital_angle)
	orbital_angle += uranus_orbital_speed * delta
	rotate_y(uranus_rotational_speed * delta)
	
