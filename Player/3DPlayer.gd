extends CharacterBody3D

@export var ACCELERATION = 60
@export var MAX_SPEED = 1.8
@export var FRICTION = 60
@export var ROLL_SPEED = 3

enum {
	MOVE,
	ROLL,
	ATTACK,
	DIALOGUE
}

var state = MOVE
#var velocity = Vector3.ZERO
var input_vector = Vector3.ZERO
var ground_vector = Vector2(input_vector.x, input_vector.z)
var roll_vector = Vector3.LEFT

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var dialogue = $Dialogue
@onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state()
		ATTACK:
			attack_state()
		DIALOGUE:
			dialogue_state()
	

func move_state(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	ground_vector = Vector2(input_vector.x, input_vector.z)
	
	if input_vector != Vector3.ZERO:
		roll_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", ground_vector)
		animationTree.set("parameters/Run/blend_position", ground_vector)
		animationTree.set("parameters/Attack/blend_position", ground_vector)
		animationTree.set("parameters/Roll/blend_position", ground_vector)
		animationState.travel("Run")
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
		
	if dialogue.visible:
		state = DIALOGUE

func roll_state():
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()

func attack_state():
	velocity = Vector3.ZERO
	animationState.travel("Attack")
	
func dialogue_state():
	if !dialogue.visible:
		state = MOVE
	
func move():
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	
func roll_animation_finished():
	state = MOVE
#
func attack_animation_finished():
	state = MOVE
	

