extends MeshInstance3D

var neptune_orbital_speed = Global.get_rotate_speed(0.006)
var neptune_rotational_speed = Global.get_rotate_speed(536.3)
var orbital_angle = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.orbital_rotate(get_parent(), 449839, orbital_angle)
	orbital_angle += neptune_orbital_speed * delta
	rotate_y(neptune_rotational_speed * delta)
	
