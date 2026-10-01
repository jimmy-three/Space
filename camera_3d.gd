extends Node3D

## 基础移动速度（单位/秒）
@export var speed: float = 5.0
## 鼠标灵敏度（弧度/像素）
@export var mouse_sensitivity: float = 0.002
## 滚轮速度调节系数（每次滚动乘数）
@export var wheel_step_factor: float = 1.2
## 按住Shift时的速度倍率
@export var sprint_multiplier: float = 20.0
## 速度最小/最大限制
@export var min_speed: float = 0.1
@export var max_speed: float = 50.0

var _mouse_captured: bool = false


func _ready():
	# 默认捕获鼠标
	_set_mouse_captured(true)

func _input(event):
	# 鼠标移动（仅当捕获时）
	if event is InputEventMouseMotion and _mouse_captured:
		# 水平旋转（偏航）
		rotate_y(-event.relative.x * mouse_sensitivity)
		# 垂直旋转（俯仰），限制角度防止翻转
		var pitch_delta = -event.relative.y * mouse_sensitivity
		rotation.x += pitch_delta
		rotation.x = clamp(rotation.x, deg_to_rad(-89.0), deg_to_rad(89.0))
	
	# 滚轮调节速度
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				speed = min(speed * wheel_step_factor, max_speed)
				get_viewport().set_input_as_handled()
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				speed = max(speed / wheel_step_factor, min_speed)
				get_viewport().set_input_as_handled()
	
	# ESC 切换鼠标捕获状态
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		_set_mouse_captured(not _mouse_captured)

func _process(delta):
	# 计算当前速度（考虑Shift加速）
	var current_speed = speed
	if Input.is_key_pressed(KEY_SHIFT):
		current_speed *= sprint_multiplier
	
	# 获取水平方向输入（相对于摄像机朝向）
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	# 方向向量转换到世界空间（忽略俯仰，保持水平移动）
	var forward = transform.basis.z * Vector3(1, 0, 1)  # 去掉垂直分量
	var right = transform.basis.x * Vector3(1, 0, 1)
	forward = forward.normalized()
	right = right.normalized()
	
	var direction = (forward * input_dir.y + right * input_dir.x).normalized()
	if direction.length() > 0:
		position += direction * current_speed * delta
	
	# 垂直移动 Q / E
	if Input.is_key_pressed(KEY_CTRL):
		position.y -= current_speed * delta
	if Input.is_key_pressed(KEY_SPACE):
		position.y += current_speed * delta
	if Input.is_key_pressed(KEY_1):
		position = $"../Sun".global_position + Vector3(0, 0, 150)
	if Input.is_key_pressed(KEY_2):
		position = $"../EarthMarker/Earth".global_position# + Vector3(0, 0, 5)
	if Input.is_key_pressed(KEY_3):
		position = $"../MercuryMarker".global_position + Vector3(0, 0, 5)
	if Input.is_key_pressed(KEY_4):
		position = $"../NeptuneMarker".global_position + Vector3(0, 0, -5)
	

func _set_mouse_captured(captured: bool):
	_mouse_captured = captured
	if captured:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
