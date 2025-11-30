extends Node2D

@onready var backpack = $Backpack

@onready var info_popup = $Backpack/InfoPopup

@onready var enemy_two = $EnemyTwo
@onready var enemy_two_health_bar = $EnemyTwoHealthBar

var attacks = {
	"BookNormal": [0.25, "single"],
	"BookSpecial": [0.5, "single"],
	"BookSuper": [0.75, "aoe"],
	
	"PencilNormal": [0.25, "single"],
	"PencilSpecial": [0.5, "single"],
	"PencilSuper": [0.75, "aoe"],
}

var weapon_selected = null
var weapon_equipped = "Book"

var ability_selected = "Normal"

var ability_weapon_selected = null

var ability_array = null
var damage = 0
var heal = 0

var enemy_selected = "zero"

var moves_left = 10

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
	if moves_left <= 0:
		print("out of moves")
	if global_variables.current_enemy_array[1] == 1:
		if global_variables.enemy_one_health <= 0:
			get_tree().change_scene_to_file("res://scenes/world/world.tscn")
	else:
		if global_variables.enemy_one_health <= 0 and global_variables.enemy_two_health <= 0:
			get_tree().change_scene_to_file("res://scenes/world/world.tscn")

func _on_backpack_button_down():
	if backpack.visible == true:
		backpack.visible = false
	else:
		backpack.visible = true
	
func _on_book_button_down():
	info_popup.visible = true
	weapon_selected = "Book"
	print(weapon_selected)

func _on_pencil_button_down():
	info_popup.visible = true
	weapon_selected = "Pencil"
	print(weapon_selected)

func _on_apple_button_down():
	info_popup.visible = true
	heal = 0.5

func _on_normal_button_down():
	ability_selected = "Normal"
	print(ability_selected)
	if weapon_selected == "Book":
		print(global_variables.book_normal_amount)
	else:
		print(global_variables.pencil_normal_amount)

func _on_special_button_down():
	if weapon_selected == "Book":
		if global_variables.book_normal_amount >= 2:
			ability_selected = "Special"
			print(ability_selected)
		else:
			print("not enough uses of the normal book")
	else:
		if global_variables.pencil_normal_amount >= 2:
			ability_selected = "Special"
			print(ability_selected)
		else:
			print("not enough uses of the normal pencil")

func _on_super_button_down():
	if weapon_selected == "Book":
		if global_variables.book_special_amount >= 2:
			ability_selected = "Super"
			print(ability_selected)
		else:
			print("not enough uses of the special book")
	else:
		if global_variables.pencil_special_amount >= 2:
			ability_selected = "Special"
			print(ability_selected)
		else:
			print("not enough uses of the special pencil")

func _on_enemy_one_button_down():
	moves_left -= 1
	enemy_selected = "one"
	print("enemy selected: ",enemy_selected)
	_deal_damage()
	
func _on_enemy_two_button_down():
	moves_left -= 1
	enemy_selected = "two"
	print("enemy selected: ",enemy_selected)
	_deal_damage()

func _on_confirm_button_down():
	if weapon_equipped != weapon_selected:
		weapon_equipped = weapon_selected
		print(weapon_equipped)
	else:
		_heal_health()
	

func _deal_damage():
	ability_weapon_selected = weapon_equipped + ability_selected
	ability_array = attacks[ability_weapon_selected]
	damage = ability_array[0]
	
	if ability_weapon_selected == "BookNormal":
		global_variables.book_normal_amount += 1
	elif ability_weapon_selected == "BookSpecial":
		global_variables.book_special_amount += 1
	elif ability_weapon_selected == "PencilNormal":
		global_variables.pencil_normal_amount += 1
	elif ability_weapon_selected == "PencilSpecial":
		global_variables.pencil_special_amount += 1
	else:
		pass
	
	
	if ability_array[1] == "aoe":
		global_variables.enemy_one_health -= damage
		global_variables.enemy_two_health -= damage
		
	elif enemy_selected == "one":
		global_variables.enemy_one_health -= damage
		
	elif enemy_selected == "two":
		global_variables.enemy_two_health -= damage
		
	else:
		print("you have not selected an enemy yet")

func _heal_health():
	global_variables.player_health += heal
