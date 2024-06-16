extends CharacterBody3D

@export var ACCELERATION = 60
@export var MAX_SPEED = 1.8
@export var FRICTION = 60
@export var ROLL_SPEED = 3
@export var CAMERA : Camera3D

enum {
	MOVE,
	ROLL,
	ATTACK,
}

var state = MOVE
var input_vector = Vector3.ZERO
var ground_vector = Vector2(input_vector.x, input_vector.z)
var roll_vector = Vector3.LEFT

@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

func _physics_process(delta):
	
	# TODO Move to separate function
	#var space_state = get_world_3d().direct_space_state
	#var mouse_position = get_viewport().get_mouse_position()
	#var ray_origin = CAMERA.project_ray_origin(mouse_position)
	#
	#var ray_end = ray_origin + CAMERA.project_ray_normal(mouse_position) * 200 # <- ray length
	#var query = PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
	#query.collide_with_areas = true # do I want this
	#var intersection = space_state.intersect_ray(query)
	#
	#if not intersection.is_empty():
		#var pos = intersection.position
		#$Marker.global_position = Vector3(pos.x, 0, pos.z)
		#$Model.look_at(Vector3(pos.x, position.y, pos.z), Vector3.UP, true) # <- third parameter is really important
		
		#var player_vector = Vector2(global_position.x, global_position.z)
		#var target_vector = Vector2(pos.x, pos.z)
		#ground_vector = player_vector.direction_to(target_vector)
		#ground_vector.y *= -1
		#print(player_vector)
	
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state()
		ATTACK:
			attack_state()
	

func move_state(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.z = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()
	
	# Second variable is required to smooth animation changes (e.g. spam left/right)
	var _ground_vector = Vector2(input_vector.x, input_vector.z).rotated($Model.rotation.y)
	_ground_vector.x *= -1
	ground_vector = ground_vector.lerp(_ground_vector, 0.2)
	
	
	if input_vector != Vector3.ZERO:
		roll_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", ground_vector)
		animationTree.set("parameters/Run/blend_position", ground_vector)
		animationState.travel("Run")
		#print("Input Vector: ", ground_vector, " Velocity: ", velocity)
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector3.ZERO, FRICTION * delta)
		
	move()
	
	if Input.is_action_just_pressed("roll"):
		state = ROLL
#
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func roll_state():
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()

func attack_state():
	velocity = Vector3.ZERO
	animationState.travel("Attack")
	
func move():
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	
func roll_animation_finished():
	state = MOVE
#
func attack_animation_finished():
	state = MOVE
	

