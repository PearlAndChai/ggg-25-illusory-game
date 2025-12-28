extends AnimatedSprite2D

@onready var enemy_two_button = $"../EnemyTwoButton"
@onready var enemy_two_attack = $"../EnemyTwoAttack"

func _ready():

	var combat = get_node("../..")
	combat.enemy_attacked.connect(on_enemy_attacked)

func on_enemy_attacked():
	if global_variables.current_enemy_number  == 2:
		
		print("enemy atak?")
		await get_tree().create_timer(5.0).timeout
		print("wow it'll acc  atk now!")
		
		visible = true
		enemy_two_attack.visible = true
		enemy_two_button.visible = false
		
		play("bully_effect")
		enemy_two_attack.play("bully_attack")
		await get_tree().create_timer(1.125).timeout
		stop()
		
		visible = false
		enemy_two_attack.visible = false
		enemy_two_button.visible = true
