extends Node2D

@onready var health_green = $HealthGreen
@onready var health_red = $HealthRed

var health_bar_length = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# set the size of the green part
	health_green.size.x = global_variables.enemy_two_health * health_bar_length 
	# set the size of the red part to the complement of the green part
	health_red.size.x = health_bar_length - health_green.size.x 
	
	# move the red part to end of the green part
	health_red.position.x = health_green.position.x + health_green.size.x
