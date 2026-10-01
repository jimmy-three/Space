extends MeshInstance3D

var saturn_orbital_speed = Global.get_rotate_speed(0.033)
var saturn_rotational_speed = Global.get_rotate_speed(818.7)
var orbital_angle = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.orbital_rotate(get_parent(), 142672, orbital_angle)
	orbital_angle += saturn_orbital_speed * delta
	rotate_y(saturn_rotational_speed * delta)
	
