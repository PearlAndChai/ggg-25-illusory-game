extends Node

var player_health = 1

var enemy_one_health = 1
var enemy_two_health = 1

var enemy_spawned = false

var enemies = {
	1: [1000, 1, "grandma"],
	2: [3000, 2, "octopus", "anglerfish"]
}

var current_enemy_number = 0
var current_enemy_array = null

var player_position = 0
