extends Node

var player_health = 1

var enemy_one_health = 1
var enemy_two_health = 1

var world = "Normal"

var interacted_with_cat = false

var reached_bullies = false
var reached_cat = false
var reached_grandma = false

var bullies_dialogue_ran = false
var cat_dialogue_ran = false
var grandma_dialogue_ran = false


var enemy_spawned = false

var enemies = {
	1: [1000, 1, "grandma"],
	2: [3000, 2, "octopus", "anglerfish"]
}

var current_enemy_number = 0
var current_enemy_array = null

var player_position = 0

var pencil_normal_amount = 0
var pencil_special_amount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_health <= 0:
		get_tree().quit()
