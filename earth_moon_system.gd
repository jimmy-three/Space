extends MeshInstance3D

var earth_orbital_speed = Global.get_rotate_speed(0.98)
var earth_rotational_speed = Global.get_rotate_speed(360)
var moon_orbital_speed = Global.get_rotate_speed(13.19)
var moon_rotational_speed = Global.get_rotate_speed(13.19)
var orbital_angle = 0
var moon_orbital_angle = 0
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	Global.orbital_rotate(get_parent(), 14960, orbital_angle)
	orbital_angle += earth_orbital_speed * delta
	Global.orbital_rotate(get_parent().get_parent().get_node("MoonMarker"), 38.4, moon_orbital_angle)
	moon_orbital_angle += moon_orbital_speed * delta
	get_parent().get_parent().get_node("MoonMarker").position += global_position
	get_parent().get_parent().get_node("MoonMarker").get_node("Moon").rotate_y(moon_rotational_speed * delta)
	rotate_y(earth_rotational_speed * delta)
