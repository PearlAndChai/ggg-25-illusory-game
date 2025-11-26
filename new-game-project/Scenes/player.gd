extends CharacterBody2D

const SPEED = 200
var x_direction = 0
func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if Input.is_action_pressed("Left"):
		x_direction = -1
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("Right"):
		x_direction = 1
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	else:
		x_direction = 0
		$AnimatedSprite2D.play("idle")
	velocity.x = x_direction * SPEED
	move_and_slide()
