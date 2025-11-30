extends CharacterBody2D

const SPEED = 500
var x_direction = 0

const FRAMEWIDTH = 1152

func _ready():
	if global_variables.current_enemy_number > 0:
		position.x = global_variables.current_enemy_array[0] + FRAMEWIDTH

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if Input.is_action_pressed("Left"):
		x_direction = -1
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("Right"):
		x_direction = 1
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	else:
		x_direction = 0
		$AnimatedSprite2D.play("idle")
	velocity.x = x_direction * SPEED
	move_and_slide()
	
func _process(_delta):
	print("player", position.x)
	global_variables.player_position = position.x
	
	
