extends KinematicBody2D

var velocity = Vector2()
var jumping = true
var was_on_floor = false

onready var coyote_timer = $CoyoteTimer

const MOVE_SPEED = 40
const FRICTION = 0.8
const GRAVITY = 10
const JUMP_HEIGHT = 340

func apply_gravity(delta):
	velocity.y += GRAVITY * delta * 60
	
	if velocity.y > 0:
		jumping = false

func apply_velocity():
	var snap_amount = Vector2(0, int(!jumping) * 32)
	
	was_on_floor = is_on_floor()
	velocity = move_and_slide_with_snap(velocity, snap_amount, Vector2(0, -1))

func move_input():
	velocity.x *= FRICTION
	var move_direction = -int(Input.is_action_pressed("move_left")) + int(Input.is_action_pressed("move_right"))
	velocity.x += MOVE_SPEED * move_direction
	if abs(velocity.x) < 6:
		velocity.x = 0
