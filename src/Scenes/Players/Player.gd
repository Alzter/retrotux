extends KinematicBody2D

var velocity = Vector2()

const MOVE_SPEED = 40
const FRICTION = 0.8
const GRAVITY = 20

func apply_gravity(delta):
	velocity.y += GRAVITY * delta * 60

func apply_velocity():
	velocity = move_and_slide_with_snap(velocity, Vector2(0, 16), Vector2(0, -1))

func horizontal_movement():
	velocity.x *= FRICTION
	var move_direction = -int(Input.is_action_pressed("move_left")) + int(Input.is_action_pressed("move_right"))
	velocity.x += MOVE_SPEED * move_direction
	if abs(velocity.x) < 6:
		velocity.x = 0
