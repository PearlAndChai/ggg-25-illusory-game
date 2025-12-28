extends AnimatedSprite2D

@onready var enemy_one_button = $"../EnemyOneButton"
@onready var enemy_one_attack_effect = $"../EnemyOneAttackEffect"


func _ready():

	var combat = get_node("../..")
	combat.enemy_attacked.connect(on_enemy_attacked)

func on_enemy_attacked():
	if global_variables.current_enemy_number  == 1:
		visible = true
		enemy_one_attack_effect.visible = true
		enemy_one_button.visible = false
		
		play("grandma_attack")
		enemy_one_attack_effect.play("grandma_effect")
		await get_tree().create_timer(1.0).timeout
		play("grandma_attack_idle")
		await get_tree().create_timer(2.5).timeout
		
		visible = false
		enemy_one_attack_effect.visible = false
		enemy_one_button.visible = true
	elif global_variables.current_enemy_number  == 2:
		visible = true
		enemy_one_attack_effect.visible = true
		enemy_one_button.visible = false
		
		play("bully_attack")
		enemy_one_attack_effect.play("bully_effect")
		await get_tree().create_timer(1.125).timeout
		play("bully_attack_idle")
		enemy_one_attack_effect.play("bully_effect_idle")
		await get_tree().create_timer(2.5).timeout
		stop()
		
		visible = false
		enemy_one_attack_effect.visible = false
		enemy_one_button.visible = true
