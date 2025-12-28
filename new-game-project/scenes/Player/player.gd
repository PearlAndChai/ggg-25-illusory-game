extends CharacterBody2D

const SPEED = 2000
var x_direction = 0

const FRAMEWIDTH = 1152

func _ready():
	if global_variables.current_enemy_number > 0:
		position.x = global_variables.current_enemy_array[0] + FRAMEWIDTH
		
	if global_variables.interacted_with_cat == true and global_variables.world == "Normal":
		position.x = -2000

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if Input.is_action_pressed("Left"):
		pass
		x_direction = -1
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("Right"):
		if global_variables.world == "Normal" and position.x > 900:
			pass
		else:
			x_direction = 1
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("walk")
	else:
		x_direction = 0
		$AnimatedSprite2D.play("idle")
	velocity.x = x_direction * SPEED
	
	move_and_slide()
	
func _process(_delta):
	global_variables.player_position = position.x
	
	if position.x <= -2000 and global_variables.interacted_with_cat == false:
		get_tree().change_scene_to_file("res://scenes/cat_cg/cat_cg.tscn")
		
	if position.x <= -4000:
		get_tree().change_scene_to_file("res://scenes/house_cg/house_cg.tscn")
		

	
	
