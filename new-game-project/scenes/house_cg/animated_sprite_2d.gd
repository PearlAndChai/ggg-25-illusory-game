extends AnimatedSprite2D

func _ready():
	await get_tree().create_timer(12.0).timeout
	get_tree().change_scene_to_file("res://scenes/world/world.tscn")
	global_variables.world = "Dream"
