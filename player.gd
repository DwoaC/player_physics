extends RigidBody2D

@export var force_scale = 200.

@onready var motor = %motor

var angle: float = 0:
	get:
		return angle
	set(value):
		angle = value
		if angle < -limit:
			angle = -limit
		elif angle > limit:
			angle = limit
		
		print(angle)
		
var n_steps: float = 200.
var delta_angle: float = PI / n_steps
var limit: float = (PI / n_steps) * (n_steps * 1./25.)

	
func _physics_process(delta):
	pass

func _input(event):
	if event.is_action("left"):
		left()
	elif event.is_action("right"):
		right()
	elif event.is_action("forward"):
		forward()
	elif event.is_action("backward"):
		backward()
	queue_redraw()
		
func left():
	angle -= delta_angle
	motor.rotation = angle

func right():
	angle += delta_angle
	motor.rotation = angle
	
func forward():
	var force: Vector2 = Vector2.UP.rotated(motor.global_rotation) 
	apply_force(force*force_scale, motor.global_position - global_position)
	print(
		motor.position, ' ',
		force*force_scale, ' ', 
		global_position - motor.global_position
	)

func backward():
	var force: Vector2 = Vector2.UP.rotated(motor.global_rotation)
	apply_force(-force*force_scale, motor.global_position - global_position)
