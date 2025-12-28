extends AnimatedSprite2D

func _ready():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://scenes/normal_world/normalworld.tscn")
	global_variables.interacted_with_cat = true
	global_variables.reached_cat = true
