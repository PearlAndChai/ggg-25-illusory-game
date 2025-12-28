extends Node2D

@onready var player = $"../Player"

func _process(_delta):
	position.x = player.position.x - 1275
