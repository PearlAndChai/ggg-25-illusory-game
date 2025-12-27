extends Node2D

@onready var enemy_two = $EnemyTwo
@onready var enemy_two_health_bar = $EnemyTwoHealthBar

@onready var player = $Player

signal enemy_attacked()

signal player_attacked()

var attacks = {
	"Pencil": [0.25, "single"],
	"Book": [0.25, "aoe"],
}

var ability_selected = "Pencil"

var ability_array = attacks["Pencil"]
var heal = 0
var damage = 0

var enemy_selected = "zero"

var moves_left = 3

# ENEMY

var enemy_attacks_count = 0

func _ready():
	
	global_variables.enemy_one_health = 1
	global_variables.enemy_two_health = 1
	
	if global_variables.current_enemy_array[1] == 1:
		enemy_two.visible = false
		enemy_two_health_bar.visible = false
	else:
		enemy_two.visible = true
		enemy_two_health_bar.visible = true

func _process(_delta):
	#print that you're out of moves
	if moves_left <= 0 and global_variables.enemy_one_health != 0 and global_variables.enemy_two_health != 0:
		print("out of moves")
		moves_left = 3
		_enemy_attack() # make the enemy attack
	#if the enemies are dead, bring you back to the world (walking)
	if global_variables.current_enemy_array[1] == 1:
		if global_variables.enemy_one_health <= 0:
			get_tree().change_scene_to_file("res://scenes/world/world.tscn")
	else:
		if global_variables.enemy_one_health <= 0 and global_variables.enemy_two_health <= 0:
			get_tree().change_scene_to_file("res://scenes/world/world.tscn")

func _on_pencil_button_down():
	ability_array = attacks["Pencil"]
	ability_selected = "Pencil"
	
func _on_book_button_down():
	ability_array = attacks["Book"]
	ability_selected = "Book"

func _on_enemy_one_button_down():
	moves_left -= 1
	enemy_selected = "one"
	print("enemy selected: ",enemy_selected)
	print(ability_selected)
	_deal_damage()
	
func _on_enemy_two_button_down():
	moves_left -= 1
	enemy_selected = "two"
	print("enemy selected: ",enemy_selected)
	_deal_damage()

func _deal_damage():
	damage = ability_array[0]
	
	emit_signal("player_attacked")
		
	if ability_array[1] == "aoe":
		global_variables.enemy_one_health -= damage
		global_variables.enemy_two_health -= damage
		
	elif enemy_selected == "one":
		global_variables.enemy_one_health -= damage
	elif enemy_selected == "two":
		global_variables.enemy_two_health -= damage
		
	else:
		print("you have not selected an enemy yet")

func _enemy_attack():
		global_variables.player_health -= 0.25
		emit_signal("enemy_attacked")
		print("enemy did in fact attack")
