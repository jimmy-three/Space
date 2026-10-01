extends MeshInstance3D

var mars_orbital_speed = Global.get_rotate_speed(0.524)
var mars_rotational_speed = Global.get_rotate_speed(350.89)
var orbital_angle = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.orbital_rotate(get_parent(), 22794, orbital_angle)
	orbital_angle += mars_orbital_speed * delta
	rotate_y(mars_rotational_speed * delta)
