extends Node3D

var mouse_sens = 0.002

# узлы сыски
@onready var head = $Head
@onready var camera = $Head/Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	# камера
	if event is InputEventMouseMotion:
		# лево право 
		rotate_y(-event.relative.x * mouse_sens)
		
		# верх нис
		head.rotate_x(-event.relative.y * mouse_sens)
		
		# ограничение углоа поворота каеры
		head.rotation.x = clamp(head.rotation.x, -1.5, 1.5)
	
	if event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
