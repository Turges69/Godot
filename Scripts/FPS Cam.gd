extends Camera3D

	


func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("Mouse Lock")):
		ToggleMouseLock()



func ToggleMouseLock() -> void:
		if(Input.mouse_mode == Input.MOUSE_MODE_CAPTURED):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(input) -> void:
	if(input is InputEventMouseMotion):
		rotation -= Vector3(input.relative.y,input.relative.x, 0)/1000
