extends CharacterBody3D

@export_category("Variables")
@export var maxSpeed: float
@export var acceleration: float
@export var drag: float
@export var jumpStrength:float
var direction: Vector3
@export_category("Objects")
@export var cam: Camera3D
@export var orientation: Node3D

func _onready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
	velocity += acceleration * delta * moveDir()
	velocity = velocity.clampf(-maxSpeed, maxSpeed)
	velocity *= (1/(1+drag*delta))
	
	if(!is_on_floor()):
		velocity+= get_gravity() * delta
	if(Input.is_action_just_pressed("Jump") and is_on_floor()):
		velocity.y = jumpStrength
	move_and_slide()

func _process(delta: float) -> void:
	orientation.global_rotation = Vector3(0 , cam.global_rotation.y, 0)

func moveDir() -> Vector3:
	var forward = orientation.transform.basis.z
	var right = orientation.transform.basis.x
	var horizontalInput = Input.get_axis("Move Left", "Move Right")
	var verticalInput = Input.get_axis("Move Backward", "Move Forward")
	direction = -forward* verticalInput + right* horizontalInput
	return direction.normalized()

func _input(input) -> void:
	pass
