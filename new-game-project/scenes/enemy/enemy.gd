extends Node2D

const FRAMEWIDTH = 1152

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if global_variables.enemy_spawned == false:
		global_variables.enemy_spawned = true
		global_variables.current_enemy_number += 1
		if global_variables.current_enemy_number <= global_variables.enemies.size():
			global_variables.current_enemy_array = global_variables.enemies[global_variables.current_enemy_number]
			print(global_variables.current_enemy_number)
			position.x = global_variables.current_enemy_array[0]

	if global_variables.player_position - FRAMEWIDTH >= global_variables.current_enemy_array[0] and global_variables.current_enemy_number <= global_variables.enemies.size():
		global_variables.enemy_spawned = false
		print("reached enemy")
		get_tree().change_scene_to_file("res://scenes/combat/Combat.tscn")
	
