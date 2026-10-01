extends MeshInstance3D

var jupiter_orbital_speed = Global.get_rotate_speed(0.083)
var jupiter_rotational_speed = Global.get_rotate_speed(870.5)
var orbital_angle = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.orbital_rotate(get_parent(), 77854, orbital_angle)
	orbital_angle += jupiter_orbital_speed * delta
	rotate_y(jupiter_rotational_speed * delta)
	
