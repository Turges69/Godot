extends CharacterBody3D

@export_category("Variables")
@export var speed: float
@export var jumpStrength:float
var direction: Vector3
@export_category("Objects")
@export var cam: Camera3D
@export var orientation: Node3D

func _onready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
	velocity = delta * speed * moveDir()
	move_and_slide()
	
func _process(delta: float) -> void:
	orientation.global_rotation = Vector3(0 , cam.global_rotation.y, 0)
	
func moveDir() -> Vector3:
	var forward = orientation.transform.basis.z
	var horizontalInput = Input.get_axis("Move Left", "Move Right")
	var verticalInput = Input.get_axis("Move Backward", "Move Forward")
	direction = Vector3(-horizontalInput, 0, -verticalInput)
	if(direction.length() != 0):
		direction = direction.direction_to(forward)
	return direction.normalized()
	
